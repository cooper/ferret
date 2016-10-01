# === Document Model ===
#  Document './test/10-irc-simple/bot_test1.frt'
#      Instruction
#          Assignment
#              Lexical variable '$bot'
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
    my $config = $ENV{FERRET_CONFIG} || '/etc/ferret.conf';
    do $config or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined, $ret_func ) = FF::get_constant_objects($f);

my $pos =
  FF::before_content( 'bot_test1.frt', './test/10-irc-simple/bot_test1.frt' );

use Ferret::Core::Operations qw(str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    FF::load_namespaces( $context, qw(Bot1) );
    FF::lex_assign(
        $scope,
        bot => $$scope->{'Bot1'}->(
            {
                addr => str( $f, "k.notroll.net" ),
                nick => str( $f, "ferret" ),
                user => str( $f, "bot" )
            },
            $scope, undef,
            $pos->(1.2)
        ),
        undef,
        $pos->(1.1)
    );
    ${ $$scope->{'bot'} }->{'connect'}->( {}, $scope, undef, $pos->(2.3) );
};

FF::after_content();
