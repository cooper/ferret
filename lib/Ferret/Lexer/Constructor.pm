# Copyright (c) 2015, Mitchell Cooper
package Ferret::Lexer::Constructor;

use warnings;
use strict;
use 5.010;

use Scalar::Util qw(blessed);

use Ferret::Lexer::Current;
use Ferret::Lexer::Rules;

our ($current, $error);

sub construct {
    my $main_node = shift;

    $current = Ferret::Lexer::Current->new(
        main_node => $main_node,
        file      => $main_node->{name} || 'unknown',
        node      => $main_node,
        elements  => [],
        upcoming  => \@_
    );

    while (my ($label, $value, $line) = @{ shift || [] }) {
        my $e = handle_label($label, $value, $line);
        return $e if $e;
    }

    c_spaces($current, $main_node);
    my $e = c_eof($current, $main_node);
    return $e if $e;
    Ferret::Lexer::RuleFunctions::final_check($main_node);

    return $error;
}

sub check_error {
    my $err = $error;
    undef $error;
    return $err;
}

sub handle_label {
    my ($label, $value, $line) = @_;
    my $redo = sub { handle_label($label, $value, $line) };
    my $last_el = ($current->node->children)[-1] || $current->node;
    $line //= 0;
    my $err;

    # check for error.
    return $err if $err = check_error();

    # current info.
    @$current{ qw(label value line next_tok last_el) } = (
        $label, $value,
        $line,  $current->{upcoming}[0],
        $last_el
    );

    $current->{unknown_el} = F::Unknown->new(
        token_label => $label,
        token_value => $value
    );

    # check token rules.
    Ferret::Lexer::RuleFunctions::token_check($label, $current, $value);
    return $err if $err = check_error();

    # call the handler for all.
    my $started_instr = c_any($label, $current, $value);

    # redo.
    return $redo->() if $current->should_redo;

    # call a handler if one exists.
    if (my $code = __PACKAGE__->can("c_$label")) {
        my $el = $code->($current, $value);

        # check error.
        return $err if $err = check_error();
        if (blessed $el) {
            return $el if $el->isa('F::Error');
            push @{ $current->{elements} }, $el;
        }

        # started an instruction.
        $el->{started_instr} = 1 if $started_instr;

        # redo.
        return $redo->() if $current->should_redo;

        # all is good.
        return;

    }

    # nothing to handle it. throw in an unknown element.
    $current->node->adopt($current->unknown_el);

    # final error check.
    return $err if $err = check_error();

    return;
}

sub c_PKG_DEC {
    my ($c, $value) = @_;

    # create a package.
    my $pkg = F::Package->new(pkg_name => $value->{name});
    $c->set_package($pkg);

    # Rule Package[0]:
    #   Must be a direct child of a Document.

    $c->node->adopt($pkg);
    return $pkg;
}

sub c_CLASS_DEC {
    my ($c, $value) = @_;

    # terminate current class.
    $c->close_node_maybe('Class');

    # create class.
    my $class = F::Class->new(%$value);
    $c->set_class($class);

    # Rule Class[0]:
    #   Must be a direct child of a Document.

    # set as current node.
    # will be terminated by another class declaration, 'end', or end of file.
    $c->adopt_and_set_node($class);

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
    my $class_or_pkg = $c->end_cap;
    if ($c->class && $class_or_pkg == $c->class) {
        $c->close_class;
    }

    # return to the previous package.
    elsif ($c->package && $class_or_pkg == $c->package) {
        return $c->unexpected(
            '(multiple packages per file not yet implemented)'
        );
    }

    # close it.
    $c->close_end_cap;
    $c->close_node;

    return;
}

sub c_METHOD {
    my ($c, $value) = @_;

    # Rule Method[0]:
    #   Must be a direct child of a Class.

    my $method = F::Method->new(%$value, event_cb => 1);

    $c->node->adopt($method);
    $c->set_node($method->body);
    $c->capture_closure_with($method->body);

    return $method;
}

sub c_FUNCTION {
    my ($c, $value) = @_;

    my $function = F::Function->new(
        %$value,
        event_cb => !$value->{anonymous}
        # anonymous functions are not implemented as events
    );

    $c->node->adopt($function);
    $c->set_node($function->body);
    $c->capture_closure_with($function->body);

    return $function;
}

