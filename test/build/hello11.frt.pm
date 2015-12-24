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

FF::before_content('hello11.frt');

use Ferret::Core::Operations qw(add bool num str);
my $result = do {
    my $scope = my $context = FF::get_context($f, 'main');
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def($f, $scope, undef, [ { name => 'twice', type => undef, optional => undef, more => undef }, { name => 'message', type => undef, optional => undef, more => undef } ], sub {
        my ($_self, $arguments, $call_scope, $scope, $return) = @_;
        my $self = $_self || $self;
        FF::need($scope, $arguments, 'twice', 16.2) or return;
        FF::need($scope, $arguments, 'message', 16.4) or return;
        if (bool($scope->property_u('twice'))) {
            my $scope = Ferret::Scope->new($f, parent => $scope);
        
            $scope->property_u('say')->call_u([ add($scope, $scope->property_u('message'), str($f, " again")) ], $scope, undef, 18.2);
        }
        $return->set_property(didTwice => $scope->property_u('twice'), 19.2);
        return $return;
    });
    FF::load_namespaces($context, qw(Math Math::Point));
    $scope->set_property_ow($context, point => $scope->property_u('Math::Point')->call_u([ num($f, 0), num($f, 0) ], $scope, undef, 1.3), 1.1);
    if (bool($scope->property_u('point'))) {
        my $scope = Ferret::Scope->new($f, parent => $scope);
    
        $scope->property_u('say')->call_u([ str($f, "The point exists!") ], $scope, undef, 4.2);
        $scope->property_u('inspect')->call_u([ $scope->property_u('point') ], $scope, undef, 5.2);
    }
    # Inside
    FF::inside($f, $scope, $scope->property_u('point'), sub {
        my $scope = shift;
        $scope->set_property_ow($context, x => num($f, 5), 9.2);
        $scope->set_property_ow($context, y => num($f, 10), 10.2);
    });
    $scope->property_u('say')->call_u([ add($scope, str($f, "Point: "), $scope->property_u('point')) ], $scope, undef, 13.2);
    FF::on($scope, 'say', $self, $scope, $func_0->inside_scope((undef) => $scope, $scope, undef, undef, undef), {  });
    $scope->set_property_ow($context, r => $scope->property_u('say')->call_u({ message => str($f, "It was said"), twice => $true }, $scope, undef, 22.2), 22.1);
    if (bool($scope->property_u('r')->property_u('didTwice'))) {
        my $scope = Ferret::Scope->new($f, parent => $scope);
    
        $scope->property_u('say')->call_u([ str($f, "Did the first one twice!") ], $scope, undef, 25.2);
    }
    $scope->property_u('say')->call_u([ str($f, "this should ignore the second parameter"), $true ], $scope, undef, 27.2);
};

FF::after_content();