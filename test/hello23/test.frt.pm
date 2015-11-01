# === Document Model ===
#  Document './test/hello23/test.frt'
#      Instruction
#          Delete modifier
#              Lexical variable '$x'
#      Instruction
#          Bareword 'Second'
#      Include (Second)
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
$Ferret::tried_files{'test.frt.pm'}++;

use Ferret::Core::Operations qw();
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    do 'CORE.frt.pm' or die "Core error: $@" unless 'main' eq 'CORE';
    undef;

    Ferret::space( $context, $_ ) for qw(Second);
    $scope->delete_property('x');
    $scope->property_u('Second');
};

Ferret::runtime();
