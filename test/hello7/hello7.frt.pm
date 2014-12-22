use warnings;
use strict;
use utf8;
use 5.010;
use lib 'lib';
use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello7.frt.pm'}++;

use Ferret::Core::Operations qw(add num str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    Ferret::space( $context, $_ ) for qw(Math::Rect Math Math::Point);
    $scope->set_property(
        rect => $scope->property('Math::Rect')->call(
            {
                x      => num( $f, 5 ),
                y      => num( $f, 4 ),
                width  => num( $f, 12 ),
                height => num( $f, 10 )
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
                str( $f, "Center of rect: " ),
                $scope->property('center')->property('pretty')
                  ->call( [], $scope )
            )
        ],
        $scope
    );
    $scope->set_property( otherPt => $scope->property('Math::Point')
          ->call( [ num( $f, 9 ), num( $f, 2 ) ], $scope ) );
    $scope->set_property( midpoint => $scope->property('center')
          ->create_set( $scope, $scope->property('otherPt') )
          ->property('midpoint')->call( [], $scope )->property('pretty')
          ->call( [], $scope ) );
    $scope->property('say')->call(
        [
            add(
                $scope, str( $f, "Midpoint: " ), $scope->property('midpoint')
            )
        ],
        $scope
    );
}
