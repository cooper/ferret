# Copyright (c) 2014, Mitchell Cooper
package Ferret::Core::Functions;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Conversion qw(
    perl_string ferret_string
    perl_boolean perl_description
);

sub _say {
    my ($self, $arguments, $call_scope, $scope, $return) = @_;
    say perl_string($arguments->{message});
    return $return;
}

sub _dump {
    my ($self, $arguments, $call_scope, $scope, $return) = @_;
    my $obj     = $arguments->{value};
    my @parents = map $_->{proto_class}{name}, $obj->parents;
    my $type    = join(',', @parents);

    require Data::Dumper;
    Data::Dumper->import('Dumper');
    $Data::Dumper::Maxdepth = 1;
    $Data::Dumper::Terse = 1;

    print Dumper($obj), " = [ $type ] $obj\n";
    return $return;
}

sub _inspect {
    my ($self, $arguments, $call_scope, $scope, $return) = @_;
    my $obj = $arguments->{value};

    my $str = perl_description($obj, perl_boolean($arguments->{ownOnly}));
    say $str unless $arguments->{quiet};

    $return->set_property(string => ferret_string($str));
    return $return;
}

1
