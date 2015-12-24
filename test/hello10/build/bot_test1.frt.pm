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

FF::before_content('bot_test1.frt');

use Ferret::Core::Operations qw(str);
my $result = do {
    my $scope = my $context = FF::get_context($f, 'main');
    FF::load_core('main');

    
    FF::load_namespaces($context, qw(Bot1));
    $scope->set_property_ow($context, bot => $scope->property_u('Bot1')->call_u({ addr => str($f, "k.notroll.net"), nick => str($f, "ferret"), user => str($f, "bot") }, $scope, undef, 1.2), 1.1);
    $scope->property_u('bot')->property_u('connect')->call_u({  }, $scope, undef, 2.3);
};

FF::after_content();