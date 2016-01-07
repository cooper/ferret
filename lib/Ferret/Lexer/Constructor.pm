# Copyright (c) 2015, Mitchell Cooper
package Ferret::Lexer::Constructor;

use warnings;
use strict;
use 5.010;

use Scalar::Util qw(blessed);

use F;
use Ferret::Lexer::Current;
use Ferret::Lexer::Rules;
use Ferret::Lexer::Scope;
use Ferret::Lexer::Verifier;

our ($current, $error);

sub construct {
    my $main_node = shift;
    my $err;

    # CONSTRUCTOR
    # ===========

    # separate into lines.
    my @tokens = @_;
    my (@lines, %positions);
    foreach my $tok (@tokens) {
        my $pos = $tok->[2];
        $positions{$pos} = $tok;
        push @{ $lines[ int $pos ] ||= [] }, $tok;
    }

    $current = Ferret::Lexer::Current->new(
        main_node   => $main_node,
        file        => $main_node->{name} || 'unknown',
        node        => $main_node,
        token_lines => \@lines,
        token_pos   => \%positions,
        upcoming    => \@tokens,
        done_toks   => [],
        elements    => []
    );

    while (my ($label, $value, $position) = @{ shift @tokens || [] }) {
        return $err if $err = handle_label($label, $value, $position);
    }

    # inject includes and EOF.
    c_spaces($current, $main_node);
    return $err if $err = c_eof($current, $main_node);

    # ENFORCER
    # ========
    Ferret::Lexer::RuleFunctions::final_check($main_node);
    return $err if $err = check_error();

    # VERIFIER
    # ========
    Ferret::Lexer::Verifier::verify($main_node);
    return $err if $err = check_error();

    return;
}

sub check_error {
    my $err = $error;
    undef $error;
    return $err;
}

sub handle_label {
    my ($label, $value, $position) = @_;
    my $redo = sub { handle_label($label, $value, $position) };
    my $last_el = ($current->node->children)[-1] || $current->node;
    $position //= 0;
    my $err;

    # check for error.
    return $err if $err = check_error();

    # current info.
    @$current{ qw(label value line position next_tok last_el unknown_el) } = (
        $label, $value,
        int $position, $position,
        $current->{upcoming}[0],
        $last_el,
        undef
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
    }

    # nothing to handle it. throw in an unknown element.
    else {

        # Rule Token[0]:
        #   Parent must be of type NONE (pseudotype representing no type).

        $current->node->adopt($current->unknown_el);
    }

    push @{ $current->{done_toks} }, [ $label, $value ];

    # final error check.
    return $err if $err = check_error();

    return;
}

sub c_PKG_DEC {
    my ($c, $value) = @_;

    # create a package.
    my $pkg = F::new('Package', pkg_name => $value->{name});
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
    my $class = F::new('Class', %$value);
    $c->set_class($class);

    # Rule Class[0]:
    #   Must be a direct child of a Document.

    # set as current node.
    # will be terminated by another class declaration, 'end', or end of file.
    $c->adopt_and_set_node($class);

    # Rule Class[1]:
    #   Direct children must be of one of the following types:
    #       Function
    #       Method
    #       Instruction
    #       Type

    # Rule Class[2]:
    #   If a direct child is an Instruction, its statement must satisfy one
    #   of the following conditions:
    #
    #       Child is a 'load' statement.
    #       Child is an 'alias' statement.
    #       Child is a lexical variable assignment.
    #

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

    my $method = F::new('Method', %$value, event_cb => 1);

    $c->node->adopt($method);
    $c->capture_closure_with($method->body);

    return $method;
}

sub c_FUNCTION {
    my ($c, $value) = @_;

    # Rule Function[0]:
    #   If the function is named (not anonymous), it must be a direct child
    #   of a subtype of ScopeOwner.

    # if the current node is a class and this is not a private function,
    # it's a class method.
    my $first_char = length $value->{name} ? substr $value->{name}, 0, 1 : '';
    if ($c->node->type eq 'Class' && $first_char ne '_') {
        $value->{main} = 1;
        return $c->simulate('METHOD', $value);
    }

    my $function = F::new('Function',
        %$value,
        event_cb => !$value->{anonymous}
        # anonymous functions are not implemented as events
    );

    $c->node->adopt($function);
    $c->capture_closure_with($function->body);

    return $function;
}

# start of a closure
sub c_CLOSURE_S {
    my ($c, $value, $is_colon) = @_;

    # Rule CLOSURE_S[0]:
    #   The current 'clos_cap' must exist.

    my $closure = $c->get_closure;

    # if it's a call, the closure is a function being passed.
    if ($closure->type eq 'Call') {
        my $call = $closure;
        $call->{call_capturing_closure} = 1;

        # create a function.
        my $func = F::new('Function', anonymous => 1, call_closure => 1);
        $func->body->{call_closure} = 1;

        # make it an argument to the call.
        $call->arg_list->new_item->adopt($func);

        $closure = $func->body;
    }

    # a closure can terminate these.
    $c->close_nodes(qw(Negation Operation Assignment));

    # a closure can terminate a generated expression.
    # for instance, inside $something {}. the expression $something ends there.
    my $node = $c->node;
    if ($node->{generated_expression}) {
        $c->close_node;
    }

    # remember which closure this is inside; if any.
    # then, set this node as the current closure.
    $c->set_closure($closure);
    $c->set_node($closure);

    return;
}

