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

FF::before_content('hello3.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my $scope = my $context = FF::get_context($f, 'main');
    FF::load_core('main');

    # Function event 'hello1' definition
    my $func_0 = FF::function_event_def($f, $scope, 'hello1', [  ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        $scope->set_property_ow($context, hello => str($f, "Hello"), 17.2);
        $scope->property_u('hello')->set_property(name => $scope->property_u('name1'), 18.3);
        $scope->property_u('say')->call_u([ add($scope, $scope->property_u('hello'), str($f, " "), $scope->property_u('hello')->property_u('name')) ], $scope, undef, 19.1);
        return $return;
    });
    # Function event 'hello2' definition
    my $func_1 = FF::function_event_def($f, $scope, 'hello2', [  ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        $scope->property_u('say')->call_u([ add($scope, str($f, "Hello "), $scope->property_u('name2')) ], $scope, undef, 23.2);
        return $return;
    });
    # Function event 'helloWorld' definition
    my $func_2 = FF::function_event_def($f, $scope, 'helloWorld', [ { name => 'name1', type => undef, optional => undef, more => undef }, { name => 'name2', type => undef, optional => undef, more => undef } ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        $func_0->inside_scope(hello1 => $scope, $scope, undef, undef, undef);
        $func_1->inside_scope(hello2 => $scope, $scope, undef, undef, undef);
        FF::need($scope, $arguments, 'name1', 11.2) or return;
        FF::need($scope, $arguments, 'name2', 11.4) or return;
        $scope->property_u('hello1')->call_u({  }, $scope, undef, 13.2);
        $scope->property_u('hello2')->call_u({  }, $scope, undef, 14.2);
        return $return;
    });
    $func_2->inside_scope(helloWorld => $scope, $scope, undef, undef, undef);
    $scope->property_u('helloWorld')->call_u({ name2 => str($f, "USA"), name1 => str($f, "World") }, $scope, undef, 1.1);
    $scope->property_u('helloWorld')->call_u({ name1 => str($f, "Earth"), name2 => str($f, "Humans") }, $scope, undef, 3.2);
    $scope->property_u('helloWorld')->call_u([ str($f, "Benjamin"), str($f, "George") ], $scope, undef, 8.2);
    $scope->set_property_ow($context, pi => add($scope, num($f, 3), num($f, 0.1), num($f, 0.04)), 28.2);
    $scope->property_u('say')->call_u([ add($scope, str($f, "Pi = "), $scope->property_u('pi')) ], $scope, undef, 29.2);
};

FF::after_content();