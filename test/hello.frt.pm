#!/usr/bin/perl

use warnings;
use strict;
use 5.010;
use lib 'lib';
use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello.frt.pm'}++;

use Ferret::Core::Operations qw();
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    Ferret::spaces( $context, qw() );

    $scope->property('say')
      ->call( [ Ferret::String->new( $f, value => "Hello World!" ) ], $scope );
}
