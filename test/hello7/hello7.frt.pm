use warnings;
use strict;
use utf8;
use 5.010;
use lib 'lib';
use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello7.frt.pm'}++;

use Ferret::Core::Operations qw(add);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    Ferret::space( $context, $_ ) for qw(Math::Rect Math::Point);

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
    $scope->set_property( center =>
          $scope->property('rect')->property('center')->call( [], $scope ) );
    $scope->property('say')->call(
        [
            add(
                $scope,
                Ferret::String->new( $f, value => "Center of rect: " ),
                $scope->property('center')->property('pretty')
                  ->call( [], $scope )
            )
        ],
        $scope
    );
    $scope->set_property(
        otherPt => $scope->property('Math::Point')->call(
            [
                Ferret::Number->new( $f, value => 9 ),
                Ferret::Number->new( $f, value => 2 )
            ],
            $scope
        )
    );
    $scope->set_property(
        midpoint => $scope->property('Math::Point')->property('midpoint')
          ->call( [ $scope->property('center'), $scope->property('otherPt') ],
            $scope )->property('pretty')->call( [], $scope )
    );
    $scope->property('say')->call(
        [
            add(
                $scope,
                Ferret::String->new( $f, value => "Midpoint: " ),
                $scope->property('midpoint')
            )
        ],
        $scope
    );
}