# start of a closure
sub c_CLOSURE_S {
    my ($c, $value) = @_;

    # Rule CLOSURE_S[0]:
    #   The current 'clos_cap' must exist.

    my $closure = $c->get_closure;

    # if it's a call, the closure is a function being passed.
    if ($closure->type eq 'Call') {
        my $call = $closure;
        $call->{call_capturing_closure} = 1;

        # create a function.
        my $func = F::Function->new(anonymous => 1, call_closure => 1);
        $func->body->{call_closure} = 1;
        $c->set_node($func->body);

        # make it an argument to the call.
        $call->arg_list->new_item->adopt($func);

        $closure = $func->body;
    }

    # a closure can terminate an equality.
    $c->close_node_maybe('Equality');

    # a closure can terminate a generated expression.
    # for instance, inside $something {}. the expression $something ends there.
    my $node = $c->node;
    if ($node->{generated_expression}) {
        $c->close_node;
        $c->set_node(delete $node->{set_body}) if $node->{set_body};
    }

    # remember which closure this is inside; if any.
    # then, set this node as the current closure.
    $c->set_closure($closure);

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
    my $closure = $c->closure;
    $c->close_closure;
    $c->close_node($closure->type eq 'Body' ? 2 : 1);

    # this is a closure-capturing function call.
    if ($closure->{call_closure}) {

        # terminate the call.
        my $upper_call = $c->node->first_self_or_parent('Call');
        if ($upper_call->{call_capturing_closure}) {
            $c->close_node_until($upper_call->parent);
        }

        # simulate a semicolon
        # only if the call started the instruction.
        #
        # $blah = something() { };  # do not simulate semicolon
        # something () { }          # simulate semicolon
        #
        c_OP_SEMI($c) if $upper_call->{started_instr};

    }

    return;
}

sub c_KEYWORD_INSIDE {
    my ($c, $value) = @_;

    # create a closure to be opened soon.
    my $inside = F::Inside->new(type => 'Inside');
    $c->capture_closure_with($inside->body);
    $c->node->adopt($inside);

    # set the current node to the inside expression.
    $inside->param_exp->{set_body} = $inside->body;
    $c->set_node($inside->param_exp);

    return $inside;
}

sub c_KEYWORD_ON {
    my ($c, $value) = @_;

    # create on.
    my $on = F::On->new(type => 'On');

    # set the closure to the function of on.
    $c->capture_closure_with($on->function->body);
    $c->node->adopt($on);

    # set the current node to the on expression.
    $on->param_exp->{set_body} = $on->function->body;
    $c->set_node($on->param_exp);

    return $on;
}

sub c_KEYWORD_IF {
    my ($c, $value) = @_;

    # create an if statement which expects a closure to be opened soon.
    my $if = F::If->new(type => 'If');
    $c->node->adopt($if);
    $c->capture_closure_with($if->body);

    # set the current node to the conditional expression.
    $if->param_exp->{set_body} = $if->body;
    $c->set_node($if->param_exp);

    return $if;
}

# sub c_KEYWORD_THEN {
#     my ($c, $value) = @_;
#
#     my $then = F::Node->new(type => 'Then');
#
#     $c->adopt_and_set_node($then);
#     $c->capture_closure_with($then);
#
#     return $then;
# }

sub c_KEYWORD_FOR {
    my ($c, $value) = @_;

    # create a closure to be opened soon.
    my $for = F::For->new(type => 'For');

    $c->node->adopt($for);
    $c->capture_closure_with($for->body);

    # set the node to the for parameter.
    $for->param_exp->{set_body} = $for->body;
    $c->set_node($for->param_exp);

    return $for;
}

sub c_KEYWORD_IN {
    my ($c, $value) = @_;

    # 'in' must terminate a generated expression for 'for'.
    return $c->unexpected("(where is 'for'?)") unless
        $c->node->{parameter_for} && $c->node->{parameter_for} eq 'for';
        # FIXME: if wrapped in parentheses, this will fail.

    my $for_exp = $c->node;
    delete $for_exp->{set_body};

    # set the node to the 'in' parameter.
    my $for = $c->close_node;
    $for->in_param_exp->{set_body} = $for->body;
    return $c->set_node($for->in_param_exp);

}

