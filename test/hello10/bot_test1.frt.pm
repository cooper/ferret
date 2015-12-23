# === Tokenization ===
#         VAR_LEX |                          "bot" | 1.06667
#       OP_ASSIGN |                                | 1.13333
#        BAREWORD |                         "Bot1" | 1.2
#      PAREN_CALL |                                | 1.26667
#      PROP_VALUE |                         "addr" | 1.33333
#          STRING |              ["k.notroll.net"] | 1.4
#        OP_COMMA |                                | 1.46667
#      PROP_VALUE |                         "nick" | 1.53333
#          STRING |                     ["ferret"] | 1.6
#        OP_COMMA |                                | 1.66667
#      PROP_VALUE |                         "user" | 1.73333
#          STRING |                        ["bot"] | 1.8
#         PAREN_E |                                | 1.86667
#         OP_SEMI |                              1 | 1.93333
#         VAR_LEX |                          "bot" | 2.16667
#        PROPERTY |                      "connect" | 2.33333
#      PAREN_CALL |                                | 2.5
#         PAREN_E |                                | 2.66667
#         OP_SEMI |                              1 | 2.83333
# === Document Model ===
#  Document './test/hello10/bot_test1.frt'
#      Instruction
#          Assignment (lexical variable '$bot')
#              Call
#                  Bareword 'Bot1'
#                  Named argument list [3 items]
#                      Item 0
#                          Pair 'addr'
#                              String 'k.notroll.net'
#                      Item 1
#                          Pair 'nick'
#                              String 'ferret'
#                      Item 2
#                          Pair 'user'
#                              String 'bot'
#      Instruction
#          Call
#              Property 'connect'
#                  Lexical variable '$bot'
#              Argument list [0 items]
#      Include (Bot1)
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

FF::before_content('bot_test1.frt');

use Ferret::Core::Operations qw(str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    FF::load_namespaces( $context, qw(Bot1) );
    $scope->set_property_ow(
        $context,
        bot => $scope->property_u('Bot1')->call_u(
            {
                addr => str( $f, "k.notroll.net" ),
                nick => str( $f, "ferret" ),
                user => str( $f, "bot" )
            },
            $scope, undef, 1.26667
        ),
        1.13333
    );
    $scope->property_u('bot')->property_u('connect')
      ->call_u( {}, $scope, undef, 2.5 );
};

FF::after_content();
