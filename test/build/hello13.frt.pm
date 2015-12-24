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

FF::before_content('hello13.frt');

use Ferret::Core::Operations qw(num str);
my $result = do {
    my $scope = my $context = FF::get_context($f, 'main');
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def($f, $scope, undef, [  ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        $scope->property_u('say')->call_u([ str($f, "five seconds up") ], $scope, undef, 4.2);
        return $return;
    });
    # Anonymous function definition
    my $func_1 = FF::function_def($f, $scope, undef, [  ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        $scope->property_u('say')->call_u([ str($f, "this shouldn't be said") ], $scope, undef, 9.2);
        return $return;
    });
    FF::load_namespaces($context, qw(Timer));
    $scope->property_u('say')->call_u([ str($f, "hello") ], $scope, undef, 1.2);
    FF::on($scope->property_u('Timer')->call_u([ num($f, 5) ], $scope, undef, 3.15)->property_u('once')->call_u({  }, $scope, undef, 3.35), 'expire', $self, $scope, $func_0->inside_scope((undef) => $scope, $scope, undef, undef, undef), {  });
    $scope->set_property_ow($context, t2 => $scope->property_u('Timer')->call_u([ num($f, 2) ], $scope, undef, 7.4), 7.2);
    FF::on($scope->property_u('t2')->property_u('once')->call_u({  }, $scope, undef, 8.4), 'expire', $self, $scope, $func_1->inside_scope((undef) => $scope, $scope, undef, undef, undef), {  });
    $scope->property_u('t2')->property_u('cancel')->call_u({  }, $scope, undef, 12.3);
};

FF::after_content();