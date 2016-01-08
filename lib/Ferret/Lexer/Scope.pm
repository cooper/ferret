# Copyright (c) 2015, Mitchell Cooper
package Ferret::Lexer::Scope;

use warnings;
use strict;
use 5.010;

use List::Util 'min';

sub new {
    my ($class, %opts) = @_;
    return bless \%opts, $class;
}

sub owner { shift->{owner} }

# the owner element of the parent scope.
sub parent_owner {
    my $owner_el = shift->owner;
    return $owner_el->first_parent('@ScopeOwner');
}

# the object of the parent scope.
sub parent_scope {
    my $parent_el = shift->parent_owner;
    return $parent_el->scope if $parent_el;
    return;
}

# remember the positions at which lexical var assignments/wantneeds occurred.
sub process_lex_declaration {
    my ($scope, $var_name, $create_pos) = @_;
    push @{ $scope->{lex_vars}{$var_name} ||= [] }, $create_pos;
}

# returns the position of the earliest declaration in this scope.
sub earliest_lex_declaration {
    my ($scope, $var_name) = @_;
    if (my $list = $scope->{lex_vars}{$var_name}) {
        return min @$list;
    }
    return;
}

# returns the position of where a lex declaration occurred.
# it might be in this scope or another parent scope.
# this is similar to ->earliest_lex_declaration, except it checks parent scopes.
sub where_lex_declared {
    my ($scope, $var_name) = @_;

    # if we own vars by this name, check that at least one was defined
    # before it is referenced.
    if (defined(my $earliest = $scope->earliest_lex_declaration($var_name))) {
        return $earliest;
    }

    my $parent_scope = $scope->parent_scope or return;
    return $parent_scope->where_lex_declared($var_name);
}

# returns true if it's ok to reference a lexical var at this position.
sub is_lex_reference_ok {
    my ($scope, $var_name, $pos) = @_;

    # if we own vars by this name, check that at least one was defined
    # before it is referenced.
    if (defined(my $earliest = $scope->earliest_lex_declaration($var_name))) {
        return 1 if $pos > $earliest;
    }

    # if we own no vars by this name, check upper scopes.
    #
    # OR if we own the var, and the reference occurs before it's defined in
    # this scope, check if it was defined earlier in a parent scope somewhere.
    #
    my $parent_scope = $scope->parent_scope or return;
    return $parent_scope->is_lex_reference_ok($var_name, $pos);

    return 1;
}

1
