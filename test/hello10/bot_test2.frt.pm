# === Tokenization ===
#         VAR_LEX |                          "bot" | 1.06667
#       OP_ASSIGN |                                | 1.13333
#        BAREWORD |                         "Bot2" | 1.2
#      PAREN_CALL |                                | 1.26667
#      PROP_VALUE |                      "address" | 1.33333
#          STRING |              ["k.notroll.net"] | 1.4
#        OP_COMMA |                                | 1.46667
#      PROP_VALUE |                         "nick" | 1.53333
#          STRING |                     ["ferret"] | 1.6
#        OP_COMMA |                                | 1.66667
#      PROP_VALUE |                         "user" | 1.73333
#          STRING |                        ["bot"] | 1.8
#         PAREN_E |                                | 1.86667
#         OP_SEMI |                                | 1.93333
#        BAREWORD |                          "say" | 2.14286
#      PAREN_CALL |                                | 2.28571
#         VAR_LEX |                          "bot" | 2.42857
#        PROPERTY |                      "address" | 2.57143
#         PAREN_E |                                | 2.71429
#         OP_SEMI |                                | 2.85714
#         VAR_LEX |                          "bot" | 3.16667
#        PROPERTY |                      "connect" | 3.33333
#      PAREN_CALL |                                | 3.5
#         PAREN_E |                                | 3.66667
#         OP_SEMI |                                | 3.83333
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
            $scope, undef, 1.26667
        ),
        1.13333
    );
    $scope->property_u('say')
      ->call_u( [ $scope->property_u('bot')->property_u('address') ],
        $scope, undef, 2.28571 );
    $scope->property_u('bot')->property_u('connect')
      ->call_u( {}, $scope, undef, 3.5 );
};

FF::after_content();
