# Copyright (c) 2015, Mitchell Cooper
package Ferret::Scope;

use warnings;
use strict;
use utf8;

use parent 'Ferret::Object';
use Scalar::Util 'weaken';
use List::Util 'first';

# creates a new scope.
sub new {
    my ($class, $f, %opts) = @_;


    # create a new object.
    my $scope = $class->SUPER::new($f,
        faketype => 'Scope',
        scope_id => $f->{_scope_cid}++,
        %opts
    );

    # create a special variable object.
    my $spec = $scope->{special} = Ferret::Object->new($f,
        parent     => $opts{parent} ? $opts{parent}{special} : $f->{special},
        is_special => 1
    );

    # set default special variables.
    $spec->set_property_weak(scope => $scope);

    return $scope;
}

sub closest_context {
    my $scope = shift;
    return first { $_->isa('Ferret::Context') } $scope, $scope->all_ancestors;
}

1
