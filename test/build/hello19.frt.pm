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

FF::before_content('hello19.frt');

use Ferret::Core::Operations qw(add str);
my $result = do {
    my $scope = my $context = FF::get_context($f, 'main');
    FF::load_core('main');

    
    $scope->set_property_ow($context, words => str($f, "how are you?")->property_u('split')->call_u([ str($f, " ") ], $scope, undef, 1.5), 1.2);
    FF::iterate($f, $scope, $scope->property_u('words'), 'word', sub {
        my $scope = shift;
        $scope->property_u('say')->call_u([ add($scope, str($f, "part: "), $scope->property_u('word')) ], $scope, undef, 4.2);
    });
};

FF::after_content();