# end of a closure
sub c_CLOSURE_E {
    my ($c, $value, $is_semi) = @_;

    # Rule CLOSURE_E[0]:
    #   The current 'closure' must exist.

    # DISABLED
    # Rule CLOSURE_E[1]:
    #   The current 'node' must be equal to the current 'closure'.

    (my $added)++, $c->simulate('OP_SEMI')
        if $c->instruction && $c->node != $c->closure;

    # close the closure and the node.
    my $closure = $c->closure;
    $c->close_closure;
    $c->close_node($closure->is_type('Body') ? 2 : 1);

    # this is a closure-capturing function call.
    if ($closure->{call_closure}) {

        # terminate the call.
        my $upper_call = $c->node->first_self_or_parent('Call');
        if ($upper_call->{call_capturing_closure}) {
            $c->close_node_until($upper_call->parent);
        }

    }

    # if the closure we just terminated is a function body,
    # check if it is anonymous. if so, possibly inject a semicolon.
    my $fm = $closure->parent;
    if (!$is_semi && !$added && $closure->type eq 'FunctionMethodBody' &&
      $fm->type eq 'Function' && $fm->anonymous) {

         # if the closing curly bracket is the last thing on the line,
         # inject a semicolon.
         my $close_pos = $fm->{close_pos};
         my $is_close  = $c->{token_pos}{$close_pos}[0] eq 'CLOSURE_E';
         my $last_on_line = $c->{token_lines}[ int $close_pos ][-1];
         $c->simulate('OP_SEMI')
            if $is_close && $close_pos == $last_on_line->[2];

    }

    # if the closure we just terminated is a 'catch' body,
    # we need to also terminate the parent instruction.
    $c->close_node if $closure->type eq 'CatchBody';

    return;
}

sub c_KEYWORD_INSIDE {
    my ($c, $value) = @_;

    # create a closure to be opened soon.
    my $inside = F::new('Inside');
    $c->capture_closure_with($inside->body);
    $c->node->adopt($inside);

    # set the current node to the inside expression.
    $c->set_node($inside->param_exp);

    return $inside;
}

sub c_TYPE {
    my ($c, $opts) = @_;

    # create a closure to be opened soon.
    my $type = F::new('Type',
        type_name => $opts->{name},
        lazy => $opts->{lazy}
    );
    $c->capture_closure_with($type->body);
    $c->node->adopt($type);

    # Rule TypeBody[0]:
    #   Direct children must of type Instruction.

    # Rule TypeBody[1]:
    #   If direct child is an Instruction, its statement has an be an
    #   Expression of some sort.

    return $type;
}

sub c_KEYWORD_CAN       { start_type_requirement(shift, 'can')       }
sub c_KEYWORD_ISA       { start_type_requirement(shift, 'isa')       }
sub c_KEYWORD_SATISFIES { start_type_requirement(shift, 'satisfies') }
sub c_KEYWORD_TRANSFORM { start_type_requirement(shift, 'transform') }

sub start_type_requirement {
    my ($c, $type) = @_;

    # Rule TypeRequirement[0]:
    #   Must be a direct child of an Instruction.

    # Rule TypeRequirement[1]:
    #   Must be somewhere inside a Type declaration.

    # Rule TypeRequirement[2]:
    #   Direct children must be a subtype of Expression.

    # Rule TypeRequirement[3]:
    #   Number of direct children must be exactly one (1).


    # create a type requirement.
    my $req = F::new('TypeRequirement', req_type => $type);
    $c->adopt_and_set_node($req);

    return $req;
}

sub c_ALIAS {
    my ($c, $opts) = @_;

    # Rule Alias[0]:
    #   Direct parent must be of type Instruction.

    # Rule Alias[1]:
    #   Direct children must be of type Assignment.

    # Rule Alias[2]:
    #   Number of direct children must be exactly one (1).

    # Rules for Assignment while inside Alias:
    #   See c_OP_ASSIGN().

    # create alias.
    my $alias = F::new('Alias', lazy => $opts->{lazy});
    $c->adopt_and_set_node($alias);

    return $alias;
}

sub c_KEYWORD_ON {
    my ($c, $value) = @_;

    # create on.
    my $on = F::new('On');

    # set the closure to the function of on.
    $c->capture_closure_with($on->function->body);
    $c->node->adopt($on);

    # set the current node to the on expression.
    $c->set_node($on->param_exp);

    # Rule OnParameter[0]:
    #   Direct children must be one of the following:
    #
    #       Property            (e.g. $obj.prop)
    #       Lexical variable    (e.g. $var)
    #       Instance variable   (e.g. $var)
    #       Property variable   (e.g. .var)
    #       Bareword            (i.e. function name)

    # Rule OnParameter[1]:
    #   If a direct child is a Property, it must not be a special property.

    # Rule OnParameter[2]:
    #   Number of direct children must be exactly one (1).

    return $on;
}

