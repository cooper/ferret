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

        # update last_el.
        my $old_el  = $current->{last_el} || 0;
        my $last_el = ($current->node->children)[-1] || $current->node;
        $current->{last_el} = $last_el;

        # pending comment.
        if ($last_el != $old_el && $current->{doc_comment}) {
            $last_el->{doc_comment} = delete $current->{doc_comment};
        }

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
    my $redo    = sub { handle_label($label, $value, $position) };
    $position //= 0;
    my $err;

    # check for error.
    return $err if $err = check_error();

    # current info.
    @$current{ qw(label value line position next_tok unknown_el) } = (
        $label, $value,
        int $position, $position,
        $current->{upcoming}[0],
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

###############################
### DOCUMENT-LEVEL KEYWORDS ###
################################################################################

# package declaration.
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

# class declaration.
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

# end of a class or package.
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

# namespace load statement.
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

#################
### OPERATORS ###
################################################################################

##################################################
### BRACKETS, PARENTHESES, ANGLES (DELIMITERS) ###
##################################################

# start of a closure (opening curly bracket).
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

# end of a closure (closing curly bracket).
sub c_CLOSURE_E {
    my ($c, $value, $is_semi) = @_;

    # Rule CLOSURE_E[0]:
    #   The current 'closure' must exist.

    # DISABLED
    # Rule CLOSURE_E[1]:
    #   The current 'node' must be equal to the current 'closure'.

    # simulate a semicolon on the last instruction of the closure body.
    $c->simulate('OP_SEMI')
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

    # this section handles expression closures within instructions
    #
    # if the closure we just terminated is a function body,
    # check if it is anonymous. if so, possibly inject a semicolon.
    # however, don't do this for 'on' functions.
    #
    # or if it's a gather body, we may need to inject a semicolon.
    #
    my $p = $closure->parent;
    my $is_gather = $closure->type eq 'GatherBody';
    my $is_anon_func =
        $closure->type eq 'FunctionMethodBody' &&
        $p->type eq 'Function'                 &&
        $p->anonymous;
    undef $is_anon_func if $p->parent->type eq 'On';

    if (!$is_semi and $is_anon_func || $is_gather) {

         # if the closing curly bracket is the last thing on the line,
         # inject a semicolon.
         my $close_pos    = $p->{close_pos};
         my $is_close     = $c->{token_pos}{$close_pos}[0] eq 'CLOSURE_E';
         my $last_on_line = $c->{token_lines}[ int $close_pos ][-1];

         $c->simulate('OP_SEMI')
            if $is_close && $close_pos == $last_on_line->[2];
    }

    # gather for: this is a special case --
    #
    # if the closure we just terminated is a 'for' body,
    # check if the for's owner is a gather body. then, see
    # if the gather is marked as a 'gatherfor' keyword.
    #
    # if those conditions are met, close another two nodes,
    # which is the gather and its body.
    #
    $c->close_node(2) if $closure->type eq 'ForBody'
        && $p->{is_gatherfor};

    # continue: this is a special case --
    #
    # if the closure we just terminated is a 'continue' body,
    # terminate the for as well.
    $c->close_node if $closure->type eq 'ContinueBody';

    # catch: this is a very special case --
    #
    # if the closure we just terminated is a 'catch' body,
    # we need to also terminate the parent instruction.
    #
    # note that a semicolon has already been processed at
    # this point, so we don't simulate one here.
    #
    $c->close_node if $closure->type eq 'CatchBody';

    return;
}

# tests whether a statement followed by a colon could be a one-line closure.
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

# opening parenthesis.
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

# closing parenthesis.
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
    $c->close_nodes(qw(Negation Operation Pair Detail));

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

# opening bracket.
sub c_BRACKET_S {
    my ($c, $value) = @_;

    # Rules for List:
    #   See c_PAREN_S().

    my $list = $c->start_list('BRACKET_E');
    $list->{collection} = 1; # define as a value list or hash.
    $list->{array} = 1;      # default
    return $list;
}

# closing bracket.
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
    $c->close_nodes(qw(Negation Operation Pair));

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

# opening angle.
sub c_ANGLE_S {
    my $c = shift;

    # it is guaranteed by the tokenizer that the opening angle is
    # immediately preceded by a bareword or class declaration.

    my $last_el = $c->last_el;
    my $tc = F::new('TypedClass', ready_for_another => 1);

    # Rule TypedClass[0]:
    #   Direct children must be of type Bareword or Maybe.

    # Rule TypedClass[1]:
    #   Number of children must be no less than two (2).

    # it's a class declaration.
    if ($last_el->type eq 'Class') {

        # remember that it belongs to this class.
        # on close, it will be abandoned,
        # but the class will remember its generics.
        $tc->set_tc_class($last_el);

        # set the typed class as the current node.
        # DO NOT adopt it. classes cannot contain them.
        # TypedClass will always return the class as
        # its ->parent, but it will not be a true child.
        $c->set_node($tc);

    }

    # for everything else, adopt the previous element.
    else {
        $tc->adopt($last_el);
        $tc->{ready_for_another}++;
        $c->adopt_and_set_node($tc);
    }

    return $tc;
}

# closing angle.
sub c_ANGLE_E {
    my $c = shift;

    # it is guaranteed by the tokenizer that this closing angle has
    # an opening angle to correspond with.

    return $c->unexpected if $c->node->type ne 'TypedClass';
    $c->close_node;

    return;
}

#########################
### CALLS AND INDICES ###
#########################

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
    return $c->unexpected if !$last_el || !$last_el->is_type('Expression');

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
    }

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

    return $call;
}

