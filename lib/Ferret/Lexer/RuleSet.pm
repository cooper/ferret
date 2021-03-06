# Copyright (c) 2015, Mitchell Cooper
package Ferret::Lexer::RuleSet;

use warnings;
use strict;
use 5.010;

sub new {
    my (undef, %opts) = @_;
    return bless \%opts;
}

# merge the rules from another set.
# the second set's rules with overwrite the first's.
sub merge_in {
    my ($set1, $set2) = @_;
    return $set1 if !$set2;
    return bless { %$set1, %$set2 };
}

sub keys_in_order {
    return @{ shift->{keys_in_order} };
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
         ($list_str, $set->{last_error}, $set->{last_num}) = @$list_str;
    }
    return split /\s+/, $list_str;
}

# returns code reference or undef if there isn't one.
sub rule_code {
    my ($set, $name) = @_;
    my $code = $set->{$name} or return;
    if (ref $code eq 'ARRAY') {
        ($code, $set->{last_error}, $set->{last_num}) = @$code;
    }
    return if ref $code ne 'CODE';
    return $code;
}

sub rule_value {
    my ($set, $name) = @_;
    my $value = $set->{$name} or return;
    if (ref $value eq 'ARRAY') {
        ($value, $set->{last_error}, $set->{last_num}) = @$value;
    }
    return $value;
}

sub err {
    my ($set, @err) = @_;
    my $err_str = Ferret::Lexer::RuleFunctions::err(@err);
    return [ $err_str, $set->{last_error}, $set->{last_num} ];
}

1