sub c_PAREN_S {
    my ($c, $value) = @_;
    my $list = $c->start_list('PAREN_E');
    return $list;
}

sub c_BRACKET_S {
    my ($c, $value) = @_;
    my $list = $c->start_list('BRACKET_E');
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
    my ($c, $value, $has_list, $is_index) = @_;

    my $terminator = $is_index ? 'BRACKET_E' : 'PAREN_E';
    my $package    = $is_index ? 'F::Index'  : 'F::Call';

    # a call can only come after an expression.
    my $last_el = $c->last_el;
    return $c->unexpected unless $last_el->is_type('Expression');

    # if this is a list, it can only have one item.
    if ($last_el->isa('F::List')
     && $last_el->children > 1) {
        return $c->expected('a single-element list', 'before');
    }

    # create a function call, adopting the last element.
    my $call = $c->node->adopt($package->new);
    $call->adopt($last_el);
    $call->{started_instr} = $last_el->{started_instr};

    # handle the list, then adopt it.
    if ($has_list) {
        my $list = $c->start_list($terminator);
        $list->{is_call} = 1;
        $list->{collection} = 1; # pretend to be array/hash for checks.
        $call->adopt($list);

        # found a more likely thing to capture a closure -
        # something that's not a call like an if or on.
        my $more_likely = $c->clos_cap
            if $c->clos_cap && $c->clos_cap->type ne 'Call';

        # clos_cap is just a call or nothing; use this call as the new clos_cap.
        $c->capture_closure_with($call) if !$is_index && !$more_likely;

    }

    return $call;
}

sub c_PAREN_E {
    my ($c, $value) = @_;

    # Rule PAREN_E[0]:
    #   The current 'list' must exist.

    # this must be the expected list terminator.
    my $t = $c->list->{list_terminator};
    my $p = Ferret::Lexer::pretty_token($t);
    return $c->unexpected("to close list (instead of $p)")
        if $t ne 'PAREN_E';

    # closes these things.
    $c->close_nodes(qw(Negation Operation Equality Pair));

    # close the list itself.
    #
    #       the current node becomes
    #       the current node (list item)'s parent (list)'s parent
    #
    return $c->unexpected if $c->node->parent != $c->list;
    $c->close_node(2);

    # function call.
    #
    #       as a special case, close function calls here as well, since they are
    #       terminated by the end of their argument list.
    #
    $c->close_node_maybe('Call');

    # finally, the current list becomes the next list up in the tree.

    return $c->close_list;
}

sub c_BRACKET_E {
    my ($c, $value) = @_;

    # Rule BRACKET_E[0]:
    #   The current 'list' must exist.

    # this must be the expected list terminator.
    my $t = $c->list->{list_terminator};
    my $p = Ferret::Lexer::pretty_token($t);
    return $c->unexpected("to close list (instead of $p)")
        if $t ne 'BRACKET_E';

    # closes these things.
    $c->close_nodes(qw(Equality Operation Pair));

    # close the list itself.
    #
    #       the current node becomes
    #       the current node (list item)'s parent (list)'s parent
    #
    return $c->unexpected if $c->node->parent != $c->list;
    $c->close_node(2);

    # index.
    #
    #       as a special case, close indices here as well, since they are
    #       terminated by the end of their argument list.
    #
    $c->close_node_maybe('Index');

    # finally, the current list becomes the next list up in the tree.

    return $c->close_list;
}

sub c_STRING {
    my ($c, $value) = @_;
    my @parts = @$value;

    # just one part.
    if (@parts == 1) {
        # FIXME: probably force string context of variables here
        return handle_label(@{ $parts[0] }) if ref $parts[0];
        my $string = F::String->new(value => $parts[0]);
        return $c->node->adopt($string);
    }

    # more than one part. contains variables.
    my $op = F::Operation->new;
    $c->adopt_and_set_node($op);

    while (my $part = shift @parts) {
        my $is_prop = ref $part && $part->[0] eq 'PROPERTY';

        # add an addition operator unless it's a property.
        $op->adopt(F::Operator->new(token => 'OP_ADD'))
            if $op->last_child && !$is_prop &&
               $op->last_child->type ne 'Operator';

        # variable or property part.
        if (ref $part) {
            handle_label(@$part);
        }

        # just a string part.
        else {
            $op->adopt(F::String->new(value => $part));
        }

    }
    $c->close_node;

    return $op;
}

