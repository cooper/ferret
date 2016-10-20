# Copyright (c) 2015, Mitchell Cooper
package Ferret::Lexer::RuleFunctions;

use warnings;
use strict;
use 5.010;

use List::Util 'first';
use Scalar::Util 'looks_like_number';

my $ok;

# Unexpected something <...>
our %error_reasons = (
    child_not_allowed       => 'inside %s',
    parent_maxed_out        => 'inside %s, which can only contain %d element%s',
    not_enough_children     => 'lacking %d or more child element%s',
    wrong_number_children   => 'lacking exactly %d child element%s',
    previous_not_allowed    => 'after %s',
    expected_before         => 'without previous element at same level',
    expected_after          => 'without following element at same level',
    must_be_inside          => 'outside of a containing %s',
    must_be_after           => 'without %s immediately preceding it',
    must_be_set             => "without a current '%s'",
    must_not_be_set         => "with already a current '%s'",
    must_be_equal           => "with mismatching current '%s' and '%s'",
    expected_next_token     => "without %s immediately following it"
);

sub err { @_ ? sprintf $error_reasons{+shift}, @_ : '' }

sub _hashify {
    my $a = shift;
    return ([ keys %$a ], $a) if ref $a eq 'HASH';
    if (ref $a eq 'ARRAY') {
        my @a     = @$a;
        my @keys  = @a[ grep { not $_ % 2 } 0..$#a ];
        return (\@keys, { @a });
    }
    die;
}

###################
### TOKEN RULES ###
###################

sub tok_rule_hash {
    my @levels = @_;
    my $h = \%Ferret::Lexer::Rules::token_rules;
    my $k = [];
    for my $level (@levels) {
        return unless $h->{$level};
        $h = $h->{$level};
        ($k, $h) = _hashify($h);
    }
    return ($k, $h);
}

sub tok_rule_set {
    my $label = shift;
    my ($keys, $rules) = tok_rule_hash($label);
    return if !$rules;
    my $set = Ferret::Lexer::RuleSet->new(%$rules);
    $set->{keys_in_order} = $keys;
    return $set;
}

my %token_checkers = (
    upper_nodes_must_have       => \&t_upper_nodes_must_have,
    current_must_have           => \&t_current_must_have,
    current_must_not_have       => \&t_current_must_not_have,
    current_node_must_be        => \&t_current_node_must_be,
    current_node_must_satisfy   => \&t_current_node_must_satisfy,
    last_element_must_be        => \&t_last_element_must_be,
    last_element_must_satisfy   => \&t_last_element_must_satisfy,
    current_must_be_equal       => \&t_current_must_be_equal,
    current_must_satisfy        => \&t_current_must_satisfy,
    next_token_must_be          => \&t_next_token_must_be
);

# token check.
sub token_check {
    my ($label, $c, $value) = @_;
    my $set = tok_rule_set($label) or return;
    my $e;

    # check each rule in order.
    foreach my $key ($set->keys_in_order) {
        my $code = $token_checkers{$key};
        die "bad code for $key" if !$code || ref $code ne 'CODE';
        $e ||= $code->($label, $c, $value, $set);
        last if $e;
    }

    # create an unknown element because token_check() can occur
    # later than $c through simulation.
    return F::new('Unknown',
        token_label => $label,
        token_value => $value
    )->unexpected($e) if $e;

    return;
}

sub t_upper_nodes_must_have {
    my ($label, $c, $value, $set) = @_;

    # upper nodes must have one of the items in the list.
    my ($err_type, $pass);
    foreach my $type ($set->list_items('upper_nodes_must_have')) {
        $err_type ||= $type;
        $pass = scalar first { $_ eq $type } $c->{node}->types_upward;
        last if $pass;
    }

    return $ok if $pass;
    return $set->err(must_be_inside => lc $err_type);
}

sub t_current_must_have {
    my ($label, $c, $value, $set) = @_;

    # one of the items in the list must exist in $current.
    my ($err_type, $pass);
    foreach my $type ($set->list_items('current_must_have')) {
        $err_type ||= $type;
        $pass = defined $c->{$type};
        last if $pass;
    }

    return $ok if $pass;
    return $set->err(must_be_set => F::pretty_current($err_type));
}


sub t_current_must_not_have {
    my ($label, $c, $value, $set) = @_;

    # one of the items in the list must exist in $current.
    foreach my $type ($set->list_items('current_must_not_have')) {
        return $set->err(must_not_be_set => F::pretty_current($type))
            if defined $c->{$type};
    }

    return $ok;
}

sub t_current_node_must_be {
    my ($label, $c, $value, $set) = @_;

    # current node must be one of the types in the list.
    my ($good, $err_type);
    foreach my $type ($set->list_items('current_node_must_be')) {
        $good = $c->{node}->t eq $type;
        last if $good;
        $err_type ||= $type;
    }

    return $ok if $good;
    return $set->err(must_be_inside => lc $err_type);
}

sub t_current_node_must_satisfy {
    my ($label, $c, $value, $set) = @_;
    my $code = $set->rule_code('current_node_must_satisfy');
    return $set->err if !$code->($c->node);
}

sub t_last_element_must_be {
    my ($label, $c, $value, $set) = @_;
    my $last_el = $c->last_el;

    # last element must be one of the types in the list.
    my ($good, $err_type);
    foreach my $type ($set->list_items('last_element_must_be')) {
        $good = $last_el && $last_el->t eq $type;
        last if $good;
        $err_type ||= $type;
    }

    return $ok if $good;
    return $set->err(must_be_after => lc $err_type);
}

sub t_last_element_must_satisfy {
    my ($label, $c, $value, $set) = @_;
    my $code = $set->rule_code('last_element_must_satisfy');
    my $last_el = $c->last_el;
    return $set->err if !$last_el || !$code->($last_el);
}

sub t_current_must_be_equal {
    my ($label, $c, $value, $set) = @_;
    my @items = $set->list_items('current_must_be_equal');

    # some of them didn't pass.
    my $first = shift @items;
    if (my $bad = first { $c->{$_} ne $c->{$first} } @items) {
        return $set->err(must_be_equal => $first, $bad);
    }

    return $ok;
}

sub t_current_must_satisfy {
    my ($label, $c, $value, $set) = @_;
    my $code = $set->rule_code('current_must_satisfy');
    return $set->err if !$code->($c);
}

sub t_next_token_must_be {
    my ($label, $c, $value, $set) = @_;
    my $next_t = $c->{upcoming}[0];

    my ($pass, $err_tok);
    foreach my $tok ($set->list_items('next_token_must_be')) {
        $err_tok ||= $tok;
        last if !$next_t;
        $pass = $next_t->[0] eq $tok;
        last if $pass;
    }

    if (!$pass) {
        my $pretty = F::pretty_token($err_tok);
        return $set->err(expected_next_token => $pretty);
    }

    return $ok;
}

#####################
### ELEMENT RULES ###
#####################

# this injects the rule name into the third element of arrays.
sub add_rule_name {
    my ($name, @rules) = @_;
    my @done;
    while (@rules >= 2) {
        my ($k, $v) = (shift @rules, shift @rules);
        if (ref $v eq 'ARRAY' && looks_like_number($v->[2])) {
            $v->[2] = "$name\[$$v[2]\]";
        }
        push @done, $k, $v;
    }
    return @done;
}

# returns a hash of rules from a section of the rule tree.
#
#   e.g. rule_hash('WantNeed', 'child_rules', 'Bareword')
#
sub rule_hash {
    my @levels = @_;
    my $first = $_[0];
    my $h = \%Ferret::Lexer::Rules::element_rules;
    for my $level (@levels) {
        return unless $h->{$level};
        $h = $h->{$level};
        $h = _hashify($h);
    }
    return add_rule_name($first, %$h);
}

# final element check.
sub final_check {
    my $main_el = shift;
    my $check; $check = sub {
        my $el = shift;

        # do tests.
        my $err = $el->parent->can_adopt($el, 1) if $el->parent;
        $err  ||= $el->can_close                 if $el->is_node;
        $err  ||= $el->has_minimal(1)            if $el->is_node;

        $el->unexpected($err) if $err;

        # now do the same for each child.
        if ($el->is_node) {
            $check->($_, $el) foreach $el->children;
        }

    };
    $check->($main_el);
}

# returns a list of rule set objects for an element.
sub F::Element::rule_sets {
    my ($el, $parent, $after) = @_;

    # as of 20 Oct 2016, element rules are applied only after construction
    return if !$after;

    my @rule_sets; return if !$after;
    my $push_set = sub { push @rule_sets, Ferret::Lexer::RuleSet->new(@_) };

    # Set 1: Local rules.

    #$push_set->(rule_hash($el->type, 'after_rules')) if $after;
    $push_set->(rule_hash($el->type));

    # rules from ancestors
    $parent ||= $el->parent;
    if ($parent) {
        my $my_place = $after ? $el->index : scalar $parent->children;

        # Set 2: Rules from ancestors above

        # rules from parent or any node above parent.
        $push_set->(map {
            rule_hash($_, 'lower_rules', $el->type)
        } reverse $parent->types_upward);

        # rules directly from parent.
        $push_set->(rule_hash($parent->t, 'child_rules', $el->type));
        $push_set->(rule_hash($parent->t, "child_${my_place}_rules"));

        # Set 3: Rules from self, when certain ancestors are above

        # rules from self while inside a certain type of node at any level.
        $push_set->(map {
            rule_hash($el->type, 'anywhere_inside_rules', $_)
        } reverse $parent->types_upward);

        # rules from self while the parent instruction is a direct descendant of
        # a type. This is like directly_inside_rules, except it overlooks the
        # above instruction.
        if ($parent->type eq 'Instruction') {
            my $p = $parent->parent;
            $push_set->(
                rule_hash($el->type, 'instruction_inside_rules', $p->type)
            ) if $p;
        }

        # rules from self while directly inside a certain type of node.
        $push_set->(
            rule_hash($el->type, 'directly_inside_rules', $parent->type)
        );

    }

    # Set 4: Rules from children
    if ($after && $el->is_node) {
        $push_set->(rule_hash($_->type, 'parent_rules')) for $el->children;
    }

    return @rule_sets;
}

# checks if an element should be adopted.
# if $after_check is true, it's part of the final check.
sub F::Node::can_adopt {
    my ($parent_maybe, $child_maybe, $after_check) = @_;
    my $e;

    # check that the parent is not maxed out.
    # only check after all is done.
    $e ||= $parent_maybe->has_room($after_check) if $after_check;

    # check that the upper hierarchy is satisfactory.
    $e ||= $child_maybe->allows_upper_nodes($parent_maybe, $after_check);

    # check that the parent allows this type of child.
    $e ||= $parent_maybe->allows_child($child_maybe, $after_check);

    # check that the child allows this type of parent.
    $e ||= $child_maybe->allows_parent($parent_maybe, $after_check);

    # determine the previous element.
    my $previous_maybe = $child_maybe->parent   ?
        $child_maybe->previous_element          :
        $parent_maybe->last_child;

    # check that the child allows the previous element type.
    $e ||= $child_maybe->allows_previous(
        $parent_maybe,
        $previous_maybe,
        $after_check
    );

    # check that the previous element allows the new child to follow it.
    $e ||= $child_maybe->previous_allows(
        $parent_maybe,
        $previous_maybe,
        $after_check
    );

    return $e || $ok;
}

sub F::Node::can_close {
    my $node = shift;
    my $e;

    # check that the last element allows nothing to follow it.
    if (my $last_el = $node->last_child) {
        $e = F::Element::previous_allows(
            undef,
            $node,
            $last_el
        );
    }

    return $e || $ok;
}

# checks if a child can be in a parent.
sub F::Element::allows_child {
    my ($parent_maybe, $child_maybe, $after_check) = @_;
    foreach my $set ($parent_maybe->rule_sets(undef, $after_check)) {

        # determine index of the child.
        my $my_place = $after_check ?
            $child_maybe->index : scalar $parent_maybe->children;

        my $must_be = sub {
            my $rule_name = shift;
            my @allowed = $set->list_items($rule_name);
            foreach my $type (@allowed) {
                my $supertypes = $type =~ s/^\@//;
                return 1 if $child_maybe->t eq $type;
                return 1 if $child_maybe->is_type($type) && $supertypes;
            }
            return;
        };

        # this specific child must be of a certain type.
        my $idx_name = "child_${my_place}_must_be";
        if ($set->{$idx_name}) {
            return $set->err(child_not_allowed => $parent_maybe->detail)
                if !$must_be->($idx_name);
        }

        # children must be of a certain type.
        if ($set->{children_must_be}) {
            return $set->err(child_not_allowed => $parent_maybe->detail)
                if !$must_be->('children_must_be');
        }

        # this specific child must match a subroutine.
        $idx_name = "child_${my_place}_must_satisfy";
        if (my $code = $set->rule_code($idx_name)) {
            return $set->err(child_not_allowed => $parent_maybe->detail)
                if !$code->($child_maybe, $parent_maybe);
        }

        # children must match a subroutine.
        if (my $code = $set->rule_code('children_must_satisfy')) {
            return $set->err(child_not_allowed => $parent_maybe->detail)
                if !$code->($child_maybe, $parent_maybe);
        }
    }

    return $ok;
}

# checks if a parent can provide for a child.
sub F::Element::allows_parent {
    my ($child_maybe, $parent_maybe, $after_check) = @_;
    foreach my $set ($child_maybe->rule_sets($parent_maybe, $after_check)) {

        # parent must be of a certain type.
        if ($set->{parent_must_be}) {
            my $good;
            my @allowed = $set->list_items('parent_must_be');
            foreach my $type (@allowed) {
                my $supertypes = $type =~ s/^\@//;
                $good++ and last
                    if $parent_maybe->t eq $type;
                $good++ and last
                    if $parent_maybe->is_type($type) && $supertypes;
            }
            return $set->err(child_not_allowed => $parent_maybe->detail)
                if !$good;
        }

        # parent must match a subroutine.
        if (my $code = $set->rule_code('parent_must_satisfy')) {
            return $set->err(child_not_allowed => $parent_maybe->detail)
                if !$code->($parent_maybe, $child_maybe);
        }
    }

    return $ok;
}

# check if somewhere in an upper level is a certain node type.
sub F::Element::allows_upper_nodes {
    my ($child_maybe, $parent_maybe, $after_check) = @_;
    SET: foreach my $set ($child_maybe->rule_sets($parent_maybe, $after_check)) {

        # there's no rule, so it allows everything.
        next SET if
            !$set->{must_be_somewhere_inside} &&
            !$set->{must_be_somewhere_inside_all};

        # any of these can work.
        # first_self_or_parent() respects @.
        my $bad;
        foreach my $type ($set->list_items('must_be_somewhere_inside')) {
            next SET if $parent_maybe->first_self_or_parent($type);
            $bad ||= $type;
        }

        # all of these must work.
        # first_self_or_parent() respects @.
        EL: foreach my $type ($set->list_items('must_be_somewhere_inside_all')) {
            next EL if $parent_maybe->first_self_or_parent($type);
            $bad = $type;
            last SET;
        }

        next if !$bad;
        return $set->err(must_be_inside => lc $bad);
    }

    return $ok;
}

# checks if the previous element at the same level is allowed.
sub F::Element::allows_previous {
    my ($child_maybe, $parent_maybe, $previous_maybe, $after_check) = @_;
    foreach my $set ($child_maybe->rule_sets($parent_maybe, $after_check)) {

        # there's no rule, so it allows everything.
        next if !$set->{must_come_after}; # allow everything.

        # allows none, and there's none.
        next if !$previous_maybe &&
            $set->list_contains(must_come_after => 'NONE');

        # require something, but there's nothing.
        return $set->err(expected_before => $child_maybe->detail) if !$previous_maybe;

        # this type is in the list.
        next if $set->list_contains(must_come_after => $previous_maybe->t);

        # this type doesn't work.
        return $set->err(previous_not_allowed => $previous_maybe->detail);
    }

    return $ok;
}

# checks if the previous element allows the new element to follow it.
#
# TODO: if an element must come before a certain thing but is followed
# by nothing, this rule currently is not respected. perhaps this can be solved
# by checking in the ->close method of the parent node.
#
sub F::Element::previous_allows {
    my ($child_maybe, $parent_maybe, $previous_maybe, $after_check) = @_;

    # no previous element, no rules.
    return $ok if !$previous_maybe;
    foreach my $set ($previous_maybe->rule_sets(undef, $after_check)) {

        # there's no rule, so it allows everything.
        next if !$set->{must_come_before}; # allow everything.

        # there's no next element. see if this is allowed.
        if (!$child_maybe) {
            next if $set->list_contains(must_come_before => 'NONE');
            return $set->err('expected_after');
        }

        # this type is in the list.
        next if $set->list_contains(must_come_before => $child_maybe->t);

        # this type doesn't work.
        return $set->err(previous_not_allowed => $previous_maybe->detail);

    }

    return $ok;
}

# check that a node has not reached its limit
sub F::Node::has_room {
    my ($parent_maybe, $after_check) = @_;
    foreach my $set ($parent_maybe->rule_sets(undef, $after_check)) {

        # no limit.
        my $max = $set->rule_value('max_children') //
                  $set->rule_value('num_children');
        next if !defined $max;

        # surpassing the limit.
        my $current = scalar $parent_maybe->children;
        my $bad = $after_check ? $current > $max : $current >= $max;
        return $set->err(parent_maxed_out =>
            $parent_maybe->detail,
            $max,
            $max == 1 ? '' : 's'
        ) if $bad;
    }

    return $ok;
}

sub F::Node::has_minimal {
    my ($node, $after_check) = @_;
    foreach my $set ($node->rule_sets(undef, $after_check)) {
        my $current = scalar $node->children;

        # first, check if it has an exact amount.
        my $exact = $set->rule_value('num_children');
        if (defined $exact) {
            return $set->err(wrong_number_children =>
                $exact,
                $exact == 1 ? '' : 's'
            ) if $current != $exact;
        }

        # now check minimum.
        my $min = $set->rule_value('min_children');
        next if !defined $min;

        # less than the minimum.
        return $set->err(not_enough_children =>
            $min,
            $min == 1 ? '' : 's'
        ) if $current < $min;
    }

    return $ok;
}
