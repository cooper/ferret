# === Tokenization ===
#         VAR_LEX |                          "bot" | 1.05
#       OP_ASSIGN |                                | 1.1
#        BAREWORD |                         "Bot2" | 1.15
#      PAREN_CALL |                                | 1.2
#      PROP_VALUE |                      "address" | 1.25
#          STRING |              ["k.notroll.net"] | 1.3
#        OP_COMMA |                                | 1.35
#      PROP_VALUE |                         "nick" | 1.4
#          STRING |                     ["ferret"] | 1.45
#        OP_COMMA |                                | 1.5
#      PROP_VALUE |                         "user" | 1.55
#          STRING |                        ["bot"] | 1.6
#         PAREN_E |                                | 1.65
#         OP_SEMI |                              1 | 1.7
#        BAREWORD |                          "say" | 2.1
#      PAREN_CALL |                                | 2.2
#         VAR_LEX |                          "bot" | 2.3
#        PROPERTY |                      "address" | 2.4
#         PAREN_E |                                | 2.5
#         OP_SEMI |                              1 | 2.6
#         VAR_LEX |                          "bot" | 3.1
#        PROPERTY |                      "connect" | 3.2
#      PAREN_CALL |                                | 3.3
#         PAREN_E |                                | 3.4
#         OP_SEMI |                              1 | 3.5
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
            $scope, undef, 1.2
        ),
        1.1
    );
    $scope->property_u('say')
      ->call_u( [ $scope->property_u('bot')->property_u('address') ],
        $scope, undef, 2.2 );
    $scope->property_u('bot')->property_u('connect')
      ->call_u( {}, $scope, undef, 3.3 );
};

FF::after_content();
