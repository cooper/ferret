# Copyright (c) 2014, Mitchell Cooper
package Ferret::Core::Functions;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Conversion qw(perl_string);

sub _say {
    my ($self, $arguments, $from_scope, $scope, $return) = @_;
    say perl_string($arguments->{message});
    return $return;
}

sub _dump {
    my ($self, $arguments, $from_scope, $scope, $return) = @_;
    my $obj     = $arguments->{value};
    my @parents = map $_->{proto_class}{name}, @{ $obj->{isa} };
    my $type    = join(',', @parents);

    require Data::Dumper;
    Data::Dumper->import('Dumper');
    $Data::Dumper::Maxdepth = 1;
    $Data::Dumper::Terse = 1;

    print Dumper($obj), " = [ $type ]\n";
    return $return;
}

1
