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
#                  Need
#                      Lexical variable '$msg'
#                      Argument type
#                          Bareword 'Massage'
#              Instruction
#                  Call
#                      Instance variable '@send'
#                      Argument list [1 items]
#                          Item 0
#                              Operation
#                                  String 'PONG :'
#                                  Addition operator (+)
#                                  Index
#                                      Property 'params'
#                                          Lexical variable '$msg'
#                                      Index list [1 items]
#                                          Item 0
#                                              Operation
#                                                  Constant zero
#                                                  Negation operator (-)
#                                                  Number '1'
#      Include (Massage)
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

use Ferret::Core::Operations qw(_sub add num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'IRC::Handlers' );
    my $scope = $file_scope;
    FF::load_core('IRC::Handlers');

    # Function event 'ping' definition
    my $func_0 = FF::function_event_def(
        $f, $context, 'ping', undef,
        [
            {
                name     => 'msg',
                type     => 'Massage',
                optional => undef,
                more     => undef
            }
        ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'msg', 8.2 ) or return;
            $$self->{'send'}->(
                [
                    add(
                        $scope,
                        str( $f, "PONG :" ),
                        ${ $$scope->{'msg'} }->{'params'}->get_index_value(
                            [ _sub( $scope, $f->zero, num( $f, "1" ) ) ],
                            $scope, 9.35
                        )
                    )
                ],
                $scope, undef, 9.1
            );
            return $ret;
        }
    );
    $func_0->inside_scope( ping => $scope, $context, undef, undef, undef );
    FF::load_namespaces( $context, qw(Massage) );

    FF::lex_assign(
        $context,
        handlers => FF::create_object( $f, { PING => $$scope->{'ping'} } ),
        undef, 3.3
    );
};

FF::after_content();
