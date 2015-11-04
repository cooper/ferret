# Copyright (c) 2014 Mitchell Cooper
package Ferret::Lexer::Constructor;

use warnings;
use strict;
use 5.010;

use Ferret::Lexer::Rules;
use Scalar::Util qw(blessed);

our ($current, $error);

sub construct {
    my @elements;
    my $main_node = shift;
    $current = {
        main_node => $main_node,
        file      => $main_node->{name} || 'unknown',
        node      => $main_node,
        elements  => \@elements,
        upcoming  => \@_
        # package
        # class
        # clos_cap      something that intends tp capture an upcoming closure
        # closure       the node capturing a closure currently
        # list          the innermost list
    };

    while (my ($label, $value, $line) = @{ shift || [] }) {
        my $last_element = ($current->{node}->children)[-1] || $current->{node};

        # check for error.
        if (my $err = $error) {
            undef $error;
            return $err;
        }

        # current info.
        @$current{ qw(label value line next_tok last_element) } = (
            $label, $value,
            $line,  $_[0],
            $last_element
        );

        $current->{unknown_el} = F::Unknown->new(
            token_label => $label,
            token_value => $value
        );

        # check token rules.
        Ferret::Lexer::RuleFunctions::token_check($label, $current, $value);
        return $error if $error;

        # call the handler for all.
        c_any($label, $current, $value);
        redo if delete $current->{redo};

        # call a handler if one exists.
        if (my $code = __PACKAGE__->can("c_$label")) {
            my $el = $code->($current, $value);
            if (my $err = $error) {
                undef $error;
                return $err;
            }
            if (blessed $el) {
                return $el if $el->isa('F::Error');
                push @elements, $el;
            }
            next;
        }

        # otherwise, throw in an unknown element.
        $current->{node}->adopt($current->{unknown_el});

    }

    c_spaces($current, $main_node);
    c_eof($current, $main_node);
    Ferret::Lexer::RuleFunctions::final_check($main_node);

    return $error;
}

sub c_PKG_DEC {
    my ($c, $value) = @_;

    # create a package.
    my $pkg = F::Package->new(pkg_name => $value->{name});
    $c->{package} = $pkg;

    # capture the end keyword.
    $pkg->{parent_end_cap} = $c->{end_cap};
    $c->{end_cap} = $pkg;

    # Rule Package[0]:
    #   Must be a direct child of a Document.

    $c->{node}->adopt($pkg);
    return $pkg;
}

sub c_CLASS_DEC {
    my ($c, $value) = @_;

    # terminate current class.
    $c->{node} = $c->{node}->close if $c->{node}->type eq 'Class';
    $c->{end_cap} = $c->{end_cap}{parent_end_cap} if $c->{end_cap};

    # create class.
    my $class = F::Class->new(%$value);
    $c->{class} = $class;

    # capture the end keyword.
    $class->{parent_end_cap} = $c->{end_cap};
    $c->{end_cap} = $class;

    # Rule Class[0]:
    #   Must be a direct child of a Document.

    # set as current node.
    # will be terminated by another class declaration, 'end', or end of file.
    $c->{node} = $c->{node}->adopt($class);

    # Rule Class[1]:
    #   Direct children must be of type Method.

    return $class;
}

# end a class or package.
sub c_KEYWORD_END {
    my ($c, $value) = @_;

    # Rule KEYWORD_END[0]:
    #   Upper nodes must contain a Class or Package.

    # Rule KEYWORD_END[1]:
    #   The current 'end_cap' (package or class to capture 'end') must exist.

    # Rule KEYWORD_END[2]:
    #   The current node must be a Class or Package.

    # end the class.
    my $class_or_pkg = $c->{end_cap};
    if ($c->{class} && $class_or_pkg == $c->{class}) {
        delete $c->{class};
    }

    # return to the previous package.
    elsif ($c->{package} && $class_or_pkg == $c->{package}) {
        return unexpected(
            $c,
            '(multiple packages per file not yet implemented)'
        );
    }

    # close it.
    $c->{end_cap} = $c->{end_cap}{parent_end_cap};
    $c->{node} = $c->{node}->close;

    return;
}

