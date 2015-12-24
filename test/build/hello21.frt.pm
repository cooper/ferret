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

FF::before_content('hello21.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my $scope = my $context = FF::get_context($f, 'main');
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def($f, $scope, undef, [  ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        $scope->property_u('say')->call_u([ add($scope, str($f, "("), $scope->property_u('i'), str($f, ") "), $scope->property_u('part')) ], $scope, undef, 5.2);
        return $return;
    });
    FF::load_namespaces($context, qw(Timer));
    $scope->set_property_ow($context, parts => str($f, "s p a m")->property_u('split')->call_u([ str($f, " ") ], $scope, undef, 1.5), 1.2);
    FF::iterate_pair($f, $scope, $scope->property_u('parts'), 'i', 'part', sub {
        my $scope = shift;
        FF::on($scope->property_u('Timer')->call_u([ $scope->property_u('i') ], $scope, undef, 4.15)->property_u('once')->call_u({  }, $scope, undef, 4.35), 'expire', $self, $scope, $func_0->inside_scope((undef) => $scope, $scope, undef, undef, undef), {  });
    });
    FF::iterate($f, $scope, FF::create_list($f, [ num($f, 1), num($f, 2), num($f, 3) ]), 'part', sub {
        my $scope = shift;
        $scope->property_u('say')->call_u([ $scope->property_u('part') ], $scope, undef, 10.2);
    });
};

FF::after_content();