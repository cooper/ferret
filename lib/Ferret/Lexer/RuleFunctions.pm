# Copyright (c) 2015, Mitchell Cooper
package Ferret::Lexer::RuleFunctions;

use warnings;
use strict;
use 5.010;

my $ok;

# Unexpected something <...>
our %error_reasons = (
    child_not_allowed       => 'inside %s',
    parent_maxed_out        => 'inside %s, which can only contain %d element(s)',
    previous_not_allowed    => 'after %s',
    expected_before         => 'without previous element at same level',
    expected_after          => 'without following element at same level',
    must_be_inside          => 'outside of a containing %s'
);

sub err { sprintf $error_reasons{+shift}, @_ }

sub final_check {
    my $main_el = shift;
    my $check; $check = sub {
        my $el = shift;

        # do tests.
        my $err = $el->parent->can_adopt($el, 1) if $el->parent;
        $err  ||= $el->can_close                 if $el->is_node;
        $el->unexpected($err) if $err;

        # now do the same for each child.
        if ($el->is_node) { $check->($_, $el) foreach $el->children }

    };
    $check->($main_el);
}

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
    }
    return %$h;
}

# returns a rule set object for an element.
#
#   optional $parent_t = element or type to get rules for inside. (child_rules)
#   $parent_t will fall back to the element's parent if it has one already.
#
sub F::Element::rule_set {
    my ($el, $parent) = @_;
    $parent ||= $el->parent;

    # local rules.
    my $set1 = Ferret::Lexer::RuleSet->new(
        rule_hash($el->type),
        rule_hash($el->tok)
    );

    my ($set2, $set3);
    if ($parent) {

        # rules from parent and upper nodes.

        # lower rules.
        #
        #
        my @rules = map {
            my   @a = rule_hash($_, 'lower_rules', $el->type);
            push @a,  rule_hash($_, 'lower_rules', $el->tok) if $el->tok;
            @a;
        } reverse $parent->types_upward;

        # child rules.
        #
        #
        push @rules, rule_hash($parent->t, 'child_rules', $el->type);
        push @rules, rule_hash($parent->t, 'child_rules', $el->tok) if $el->tok;

        $set2 = Ferret::Lexer::RuleSet->new(@rules);

        # rules from self while inside a certain type of node at any level.
        #
        #
        @rules = map {
            rule_hash($el->type, 'anywhere_inside_rules', $_)
        } reverse $parent->types_upward;

        # rules from self while directly inside a certain type of node.
        #
        push @rules, rule_hash($el->type, 'directly_inside_rules', $el->type);
        push @rules, rule_hash($el->type, 'directly_inside_rules', $el->tok) if $el->tok;

        $set3 = Ferret::Lexer::RuleSet->new(@rules);
    }

    return $set1->merge_in($set2)->merge_in($set3);
}

# checks if an element should be adopted.
# if $after_check is true, it's part of the final check.
sub F::Node::can_adopt {
    my ($parent_maybe, $child_maybe, $after_check) = @_;

    # check that the parent is not maxed out.
    my $e = $parent_maybe->has_room($after_check);

    # check that the parent allows this type of child.
    $e ||= $parent_maybe->allows_child($child_maybe);

    # check that the child allows this type of parent.
    $e ||= $child_maybe->allows_parent($parent_maybe);

    # check that the upper hierarchy is satisfactory.
    $e ||= $child_maybe->allows_upper_nodes($parent_maybe);

    # determine the previous element.
    my $previous_maybe = $child_maybe->parent   ?
        $child_maybe->previous_element          :
        $parent_maybe->last_child;

    # check that the child allows the previous element type.
    $e ||= $child_maybe->allows_previous(
        $parent_maybe,
        $previous_maybe
    );

    # check that the previous element allows the new child to follow it.
    $e ||= $child_maybe->previous_allows(
        $parent_maybe,
        $previous_maybe
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
    my ($parent_maybe, $child_maybe) = @_;
    my $set = $parent_maybe->rule_set(undef);

    # children must be of a certain type.
    if ($set->{children_must_be}) {
        return $set->err(child_not_allowed => $parent_maybe->desc)
            if !$set->list_contains(children_must_be => $child_maybe->t);
    }

    # children must match a subroutine.
    if (my $code = $set->rule_code('children_must_satisfy')) {
        return $set->err(child_not_allowed => $parent_maybe->desc)
            if !$code->($child_maybe, $parent_maybe);
    }

    return $ok;
}

# checks if a parent can provide for a child.
sub F::Element::allows_parent {
    my ($child_maybe, $parent_maybe) = @_;
    my $set = $child_maybe->rule_set($parent_maybe);

    # there's no rule, so it allows everything.
    return $ok if !$set->{parent_must_be};

    # it's in the list.
    return $ok if $set->list_contains(parent_must_be => $parent_maybe->t);

    # not allowed.
    return $set->err(child_not_allowed => $parent_maybe->desc);

}

# check if somewhere in an upper level is a certain node type.
sub F::Element::allows_upper_nodes {
    my ($child_maybe, $parent_maybe) = @_;
    my $set = $child_maybe->rule_set($parent_maybe);

    # there's no rule, so it allows everything.
    return $ok if !$set->{must_be_inside_one} && !$set->{must_be_inside_all};

    # any of these can work.
    my $bad;
    foreach my $type ($set->list_items('must_be_inside_one')) {
        return $ok if $parent_maybe->first_self_or_parent($type);
        $bad ||= $type;
    }

    # all of these must work.
    foreach my $type ($set->list_items('must_be_inside_all')) {
        next if $parent_maybe->first_self_or_parent($type);
        $bad = $type;
        last;
    }

    return $set->err(must_be_inside => lc $bad);
}

# checks if the previous element at the same level is allowed.
sub F::Element::allows_previous {
    my ($child_maybe, $parent_maybe, $previous_maybe) = @_;
    my $set = $child_maybe->rule_set($parent_maybe);

    # there's no rule, so it allows everything.
    return $ok if !$set->{must_come_after}; # allow everything.

    # allows none, and there's none.
    return $ok if !$previous_maybe &&
        $set->list_contains(must_come_after => 'NONE');

    # require something, but there's nothing.
    return $set->err(expected_before => $child_maybe->desc) if !$previous_maybe;

    # this type is in the list.
    return $ok if $set->list_contains(must_come_after => $previous_maybe->t);

    # this type doesn't work.
    return $set->err(previous_not_allowed => $previous_maybe->desc);

}

# checks if the previous element allows the new element to follow it.
#
# TODO: if an element must come before a certain thing but is followed
# by nothing, this rule currently is not respected. perhaps this can be solved
# by checking in the ->close method of the parent node.
#
sub F::Element::previous_allows {
    my ($child_maybe, $parent_maybe, $previous_maybe) = @_;

    # no previous element, no rules.
    return $ok if !$previous_maybe;
    my $set = $previous_maybe->rule_set; # in actual parent.

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
    return $set->err(previous_not_allowed => $previous_maybe->desc);

}

# check that a node has not reached its limit
sub F::Node::has_room {
    my ($parent_maybe, $after_check) = @_;
    my $set = $parent_maybe->rule_set;

    # no limit.
    my $max = $set->{max_children};
    return $ok if !defined $max;

    # surpassing the limit.
    my $current = scalar $parent_maybe->children;
    my $bad = $after_check ? $current > $max : $current >= $max;
    return $set->err(
        parent_maxed_out => $parent_maybe->desc, $max
    ) if $bad;

    return $ok;
}
