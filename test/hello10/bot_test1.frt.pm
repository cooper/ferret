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
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die 'config error';
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = FF::get_ferret();

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
            $scope, undef, 1
        )
    );
    $scope->property_u('bot')->property_u('connect')
      ->call_u( {}, $scope, undef, 2 );
};

FF::after_content();
