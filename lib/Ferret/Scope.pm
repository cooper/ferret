# Copyright (c) 2013, Mitchell Cooper
package Ferret::Scope;

use warnings;
use strict;
use utf8;

use parent 'Ferret::Object';

# creates a new scope.
sub new {
    my ($class, $f, %opts) = @_;
    $opts{parent_scope} ||= $opts{parent};

    # create a new object.
    my $scope = $class->SUPER::new($f, %opts);

    # create a special variable object.
    my $spec;
    if (not $spec = $scope->{special}) {
        $spec = $scope->{special} = Ferret::Object->new;
        $scope->set_property(_special_ => $spec);
    }

    # set default special variables.
    $spec->set_property_weak(scope => $scope);

    # determine parent scope.
    $scope->{parent_scope} =
        $opts{parent_scope}     ||
        $scope->{parent_scope}  ||
        $opts{is_core} ? undef : $f->main_context;

    #$scope->{special} = a ferret object for * variables

    return $scope;
}

1
