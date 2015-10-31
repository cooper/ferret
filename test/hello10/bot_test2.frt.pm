# === Document Model ===
#  Document './test/hello10/bot_test2.frt'
#      Instruction
#          Assignment (lexical variable '$bot')
#              Call
#                  Bareword 'Bot2'
#                  Hash [3 items]
#                      Item 0
#                          Pair 'address'
#                              String 'k.notroll.net'
#                      Item 1
#                          Pair 'nick'
#                              String 'ferret'
#                      Item 2
#                          Pair 'user'
#                              String 'bot'
#      Instruction
#          Call
#              Bareword 'say'
#              Single value [1 items]
#                  Item 0
#                      Property 'address'
#                          Lexical variable '$bot'
#      Instruction
#          Call
#              Property 'connect'
#                  Lexical variable '$bot'
#              Structural list [0 items]
#      Include (Bot2)
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
$Ferret::tried_files{'bot_test2.frt.pm'}++;

use Ferret::Core::Operations qw(str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    undef;
    Ferret::space( $context, 'CORE' ) or die 'CORE error';

    Ferret::space( $context, $_ ) for qw(Bot2);
    $scope->set_property_ow(
        $context,
        bot => $scope->property_u('Bot2')->call_u(
            {
                address => str( $f, "k.notroll.net" ),
                nick    => str( $f, "ferret" ),
                user    => str( $f, "bot" )
            },
            $scope
        )
    );
    $scope->property_u('say')
      ->call_u( [ $scope->property_u('bot')->property_u('address') ], $scope );
    $scope->property_u('bot')->property_u('connect')->call_u( {}, $scope );
};

Ferret::runtime();
