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
    my $list_str   = $set->{$list} or return;
    my %list_items = map { $_ => 1 } split /\s+/, $list_str;
    return $list_items{$what};
}

package Ferret::Lexer::Rules;

use warnings;
use strict;
use 5.010;

use Scalar::Util 'blessed';

our %element_rules = (
    WantNeed => {

        # ONLY allows these types of children.
        allow_children => 'LexicalVariable OP_VALUE OP_COMMA Bareword',

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

);

sub rule_hash {
    my @levels = @_;
    my $h = \%element_rules;
    for my $level (@levels) {
        return unless $h->{$level};
        $h = $h->{$level};
    }
    return %$h;
}

# $parent_t = element or type to get rules for inside.
sub F::Element::rule_set {
    my ($el, $parent_t) = @_;
    $parent_t ||= $el->parent;
    $parent_t   = $parent_t->t if blessed $parent_t;

    # local rules.
    my $set1 = Ferret::Lexer::RuleSet->new(
        rule_hash($el->t)
    );

    # rules from parent.
    my $set2 = Ferret::Lexer::RuleSet->new(
        rule_hash($parent_t, 'child_rules', $el->t)
    ) if $parent_t;

    return $set1->merge_in($set2);
}

# checks the following:
#
#   1. parent must accept child's type.
#   2. child must accept parent's type.
#   3. child must allow previous element's type.
#
sub F::Element::can_adopt {
    my ($parent_maybe, $child_maybe) = @_;

    # check that the parent allows this type of child.
    return unless $parent_maybe->allows_child($child_maybe);

    # check that the child allows this type of parent.
    return unless $child_maybe->allows_parent($parent_maybe);

    # check that the child allows the previous element type.
    return unless $child_maybe->allows_previous(
        $parent_maybe->last_child,
        $parent_maybe
    );

    return 1;
}

sub F::Element::allows_child {
    my ($parent_maybe, $child_maybe) = @_;
    my $set = $parent_maybe->rule_set;
    return 1 if !$set->{allow_children}; # allows everything.
    return $set->list_contains(allow_children => $child_maybe->t);
}

sub F::Element::allows_parent {
    my ($child_maybe, $parent_maybe) = @_;
    my $set = $child_maybe->rule_set;
    return 1 if !$set->{allow_parents}; # allows everything.
    return $set->list_contains(allow_parents => $parent_maybe->t);
}

sub F::Element::allows_previous {
    my ($child_maybe, $previous_maybe, $parent_maybe) = @_;
    my $set = $child_maybe->rule_set($parent_maybe);

    # allows everything.
    return 1 if !$set->{must_come_after}; # allow everything.

    # allows none, and there's none.
    return 1 if !$previous_maybe && $set->list_contains(
        must_come_after => 'NONE'
    );

    return $set->list_contains(must_come_after => $previous_maybe->t);
}

1
