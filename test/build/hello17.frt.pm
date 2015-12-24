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

FF::before_content('hello17.frt');

use Ferret::Core::Operations qw(num str);
my $result = do {
    my $scope = my $context = FF::get_context($f, 'main');
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def($f, $scope, undef, [  ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        $scope->property_u('say')->call_u([ str($f, "it works!") ], $scope, undef, 8.2);
        return $return;
    });
    FF::load_namespaces($context, qw(Timer));
    $scope->set_property_ow($context, obj => FF::create_object($f, {  }), 2.2);
    $scope->property_u('Timer')->property_u('init')->call_u([ $scope->property_u('obj') ], $scope, undef, 5.15)->call_u([ num($f, 5) ], $scope, undef, 5.3);
    FF::on($scope->property_u('obj')->property_u('once')->call_u({  }, $scope, undef, 7.4), 'expire', $self, $scope, $func_0->inside_scope((undef) => $scope, $scope, undef, undef, undef), {  });
};

FF::after_content();