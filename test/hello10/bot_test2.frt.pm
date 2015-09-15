# --- DOM ---
#  Document './test/hello10/bot_test2.frt'
#      Instruction
#          Number '1'
#      Include
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    my $libs = do '/etc/ferret.conf';
    ref $libs eq 'ARRAY' or die "config error";
    unshift @INC, @$libs;
}

use Ferret;

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'bot_test2.frt.pm'}++;

use Ferret::Core::Operations qw(num);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    num( $f, 1 );
}

Ferret::runtime();