sub c_METHOD {
    my ($c, $value) = @_;

    # Rule Method[0]:
    #   Must be a direct child of a Class.

    my $method = F::Method->new(%$value, event_cb => 1);
    $c->{node}->adopt($method);
    @$c{ qw(node clos_cap method) } = ($method) x 3;
    return $method;
}

sub c_FUNCTION {
    my ($c, $value) = @_;
    my $function = F::Function->new(
        %$value,
        event_cb => !$value->{anonymous}
        # anonymous functions are not implemented as events
    );
    $c->{node}->adopt($function);
    @$c{ qw(node clos_cap function) } = ($function) x 3;
    return $function;
}

# start of a closure
sub c_CLOSURE_S {
    my ($c, $value) = @_;

    # Rule CLOSURE_S[0]:
    #   The current 'clos_cap' must exist.

    my $closure = delete $c->{clos_cap};

    # a closure can terminate an equality.
    if ($c->{node}->type eq 'Equality') {
        $c->{node} = $c->{node}->close;
    }

    # a closure can terminate a generated expression.
    # for instance, inside $something {}. the expression $something ends there.
    if ($c->{node}{generated_expression}) {
        $c->{node} = $c->{node}->close;
    }

    # remember which closure this is inside; if any.
    # then, set this node as the current closure.
    $closure->{containing_closure} = $c->{closure};
    $c->{closure} = $closure;

    return;
}

# end of a closure
sub c_CLOSURE_E {
    my ($c, $value) = @_;

    # Rule CLOSURE_E[0]:
    #   The current 'closure' must exist.

    # Rule CLOSURE_E[1]:
    #   The current 'node' must be equal to the current 'closure'.

    # close the closure and the node.
    $c->{closure} = delete $c->{closure}{containing_closure};
    $c->{node} = $c->{node}->close;

    return;
}

sub c_KEYWORD_INSIDE {
    my ($c, $value) = @_;

    # create a closure to be opened soon.
    my $inside = F::Inside->new(type => 'Inside');
    $c->{clos_cap} = $c->{node}->adopt($inside);

    # set the current node to the inside expression.
    $c->{node} = $inside->param_exp;

    return $inside;
}

sub c_KEYWORD_ON {
    my ($c, $value) = @_;

    # create on.
    my $on = F::On->new(type => 'On');

    # set the closure to the function of on.
    $c->{clos_cap} = $on->function;
    $c->{node}->adopt($on);

    # set the current node to the on expression.
    $c->{node} = $on->param_exp;

    return $on;
}

sub c_KEYWORD_IF {
    my ($c, $value) = @_;

    # create an if statement which expects a closure to be opened soon.
    my $if = F::If->new(type => 'If');
    $c->{node}->adopt($if);
    $c->{clos_cap} = $if;

    # set the current node to the conditional expression.
    $c->{node} = $if->param_exp;

    return $if;
}

sub c_KEYWORD_THEN {
    my ($c, $value) = @_;
    my $then = F::Node->new(type => 'Then');
    $c->{node}->adopt($then);
    @$c{ qw(node clos_cap) } = ($then) x 2;
    return $then;
}

sub c_KEYWORD_FOR {
    my ($c, $value) = @_;

    # create a closure to be opened soon.
    my $for = F::For->new(type => 'For');
    $c->{node}->adopt($for);
    $c->{clos_cap} = $for;

    # set the node to the for parameter.
    $c->{node} = $for->param_exp;

    return $for;
}

sub c_KEYWORD_IN {
    my ($c, $value) = @_;

    # 'in' must terminate a generated expression for 'for'.
    return unexpected($c, "(where is 'for'?)") unless
        $c->{node}{parameter_for} && $c->{node}{parameter_for} eq 'for';
        # FIXME: if wrapped in parentheses, this will fail.

    # set the node to the 'in' parameter.
    return $c->{node} = $c->{node}->close->in_param_exp;

}

sub c_PAREN_S {
    my ($c, $value) = @_;
    my $list = start_list($c, $value, 'PAREN_E');
    return $list;
}

sub c_BRACKET_S {
    my ($c, $value) = @_;
    my $list = start_list($c, $value, 'BRACKET_E');
    $list->{collection} = 1; # define as a value list or hash.
    $list->{array} = 1;      # default
    return $list;
}

sub c_BRACKET_IDX {
    my ($c, $value) = @_;
    return handle_call($c, $value, 1, 1);
}

