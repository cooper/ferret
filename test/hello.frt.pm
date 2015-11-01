# === Document Model ===
#  Document './test/hello.frt'
#      Instruction
#          Call
#              Bareword 'say'
#              Single value [1 items]
#                  Item 0
#                      String 'Hello World!'
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
$Ferret::tried_files{'hello.frt.pm'}++;

use Ferret::Core::Operations qw(str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    do 'CORE.frt.pm' or die "Core error: $@" unless 'main' eq 'CORE';
    undef;

    $scope->property_u('say')->call_u( [ str( $f, "Hello World!" ) ], $scope );
};

Ferret::runtime();
