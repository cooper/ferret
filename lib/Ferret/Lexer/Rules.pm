# Copyright (c) 2014 Mitchell Cooper
package Ferret::Lexer::RuleSet;

use warnings;
use strict;
use 5.010;

sub new {
    my ($class, %opts) = @_;
    return bless \%opts, $class;
}

# merge the rules from another set.
# the second set's rules with overwrite the first's.
sub merge_in {
    my ($set1, $set2) = @_;
    return $set1 if !$set2;
    return bless { %$set1, %$set2 };
}

# returns true if a list contains an item.
sub list_contains {
    my ($set, $list, $what) = @_;
    my %list_items = map { $_ => 1 } $set->list_items($list);
    return $list_items{$what};
}

# returns the items in a list or none if the list doesn't exist.
sub list_items {
    my ($set, $list) = @_;
    my $list_str = $set->{$list} or return;
    if (ref $list_str eq 'ARRAY') {
         ($list_str, $set->{last_error}) = @$list_str;
    }
    return split /\s+/, $list_str;
}

sub err {
    my ($set, @err) = @_;
    my $err_str = Ferret::Lexer::Rules::err(@err);
    return [ $err_str, $set->{last_error} ];
}

package Ferret::Lexer::Rules;

use warnings;
use strict;
use 5.010;

use Scalar::Util 'blessed';

my $ok;

our %element_rules = (

    WantNeed => {

        # WantNeed must always be a direct child of an instruction.
        parent_must_be => 'Instruction',

        # WantNeed must always be inside one of these.
        must_be_inside_one => [
            'Function Method',
            'Argument declaration must be within a function or method'
        ],

        inside_Method => {

            # inside a method, WantNeed can ONLY contain these things.
            children_must_be => [
                'InstanceVariable LexicalVariable Expression Bareword',
                'Argument declaration inside method can only contain lexical'.
                ' or instance variables and their types'
            ]

        },

        inside_Function => {

            # inside a function, WantNeed can ONLY contain these things.
            children_must_be => [
                'LexicalVariable Expression Bareword',
                'Argument declaration inside function can only contain lexical'.
                ' variables and their types'
            ]

        },

    },

    Token => {
        parent_must_be => 'NONE'
    }

);

# Unexpected something <...>
our %error_reasons = (
    child_not_allowed       => 'inside %s',
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
        my $err = $el->parent->can_adopt($el) if $el->parent;
        $err  ||= $el->can_close              if $el->is_node;
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
    my $h = \%element_rules;
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
        my @rules = map {
            my   @a = rule_hash($_, 'lower_rules', $el->type);
            push @a,  rule_hash($_, 'lower_rules', $el->tok) if $el->tok;
            @a;
        } reverse $parent->types_upward;

        # child rules.
        push @rules, rule_hash($parent->t, 'child_rules', $el->type);
        push @rules, rule_hash($parent->t, 'child_rules', $el->tok) if $el->tok;

        $set2 = Ferret::Lexer::RuleSet->new(@rules);

        # rules from self while inside a certain type of node.
        @rules = map {
            my   @a = rule_hash($el->type, "inside_$_");
            push @a,  rule_hash($el->tok,  "inside_$_") if $el->tok;
            @a;
        } reverse $parent->types_upward;

        $set3 = Ferret::Lexer::RuleSet->new(@rules);
    }

    return $set1->merge_in($set2)->merge_in($set3);
}

# checks if an element should be adopted.
sub F::Node::can_adopt {
    my ($parent_maybe, $child_maybe) = @_;

    # check that the parent allows this type of child.
    my $e = $parent_maybe->allows_child($child_maybe);

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
    my $set = $parent_maybe->rule_set(undef, $child_maybe);

    # there's no rule, so it allows everything.
    return $ok if !$set->{children_must_be};

    # it's in the list.
    return $ok if $set->list_contains(children_must_be => $child_maybe->t);

    # not allowed.
    return $set->err(child_not_allowed => $parent_maybe->desc);

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

    return $set->err(must_be_inside => $bad);
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

1
