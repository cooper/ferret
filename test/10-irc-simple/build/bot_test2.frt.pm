# === Document Model ===
#  Document './test/10-irc-simple/bot_test2.frt'
#      Instruction
#          Assignment
#              Lexical variable '$bot'
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
#              Argument list [1 item]
#                  Item 0
#                      Property 'address'
#                          Lexical variable '$bot'
#      Instruction
#          Call
#              Property 'connect'
#                  Lexical variable '$bot'
#              Argument list [0 items]
#      Include (Bot2)
package FF;

use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    my $config = $ENV{FERRET_CONFIG} || '/etc/ferret.conf';
    do $config or die "config error: " . ( $@ || $! );
}

use Ferret;

my ( $self, $ins );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $file_name = './test/10-irc-simple/bot_test2.frt';
my $pos = before_content( 'bot_test2.frt', $file_name );

use Ferret::Core::Operations qw(str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    load_namespaces( $context, $file_name, qw(Bot2) );
    var(
        $scope,
        bot => $$scope->{'Bot2'}->(
            [
                undef,
                [
                    address => str( $f, "k.notroll.net" ),
                    nick    => str( $f, "ferret" ),
                    user    => str( $f, "bot" )
                ]
            ],
            $scope, undef,
            $pos->(1.2)
        ),
        undef,
        $pos->(1.1)
    );
    $$scope->{'say'}->(
        [ $$scope->{'bot'}->property_u( 'address', $pos->(2.4) ) ],
        $scope, undef, $pos->(2.2)
    );
    $$scope->{'bot'}->property_u( 'connect', $pos->(3.2) )
      ->( [ undef, [] ], $scope, undef, $pos->(3.3) );
};

after_content($file_name);