sub c_KEYWORD_BEFORE { handle_callback_clause(shift, 'before') }
sub c_KEYWORD_AFTER  { handle_callback_clause(shift, 'after')  }

sub handle_callback_clause {
    my ($c, $type) = @_;

    # must be inside an on expression.
    my $exp = $c->node->first_self_or_parent('OnParameter');
    return $c->unexpected("without preceding 'on' expression") if !$exp;

    # next token must be a symbol.
    my $e = $c->next_token_must_be(
        'VAR_SYM',
        "Following '$type' keyword must be a symbol callback name"
    );
    return $e if $e;

    # make the on expression the current node.
    $exp->{cb_method} = "add_${type}_clause";
    $c->set_node($exp);

    return;
}

sub c_KEYWORD_IF {
    my ($c, $value) = @_;

    # create an if statement which expects a closure to be opened soon.
    my $if = F::new('If', if_type => 'if');
    $c->node->adopt($if);
    $c->capture_closure_with($if->body);

    # Rule IfParameter[0]:
    #   Direct children must be an Expression of some sort.
    #   If direct child is an Assignment, it cannot be a lazy assignment.

    # Rule IfParameter[1]:
    #   Number of direct children must be exactly one (1).

    # set the current node to the conditional expression.
    $c->set_node($if->param_exp);

    return $if;
}

sub c_KEYWORD_ELSIF {
    my ($c, $value) = @_;

    # ensure that the last element is an if.
    my $last_el = $c->last_el;
    if ($last_el->type ne 'If') {
        return $c->unexpected([
            'without preceding if',
            'Else if must immediately follow the termination of an if body'
        ]);
    }

    # create an if statement which expects a closure to be opened soon.
    my $if = F::new('If', if_type => 'elsif');
    $c->node->adopt($if);
    $c->capture_closure_with($if->body);

    # set the current node to the conditional expression.
    $c->set_node($if->param_exp);

    return $if;
}

sub c_KEYWORD_ELSE {
    my ($c, $value) = @_;

    # ensure that the last element is an if.
    my $last_el = $c->last_el;
    if ($last_el->type ne 'If') {
        return $c->unexpected([
            'without preceding if',
            'Else must immediately follow the termination of an if body'
        ]);
    }

    # create else.
    my $else = F::new('Else');
    $c->capture_closure_with($else->body);
    $c->node->adopt($else);

    return $else;
}

sub c_KEYWORD_FOR {
    my ($c, $value) = @_;

    # create a closure to be opened soon.
    my $for = F::new('For');

    $c->node->adopt($for);
    $c->capture_closure_with($for->body);

    # set the node to the for parameter.
    $c->set_node($for->param_exp);

    return $for;
}

sub c_KEYWORD_IN {
    my ($c, $value) = @_;

    # 'in' must terminate a generated expression for 'for'.
    return $c->unexpected("(where is 'for'?)") unless
        $c->node->{parameter_for} && $c->node->{parameter_for} eq 'for';
        # FIXME: if wrapped in parentheses, this will fail.

    # set the node to the 'in' parameter.
    my $for = $c->close_node;
    return $c->set_node($for->in_param_exp);

}

sub c_KEYWORD_LOAD {
    my ($c, $value) = @_;

    # Rule Load[0]:
    #   Must be a direct child of an Instruction.

    # Rule Load[1]:
    #   Parent must be a direct child of a Class or Document.

    # Rule Load[2]:
    #   Direct children must be of type Bareword.

    # Rule Load[3]:
    #   Number of direct children must be exactly one (1).

    my $load = F::new('Load');
    $c->adopt_and_set_node($load);
}

sub c_KEYWORD_STOP {
    my ($c, $value) = @_;

    # Rule Stop[0]:
    #   Direct parent must be of type Instruction.

    # Rule Stop[1]:
    #   Direct children must be of type Function or Method.

    my $stop = F::new('Stop');
    $c->adopt_and_set_node($stop);
}

sub c_KEYWORD_DEFER {
    my ($c, $value) = @_;

    # Rule Defer[0]:
    #   Must be somewhere inside a Function or Method.

    # create closure.
    my $defer = F::new('Defer');
    $c->capture_closure_with($defer->body);
    $c->node->adopt($defer);

    return $defer;
}

sub c_KEYWORD_CATCH {
    my ($c, $value) = @_;

    # Rule KEYWORD_CATCH[0]:
    #   The current 'instruction' must exist.

    # store the instruction, then simulate a semicolon.
    my $instr = $c->instruction;
    $c->simulate('OP_SEMI');

    # TODO: make sure there is only one catch.

    # create a catch and add it to the instruction.
    my $catch = F::new('Catch');
    $instr->adopt($catch);

    # capture a closure with the catch body.
    $c->capture_closure_with($catch->body);

    # Rule CatchParameter[0]:
    #   Direct children must be of type LexicalVariable.

    # Rule CatchParameter[1]:
    #   Number of direct children must not exceed one (1).

    # set the current node to the catch variable expression.
    $c->set_node($catch->param_exp);

    return $catch;
}

