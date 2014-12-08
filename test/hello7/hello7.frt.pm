#!/usr/bin/perl

use warnings;
use strict;
use 5.010;
use lib 'lib';
use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello7.frt.pm'}++;

use Ferret::Core::Operations qw();
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    Ferret::spaces( $context, qw(Math::Rect) );

    $scope->set_property(
        rect => $scope->property('Math::Rect')->call(
            {
                x      => Ferret::Number->new( $f, value => 5 ),
                y      => Ferret::Number->new( $f, value => 4 ),
                width  => Ferret::Number->new( $f, value => 12 ),
                height => Ferret::Number->new( $f, value => 10 )
            },
            $scope
        )
    );
    $scope->property('say')->call(
        [
            $scope->property('rect')->property('center')->call( [], $scope )
              ->property('pretty')->call( [], $scope )
        ],
        $scope
    );
}
