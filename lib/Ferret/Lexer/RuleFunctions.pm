# Copyright (c) 2015, Mitchell Cooper
package Ferret::Lexer::RuleFunctions;

use warnings;
use strict;
use 5.010;

use List::Util 'first';

my $ok;

# Unexpected something <...>
our %error_reasons = (
    child_not_allowed       => 'inside %s',
    parent_maxed_out        => 'inside %s, which can only contain %d element(s)',
    not_enough_children     => 'without %d or more child element(s)',
    previous_not_allowed    => 'after %s',
    expected_before         => 'without previous element at same level',
    expected_after          => 'without following element at same level',
    must_be_inside          => 'outside of a containing %s',
    must_be_set             => "without a current %s",
    must_not_be_set         => "with already a current '%s'",
    must_be_equal           => "with mismatching current %s and current %s"
);

sub err { sprintf $error_reasons{+shift}, @_ }

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
    upper_nodes_must_have   => \&t_upper_nodes_must_have,
    current_must_have       => \&t_current_must_have,
    current_must_not_have   => \&t_current_must_not_have,
    current_node_must_be    => \&t_current_node_must_be,
    current_must_be_equal   => \&t_current_must_be_equal,
    current_must_satisfy    => \&t_current_must_satisfy
);

# token check.
sub token_check {
    my ($label, $c, $value) = @_;
    my $set = tok_rule_set($label) or return;
    my $e;

    # check each rule in order.
    foreach my $key ($set->keys_in_order) {
        my $code = $token_checkers{$key};
        die 'bad code' if !$code || ref $code ne 'CODE';
        $e ||= $code->($label, $c, $value, $set);
        last if $e;
    }

    return $c->unknown_el->unexpected($e) if $e;
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
    return $set->err(must_be_set => Ferret::Lexer::pretty_current($err_type));
}


