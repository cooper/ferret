# === Tokenization ===
#         VAR_LEX | "bot"
#       OP_ASSIGN | 
#        BAREWORD | "Bot2"
#      PAREN_CALL | 
#      PROP_VALUE | "address"
#          STRING | ["k.notroll.net"]
#        OP_COMMA | 
#      PROP_VALUE | "nick"
#          STRING | ["ferret"]
#        OP_COMMA | 
#      PROP_VALUE | "user"
#          STRING | ["bot"]
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#         VAR_LEX | "bot"
#        PROPERTY | "address"
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "bot"
#        PROPERTY | "connect"
#      PAREN_CALL | 
#         PAREN_E | 
#         OP_SEMI | 
# === Document Model ===
#  Document './test/hello10/bot_test2.frt'
#      Instruction
#          Assignment (lexical variable '$bot')
#              Call
#                  Bareword 'Bot2'
#                  Named argument list [3 items]
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
#              Argument list [1 items]
#                  Item 0
#                      Property 'address'
#                          Lexical variable '$bot'
#      Instruction
#          Call
#              Property 'connect'
#                  Lexical variable '$bot'
#              Argument list [0 items]
#      Include (Bot2)
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

FF::before_content('bot_test2.frt');

use Ferret::Core::Operations qw(str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    FF::load_namespaces( $context, qw(Bot2) );
    $scope->set_property_ow(
        $context,
        bot => $scope->property_u('Bot2')->call_u(
            {
                address => str( $f, "k.notroll.net" ),
                nick    => str( $f, "ferret" ),
                user    => str( $f, "bot" )
            },
            $scope, undef, 1.28571
        ),
        1.14286
    );
    $scope->property_u('say')
      ->call_u( [ $scope->property_u('bot')->property_u('address') ],
        $scope, undef, 2.33333 );
    $scope->property_u('bot')->property_u('connect')
      ->call_u( {}, $scope, undef, 3.6 );
};

FF::after_content();