sub c_KEYWORD_FAIL  { handle_failthrow(shift, 'fail')  }
sub c_KEYWORD_THROW { handle_failthrow(shift, 'throw') }

sub handle_failthrow {
    my ($c, $type) = @_;

    # Rule Fail[0]:
    #   Direct parent must be of type Instruction.

    # Rule Fail[1]:
    #   Direct children must be Expressions of sorts.

    # Rule Fail[2]:
    #   Number of direct children must be exactly one (1).

    # Rule Fail[3]:
    #   If it's a fail statement (rather than throw), it must be somewhere
    #   inside a Function or Method.

    my $fail = F::new('Fail', fail_type => $type);
    $c->adopt_and_set_node($fail);

    return $fail;
}

sub c_PAREN_S {
    my ($c, $value) = @_;

    # Rule List[0]:
    #   Direct children must be of type ListItem.

    # Rule ListItem[0]:
    #   Direct children must be of type Pair or some sort of Expression.

    # Rule ListItem[1]:
    #   Must directly follow a ListItem, if following anything.

    # Rule ListItem[2]:
    #   Must come directly before a ListItem, if before anything.

    # Rule ListItem[3]:
    #   Number of direct children must be exactly one (1).

    # Rule for ListItem implemented in F/List.pm:
    #   Pairs and non-pairs cannot be mixed in a list unless it is the
    #   argument list of a call.

    my $list = $c->start_list('PAREN_E');
    return $list;
}

sub c_BRACKET_S {
    my ($c, $value) = @_;

    # Rules for List:
    #   See c_PAREN_S().

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

    # if it's a 'can', this is an interface method requirement.
    my $is_req = ($c->node->{req_type} || '') eq 'can';

    # determine list terminator and call package.
    my $terminator = $is_index ? 'BRACKET_E'          : 'PAREN_E';
    my $package    = $is_index ? 'Index'              :
                     $is_req   ? 'InterfaceMethod'    : 'Call';

    # a call can only come after an expression.
    my $last_el = $c->last_el;
    return $c->unexpected unless $last_el->is_type('Expression');

    # create a function call, adopting the last element.
    my $call = $c->node->adopt(F::new($package));
    $call->adopt($last_el);

    # handle the list, then adopt it.
    if ($has_list) {

        # Rules for List:
        #   See c_PAREN_S().

        my $list = $c->start_list($terminator);
        $list->{is_callidx} = 1;
        $list->{is_index} = $is_index;
        $list->{collection} = 1; # pretend to be array/hash for checks.
        $call->adopt($list);

        # if it's not an index or method requirement,
        # it might be a closure-capturing call.
        if (!$is_index && !$is_req) {

            # found a more likely thing to capture a closure -
            # something that's not a call like an 'if' or 'on'
            my $more_likely = $c->clos_cap
                if $c->clos_cap && $c->clos_cap->type ne 'Call';

            # clos_cap is just a call or nothing;
            # use this call as the new clos_cap.
            $c->capture_closure_with($call) if !$more_likely;

        }
    }

    return $call;
}

sub c_PAREN_E {
    my ($c, $value) = @_;

    # Rule PAREN_E[0]:
    #   The current 'list' must exist.

    # this must be the expected list terminator.
    my $t = $c->list->{list_terminator};
    my $p = F::pretty_token($t);
    return $c->unexpected("to close list (instead of $p)")
        if $t ne 'PAREN_E';

    # closes these things.
    $c->close_nodes(qw(Negation Operation Pair));

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
    $c->close_node_maybe('Call') || $c->close_node_maybe('InterfaceMethod');

    # finally, the current list becomes the next list up in the tree.

    return $c->close_list;
}

sub c_BRACKET_E {
    my ($c, $value) = @_;

    # Rule BRACKET_E[0]:
    #   The current 'list' must exist.

    # this must be the expected list terminator.
    my $t = $c->list->{list_terminator};
    my $p = F::pretty_token($t);
    return $c->unexpected("to close list (instead of $p)")
        if $t ne 'BRACKET_E';

    # closes these things.
    $c->close_nodes(qw(Operation Pair));

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
    my $closed_index = $c->close_node_maybe('Index');

    # property.
    #
    #       additionally, the termination of the index can close a
    #       non-bareword property, such as in 2.["even"]
    #
    #       only do it though if the property is marked as indexed
    #       and if we have not closed an index above.
    #
    $c->close_node_maybe('Property')
        if !$closed_index && $c->node->{is_index};

    # finally, the current list becomes the next list up in the tree.

    return $c->close_list;
}

sub c_STRING {
    my ($c, $value) = @_;
    my $string = F::new('String', value => $value);
    return $c->node->adopt($string);
}