sub t_current_must_not_have {
    my ($label, $c, $value, $set) = @_;

    # one of the items in the list must exist in $current.
    foreach my $type ($set->list_items('current_must_not_have')) {
        return $set->err(must_not_be_set => Ferret::Lexer::pretty_current($type))
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
    return $set->err() if !$code->($c);
}

#####################
### ELEMENT RULES ###
#####################

# returns a hash of rules from a section of the rule tree.
#
#   e.g. rule_hash('WantNeed', 'child_rules', 'Bareword')
#
sub rule_hash {
    my @levels = @_;
    my $h = \%Ferret::Lexer::Rules::element_rules;
    for my $level (@levels) {
        return unless $h->{$level};
        $h = $h->{$level};
        $h = _hashify($h);
    }
    return %$h;
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

# returns a rule set object for an element.
#
#   optional $parent_t = element or type to get rules for inside. (child_rules)
#   $parent_t will fall back to the element's parent if it has one already.
#
sub F::Element::rule_set {
    my ($el, $parent, $after) = @_;
    $parent ||= $el->parent;

    # after_rules
    my @after;
    if ($after) {
        push @after, rule_hash($el->type, 'after_rules');
        push @after, rule_hash($el->tok,  'after_rules');
    }

    # Set 1: local rules.
    my $set1 = Ferret::Lexer::RuleSet->new(
        @after,
        rule_hash($el->type),
        rule_hash($el->tok)
    );

    my ($set2, $set3, $set4);

    # rules from ancestors
    if ($parent) {

        # Set 2: Rules from ancestors above

        # rules from parent or any node above parent.
        my @rules = map {
            my   @a = rule_hash($_, 'lower_rules', $el->type);
            push @a,  rule_hash($_, 'lower_rules', $el->tok) if $el->tok;
            @a;
        } reverse $parent->types_upward;

        # rules directly from parent.
        push @rules, rule_hash($parent->t, 'child_rules', $el->type);
        push @rules, rule_hash($parent->t, 'child_rules', $el->tok) if $el->tok;

        $set2 = Ferret::Lexer::RuleSet->new(@rules);

        # Set 3: Rules from self, when certain ancestors are above

        # rules from self while inside a certain type of node at any level.
        @rules = map {
            rule_hash($el->type, 'anywhere_inside_rules', $_)
        } reverse $parent->types_upward;

        # rules from self while the parent instruction is a direct descendant of
        # a type. This is like directly_inside_rules, except it overlooks the
        # above instruction.
        if ($parent->type eq 'Instruction') {
            my $p = $parent->parent;
            push @rules, rule_hash($el->type, 'instruction_inside_rules', $p->type) if $p;
            push @rules, rule_hash($el->type, 'instruction_inside_rules', $p->tok)  if $p && $p->tok;
        }

        # rules from self while directly inside a certain type of node.
        push @rules, rule_hash($el->type, 'directly_inside_rules', $parent->type);
        push @rules, rule_hash($el->type, 'directly_inside_rules', $parent->tok) if $parent->tok;

        $set3 = Ferret::Lexer::RuleSet->new(@rules);
    }

    # Set 4: Rules from children
    my @rules;
    if ($after && $el->is_node) {
        foreach my $child ($el->children) {
            push @rules, rule_hash($child->type, 'parent_rules');
        }
    }
    $set4 = Ferret::Lexer::RuleSet->new(@rules);

    return $set1->merge_in($set2)->merge_in($set3)->merge_in($set4);
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
    my $set = $parent_maybe->rule_set(undef, $after_check);

    # children must be of a certain type.
    if ($set->{children_must_be}) {
        return $set->err(child_not_allowed => $parent_maybe->detail)
            if !$set->list_contains(children_must_be => $child_maybe->t);
    }

    # children must match a subroutine.
    if (my $code = $set->rule_code('children_must_satisfy')) {
        return $set->err(child_not_allowed => $parent_maybe->detail)
            if !$code->($child_maybe, $parent_maybe);
    }

    return $ok;
}

# checks if a parent can provide for a child.
sub F::Element::allows_parent {
    my ($child_maybe, $parent_maybe, $after_check) = @_;
    my $set = $child_maybe->rule_set($parent_maybe, $after_check);

    # parent must be of a certain type.
    if ($set->{parent_must_be}) {
        return $set->err(child_not_allowed => $parent_maybe->detail)
            if !$set->list_contains(parent_must_be => $parent_maybe->t);
    }

    # parent must match a subroutine.
    if (my $code = $set->rule_code('parent_must_satisfy')) {
        return $set->err(child_not_allowed => $parent_maybe->detail)
            if !$code->($parent_maybe, $child_maybe);
    }

    return $ok;
}

# check if somewhere in an upper level is a certain node type.
sub F::Element::allows_upper_nodes {
    my ($child_maybe, $parent_maybe, $after_check) = @_;
    my $set = $child_maybe->rule_set($parent_maybe, $after_check);

    # there's no rule, so it allows everything.
    return $ok if
        !$set->{must_be_somewhere_inside} &&
        !$set->{must_be_somewhere_inside_all};

    # any of these can work.
    my $bad;
    foreach my $type ($set->list_items('must_be_somewhere_inside')) {
        return $ok if $parent_maybe->first_self_or_parent($type);
        $bad ||= $type;
    }

    # all of these must work.
    foreach my $type ($set->list_items('must_be_somewhere_inside_all')) {
        next if $parent_maybe->first_self_or_parent($type);
        $bad = $type;
        last;
    }

    return $ok if !$bad;
    return $set->err(must_be_inside => lc $bad);
}

# checks if the previous element at the same level is allowed.
sub F::Element::allows_previous {
    my ($child_maybe, $parent_maybe, $previous_maybe, $after_check) = @_;
    my $set = $child_maybe->rule_set($parent_maybe, $after_check);

    # there's no rule, so it allows everything.
    return $ok if !$set->{must_come_after}; # allow everything.

    # allows none, and there's none.
    return $ok if !$previous_maybe &&
        $set->list_contains(must_come_after => 'NONE');

    # require something, but there's nothing.
    return $set->err(expected_before => $child_maybe->detail) if !$previous_maybe;

    # this type is in the list.
    return $ok if $set->list_contains(must_come_after => $previous_maybe->t);

    # this type doesn't work.
    return $set->err(previous_not_allowed => $previous_maybe->detail);

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
    my $set = $previous_maybe->rule_set(undef, $after_check); # in actual parent.

    # there's no rule, so it allows everything.
    return $ok if !$set->{must_come_before}; # allow everything.

    # there's no next element. see if this is allowed.
    if (!$child_maybe) {
        return $ok if $set->list_contains(must_come_before => 'NONE');
        return $set->err('expected_after');
    }

    # this type is in the list.
    return $ok if $set->list_contains(must_come_before => $child_maybe->t);

    # this type doesn't work.
    return $set->err(previous_not_allowed => $previous_maybe->detail);

}

# check that a node has not reached its limit
sub F::Node::has_room {
    my ($parent_maybe, $after_check) = @_;
    my $set = $parent_maybe->rule_set(undef, $after_check);

    # no limit.
    my $max = $set->{max_children};
    return $ok if !defined $max;

    # surpassing the limit.
    my $current = scalar $parent_maybe->children;
    my $bad = $after_check ? $current > $max : $current >= $max;
    return $set->err(
        parent_maxed_out => $parent_maybe->detail, $max
    ) if $bad;

    return $ok;
}

sub F::Node::has_minimal {
    my ($node, $after_check) = @_;
    my $set = $node->rule_set(undef, $after_check);

    # no limit.
    my $min = $set->{min_children};
    return $ok if !defined $min;

    # less than the minimum.
    my $current = scalar $node->children;
    return $set->err(
        not_enough_children => $node->detail, $min
    ) if $current < $min;


    return $ok;
}