sub c_PAREN_CALL {
    my ($c, $value) = @_;
    return handle_call($c, $value, 1);
}

sub c_OP_CALL {
    my ($c, $value) = @_;
    return handle_call($c, $value);
}

# handle_call() is used for calls as well as indices.
sub handle_call {
    my ($c, $value, $is_paren, $is_index) = @_;

    my $terminator = $is_index ? 'BRACKET_E' : 'PAREN_E';
    my $package    = $is_index ? 'F::Index'  : 'F::Call';

    # a call can only come after an expression.
    my $last_el = $c->{last_element};
    return unexpected($c) unless $last_el->is_type('Expression');

    # if this is a list, it can only have one item.
    if ($last_el->isa('F::List')
     && $last_el->children > 1) {
        return expected($c, 'a single-element list', 'before');
    }

    # create a function call, adopting the last element.
    my $call = $c->{node}->adopt($package->new);
    $call->adopt($last_el);

    # handle the list, then adopt it.
    if ($is_paren) {
        my $list = start_list($c, $value, $terminator);
        $list->{is_call} = 1;
        $list->{collection} = 1; # pretend to be array/hash for checks.
        $call->adopt($list);
    }

    return $call;
}

# used for both parenthesis and bracket lists.
sub start_list {
    my ($c, $value, $terminator) = @_;

    # for any of PAREN_S, PAREN_CALL, ... create a list.
    my $list = F::List->new;
    $list->{parent_list} = $c->{list};
    $list->{list_terminator} = $terminator;
    $list->{no_instructions} = 1;

    # set the current list and the current node to the list's first item.
    $c->{list} = $c->{node}->adopt($list);
    $c->{node} = $list->new_item;

    return $list;
}

sub c_PAREN_E {
    my ($c, $value) = @_;

    # Rule PAREN_E[0]:
    #   The current 'list' must exist.

    # this must be the expected list terminator.
    my $t = $c->{list}{list_terminator};
    my $p = Ferret::Lexer::pretty_token($t);
    return unexpected($c, "to close list (instead of $p)")
        if $t ne 'PAREN_E';

    # closes these things.
    #
    #       math operations must come first here because
    #       operations can be in pairs, but pairs can't be in operations
    #
    $c->{node} = $c->{node}->close while $c->{node}->type eq 'Equality';
    $c->{node} = $c->{node}->close while $c->{node}->type eq 'Operation';
    $c->{node} = $c->{node}->close if    $c->{node}->type eq 'Pair';

    # close the list itself.
    #
    #       the current node becomes
    #       the current node (list item)'s parent (list)'s parent
    #
    return unexpected($c) if $c->{node}->parent != $c->{list};
    $c->{node} = $c->{node}->close->close;

    # function call.
    #
    #       as a special case, close function calls here as well, since they are
    #       terminated by the end of their argument list.
    #
    $c->{node} = $c->{node}->close if $c->{node}->type eq 'Call';

    # finally, the current list becomes the next list up in the tree.
    $c->{list} = $c->{list}{parent_list};

    return $c->{list};
}

sub c_BRACKET_E {
    my ($c, $value) = @_;

    # Rule BRACKET_E[0]:
    #   The current 'list' must exist.

    # this must be the expected list terminator.
    my $t = $c->{list}{list_terminator};
    my $p = Ferret::Lexer::pretty_token($t);
    return unexpected($c, "to close list (instead of $p)")
        if $t ne 'BRACKET_E';

    # closes these things.
    #
    #       math operations must come first here because
    #       operations can be in pairs, but pairs can't be in operations
    #
    $c->{node} = $c->{node}->close while $c->{node}->type eq 'Equality';
    $c->{node} = $c->{node}->close while $c->{node}->type eq 'Operation';
    $c->{node} = $c->{node}->close if    $c->{node}->type eq 'Pair';

    # close the list itself.
    #
    #       the current node becomes
    #       the current node (list item)'s parent (list)'s parent
    #
    return unexpected($c) if $c->{node}->parent != $c->{list};
    $c->{node} = $c->{node}->close->close;

    # index.
    #
    #       as a special case, close indices here as well, since they are
    #       terminated by the end of their argument list.
    #
    $c->{node} = $c->{node}->close if $c->{node}->type eq 'Index';

    # finally, the current list becomes the next list up in the tree.
    $c->{list} = $c->{list}{parent_list};

    return $c->{list};
}