sub c_NUMBER {
    my ($c, $value) = @_;

    # create the number...
    my $num = F::new('Number', value => $value);

    # add to the current node.
    $c->node->adopt($num);

    return $num;
}

sub c_KEYWORD_UNDEFINED {
    my ($c, $value) = @_;

    # create the bool...
    my $b = F::new('Boolean', value => undef);

    # add to the current node.
    $c->node->adopt($b);

    return $b;
}

sub c_KEYWORD_TRUE {
    my ($c, $value) = @_;

    # create the bool...
    my $b = F::new('Boolean', value => 1);

    # add to the current node.
    $c->node->adopt($b);

    return $b;
}

sub c_KEYWORD_FALSE {
    my ($c, $value) = @_;

    # create the bool...
    my $b = F::new('Boolean', value => 0);

    # add to the current node.
    $c->node->adopt($b);

    return $b;
}

sub c_VAR_SYM {
    my ($c, $value) = @_;

    # if the current node is an OnParameter, it's a callback name.
    if ($c->node->type eq 'OnParameter' && $c->node->{cb_method}) {
        my $method = delete $c->node->{cb_method};

        # cannot use ':default' when it's the primary callback name
        if ($value eq 'default' && $method eq 'set_cb_name') {
            return $c->unexpected([
                ":default for callback name",
                "Cannot dynamically add default callback. ".
                "Use 'func' keyword instead"
            ]);
        }

        $c->node->parent->$method($value);
        return;
    }

    # create the symbol...
    my $b = F::new('Symbol', sym_value => $value);

    # add to the current node.
    $c->node->adopt($b);

    return $b;
}

sub c_OP_COMMA {
    my ($c, $value) = @_;

    # we're in a list.
    if ($c->list) {

        # Rules for ListItem:
        #   See c_PAREN_S().

        # set the current node to a new list item.
        $c->set_node($c->list->new_item);

        return $c->node;
    }

    # we're in a want/need. this starts another.
    $c->close_nodes(qw(WantNeedType WantNeedValue));
    if ($c->node->type eq 'WantNeed') {
        my $old_wn = $c->node;

        # fake a semicolon to terminate the instruction
        # wrapping the previous WantNeed.
        $c->simulate('OP_SEMI');

        # create new want/need.
        my $wn = F::new('WantNeed', arg_type => $old_wn->{arg_type});

        # wrap it with an instruction.
        my $instr = F::new('Instruction');
        $c->set_instruction($instr);
        $c->adopt_and_set_node($instr);

        return $c->adopt_and_set_node($wn);
    }

    # we're inside an OnParameter, so this comma could separate from a
    # symbol callback name.
    if (my $exp = $c->node->first_self_or_parent('OnParameter')) {
        my $e = $c->next_token_must_be(
            'VAR_SYM',
            "Following a comma within 'on' parameter ".
            "must be a symbol callback name"
        );
        return $e if $e;
        $exp->{cb_method} = 'set_cb_name';
        $c->set_node($exp);
        return;
    }

    return $c->unexpected('outside of list');
}

sub c_BAREWORD {
    my ($c, $value) = @_;

    # if the last element is a bareword, combine them.
    # ex: Math :: Point == Math::Point
    # ex: A B = AB
    my $l_word  = $c->last_el;
    my $l_label = $c->{done_toks}[-1] ? $c->{done_toks}[-1][0] : '';
    if ($l_label eq 'OP_PACK' || $l_label eq 'BAREWORD'
      and $l_word->type eq 'Bareword') {
        $l_word->{bareword_value} .= $value;
        $l_word->{parent}->adopt($l_word); # to redo after_adopt()
        return $l_word;
    }

    # otherwise, create a new bareword.
    my $word = F::new('Bareword', bareword_value => $value);
    $c->node->adopt($word);

    # not yet in function call at this point.
    return $word;
}

sub c_OP_SEMI {
    my ($c, $automatic) = @_;

    # Rule OP_SEMI[0]:
    #   The current 'instruction' must exist.

    # close these things.
    $c->close_nodes(qw(
        WantNeed WantNeedType WantNeedValue PropertyModifier Negation
        Alias Fail Assignment Return ReturnPair TypeRequirement Operation
        SharedDeclaration LocalDeclaration Load Stop
    ));

    # special case:
    # if it's an automatic semicolon and the node is a list item, ignore it.
    return if $automatic and
        $c->node->type eq 'ListItem' || $c->node->type eq 'Pair';

    # at this point, the instruction must be the current node.
    if ($c->node != $c->instruction) {
        my $type = $c->node->desc;
        return $c->unexpected($automatic ? [
            "inside $type",
            'This is an inferred semicolon. Perhaps you forgot a separator '.
            '(comma) or terminator (closing parenthesis, bracket, etc.) '.
            'at the end of the line'
        ] : "inside $type");
    }

    # close the instruction.
    my $instr = $c->instruction;
    $c->close_node;
    $c->close_instruction;

    # possibly terminate a closure.
    if (delete $instr->{will_close_closure}) {
        $c->simulate('CLOSURE_E', undef, 1);
    }

    return;
}

