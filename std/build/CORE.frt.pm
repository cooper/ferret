# === Document Model ===
#  Document './std/CORE.frt'
#      Package 'CORE'
#      Instruction
#          Load
#              Bareword 'Signal'
#      Include (Signal)
use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('CORE.frt');

use Ferret::Core::Operations qw();
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'CORE' );
    FF::load_core('CORE');

    FF::load_namespaces( $context, qw(Signal) );
};

FF::after_content();