sub c_STRING {
    my ($c, $value) = @_;
    my @parts = @$value;

    # just one part, a plain string.
    if (@parts == 1) {
        my $string = F::String->new(value => $parts[0]);
        return $c->{node}->adopt($string);
    }

    # more than one part. contains variables.
    my $op = $c->{node} = $c->{node}->adopt(F::Operation->new);
    while (my $part = shift @parts) {
        if (ref $part) {
            __PACKAGE__->can("c_$$part[0]")->($c, @$part[1..$#$part]);
        }
        else { $op->adopt(F::String->new(value => $part)) }
        $op->adopt(F::Operator->new(token => 'OP_ADD')) if @parts;
    }
    $c->{node} = $op->close;

    return $op;
}

sub c_NUMBER {
    my ($c, $value) = @_;

    # create the number...
    my $num = F::Number->new(value => $value);

    # add to the current node.
    $c->{node}->adopt($num);

    return $num;
}

sub c_KEYWORD_UNDEFINED {
    my ($c, $value) = @_;

    # create the bool...
    my $b = F::Boolean->new(value => undef);

    # add to the current node.
    $c->{node}->adopt($b);

    return $b;
}

sub c_KEYWORD_TRUE {
    my ($c, $value) = @_;

    # create the bool...
    my $b = F::Boolean->new(value => 1);

    # add to the current node.
    $c->{node}->adopt($b);

    return $b;
}

sub c_KEYWORD_FALSE {
    my ($c, $value) = @_;

    # create the bool...
    my $b = F::Boolean->new(value => 0);

    # add to the current node.
    $c->{node}->adopt($b);

    return $b;
}

sub c_OP_COMMA {
    my ($c, $value) = @_;

    # we're in a list.
    if ($c->{list}) {

        # set the current node to a new list item.
        $c->{node} = $c->{list}->new_item;

        return $c->{node};
    }

    # we're in a want/need. this starts another.
    if ($c->{node}->type eq 'WantNeed') {
        my $old_wn = $c->{node};

        # fake a semicolon to terminate the instruction
        # wrapping the previous WantNeed.
        c_OP_SEMI($c);

        # create new want/need.
        my $wn = F::WantNeed->new(arg_type => $old_wn->{arg_type});
        $c->{ $old_wn->{arg_type} } = $wn;

        # wrap it with an instruction.
        my $instr = F::Instruction->new;
        $instr->{parent_instruction} = $c->{instruction};
        $c->{instruction} = $instr;
        $c->{node} = $c->{node}->adopt($instr);

        return $c->{node} = $instr->adopt($wn);
    }

    return unexpected($c, 'outside of list') if !$c->{list};
}

sub c_BAREWORD {
    my ($c, $value) = @_;

    # if the last element is a bareword, combine them.
    # ex: Math :: Point == Math::Point
    # ex: A B = AB
    my $l_word = $c->{last_element};
    if ($l_word->type eq 'Bareword') {
        $l_word->{bareword_value} .= $value;
        $l_word->{parent}->adopt($l_word); # to redo after_adopt()
        return $l_word;
    }

    # otherwise, create a new bareword.
    my $word = F::Bareword->new(bareword_value => $value);
    $c->{node}->adopt($word);

    # not yet in function call at this point.
    return $word;
}

sub c_OP_SEMI {
    my ($c, $value) = @_;

    # Rule OP_SEMI[0]:
    #   The current 'instruction' must exist.

    # end of instruction can terminate any of these nodes.
    my @closes = qw(
        WantNeed Equality Operation Assignment
        ReturnPair Return PropertyModifier
    );
    foreach (@closes) {
        $c->{node} = $c->{node}->close if $_ eq $c->{node}->type;
    }

    # at this point, the instruction must be the current node.
    if ($c->{node} != $c->{instruction}) {
        my $type = $c->{node}->desc;
        return unexpected($c, "inside $type");
    }

    # close the instruction.
    $c->{node} = $c->{node}->close;
    $c->{instruction} = $c->{instruction}{parent_instruction};

    # maybe now we can terminate an inline If.
    $c->{node} = $c->{node}->close
        if $c->{node}->type eq 'If' && $c->{node}{inline};

    return;
}

sub c_VAR_LEX {
    my ($c, $value) = @_;
    my $var = F::LexicalVariable->new(var_name => $value);
    return $c->{node}->adopt($var);
}

sub c_VAR_THIS {
    my ($c, $value) = @_;

    # Rule InstanceVariable[0]:
    #   Must be somewhere inside a Class.

    my $var = F::InstanceVariable->new(var_name => $value);
    return $c->{node}->adopt($var);
}

sub c_VAR_SPEC {
    my ($c, $value) = @_;
    my $var = F::SpecialVariable->new(var_name => $value);
    return $c->{node}->adopt($var);
}

sub c_KEYWORD_WANT {
    my ($c, $value) = @_;

    # Rule WantNeed[0]:
    #   Must be a direct child of an Instruction.

    # Rule WantNeed[1]:
    #   Must be somewhere inside a Function or a Method.

    # Rule WantNeed[2]:
    #   When directly inside a method, WantNeed can only directly contain
    #   children of the following types:
    #
    #       Instance variable   (e.g. need @x)
    #       Lexical variable    (e.g. need $x)
    #       Expression          (i.e. the want parameter for fallback value)
    #       Bareword            (i.e. the bareword variable type)
    #

    # Rule WantNeed[3]:
    #   When directly inside a function, WantNeed can only directly contain
    #   children of the following types:
    #
    #       Lexical variable    (e.g. need $x)
    #       Expression          (i.e. the want parameter for fallback value)
    #       Bareword            (i.e. the bareword variable type)
    #

    # Manually implemented rules:
    #   See F/WantNeed.pm for more rules which are implemented in ->adopt().

    my $want = F::WantNeed->new(arg_type => 'want');
    return $c->{node} = $c->{want} = $c->{node}->adopt($want);
}

sub c_KEYWORD_NEED {
    my ($c, $value) = @_;

    # same rules as in c_KEYWORD_WANT above.

    my $need = F::WantNeed->new(arg_type => 'need');
    return $c->{node} = $c->{need} = $c->{node}->adopt($need);
}

sub c_OP_VALUE {
    my $c = shift;

    # inline if can terminate this.
    $c->{node} = $c->{node}->close if $c->{node}->type eq 'Equality';

    # perhaps this is an inline if?
    if (($c->{node}{parameter_for} || '') eq 'if') {
        my $if = $c->{node} = $c->{node}->close;
        $if->{inline} = 1;
        return $if;
    }

    # otherwise just throw the token back in.
    $current->{node}->adopt($current->{unknown_el});

}

sub c_PROP_VALUE {
    my ($c, $value) = @_;

    # Rule Pair[0]:
    #   Must be somewhere inside a List.

    # Rule Pair[1]:
    #   Must be a direct child of a List item.

    # create a new node which is a pair.
    my $pair = F::Pair->new(key => $value);
    $c->{node} = $c->{node}->adopt($pair);

    return $pair;
}

sub c_PROPERTY {
    my ($c, $value) = @_;
    # TODO: check if last element is allowed.
    my $prop = F::Property->new(prop_name => $value);

    my $last_el = $c->{last_element};
    return expected($c,
        'an expression',
        'at left of '.Ferret::Lexer::pretty_token($c->{label})
    ) unless $last_el->is_type('Expression');

    $c->{node}->adopt($prop);
    $prop->adopt($last_el);

    return $prop;
}

sub c_OP_ASSIGN {
    my ($c, $value) = @_;

    # if we're in a WantNeed, it's not a real assignment.
    if ($c->{node}->type eq 'WantNeed') {
        return $c->{node}->adopt($c->{unknown_el});
    }

    my $last_el = $c->{last_element};
    return expected($c,
        'an assignable expression',
        'at left of assignment operator (=)'
    ) unless $last_el->is_type('Assignable');

    # remember the last element as the left side of the assignment.
    my $a = $c->{node} = $c->{node}->adopt(F::Assignment->new);
    $a->{left_side} = $last_el;
    $last_el->parent->abandon($last_el);

    return $a;
}

sub c_OP_EQUAL      { handle_equality(shift, 0, 0) }
sub c_OP_EQUAL_I    { handle_equality(shift, 0, 1) }
sub c_OP_NEQUAL     { handle_equality(shift, 1, 0) }
sub c_OP_NEQUAL_I   { handle_equality(shift, 1, 1) }

sub handle_equality {
    my ($c, $negated, $obj_equality) = @_;

    my $last_el = $c->{last_element};
    return expected($c,
        'an expression',
        'at left of '.Ferret::Lexer::pretty_token($c->{label})
    ) unless $last_el->is_type('Expression');

    # adopt the last element as the left side of the equality.
    my $equality = $c->{node} = $c->{node}->adopt(
        F::Equality->new(
            negated      => $negated,
            obj_equality => $obj_equality
        )
    );
    $equality->adopt($last_el);

    return $equality;
}

*c_OP_ADD = *c_OP_SUB =
*c_OP_MUL = *c_OP_DIV =
*c_OP_POW = *c_math_operator;

sub c_math_operator {
    my ($c, $value) = @_;
    my $last_el = $c->{last_element};

    # if it's addition or subtraction, it might be a sign.
    my %signs = (OP_ADD => 1, OP_SUB => 1);
    if (!$last_el->is_type('Expression') && $signs{ $c->{label} }) {
        undef $last_el;
    }

    return expected($c,
        'an expression',
        'at left of '.Ferret::Lexer::pretty_token($c->{label})
    ) if $last_el && !$last_el->is_type('Expression');

    # if the current node is an operation, just add another thing.
    my $operator = F::Operator->new(token => $c->{label});
    if ($c->{node}->type eq 'Operation') {
        $c->{node}->adopt($operator);
        return $operator;
    }

    # adopt the last element as the left side of the operation.
    my $op = $c->{node} = $c->{node}->adopt(F::Operation->new);
    $op->adopt($last_el) if $last_el;
    $op->adopt($operator);

    return $op;
}

sub c_OP_RETURN {
    my ($c, $value) = @_;

    # the previous element MUST be a bareword.
    my $word = $c->{last_element};
    return expected($c,
        'a bareword key',
        'at left of return operator (->)'
    ) unless $word->type eq 'Bareword';

    # forget about the bareword.
    $word->parent->abandon($word);

    # create a return pair with the proper key.
    my $pair = F::ReturnPair->new(key => $word->{bareword_value});
    $c->{node} = $c->{node}->adopt($pair);

    return $pair;
}

sub c_KEYWORD_RETURN {
    my ($c, $value) = @_;
    my $ret = F::Return->new;
    return $c->{node} = $c->{node}->adopt($ret);
}

sub c_OP_PACK {
    my ($c, $value) = @_;
    my $l_word = $c->{last_element};

    # left side must be bareword.
    return expected($c,
        'a bareword',
        'at left of namespace operator (::)'
    ) unless $l_word->type eq 'Bareword';

    # right side must be bareword.
    return expected($c,
        'a bareword',
        'at right of namespace operator (::)'
    ) unless $c->{next_tok}[0] eq 'BAREWORD';

    $l_word->{bareword_value} .= '::';
    return $l_word;
}


sub c_OP_MAYBE {
    my ($c, $value) = @_;

    # must come after expression.
    my $last_el = $c->{last_element};
    return unexpected($c) unless $last_el->is_type('Expression');

    # if this is a list, it can only have one item.
    if ($last_el->isa('F::List') && $last_el->children > 1) {
        return expected($c, 'a single-element list', 'before');
    }

    # create a maybe, adopting the last element.
    my $maybe = $c->{node}->adopt(F::Maybe->new);
    $maybe->adopt($last_el);

    # add the maybe to the instruction.
    $c->{instruction}->add_maybe($maybe);

    return $maybe;
}

sub c_OP_NOT {
    my ($c, $value) = @_;
    my $not = F::Negation->new;
    $c->{node} = $c->{node}->adopt($not);
}

sub start_modifier {
    my ($c, $type) = @_;

    # Rule PropertyModifier[0]:
    #   Must be a direct child of an Instruction.

    # Rule PropertyModifier[1]:
    #   Direct children must be one of the following types:
    #
    #       Lexical variable
    #       Instance variable
    #       Property
    #

    # Rule PropertyModifier[2]:
    #   Direct children must satisfy the following condition:
    #
    #       if (child is a Property)
    #           Property must not be special
    #

    # Rule PropertyModifier[3]:
    #   Number of direct children must not exceed one (1).

    my $mod = F::PropertyModifier->new(mod_type => $type);
    $c->{node} = $c->{node}->adopt($mod);
    return $mod;
}

sub c_KEYWORD_DELETE {
    my ($c, $value) = @_;
    # see start_modifier() for rules.
    return start_modifier($c, 'delete');
}

sub c_KEYWORD_WEAKEN {
    my ($c, $value) = @_;
    # see start_modifier() for rules.
    return start_modifier($c, 'weaken');
}

sub c_any {
    my ($label, $c, $value) = @_;

    ### TERMINATE A NEGATION ###
    # TODO: I would like to implement auto-closing of some sort.
    if ($c->{node}->type eq 'Negation' && $c->{node}->children) {
        $c->{node} = $c->{node}->close;
        $c->{redo} = 1;
    }

    ### START AN INSTRUCTION ###

    # can the current node hold instructions?
    return unless $c->{node}->hold_instr;

    # if the current node does not directly allow instructions,
    # do not start an instruction here. for example, the
    # expression representing the condition of an if block
    # does not allow instructions.
    return if $c->{node}{no_instructions};

    # these things cannot start an instruction.
    # (tokens only) (this is horrendous)
    my @ignore = qw(
        ^FUNCTION$          ^CLOSURE_.+$
        ^METHOD$            ^COMPUTED$
        ^PKG_DEC$           ^CLASS_DEC$
        ^KEYWORD_INSIDE$    ^KEYWORD_FOR$
        ^KEYWORD_ON$        ^KEYWORD_END$   ^KEYWORD_IF$
    );
    foreach (@ignore) { return if $label =~ $_ }

    my $instruction = F::Instruction->new;
    $instruction->{parent_instruction} = $c->{instruction};
    @$c{ qw(node instruction) } = ($c->{node}->adopt($instruction)) x 2;
}

sub c_spaces {
    my ($c, $main_node) = @_;
    my $spaces = F::Spaces->new;
    $main_node->adopt($spaces);
    return;
}

sub c_eof {
    my ($c, $main_node) = @_;

    # end of file can terminate a class.
    $c->{node} = $c->{node}->close if $c->{node}->type eq 'Class';

    # when all is said and done, the current node should be the main node.
    if ($current->{node} != $main_node) {
        my $node = $current->{node};
        my $desc = $node->desc;

        # if the node started on a different line than current,
        # mention where it started.
        my $started = $node->{create_line} == $current->{line} ?
            '' : " (which started on line $$node{create_line})";

        return expected($current,
            "termination of $desc$started",
            'before reaching end of file'
        );
    }
}

# returns the first parent node which is not a list or a list item.
sub first_non_list_parent {
    my $node = shift;
    while ($node = $node->parent) {
        next if $node->isa('F::List');
        next if $node->isa('F::ListItem');
        return $node;
    }
    return;
}

sub fatal {
    my ($c, $err) = @_;
    my $near = last_el($c);
    my @caller = @{ delete $c->{err_caller} || [caller] };
    $err .= "\n     File    -> $$c{file}";
    $err .= "\n     Line    -> $$c{line}";
    $err .= "\n     Near    -> $near";
    $err .= "\n     Parent  -> ".$c->{node}->desc if $c->{node};
    $err .= "\n\nException raised by $caller[0] line $caller[2].";
    return Ferret::Lexer::fatal($err);
}

sub expected {
    my ($c, $what, $where) = @_;
    $c->{err_caller} ||= [caller];
    $where //= '';
    fatal($c, "Expected $what $where.");
}

sub unexpected {
    my ($c, $reason, $err_desc) = @_[0, 1];
    $c->{err_caller} ||= [caller];

    # if it's an arrayref, it's from a rule with a description.
    ($reason, $err_desc) = @$reason if ref $reason eq 'ARRAY';
    $err_desc = length $err_desc ? "\n$err_desc." : '';
    $reason   = length $reason   ? " $reason"     : '';

    # if we're processing element rules, use the actual element if possible.
    # otherwise, use the pretty representation of the token.
    my $what = $current->{rule_el} ?
        $current->{rule_el}->desc  :
        Ferret::Lexer::pretty_token($c->{label});

    fatal($c, "Unexpected $what$reason.$err_desc");
}

sub last_el {
    my $c = shift;
    return $c->{elements}[-1]->desc if $c->{elements}[-1];
    return 'beginning of file';
}

1