sub c_VAR_LEX {
    my ($c, $value) = @_;
    my $var = F::new('LexicalVariable', var_name => $value);
    return $c->node->adopt($var);
}

sub c_VAR_THIS {
    my ($c, $value) = @_;

    # Rule InstanceVariable[0]:
    #   Must be somewhere inside a Function or Method.

    my $var = F::new('InstanceVariable', var_name => $value);
    return $c->node->adopt($var);
}

sub c_VAR_SPEC {
    my ($c, $value) = @_;
    my $var = F::new('SpecialVariable', var_name => $value);
    return $c->node->adopt($var);
}

sub c_VAR_SET {
    my ($c, $value) = @_;
    my $var = F::new('SetTypeVariable', var_name => $value);
    return $c->node->adopt($var);
}

sub c_VAR_PROP {
    my ($c, $value) = @_;

    # Rule PropertyVariable[0]:
    #   Must be somewhere inside an Inside or Type.

    # Rule PropertyVariable[1]:
    #   Must be somewhere inside the parent's first ancestor Inside's body,
    #   if such an ancestor exists.

    my $var = F::new('PropertyVariable', var_name => $value);
    return $c->node->adopt($var);
}

sub c_KEYWORD_WANT {
    my ($c, $value) = @_;

    # Rule WantNeed[0]:
    #   Must be a direct child of an Instruction.

    # Rule WantNeed[1]:
    #   Must be somewhere inside a Function or a Method.

    # Rule WantNeed[2]:
    #   Direct children must be one of the following types:
    #       InstanceVariable
    #       LexicalVariable
    #       WantNeedType
    #       WantNeedValue

    # Rule WantNeed[3]:
    #   Number of direct children must be no less than one (1).

    # Rule WantNeed[4]:
    #   Number of direct children must not exceed three (3).

    # Rule WantNeedType[0]:
    #   Direct parent must be of type WantNeed.

    # Rule WantNeedType[1]:
    #   Direct children must be of type Bareword.

    # Rule WantNeedType[2]:
    #   Must directly follow a lexical variable or instance variable.

    # Rule WantNeedType[3]:
    #   Number of direct children must be exactly one (1).

    # Rule WantNeedValue[0]:
    #   Direct parent must be of type WantNeed.

    # Rule WantNeedValue[1]:
    #   Direct children must be some sort of Expression.

    # Rule WantNeedValue[2]:
    #   Must directly follow one of the following types:
    #       LexicalVariable
    #       InstanceVariable
    #       WantNeedType

    # Rule WantNeedValue[3]:
    #   Number of direct children must be exactly one (1).

    my $want = F::new('WantNeed', arg_type => 'want');
    return $c->adopt_and_set_node($want);
}

sub c_KEYWORD_NEED {
    my ($c, $value) = @_;

    # Rules:
    #   See rules in c_KEYWORD_WANT() above.

    my $need = F::new('WantNeed', arg_type => 'need');
    return $c->adopt_and_set_node($need);
}

sub c_OP_VALUE {
    my $c = shift;

    # if the current node is a WantNeed, this is likely the type
    # for the argument variable.
    if ($c->node->type eq 'WantNeed') {
        my $wn = $c->node;

        # Rules for WantNeedType:
        #   See c_KEYWORD_WANT().

        # if the argument already has a type, that's an issue.
        if ($wn->arg_type_exp) {
            return $c->unexpected([
                "inside $$wn{arg_type}",
                'This argument declaration already has a type expression'
            ]);
        }

        my $exp = $wn->create_arg_type_exp;
        $c->adopt_and_set_node($exp);
        return $exp;
    }

    # if something is waiting to capture a closure,
    # maybe that's what this is, a single-statement closure.
    if (could_be_one_liner($c)) {

        # simulate a {
        $c->simulate('CLOSURE_S', 1);

        # remember that the coming intruction will terminate closure.
        $c->instruction_opens_closure;

        return;
    }

    # otherwise just throw the token back in.
    $c->node->adopt($c->unknown_el);

}

sub could_be_one_liner {
    my $c = shift;

    # clos_cap gotta be there.
    return unless $c->clos_cap;

    # if we're inside a generated expression, all good.
    # this could be problematic if a generated expression had an anonymous
    # function or other sort of closure in it, but that would be ridiculous.
    my $el = $c->node;
    do {
        return 1 if $el->{generated_expression};
    } while $el = $el->parent;

    # if the last token is any of these, good.
    my %is_reasonable = map { $_ => 1 } qw(
        KEYWORD_ELSE
        KEYWORD_DEFER
    );

    my $l_label = $c->{done_toks}[-1] ? $c->{done_toks}[-1][0] : '';
    return $is_reasonable{$l_label};
}

