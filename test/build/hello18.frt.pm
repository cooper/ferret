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

FF::before_content('hello18.frt');

use Ferret::Core::Operations qw(add str);
my $result = do {
    my $scope = my $context = FF::get_context($f, 'main');
    FF::load_core('main');

    
    $scope->set_property_ow($context, list => FF::create_list($f, [ str($f, "hi") ]), 1.2);
    $scope->property_u('list')->property_u('push')->call_u([ str($f, "there") ], $scope, undef, 2.3);
    $scope->property_u('list')->set_index_value([ num($f, 4) ], str($f, "yeah"), $scope);
    $scope->property_u('say')->call_u([ add($scope, str($f, "Length: "), $scope->property_u('list')->property_u('length')) ], $scope, undef, 5.2);
    FF::iterate($f, $scope, $scope->property_u('list'), 'item', sub {
        my $scope = shift;
        $scope->property_u('say')->call_u([ add($scope, str($f, "item: "), $scope->property_u('item')) ], $scope, undef, 8.2);
    });
    $scope->set_property_ow($context, hash => FF::create_hash($f, { hi => str($f, "there") }), 11.2);
    $scope->property_u('hash')->set_index_value([ str($f, "whats") ], str($f, "up"), $scope);
    $scope->property_u('hash')->set_index_value([ str($f, "thank") ], str($f, "you"), $scope);
    $scope->property_u('say')->call_u([ add($scope, str($f, "whats "), $scope->property_u('hash')->get_index_value([ str($f, "whats") ], $scope)) ], $scope, undef, 15.1);
    FF::iterate_pair($f, $scope, $scope->property_u('hash'), 'key', 'val', sub {
        my $scope = shift;
        $scope->property_u('say')->call_u([ add($scope, str($f, "pair: key="), $scope->property_u('key'), str($f, " value="), $scope->property_u('val')) ], $scope, undef, 18.2);
    });
};

FF::after_content();