sub c_NUMBER {
    my ($c, $value) = @_;

    # create the number...
    my $num = F::Number->new(value => $value);

    # add to the current node.
    $c->node->adopt($num);

    return $num;
}

sub c_KEYWORD_UNDEFINED {
    my ($c, $value) = @_;

    # create the bool...
    my $b = F::Boolean->new(value => undef);

    # add to the current node.
    $c->node->adopt($b);

    return $b;
}

sub c_KEYWORD_TRUE {
    my ($c, $value) = @_;

    # create the bool...
    my $b = F::Boolean->new(value => 1);

    # add to the current node.
    $c->node->adopt($b);

    return $b;
}

sub c_KEYWORD_FALSE {
    my ($c, $value) = @_;

    # create the bool...
    my $b = F::Boolean->new(value => 0);

    # add to the current node.
    $c->node->adopt($b);

    return $b;
}

sub c_VAR_SYM {
    my ($c, $value) = @_;

    # create the symbol...
    my $b = F::Symbol->new(sym_value => $value);

    # add to the current node.
    $c->node->adopt($b);

    return $b;
}

sub c_OP_COMMA {
    my ($c, $value) = @_;

    # we're in a list.
    if ($c->list) {

        # set the current node to a new list item.
        $c->set_node($c->list->new_item);

        return $c->node;
    }

    # we're in a want/need. this starts another.
    if ($c->node->type eq 'WantNeed') {
        my $old_wn = $c->node;

        # fake a semicolon to terminate the instruction
        # wrapping the previous WantNeed.
        c_OP_SEMI($c);

        # create new want/need.
        my $wn = F::WantNeed->new(arg_type => $old_wn->{arg_type});

        # wrap it with an instruction.
        my $instr = F::Instruction->new;
        $c->set_instruction($instr);
        $c->adopt_and_set_node($instr);

        return $c->adopt_and_set_node($wn);
    }

    return $c->unexpected('outside of list') if !$c->list;
}

sub c_BAREWORD {
    my ($c, $value) = @_;

    # if the last element is a bareword, combine them.
    # ex: Math :: Point == Math::Point
    # ex: A B = AB
    my $l_word = $c->last_el;
    if ($l_word->type eq 'Bareword') {
        $l_word->{bareword_value} .= $value;
        $l_word->{parent}->adopt($l_word); # to redo after_adopt()
        return $l_word;
    }

    # otherwise, create a new bareword.
    my $word = F::Bareword->new(bareword_value => $value);
    $c->node->adopt($word);

    # not yet in function call at this point.
    return $word;
}

sub c_OP_SEMI {
    my $c = shift;

    # Rule OP_SEMI[0]:
    #   The current 'instruction' must exist.

    # close these things.
    $c->close_nodes(qw(
        WantNeed PropertyModifier Negation Operation
        Equality Assignment Return ReturnPair
    ));

    # at this point, the instruction must be the current node.
    if ($c->node != $c->instruction) {
        my $type = $c->node->desc;
        return $c->unexpected("inside $type");
    }

    # close the instruction.
    $c->close_node;
    $c->close_instruction;

    # maybe now we can terminate an inline If.
    my ($n, $p) = ($c->node, $c->node->parent);
    $c->close_node(2)
        if $p && $n->type eq 'Body' && $p->type eq 'If' && $p->{inline};

    return;
}

sub c_VAR_LEX {
    my ($c, $value) = @_;
    my $var = F::LexicalVariable->new(var_name => $value);
    return $c->node->adopt($var);
}

sub c_VAR_THIS {
    my ($c, $value) = @_;

    # Rule InstanceVariable[0]:
    #   Must be somewhere inside a Class.

    my $var = F::InstanceVariable->new(var_name => $value);
    return $c->node->adopt($var);
}