sub c_OP_ELLIP {
    my ($c, $value) = @_;

    # Rule OP_ELLIP[0]:
    #   The current node must be of one of the following types:
    #       WantNeed
    #       WantNeedType
    #       WantNeedValue

    # ellipsis can only exist on the end of a WantNeed.
    # consider: no way to handle need $var...: Type = exp.
    # not really a big deal because it has the same effect as
    # need $var: Type = exp...
    $c->close_nodes(qw(WantNeedType WantNeedValue));
    if ($c->node->type eq 'WantNeed') {
        $c->node->{ellipsis} = 1;
        return;
    }

    $c->node->adopt($c->unknown_el);
}

sub c_PROP_VALUE {
    my ($c, $value) = @_;

    # Rule Pair[0]:
    #   Must be somewhere inside a List.

    # Rule Pair[1]:
    #   Must be a direct child of a List item.

    # create a new node which is a pair.
    my $pair = F::new('Pair', key => $value);
    $c->adopt_and_set_node($pair);

    return $pair;
}

sub c_PROPERTY {
    my ($c, $value) = @_;

    # Rule Property[0]:
    #   Direct children must be Expressions of sorts.

    # Rule Property[1]:
    #   The second direct must be a List.

    # Rule Property[2]:
    #   The second direct child, if a list, must have "[" ... "]" delimiters.

    # Rule Property[3]:
    #   The second direct child must be a parent of exactly one direct child.

    # Rule Property[4]:
    #   Number of direct children must be no less than one (1).

    # Rule Property[5]:
    #   Number of direct children must not exceed two (2).

    # last element must be an expression.
    my $last_el = $c->last_el;
    return $c->expected(
        'an expression',
        'at left of '.F::pretty_token($c->label)
    ) unless $last_el->is_type('Expression');

    my $prop = F::new('Property', prop_name => $value);
    $c->node->adopt($prop);
    $prop->adopt($last_el);

    return $prop;
}

# property operator is used for non-bareword properties.
# e.g. $prop = "odd"; 2.[$prop] # false
sub c_OP_PROP {
    my ($c, $value) = @_;

    # Rule OP_PROP[0]:
    #   Next token must be an opening bracket "[".

    # Rules for Property:
    #   See c_PROPERTY().

    # last element must be an expression.
    my $last_el = $c->last_el;
    return $c->expected(
        'an expression',
        'at left of '.F::pretty_token($c->label)
    ) unless $last_el->is_type('Expression');

    # make the property the current node.
    # it will capture the upcoming value list.
    my $prop = F::new('Property', prop_name => $value, is_index => 1);
    $c->adopt_and_set_node($prop);
    $prop->adopt($last_el);

    return $prop;
}

sub c_OP_ASSIGN {
    my ($c, $value) = @_;

    # if we're in a WantNeed, this is the value expression.
    $c->close_node_maybe('WantNeedType');
    if ($c->node->type eq 'WantNeed') {
        my $wn = $c->node;

        # Rules for WantNeedValue:
        #   See c_KEYWORD_WANT().

        # if the argument already has a value expression, that's an issue.
        if ($wn->value_exp) {
            return $c->unexpected([
                "inside $$wn{arg_type}",
                'This argument declaration already has a fallback value '.
                'expression'
            ]);
        }

        my $exp = $wn->create_value_exp;
        $c->adopt_and_set_node($exp);
        return $exp;
    }

    # Rule Assignment[0]:
    #   Direct parent must be of one of the following types:
    #       Instruction
    #       IfParameter
    #       Alias
    #       SharedDeclaration
    #       LocalDeclaration

    # Rule Assignment[1]:
    #   Number of direct children must be exactly two (2).

    # Rule Assignment[2]:
    #   The first direct child must be some sort of Assignable expression.

    # Rule Assignment[3]:
    #   The second direct child must be an Expression of sorts.

    # Rule Assignment[4]:
    #   When the direct parent is of type Alias, only direct children of type
    #   Bareword are permitted.

    # Rule Assignment[5]:
    #   When the direct parent is of type Alias, voids Assignment[2].

    # Rule Assignment[6]:
    #   When the direct parent is of type Alias, voids Assignment[3].

    # remember the last element as the left side of the assignment.
    my $a = F::new('Assignment');
    $c->adopt_and_set_node($a);
    $a->adopt($c->last_el);

    return $a;
}

sub c_OP_LASSIGN {
    my ($c, $value) = @_;

    # Rules for Assignment:
    #   See c_OP_ASSIGN().

    # remember the last element as the left side of the assignment.
    my $a = F::new('Assignment', lazy => 1);
    $c->adopt_and_set_node($a);
    $a->adopt($c->last_el);

    return $a;
}

*c_OP_ADD    = *c_OP_SUB      =
*c_OP_MUL    = *c_OP_DIV      =
*c_OP_POW    = *c_OP_MOD      =
*c_OP_AND    = *c_OP_OR       =
*c_OP_EQUAL  = *c_OP_EQUAL_I  =
*c_OP_NEQUAL = *c_OP_NEQUAL_I =
*c_OP_RANGE  = *c_operator;

