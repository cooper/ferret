# === Document Model ===
#  Document './std/IRC/Handlers.frt'
#      Package 'IRC::Handlers'
#      Instruction
#          Shared variable declaration
#              Assignment
#                  Lexical variable '$handlers'
#                  Object [1 items]
#                      Item 0
#                          Pair 'PING'
#                              Bareword 'ping'
#      Function 'ping'
#          Body ('function' scope)
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Argument list [1 items]
#                          Item 0
#                              String 'handling ping'
#              Instruction
#                  Call
#                      Instance variable '@send'
#                      Argument list [1 items]
#                          Item 0
#                              String 'PONG'
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

FF::before_content('Handlers.frt');

use Ferret::Core::Operations qw(str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'IRC::Handlers' );
    my $scope = $file_scope;
    FF::load_core('IRC::Handlers');

    # Function event 'ping' definition
    my $func_0 = FF::function_event_def(
        $f, $context, 'ping', undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $$scope->{'say'}
              ->( [ str( $f, "handling ping" ) ], $scope, undef, 8.2 );
            $$self->{'send'}->( [ str( $f, "PONG" ) ], $scope, undef, 9.2 );
            return $ret;
        }
    );
    $func_0->inside_scope( ping => $scope, $context, undef, undef, undef );

    FF::lex_assign(
        $context,
        handlers => FF::create_object( $f, { PING => $$scope->{'ping'} } ),
        undef, 3.3
    );
};

FF::after_content();
