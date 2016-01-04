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
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    FF::load_namespaces( $context, qw(Bot2) );
    my $lv_bot = FF::lex_assign(
        $scope,
        bot => $$scope->{'Bot2'}->(
            {
                address => str( $f, "k.notroll.net" ),
                nick    => str( $f, "ferret" ),
                user    => str( $f, "bot" )
            },
            $scope, undef, 1.2
        ),
        undef,
        1.1
    );
    $$scope->{'say'}
      ->( [ ${ $$scope->{'bot'} }->{'address'} ], $scope, undef, 2.2 );
    ${ $$scope->{'bot'} }->{'connect'}->( {}, $scope, undef, 3.3 );
};

FF::after_content();