# opening bracket for an index.
sub c_BRACKET_IDX {
    my ($c, $value) = @_;
    return handle_call($c, $value, 1, 1);
}

# opening parenthesis for a call.
sub c_PAREN_CALL {
    my ($c, $value) = @_;
    return handle_call($c, $value, 1);
}

# zero-argument call operator.
sub c_OP_CALL {
    my ($c, $value) = @_;
    return handle_call($c, $value);
}

# detailed return values.
sub c_KEYWORD_DETAIL {
    my ($c, $value) = @_;
    my $det = F::new('Detail');
    return $c->adopt_and_set_node($det);
}

###################
### ASSIGNMENTS ###
###################

# standard assignment operator.
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

# lazy assignment operator.
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

##################
### OPERATIONS ###
##################

*c_OP_ADD     = *c_OP_SUB      =
*c_OP_MUL     = *c_OP_DIV      =
*c_OP_POW     = *c_OP_MOD      =
*c_OP_AND     = *c_OP_OR       =
*c_OP_SIM     = *c_OP_NSIM     =
*c_OP_EQUAL   = *c_OP_NEQUAL   =
*c_OP_EQUAL_I = *c_OP_NEQUAL_I =
*c_OP_LESS    = *c_OP_LESS_E   =
*c_OP_GR8R    = *c_OP_GR8R_E   =
*c_OP_RANGE   = *c_operator;

