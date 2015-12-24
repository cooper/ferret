use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    do '/etc/ferret.conf' or die "config error: ".($@ || $!);
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ($true, $false, $undefined) = FF::get_constant_objects($f);

FF::before_content('hello7.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my $scope = my $context = FF::get_context($f, 'main');
    FF::load_core('main');

    
    FF::load_namespaces($context, qw(Math Math::Point Math::Rect));
    $scope->set_property_ow($context, rect => $scope->property_u('Math::Rect')->call_u({ x => num($f, 5), y => num($f, 4), width => num($f, 12), height => num($f, 10) }, $scope, undef, 1.2), 1.06667);
    $scope->set_property_ow($context, center => $scope->property_u('rect')->property_u('center'), 3.2);
    $scope->property_u('say')->call_u([ add($scope, str($f, "Center of rect: "), $scope->property_u('center')) ], $scope, undef, 4.2);
    $scope->property_u('say')->call_u([ add($scope, str($f, "Center distance from origin: "), $scope->property_u('center')->property_u('distanceFromOrigin')) ], $scope, undef, 5.2);
    $scope->set_property_ow($context, otherPt => $scope->property_u('Math::Point')->call_u([ num($f, 9), num($f, 2) ], $scope, undef, 7.3), 7.1);
    $scope->set_property_ow($context, midpoint => FF::create_set($scope, $scope->property_u('center'), $scope->property_u('otherPt'))->property_u('midpoint')->call_u({  }, $scope, undef, 8.45)->property_u('pretty')->call_u({  }, $scope, undef, 8.6), 8.1);
    $scope->property_u('say')->call_u([ add($scope, str($f, "Midpoint: "), $scope->property_u('midpoint')) ], $scope, undef, 9.2);
    $scope->property_u('say')->call_u([ add($scope, str($f, "Square root of four: "), $scope->property_u('Math')->property_u('sqrt')->call_u([ num($f, 4) ], $scope, undef, 11.35)) ], $scope, undef, 11.1);
};

FF::after_content();