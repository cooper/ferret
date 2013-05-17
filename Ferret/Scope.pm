# Copyright (c) 2013, Mitchell Cooper
package Ferret::Scope;

use warnings;
use strict;
use utf8;

use parent 'Ferret::Object';

# creates a new scope.
sub new {
    my ($class, $f, %opts) = @_;
    
    # create a new object.
    my $scope = $class->SUPER::new($f, %opts);
    
    # determine the containing scope.
    $scope->{parent_scope} = $opts{parent_scope} || $f->context;

    # add default properties.
    $scope->_apply_default_properties($f);
    
    return $scope;
}

# add the properties that all Objects start out with.
sub _apply_default_properties {
    my ($scope, $f) = @_;
    
    # create the _special object.
    #my $special = Ferret::Object->new;

    
}

1