# used for all operators managed by the Operation node.
sub c_operator {
    my ($c, $value) = @_;

    # we're only interested in the previous element at the same level.
    my $last_el = $c->last_el;
    undef $last_el if $last_el == $c->node;

    # if it's addition or subtraction, it might be a sign.
    my %signs = (OP_ADD => 1, OP_SUB => 1);
    if ($last_el && !$last_el->is_type('Expression') && $signs{ $c->label }) {
        undef $last_el;
    }

    # it has to be an expression
    return $c->expected(
        'an expression',
        'at left of '.F::pretty_token($c->label)
    ) if $last_el && !$last_el->is_type('Expression');

    # FIXES NEGATING THE ENTIRE OPERATION
    if ($c->node->type eq 'Negation') {
        $last_el = $c->node;
        $c->close_node;
    }

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

#######################
### MISC. OPERATORS ###
#######################

# the comma. separates list items and whatnot.
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

    # we're in a typed class.
    if ($c->node->type eq 'TypedClass') {
        my $tc = $c->node;
        $tc->{ready_for_another}++;
        return $tc;
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

    # we're in a var. this starts another.
    if ($c->node->type eq 'LocalDeclaration') {

        # fake a semicolon to terminate the instruction
        # wrapping the previous var.
        $c->simulate('OP_SEMI');

        # create new var.
        my $local = F::new('LocalDeclaration');

        # wrap it with an instruction.
        my $instr = F::new('Instruction');
        $c->set_instruction($instr);
        $c->adopt_and_set_node($instr);

        return $c->adopt_and_set_node($local);
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

# the semicolon. terminates an instruction.
sub c_OP_SEMI {
    my ($c, $automatic) = @_;

    # Rule OP_SEMI[0]:
    #   The current 'instruction' must exist.

    # close these things.
    $c->close_nodes(qw(
        WantNeed WantNeedType WantNeedValue PropertyModifier Negation
        Alias FailThrow Assignment Return ReturnPair TypeRequirement Operation
        SharedDeclaration LocalDeclaration Load Stop LoopStatement Take Detail
    ));

    # special case:
    # if it's an automatic semicolon and the node is a list item, ignore it.
    return if $automatic and
        $c->node->type eq 'ListItem' || $c->node->type eq 'Pair';

    # at this point, the instruction must be the current node.
    if ($c->node != $c->instruction) {

        # if this is an automatic semicolon, just discard it.
        # if we were to respect it, the error would be "unexpected semicolon",
        # which is not particularly useful when there is no semicolon at all.
        return if $automatic;

        my $type = $c->node->desc;
        return $c->unexpected("inside $type");
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

# the colon. separates variables from their types, keys from their values, etc.
# additionally, it can start a closure which captures only one instruction.
# see also PROP_VALUE, which is a token combining a bareword and a colon.
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

# the ellipsis. indicates a variable argument count.
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

# package (namespace) separator.
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

# negation operator.
sub c_OP_NOT {
    my ($c, $value) = @_;
    my $not = F::new('Negation');
    $c->adopt_and_set_node($not);
}

# inline if operator.
sub c_OP_MAYBE {
    my ($c, $value) = @_;

    # must come after expression.
    my $last_el = $c->last_el;
    return $c->unexpected if !$last_el || !$last_el->is_type('Expression');

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
        die;
    }

    # create a maybe, adopting the last element.
    my $maybe = $c->node->adopt(F::new('Maybe'));
    $maybe->adopt($last_el);

    # add the maybe to the instruction.
    $owner->add_maybe($maybe);

    return $maybe;
}

# bitwise or operator.
sub c_OP_BOR {
    my ($c, $value) = @_;

    # this separating two bareword types.
    if ($c->node->type eq 'WantNeedType') {
        return;
    }

    return $c->node->adopt($c->unknown_el);
}

###################
### EXPRESSIONS ###
################################################################################

############################
### CONSTANT EXPRESSIONS ###
############################

# a constant string.
sub c_STRING {
    my ($c, $value) = @_;
    my $string = F::new('String', value => $value);
    return $c->node->adopt($string);
}

# a constant regular expression.
sub c_REGEX {
    my ($c, $value) = @_;
    my ($rgx, $mods) = $value;
       ($rgx, $mods) = @$value if ref $value;
    my $regex = F::new('Regex', value => $rgx, mods => $mods);
    return $c->node->adopt($regex);
}

# a constant number.
sub c_NUMBER {
    my ($c, $value) = @_;

    # create the number...
    my $num = F::new('Number', value => $value);

    # add to the current node.
    $c->node->adopt($num);

    return $num;
}

# the undefined value constant.
sub c_KEYWORD_UNDEFINED {
    my ($c, $value) = @_;

    # create the bool...
    my $b = F::new('Boolean', value => undef);

    # add to the current node.
    $c->node->adopt($b);

    return $b;
}

# the boolean true value constant.
sub c_KEYWORD_TRUE {
    my ($c, $value) = @_;

    # create the bool...
    my $b = F::new('Boolean', value => 1);

    # add to the current node.
    $c->node->adopt($b);

    return $b;
}

# the boolean false value constant.
sub c_KEYWORD_FALSE {
    my ($c, $value) = @_;

    # create the bool...
    my $b = F::new('Boolean', value => 0);

    # add to the current node.
    $c->node->adopt($b);

    return $b;
}

###################
### IDENTIFIERS ###
###################

# a bareword, representing a function, method, type interface, etc.
sub c_BAREWORD {
    my ($c, $value) = @_;

    # if the last element is a bareword, combine them.
    # ex: Math :: Point == Math::Point
    # ex: A B = AB
    my $l_word  = $c->last_el;
    my $l_label = $c->{done_toks}[-1] ? $c->{done_toks}[-1][0] : '';
    if ($l_label eq 'OP_PACK' && $l_word->type eq 'Bareword') {

        # if it's a typed class, allow another adopt
        if ($c->node->type eq 'TypedClass') {
            $c->node->{ready_for_another}++;
        }

        # update value and re-adopt (to call after_adopt again)
        $l_word->{bareword_value} .= $value;
        $l_word->{parent}->adopt($l_word);

        return $l_word;
    }

    # otherwise, create a new bareword.
    my $word = F::new('Bareword', bareword_value => $value);
    $c->node->adopt($word);

    # not yet in function call at this point.
    return $word;
}

# a lexical variable.
sub c_VAR_LEX {
    my ($c, $value) = @_;
    my $var = F::new('LexicalVariable', var_name => $value);
    return $c->node->adopt($var);
}

# an instance variable.
sub c_VAR_THIS {
    my ($c, $value) = @_;

    # Rule InstanceVariable[0]:
    #   Must be somewhere inside a Function or Method.

    my $var = F::new('InstanceVariable', var_name => $value);
    return $c->node->adopt($var);
}

# a special variable.
sub c_VAR_SPEC {
    my ($c, $value) = @_;
    my $var = F::new('SpecialVariable', var_name => $value);
    return $c->node->adopt($var);
}

# a symbol identifier.
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

# a shorthand property variable.
sub c_VAR_PROP {
    my ($c, $value) = @_;

    # Rule PropertyVariable[0]:
    #   Must be somewhere inside an InsideBody, FunctionMethodBody, or Type.

    # Rule PropertyVariable[1]:
    #   If not somewhere inside an InsideBody or Type, the nearest Function
    #   must be anonymous and have no WantNeeds associated with it.

    my $var = F::new('PropertyVariable', var_name => $value);
    return $c->node->adopt($var);
}

##################
### PROPERTIES ###
##################

# a simple property.
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
    ) if !$last_el || !$last_el->is_type('Expression');

    my $prop = F::new('Property', prop_name => $value);
    $c->node->adopt($prop);
    $prop->adopt($last_el);

    return $prop;
}

# a bareword suffixed by a colon. used for bareword keys.
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

# the property operator. used for non-bareword properties.
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
    ) if !$last_el || !$last_el->is_type('Expression');

    # make the property the current node.
    # it will capture the upcoming value list.
    my $prop = F::new('Property', prop_name => $value, is_index => 1);
    $c->adopt_and_set_node($prop);
    $prop->adopt($last_el);

    return $prop;
}

