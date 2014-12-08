#!/usr/bin/perl

use warnings;
use strict;
use 5.010;
use lib 'lib';
use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello4.frt.pm'}++;

use Ferret::Core::Operations qw(add);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    Ferret::spaces( $context, qw() );

    # Function 'makePoint' definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, name => 'makePoint' );
        $func->add_argument( name => 'x' );
        $func->add_argument( name => 'y' );
        $func->add_argument( name => 'z', optional => 1 );
        $func->{code} = sub {
            my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
            do {
                return if not defined $arguments->{x};
                $scope->set_property( x => $arguments->{x} );
            };
            do {
                return if not defined $arguments->{y};
                $scope->set_property( y => $arguments->{y} );
            };
            $scope->set_property( z => $arguments->{z} );
            $scope->set_property(
                point => Ferret::Hash->new(
                    $f,
                    pairs => {
                        x => $scope->property('x'),
                        y => $scope->property('y')
                    }
                )
            );
            $return->set_property( point => $scope->property('point') );
            return $return;
        };
    }

    # Function 'makePoint'
    {
        $funcs[0]->{outer_scope} = $scope;
        $scope->set_property( makePoint => $funcs[0] );
    }
    $scope->set_property(
        pt => $scope->property('makePoint')->call(
            [
                Ferret::Number->new( $f, value => 5 ),
                Ferret::Number->new( $f, value => 3 )
            ],
            $scope
        )->property('point')
    );
    $scope->property('say')->call(
        [
            add(
                $scope,
                Ferret::String->new( $f, value => "Point(" ),
                $scope->property('pt')->property('x'),
                Ferret::String->new( $f, value => "," ),
                $scope->property('pt')->property('y'),
                Ferret::String->new( $f, value => ")" )
            )
        ],
        $scope
    );
    $scope->set_property(
        numbers => Ferret::List->new(
            $f,
            items => [
                Ferret::Number->new( $f, value => 1 ),
                Ferret::Number->new( $f, value => 2 ),
                Ferret::Number->new( $f, value => 3 ),
                Ferret::Number->new( $f, value => 4 ),
                add(
                    $scope,
                    Ferret::Number->new( $f, value => 4 ),
                    Ferret::Number->new( $f, value => 1 )
                )
            ]
        )
    );
    $scope->set_property( emptyArray => Ferret::List->new( $f, items => [] ) );
    $scope->set_property( emptyHash  => Ferret::Hash->new( $f, pairs => {} ) );
}
