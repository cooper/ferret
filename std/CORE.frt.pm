# === Document Model ===
#  Document './std/CORE.frt'
#      Package 'CORE'
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die 'config error';
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'CORE.frt.pm'}++;

use Ferret::Core::Operations qw();
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('CORE');
    undef;
    Ferret::space( $context, 'CORE' ) or die 'CORE error';

};

Ferret::runtime();