####################
### CONTROL FLOW ###
################################################################################

##################################
### FUNCTIONS, METHODS, EVENTS ###
##################################

# method declaration.
sub c_METHOD {
    my ($c, $value) = @_;

    # Rule Method[0]:
    #   Must be a direct child of a Class.

    my $method = F::new('Method', %$value, event_cb => 1);

    $c->node->adopt($method);
    $c->capture_closure_with($method->body);

    return $method;
}

# function declaration or anonymous function.
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

# event callback.
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

# event callback priority hints.
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

# stop statement. cancels event propagation.
sub c_KEYWORD_STOP {
    my ($c, $value) = @_;

    # Rule Stop[0]:
    #   Direct parent must be of type Instruction.

    # Rule Stop[1]:
    #   Direct children must be of type Function or Method.

    my $stop = F::new('Stop');
    $c->node->adopt($stop);
    # $c->adopt_and_set_node($stop); # once it takes an arg
}

# defer statement. postpones an instruction.
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

# function/method return statement.
sub c_KEYWORD_RETURN {
    my ($c, $value) = @_;
    my $ret = F::new('Return');
    return $c->adopt_and_set_node($ret);
}

# the return operator.
sub c_OP_RETURN {
    my ($c, $value) = @_;

    # check the last element.
    my $word = $c->last_el;
    if ($word->type ne 'Bareword') {

        # the previous element MUST be a bareword if this operator is not
        # starting an instruction.
        if ($c->node->type ne 'Instruction' || $c->node->children != 0) {
            return $c->expected(
                'a bareword key (or nothing)',
                'at left of return operator (->)'
            ) unless $word->type eq 'Bareword';
        }

        # if it does start the instruction, pretend it's a return keyword
        return $c->simulate('KEYWORD_RETURN');

    }

    # forget about the bareword.
    $word->parent->abandon($word);

    # create a return pair with the proper key.
    my $pair = F::new('ReturnPair', key => $word->{bareword_value});
    $c->adopt_and_set_node($pair);

    return $pair;
}