sub c_VAR_SPEC {
    my ($c, $value) = @_;
    my $var = F::SpecialVariable->new(var_name => $value);
    return $c->node->adopt($var);
}

sub c_VAR_SET {
    my ($c, $value) = @_;
    my $var = F::SetTypeVariable->new(var_name => $value);
    return $c->node->adopt($var);
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
    #       Bareword            (i.e. bareword variable type; need $x: Str)
    #       Set type variable   (i.e. set type variable type; need $x: <Str>)
    #

    # Rule WantNeed[3]:
    #   When directly inside a function, WantNeed can only directly contain
    #   children of the following types:
    #
    #       Lexical variable    (e.g. need $x)
    #       Expression          (i.e. the want parameter for fallback value)
    #       Bareword            (i.e. bareword variable type; need $x: Str)
    #       Set type variable   (i.e. set type variable type; need $x: <Str>)
    #

    # Manually implemented rules:
    #   See F/WantNeed.pm for more rules which are implemented in ->adopt().

    my $want = F::WantNeed->new(arg_type => 'want');
    return $c->adopt_and_set_node($want);
}

sub c_KEYWORD_NEED {
    my ($c, $value) = @_;

    # same rules as in c_KEYWORD_WANT above.

    my $need = F::WantNeed->new(arg_type => 'need');
    return $c->adopt_and_set_node($need);
}

sub c_OP_VALUE {
    my $c = shift;

    # inline if can terminate this.
    $c->close_nodes(qw(Negation Equality));

    # perhaps this is an inline if?
    if (($c->node->{parameter_for} || '') eq 'if') {
        my $if = $c->close_node;
        $if->{inline} = 1;
        $c->set_node($if->body);
        return $if;
    }

    # otherwise just throw the token back in.
    $c->node->adopt($c->unknown_el);

}

sub c_PROP_VALUE {
    my ($c, $value) = @_;

    # Rule Pair[0]:
    #   Must be somewhere inside a List.

    # Rule Pair[1]:
    #   Must be a direct child of a List item.

    # create a new node which is a pair.
    my $pair = F::Pair->new(key => $value);
    $c->adopt_and_set_node($pair);

    return $pair;
}

sub c_PROPERTY {
    my ($c, $value) = @_;
    my $prop = F::Property->new(prop_name => $value);

    my $last_el = $c->last_el;
    return $c->expected(
        'an expression',
        'at left of '.Ferret::Lexer::pretty_token($c->label)
    ) unless $last_el->is_type('Expression');

    $c->node->adopt($prop);
    $prop->adopt($last_el);

    return $prop;
}

sub c_OP_ASSIGN {
    my ($c, $value) = @_;

    # if we're in a WantNeed, it's not a real assignment.
    if ($c->node->type eq 'WantNeed') {
        return $c->node->adopt($c->unknown_el);
    }

    my $last_el = $c->last_el;
    return $c->expected(
        'an assignable expression',
        'at left of assignment operator (=)'
    ) unless $last_el->is_type('Assignable');

    # remember the last element as the left side of the assignment.
    my $a = F::Assignment->new;
    $c->adopt_and_set_node($a);
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

    # equality closes these.
    my $redo = $c->close_nodes(qw(Negation Equality));

    # if we closed something, redo to update last_el.
    return $c->redo if $redo;

    my $last_el = $c->last_el;
    return $c->expected(
        'an expression',
        'at left of '.Ferret::Lexer::pretty_token($c->label)
    ) unless $last_el->is_type('Expression');

    # adopt the last element as the left side of the equality.
    my $equality = F::Equality->new(
        negated      => $negated,
        obj_equality => $obj_equality
    );
    $c->adopt_and_set_node($equality);
    $equality->adopt($last_el);

    return $equality;
}

*c_OP_ADD = *c_OP_SUB =
*c_OP_MUL = *c_OP_DIV =
*c_OP_POW = *c_OP_MOD = *c_OP_RANGE = *c_math_operator;

