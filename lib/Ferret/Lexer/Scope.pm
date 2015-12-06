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

# remember the lines on which lexical var assignments/wantneeds occurred.
sub process_lex_declaration {
    my ($scope, $var_name, $create_pos) = @_;
    push @{ $scope->{lex_vars}{$var_name} ||= [] }, $create_pos;
}

# returns true if it's ok to reference a lexical var on this line.
sub is_lex_reference_ok {
    my ($scope, $var_name, $pos) = @_;

    # if we own vars by this name, check that at least one was defined
    # before it is referenced
    if (my $list = $scope->{lex_vars}{$var_name}) {
        my $earliest = min @$list;
        return 1 if $pos > $earliest;
    }

    # if we own no vars by this name, check upper scopes.
    else {
        my $parent_scope = $scope->parent_scope or return;
        return $parent_scope->is_lex_reference_ok($var_name, $pos);
    }

    # if we own the var, and the reference occurs before it's defined in
    # this scope, check if it was defined earlier in a parent scope somewhere.
    die "$var_name $pos";

    return 1;
}

1
