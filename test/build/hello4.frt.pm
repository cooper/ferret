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

FF::before_content('hello4.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my $scope = my $context = FF::get_context($f, 'main');
    FF::load_core('main');

    # Function event 'makePoint' definition
    my $func_0 = FF::function_event_def($f, $scope, 'makePoint', [ { name => 'x', type => undef, optional => undef, more => undef }, { name => 'y', type => undef, optional => undef, more => undef }, { name => 'z', type => undef, optional => 1, more => undef } ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        FF::need($scope, $arguments, 'x', 2.2) or return;
        FF::need($scope, $arguments, 'y', 2.4) or return;
        FF::want($scope, $arguments, 'z', 3.2);
        $scope->set_property_ow($context, point => FF::create_object($f, { x => $scope->property_u('x'), y => $scope->property_u('y') }), 4.2);
        $return->set_property(point => $scope->property_u('point'), 8.2);
        return $return;
    });
    $func_0->inside_scope(makePoint => $scope, $scope, undef, undef, undef);
    $scope->set_property_ow($context, pt => $scope->property_u('makePoint')->call_u([ num($f, 5), num($f, 3) ], $scope, undef, 11.2)->property_u('point'), 11.1);
    $scope->property_u('say')->call_u([ add($scope, str($f, "Point("), $scope->property_u('pt')->property_u('x'), str($f, ", "), $scope->property_u('pt')->property_u('y'), str($f, ")")) ], $scope, undef, 12.1);
    $scope->set_property_ow($context, numbers => FF::create_list($f, [ num($f, 1), num($f, 2), num($f, 3), num($f, 4), add($scope, num($f, 4), num($f, 1)) ]), 14.1);
    $scope->set_property_ow($context, emptyArray => FF::create_list($f, [  ]), 16.2);
    $scope->set_property_ow($context, emptyHash => FF::create_hash($f, {  }), 17.2);
};

FF::after_content();