# Copyright (c) 2015, Mitchell Cooper
package Ferret::Lexer::Scope;

use warnings;
use strict;
use 5.010;

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

1