sub c_math_operator {
    my ($c, $value) = @_;
    my $last_el = $c->last_el;

    # if it's addition or subtraction, it might be a sign.
    my %signs = (OP_ADD => 1, OP_SUB => 1);
    if (!$last_el->is_type('Expression') && $signs{ $c->label }) {
        undef $last_el;
    }

    return $c->expected(
        'an expression',
        'at left of '.Ferret::Lexer::pretty_token($c->label)
    ) if $last_el && !$last_el->is_type('Expression');

    # if the current node is an operation, just add another thing.
    my $operator = F::Operator->new(token => $c->label);
    if ($c->node->type eq 'Operation') {
        $c->node->adopt($operator);
        return $operator;
    }

    # adopt the last element as the left side of the operation.
    my $op = F::Operation->new;
    $c->adopt_and_set_node($op);
    $op->adopt($last_el) if $last_el;
    $op->adopt($operator);

    return $op;
}

sub c_OP_RETURN {
    my ($c, $value) = @_;

    # the previous element MUST be a bareword.
    my $word = $c->last_el;
    return $c->expected(
        'a bareword key',
        'at left of return operator (->)'
    ) unless $word->type eq 'Bareword';

    # forget about the bareword.
    $word->parent->abandon($word);

    # create a return pair with the proper key.
    my $pair = F::ReturnPair->new(key => $word->{bareword_value});
    $c->adopt_and_set_node($pair);

    return $pair;
}

sub c_KEYWORD_RETURN {
    my ($c, $value) = @_;
    my $ret = F::Return->new;
    return $c->adopt_and_set_node($ret);
}

sub c_OP_PACK {
    my ($c, $value) = @_;
    my $l_word = $c->last_el;

    # left side must be bareword.
    return $c->expected(
        'a bareword',
        'at left of namespace operator (::)'
    ) unless $l_word->type eq 'Bareword';

    # right side must be bareword.
    return $c->expected(
        'a bareword',
        'at right of namespace operator (::)'
    ) unless $c->next_tok eq 'BAREWORD';

    $l_word->{bareword_value} .= '::';
    return $l_word;
}


sub c_OP_MAYBE {
    my ($c, $value) = @_;

    # must come after expression.
    my $last_el = $c->last_el;
    return $c->unexpected unless $last_el->is_type('Expression');

    # if this is a list, it can only have one item.
    if ($last_el->isa('F::List') && $last_el->children > 1) {
        return $c->expected('a single-element list', 'before');
    }

    # create a maybe, adopting the last element.
    my $maybe = $c->node->adopt(F::Maybe->new);
    $maybe->adopt($last_el);

    # add the maybe to the instruction.
    $c->instruction->add_maybe($maybe);

    return $maybe;
}

sub c_OP_NOT {
    my ($c, $value) = @_;
    my $not = F::Negation->new;
    $c->adopt_and_set_node($not);
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
    return $c->adopt_and_set_node($mod);
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

    ### START AN INSTRUCTION ###

    # can the current node hold instructions?
    return unless $c->node->hold_instr;

    # if the current node does not directly allow instructions,
    # do not start an instruction here. for example, the
    # expression representing the condition of an if block
    # does not allow instructions.
    return if $c->node->{no_instructions};

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

    my $instr = F::Instruction->new;
    $c->set_instruction($instr);
    $c->adopt_and_set_node($instr);

    return 1; # true = started an instruction
}

sub c_spaces {
    my ($c, $main_node) = @_;
    my $spaces = F::Spaces->new;
    $main_node->adopt($spaces);
    return;
}

sub c_eof {
    my ($c, $main_node) = @_;

    # if there's a current instruction, fake a semicolon.
    if ($c->instruction) {
        c_OP_SEMI($c);
    }

    # end of file can terminate these.
    $c->close_node_maybe('Class');

    # when all is said and done, the current node should be the main node.
    if ($c->node != $main_node) {
        my $node = $c->node;
        my $desc = $node->desc;

        # if the node started on a different line than current,
        # mention where it started.
        my $started = $node->{create_line} == $c->line ?
            '' : " (which started on line $$node{create_line})";

        return $c->expected(
            "termination of $desc$started",
            'before reaching end of file'
        );
    }

    return;
}

1