# optional function/method argument declaration.
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
    #   Number of direct children must be no less than one (1).

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

# required function/method argument declaration.
sub c_KEYWORD_NEED {
    my ($c, $value) = @_;

    # Rules:
    #   See rules in c_KEYWORD_WANT() above.

    my $need = F::new('WantNeed', arg_type => 'need');
    return $c->adopt_and_set_node($need);
}

##########################
### MISC. CONTROL FLOW ###
##########################

# inside block. allows for shorthand property access.
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

# gathering. consolidates items into a list.
sub c_KEYWORD_GATHER {
    my ($c, $value) = @_;

    # create a closure to be opened soon.
    my $gather = F::new('Gather');
    $c->capture_closure_with($gather->body);
    $c->node->adopt($gather);

    return $gather;
}

# gathering loop. conveniently combines the 'gather' and 'for' keywords.
sub c_KEYWORD_GATHFOR {
    my $c = shift;

    # create a gather.
    my $gather = $c->simulate('KEYWORD_GATHER');
    $gather->{is_gatherfor} = 1;

    # create a for.
    my $for = $c->simulate('KEYWORD_FOR');
    $for->{is_gatherfor} = 1;

    # add the for to the gather body.
    # note: $gather->body->open will never be called.
    $gather->body->adopt($for);

    return $for;
}

# take statement. adds a value to the current gathering.
sub c_KEYWORD_TAKE {
    my ($c, $value) = @_;

    # Rule Take[0]:
    #   Direct parent must be an Instruction.

    # Rule Take[1]:
    #   Direct children must be Expressions of sorts.

    # Rule Take[2]:
    #   Number of direct children must be exactly one (1).

    # Rule Take[3]:
    #   Must be somewhere inside a Gather.

    my $take = F::new('Take');
    $c->adopt_and_set_node($take);

    return $take;
}

#####################
### MISCELLANEOUS ###
################################################################################

#######################
### TYPE INTERFACES ###
#######################

# type interface declaration.
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

# type interface conditions and transformations.
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

# alias for type declaration or function/method.
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

####################
### CONDITIONALS ###
####################

# the basic conditional.
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

# alternative/extended conditional.
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

# conditional fallback.
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

#############
### LOOPS ###
#############

# the loop.
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

# the collection indicator. used for iterations.
sub c_KEYWORD_IN {
    my ($c, $value) = @_;

    # 'in' must terminate a generated expression for 'for'.
    return $c->unexpected("(where is 'for'?)") unless
        $c->node->{parameter_for} && $c->node->{parameter_for} eq 'for';

    # set the node to the 'in' parameter.
    my $for = $c->close_node;
    return $c->set_node($for->in_param_exp);

}

# loop control flow statements.
sub c_KEYWORD_NEXT { handle_loop_statement('next', @_) }
sub c_KEYWORD_LAST { handle_loop_statement('last', @_) }
sub c_KEYWORD_REDO { handle_loop_statement('redo', @_) }

sub handle_loop_statement {
    my ($type, $c) = @_;

    # Rule LoopStatement[0]:
    #   Direct parent must be of type Instruction.

    # Rule LoopStatement[1]:
    #   Must be somewhere inside the body of a For loop.

    my $stmt = F::new('LoopStatement', loop_stmt_name => $type);
    $c->node->adopt($stmt);

    return $stmt;
}

sub c_KEYWORD_CONTINUE {
    my ($c, $value) = @_;

    # find the for
    my $for = $c->last_el;
    return $c->unexpected("(where is 'for'?)")
        unless $for->type eq 'For';

    # create a closure to be opened soon.
    my $cont = F::new('Continue');

    $for->adopt($cont);
    $c->capture_closure_with($cont->body);

    return $cont;
}

######################
### ERROR HANDLING ###
######################

