# === Document Model ===
#  File './test/10-irc-simple/bot_test1.frt'
#      Package 'main'
#          Instruction
#              Assignment
#                  Lexical variable '$bot'
#                  Call
#                      Bareword 'Bot1'
#                      Named argument list [3 items]
#                          Item 0
#                              Pair 'addr'
#                                  String 'k.notroll.net'
#                          Item 1
#                              Pair 'nick'
#                                  String 'ferret'
#                          Item 2
#                              Pair 'user'
#                                  String 'bot'
#          Instruction
#              Call
#                  Property 'connect'
#                      Lexical variable '$bot'
#                  Argument list [0 items]
#          Include (Bot1)
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
use Ferret::Core::Operations qw(str);

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) =
  before_content( 'bot_test1.frt', './test/10-irc-simple/bot_test1.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    provides_namespaces( $context, $file_name, qw() );
    load_namespaces( $context, $file_name, qw(Bot1) );
    var(
        $scope,
        bot => $$scope->{'Bot1'}->(
            [
                undef,
                [
                    addr => str( $f, "k.notroll.net" ),
                    nick => str( $f, "ferret" ),
                    user => str( $f, "bot" )
                ]
            ],
            $scope, undef,
            $pos->(1.2)
        ),
        undef,
        $pos->(1.1)
    );
    $$scope->{'bot'}->property_u( 'connect', $pos->(2.2) )
      ->( [ undef, [] ], $scope, undef, $pos->(2.3) );
};

after_content($file_name);
