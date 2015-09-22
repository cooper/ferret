# === Document Model ===
#  Document './test/hello20/run.frt'
#      Instruction
#          Assignment
#              Lexical variable '$bot'
#              Call
#                  Bareword 'Bot'
#                  Hash [3 items]
#                      Item 0
#                          Pair 'addr'
#                              String 'k.notroll.net'
#                      Item 1
#                          Pair 'nick'
#                              String 'bottttie'
#                      Item 2
#                          Pair 'user'
#                              String 'ferret'
#      Instruction
#          Call
#              Property 'connect'
#                  Lexical variable '$bot'
#              Structural list [0 items]
#      Include (Bot)
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
$Ferret::tried_files{'run.frt.pm'}++;

use Ferret::Core::Operations qw(str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    Ferret::space( $context, $_ ) for qw(Bot);
    $scope->set_property_ow(
        bot => $scope->property('Bot')->call(
            {
                addr => str( $f, "k.notroll.net" ),
                nick => str( $f, "bottttie" ),
                user => str( $f, "ferret" )
            },
            $scope
        )
    );
    $scope->property('bot')->property('connect')->call( {}, $scope );
}

Ferret::runtime();
