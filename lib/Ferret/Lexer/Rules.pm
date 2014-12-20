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
    return split /\s+/, $list_str;
}

package Ferret::Lexer::Rules;

use warnings;
use strict;
use 5.010;

use Scalar::Util 'blessed';

my $ok;

our %element_rules = (

    WantNeed => {

        parent_must_be      => 'Instruction',
        must_be_inside_one  => 'Function Method',
        children_must_be    => 'LexicalVariable OP_VALUE OP_COMMA Bareword',

        child_rules => {

            # lexical variables can come first OR come after a comma.
            #
            #   need $x;
            #        ^
            #
            #   need $x, $y;
            #            ^
            #
            LexicalVariable => {
                must_come_after => 'NONE OP_COMMA'
            },

            # colons can ONLY come after a lexical variable.
            #
            #   e.g. need $x: Num;
            #               ^
            #
            OP_VALUE => {
                must_come_after => 'LexicalVariable'
            },

            # comma MUST come after a bareword or a lexical variable.
            #
            #   e.g. need $x, $y;
            #               ^
            #
            #   e.g. need $x: Num, $y: Num;
            #                    ^
            #
            OP_COMMA => {
                must_come_after => 'LexicalVariable Bareword'
            },

            # bareword MUST come after a colon.
            #
            #   e.g. need $x: Num;
            #                 ^
            #
            Bareword => {
                must_come_after => 'OP_VALUE'
            }
        }
    },

    Token => {
        parent_must_be => 'WantNeed'
    }

);

# Unexpected something <...>
our %error_reasons = (
    child_not_allowed       => 'inside %s',
    previous_not_allowed    => 'after %s',
    expected_before         => 'without previous element at same level',
    must_be_inside          => 'outside of a containing %s node'
);

sub err { sprintf $error_reasons{+shift}, @_ }

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
#   optional $parent_t = element or type to get rules for inside.
#   $parent_t will fall back to the element's parent if it has one already.
#
sub F::Element::rule_set {
    my ($el, $parent_t) = @_;
    $parent_t ||= $el->parent;
    $parent_t   = $parent_t->t if blessed $parent_t;

    # local rules.
    my $set1 = Ferret::Lexer::RuleSet->new(
        rule_hash($el->type),
        rule_hash($el->tok)
    );

    # rules from parent.
    my $set2 = Ferret::Lexer::RuleSet->new(
        rule_hash($parent_t, 'child_rules', $el->type),
        rule_hash($parent_t, 'child_rules', $el->tok)
    ) if $parent_t;

    return $set1->merge_in($set2);
}

# checks if an element should be adopted.
sub F::Element::can_adopt {
    my ($parent_maybe, $child_maybe) = @_;

    # check that the parent allows this type of child.
    my $e = $parent_maybe->allows_child($child_maybe);

    # check that the child allows this type of parent.
    $e ||= $child_maybe->allows_parent($parent_maybe);

    # check that the upper hierarchy is satisfactory.
    $e ||= $child_maybe->allows_upper_nodes($parent_maybe);

    # check that the child allows the previous element type.
    $e ||= $child_maybe->allows_previous(
        $parent_maybe->last_child,
        $parent_maybe
    );

    return $e || $ok;
}

# checks if a child can be in a parent.
sub F::Element::allows_child {
    my ($parent_maybe, $child_maybe) = @_;
    my $set = $parent_maybe->rule_set;

    # there's no rule, so it allows everything.
    return $ok if !$set->{children_must_be};

    # it's in the list.
    return $ok if $set->list_contains(children_must_be => $child_maybe->t);

    # not allowed.
    return err(child_not_allowed => $parent_maybe->desc);

}

# checks if a parent can provide for a child.
sub F::Element::allows_parent {
    my ($child_maybe, $parent_maybe) = @_;
    my $set = $child_maybe->rule_set;

    # there's no rule, so it allows everything.
    return $ok if !$set->{parent_must_be};

    # it's in the list.
    return $ok if $set->list_contains(parent_must_be => $parent_maybe->t);

    # not allowed.
    return err(child_not_allowed => $parent_maybe->desc);

}

# check if somewhere in an upper level is a certain node type.
sub F::Element::allows_upper_nodes {
    my ($child_maybe, $parent_maybe) = @_;
    my $set = $child_maybe->rule_set;

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

    return err(must_be_inside => $bad);
}

# checks if the previous element at the same level is allowed.
sub F::Element::allows_previous {
    my ($child_maybe, $previous_maybe, $parent_maybe) = @_;
    my $set = $child_maybe->rule_set($parent_maybe);

    # there's no rule, so it allows everything.
    return $ok if !$set->{must_come_after}; # allow everything.

    # allows none, and there's none.
    return $ok if !$previous_maybe &&
        $set->list_contains(must_come_after => 'NONE');

    # require something, but there's nothing.
    return err(expected_before => $child_maybe->desc) if !$previous_maybe;

    # this type is in the list.
    return $ok if $set->list_contains(must_come_after => $previous_maybe->t);

    # this type doesn't work.
    return err(previous_not_allowed => $previous_maybe->desc);

}

1
