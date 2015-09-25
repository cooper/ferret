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
    $opts{parent}       ||= $opts{parent_scope};

    # create a new object.
    my $scope = $class->SUPER::new($f,
        faketype => 'Scope',
        %opts
    );

    # create a special variable object.
    my $spec;
    if (not $spec = $scope->{special}) {
        my $p_spec = $opts{parent_scope}{special} if $opts{parent_scope};
        $spec = $scope->{special} = Ferret::Object->new($f,
            parent => $p_spec
        );
    }

    # set default special variables.
    $spec->set_property_weak(scope => $scope);

    # determine parent scope.
    $scope->{parent_scope} =
        $opts{parent_scope}     ||
        $scope->{parent_scope}  ||
        ($opts{is_core} ? undef : $f->main_context);

    return $scope;
}

1