# raising of runtime errors.
sub c_KEYWORD_FAIL  { handle_failthrow(shift, 'fail')  }
sub c_KEYWORD_THROW { handle_failthrow(shift, 'throw') }

sub handle_failthrow {
    my ($c, $type) = @_;

    # Rule FailThrow[0]:
    #   Direct parent must be of type Instruction.

    # Rule FailThrow[1]:
    #   Direct children must be Expressions of sorts.

    # Rule FailThrow[2]:
    #   Number of direct children must be exactly one (1).

    # Rule FailThrow[3]:
    #   If it's a fail statement (rather than throw), it must be somewhere
    #   inside a Function or Method.

    my $fail = F::new('FailThrow', fail_type => $type);
    $c->adopt_and_set_node($fail);

    return $fail;
}

# handling runtime errors.
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

##########################
### PROPERTY MODIFIERS ###
##########################

# property modifier statements.
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

# property deletion statement.
sub c_KEYWORD_DELETE {
    my ($c, $value) = @_;
    # see start_modifier() for rules.
    return start_modifier($c, 'delete');
}

# property weakening statement.
sub c_KEYWORD_WEAKEN {
    my ($c, $value) = @_;
    # see start_modifier() for rules.
    return start_modifier($c, 'weaken');
}

#############################
### VARIABLE DECLARATIONS ###
#############################

# shared variable declaration.
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

    # Rule SharedDeclaration[4]:
    #   Parent must be a direct child of a Class or Document.

    my $share = F::new('SharedDeclaration');
    return $c->adopt_and_set_node($share);
}

# local variable declaration.
sub c_KEYWORD_VAR {
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

##############################
### DOCUMENTATION COMMENTS ###
##############################

# left-facing document line comment.
sub c_COMMENT_LDL {
    my ($c, $comment) = @_;
    my $last_el = $c->last_el;
    $last_el->{doc_comment} = $comment;
    return;
}

# right-facing document line comment.
sub c_COMMENT_LDR {
    my ($c, $comment) = @_;
    $c->{doc_comment} = $comment;
    return;
}

# appended document line comment.
sub c_COMMENT_LDA {
    my ($c, $comment) = @_;
    my $last_tok = $c->{done_toks}[-1] ? $c->{done_toks}[-1][0] : '';

    # use the last element comment.
    if ($last_tok eq 'COMMENT_LDL') {
        my $last_el = $c->last_el;
        $c->{doc_comment_ref} = \$last_el->{doc_comment};
    }

    # use the pending comment.
    if ($last_tok eq 'COMMENT_LDR') {
        $c->{doc_comment_ref} = \$c->{doc_comment};
    }

    # use the current comment reference.
    if ($c->{doc_comment_ref}) {
        ${ $c->{doc_comment_ref} } .= "\n".$comment;
        return;
    }

    # have to have a comment to append.
    return $c->unexpected(
        'without preceding documentation comment opener (#< or #>); found '.$last_tok
    );

    return;
}

###########################
### MISC. MISCELLANEOUS ###
###########################

# called for all labels. possibly starts an instruction.
sub c_any {
    my ($label, $c, $value) = @_;

    ### START AN INSTRUCTION ###

    # can the current node hold instructions?
    return unless $c->node->hold_instr;

    # these things cannot start an instruction.
    # (tokens only) (this is horrendous)
    my @ignore = qw(
        ^PKG_DEC$           ^CLASS_DEC$         ^KEYWORD_END$
        ^FUNCTION$          ^METHOD$            ^COMPUTED$
        ^TYPE$              ^COMMENT_.+$

        ^KEYWORD_INSIDE$    ^KEYWORD_FOR$       ^KEYWORD_ON$
        ^KEYWORD_IF$        ^KEYWORD_ELSE$      ^KEYWORD_ELSIF$
        ^KEYWORD_DEFER$     ^KEYWORD_CONTINUE$

        ^CLOSURE_.+$        ^ANGLE_.+$
        ^OP_(?!(?:ADD|SUB|NOT|RETURN)$).+$
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

# injected by the constructor. indicates namespace requirements.
sub c_spaces {
    my ($c, $main_node) = @_;
    my $spaces = F::new('Spaces');
    $main_node->adopt($spaces);
    return;
}

# represents the end of the document.
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
