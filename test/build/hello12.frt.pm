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

FF::before_content('hello12.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my $scope = my $context = FF::get_context($f, 'main');
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def($f, $scope, undef, [ { name => 'data', type => undef, optional => undef, more => undef } ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        FF::need($scope, $arguments, 'data', 5.2) or return;
        $scope->property_u('say')->call_u([ add($scope, str($f, "recv: "), $scope->property_u('data')) ], $scope, undef, 6.2);
        return $return;
    });
    # Anonymous function definition
    my $func_1 = FF::function_def($f, $scope, undef, [ { name => 'data', type => undef, optional => undef, more => undef } ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        FF::need($scope, $arguments, 'data', 10.2) or return;
        $scope->property_u('say')->call_u([ add($scope, str($f, "send: "), $scope->property_u('data')) ], $scope, undef, 11.2);
        return $return;
    });
    # Anonymous function definition
    my $func_2 = FF::function_def($f, $scope, undef, [  ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        $scope->property_u('sock')->property_u('println')->call_u([ str($f, "NICK k") ], $scope, undef, 15.3);
        $scope->property_u('sock')->property_u('println')->call_u([ add($scope, str($f, "USER k "), str($f, "*"), str($f, " "), str($f, "*"), str($f, " :k")) ], $scope, undef, 16.3);
        return $return;
    });
    # Anonymous function definition
    my $func_3 = FF::function_def($f, $scope, undef, [  ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        $scope->property_u('sock')->property_u('println')->call_u([ str($f, "JOIN #k") ], $scope, undef, 22.3);
        return $return;
    });
    FF::load_namespaces($context, qw(Socket Socket::TCP Timer));
    $scope->set_property_ow($context, sock => $scope->property_u('Socket::TCP')->call_u({ address => str($f, "k.notroll.net"), port => num($f, 6667), readMode => FF::get_symbol($f, 'line') }, $scope, undef, 1.3), 1.1);
    $scope->property_u('inspect')->call_u([ $scope->property_u('sock') ], $scope, undef, 2.2);
    FF::on($scope->property_u('sock'), 'gotLine', $self, $scope, $func_0->inside_scope((undef) => $scope, $scope, undef, undef, undef), {  });
    FF::on($scope->property_u('sock'), 'println', $self, $scope, $func_1->inside_scope((undef) => $scope, $scope, undef, undef, undef), {  });
    FF::on($scope->property_u('sock'), 'connected', $self, $scope, $func_2->inside_scope((undef) => $scope, $scope, undef, undef, undef), {  });
    $scope->property_u('sock')->property_u('connect')->call_u({  }, $scope, undef, 19.3);
    FF::on($scope->property_u('Timer')->call_u([ num($f, 5) ], $scope, undef, 21.15)->property_u('once')->call_u({  }, $scope, undef, 21.35), 'expire', $self, $scope, $func_3->inside_scope((undef) => $scope, $scope, undef, undef, undef), {  });
};

FF::after_content();