sub c_operator {
    my ($c, $value) = @_;
    my $last_el = $c->last_el;

    # if it's addition or subtraction, it might be a sign.
    my %signs = (OP_ADD => 1, OP_SUB => 1);
    if (!$last_el->is_type('Expression') && $signs{ $c->label }) {
        undef $last_el;
    }

    return $c->expected(
        'an expression',
        'at left of '.F::pretty_token($c->label)
    ) if $last_el && !$last_el->is_type('Expression');

    # if the current node is an operation, just add another thing.
    my $operator = F::new('Operator', token => $c->label);
    if ($c->node->type eq 'Operation') {
        $c->node->adopt($operator);
        return $operator;
    }

    # adopt the last element as the left side of the operation.
    my $op = F::new('Operation');
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
    my $pair = F::new('ReturnPair', key => $word->{bareword_value});
    $c->adopt_and_set_node($pair);

    return $pair;
}

sub c_KEYWORD_RETURN {
    my ($c, $value) = @_;
    my $ret = F::new('Return');
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
    if ($last_el->type eq 'List' && $last_el->children > 1) {
        return $c->expected(
            'a single-element list',
            'before ' . F::pretty_token('OP_MAYBE')
        );
    }

    # nothing to capture the maybe.
    my $owner = $c->maybe_owner;
    if (!$owner) {
        # TODO: error!
    }

    # create a maybe, adopting the last element.
    my $maybe = $c->node->adopt(F::new('Maybe'));
    $maybe->adopt($last_el);

    # add the maybe to the instruction.
    $owner->add_maybe($maybe);

    return $maybe;
}

sub c_OP_NOT {
    my ($c, $value) = @_;
    my $not = F::new('Negation');
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
    #   Number of direct children must be exactly one (1).

    my $mod = F::new('PropertyModifier', mod_type => $type);
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

sub c_KEYWORD_SHARE {
    my ($c, $value) = @_;

    # Rule SharedDeclaration[0]:
    #   Must be a direct child of an Instruction.

    # Rule SharedDeclaration[1]:
    #   Direct children must be one of the following types:
    #
    #       Lexical variable
    #       Assignment
    #

    # Rule SharedDeclaration[2]:
    #   Direct children must satisfy the following condition:
    #
    #       if (child is an Assignment)
    #           Left side must be a lexical variable
    #

    # Rule SharedDeclaration[3]:
    #   Number of direct children must be exactly one (1).

    my $share = F::new('SharedDeclaration');
    return $c->adopt_and_set_node($share);
}

sub c_KEYWORD_LOCAL {
    my ($c, $value) = @_;

    # Rule LocalDeclaration[0]:
    #   Must be a direct child of an Instruction.

    # Rule LocalDeclaration[1]:
    #   Direct children must be one of the following types:
    #
    #       Lexical variable
    #       Assignment
    #

    # Rule LocalDeclaration[2]:
    #   Direct children must satisfy the following condition:
    #
    #       if (child is an Assignment)
    #           Left side must be a lexical variable
    #

    # Rule LocalDeclaration[3]:
    #   Number of direct children must be exactly one (1).


    my $local = F::new('LocalDeclaration');
    return $c->adopt_and_set_node($local);
}

sub c_any {
    my ($label, $c, $value) = @_;

    ### START AN INSTRUCTION ###

    # can the current node hold instructions?
    return unless $c->node->hold_instr;

    # these things cannot start an instruction.
    # (tokens only) (this is horrendous)
    my @ignore = qw(
        ^FUNCTION$          ^METHOD$            ^COMPUTED$
        ^KEYWORD_INSIDE$    ^KEYWORD_FOR$       ^KEYWORD_ON$
        ^KEYWORD_IF$        ^KEYWORD_ELSE$      ^KEYWORD_ELSIF$
        ^PKG_DEC$           ^CLASS_DEC$         ^KEYWORD_END$
        ^CLOSURE_.+$        ^OP_.+$             ^TYPE$
        ^KEYWORD_DEFER$
    );
    foreach (@ignore) { return if $label =~ $_ }

    # Rule Instruction[0]:
    #   Number of direct children must be no less than one (1).

    # Rule Instruction[1]:
    #   Number of direct children must not exceed two (2).

    # Rule Instruction[3]:
    #   The second direct child, if present, must be of type Catch.

    my $instr = F::new('Instruction');
    $c->set_instruction($instr);
    $c->adopt_and_set_node($instr);

    return 1; # true = started an instruction
}

sub c_spaces {
    my ($c, $main_node) = @_;
    my $spaces = F::new('Spaces');
    $main_node->adopt($spaces);
    return;
}

sub c_eof {
    my ($c, $main_node) = @_;

    # if there's a current instruction, fake a semicolon.
    if ($c->instruction) {
        $c->simulate('OP_SEMI');
    }

    # end of file can terminate these.
    $c->close_node_maybe('Class');

    # when all is said and done, the current node should be the main node.
    if ($c->node != $main_node) {
        my $node = $c->node;
        my $desc = $node->detail;

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
