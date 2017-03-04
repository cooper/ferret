# === Document Model ===
#  File './std/IRC/Bot.frt'
#      Package 'IRC'
#          Class 'Bot'
#              Class method 'initializer__' { ?$commands }
#                  Function body
#                      Instruction
#                          Want
#                              Instance variable '@commands'
#                              Argument value
#                                  Object [0 items]
#                      Instruction
#                          Assignment
#                              Instance variable '@handlers'
#                              Object [0 items]
#                      Instruction
#                          Call
#                              Special property '*addParent'
#                                  Instance variable '@handlers'
#                              Argument list [1 item]
#                                  Item 0
#                                      Property 'handlers'
#                                          Bareword 'BotHandlers'
#                      Instruction
#                          Assignment
#                              Instance variable '@conns'
#                              Value list [0 items]
#              Method 'addConnection' { $connection:Connection }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$connection'
#                              Argument type
#                                  Bareword 'Connection'
#                      Instruction
#                          Call
#                              Property 'push'
#                                  Instance variable '@conns'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$connection'
#                      Instruction
#                          Call
#                              Special property '*addParent'
#                                  Property 'handlers'
#                                      Lexical variable '$connection'
#                              Argument list [1 item]
#                                  Item 0
#                                      Instance variable '@handlers'
#                      Instruction
#                          Call
#                              Special property '*addListener'
#                                  Property 'handlers'
#                                      Lexical variable '$connection'
#                              Mixed argument list [2 items]
#                                  Item 0
#                                      Instance variable '@handlers'
#                                  Item 1
#                                      Pair 'bot'
#                                          Special variable '*self'
#              Method 'removeConnection' { $connection:Connection }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$connection'
#                              Argument type
#                                  Bareword 'Connection'
#                      Instruction
#                          Call
#                              Property 'remove'
#                                  Instance variable '@conns'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$connection'
#                      Instruction
#                          Call
#                              Special property '*removeParent'
#                                  Property 'handlers'
#                                      Lexical variable '$connection'
#                              Argument list [1 item]
#                                  Item 0
#                                      Instance variable '@handlers'
#                      Instruction
#                          Call
#                              Special property '*removeListener'
#                                  Property 'handlers'
#                                      Instance variable '@connection'
#                              Argument list [1 item]
#                                  Item 0
#                                      Instance variable '@handlers'
#              Method 'connect'
#                  Function body
#                      For (values)
#                          Expression ('for' parameter)
#                              Lexical variable '$c'
#                          Expression ('in' parameter)
#                              Instance variable '@conns'
#                          For body
#                              Instruction
#                                  Call
#                                      Property 'connect'
#                                          Lexical variable '$c'
#                                      Argument list [0 items]
#              Method 'description' { -> $result }
#                  Function body
#                      Instruction
#                          Assignment
#                              Lexical variable '$s'
#                              String ''
#                      If
#                          Expression ('if' parameter)
#                              Operation
#                                  Property 'length'
#                                      Instance variable '@conns'
#                                  Negated equality operator (!=)
#                                  Number '1'
#                          If body
#                              Instruction
#                                  Assignment
#                                      Lexical variable '$s'
#                                      String 's'
#                      Instruction
#                          Return
#                              Operation
#                                  String 'IRC::Bot('
#                                  Addition operator (+)
#                                  Property 'length'
#                                      Instance variable '@conns'
#                                  Addition operator (+)
#                                  String ' connection'
#                                  Addition operator (+)
#                                  Lexical variable '$s'
#                                  Addition operator (+)
#                                  String ')'
#          Include (BotHandlers, Connection)
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
use Ferret::Core::Operations qw(add bool nequal num str);

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) = before_content( 'Bot.frt', './std/IRC/Bot.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'IRC', 1.1 );
    my $scope = $file_scope;
    load_core('IRC');

    # Class 'Bot'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Bot', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'commands',
                    type     => undef,
                    optional => 1,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                want( $self, $args, 'commands', 5.2, create_object( $f, [] ) );
                $self->set_property(
                    handlers => create_object( $f, [] ),
                    $pos->(6.2)
                );
                $$self->{'handlers'}->property_u( '*addParent', $pos->(7.2) )
                  ->(
                    [
                        $$scope->{'BotHandlers'}
                          ->property_u( 'handlers', $pos->(7.5) )
                    ],
                    $scope, undef,
                    $pos->(7.3)
                  );
                $self->set_property(
                    conns => create_list( $f, [] ),
                    $pos->(8.2)
                );
                return $ret;
            }
        );

        # Method event 'addConnection' definition
        my $func_1 = method_event_def(
            $f, $scope,
            'addConnection',
            [
                {
                    name     => 'connection',
                    type     => 'Connection',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'connection', 12.2 )
                  || return $ret_func->();
                $$self->{'conns'}->property_u( 'push', $pos->(13.2) )
                  ->( [ $$scope->{'connection'} ], $scope, undef,
                    $pos->(13.3) );
                $$scope->{'connection'}->property_u( 'handlers', $pos->(14.2) )
                  ->property_u( '*addParent', $pos->(14.3) )
                  ->( [ $$self->{'handlers'} ], $scope, undef, $pos->(14.4) );
                $$scope->{'connection'}->property_u( 'handlers', $pos->(15.1) )
                  ->property_u( '*addListener', $pos->(15.15) )->(
                    [
                        $$self->{'handlers'},
                        [ bot => ${ $scope->{special} }->{'self'} ]
                    ],
                    $scope, undef,
                    $pos->(15.2)
                  );
                return $ret;
            }
        );

        # Method event 'removeConnection' definition
        my $func_2 = method_event_def(
            $f, $scope,
            'removeConnection',
            [
                {
                    name     => 'connection',
                    type     => 'Connection',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'connection', 19.2 )
                  || return $ret_func->();
                $$self->{'conns'}->property_u( 'remove', $pos->(20.2) )
                  ->( [ $$scope->{'connection'} ], $scope, undef,
                    $pos->(20.3) );
                $$scope->{'connection'}->property_u( 'handlers', $pos->(21.2) )
                  ->property_u( '*removeParent', $pos->(21.3) )
                  ->( [ $$self->{'handlers'} ], $scope, undef, $pos->(21.4) );
                $$self->{'connection'}->property_u( 'handlers', $pos->(22.2) )
                  ->property_u( '*removeListener', $pos->(22.3) )
                  ->( [ $$self->{'handlers'} ], $scope, undef, $pos->(22.4) );
                return $ret;
            }
        );

        # Method event 'connect' definition
        my $func_3 = method_event_def(
            $f, $scope,
            'connect',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                {
                    my ( $loop_status, $loop_ret ) = iterate(
                        $f, $scope,
                        $$self->{'conns'},
                        'c',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            $$scope->{'c'}
                              ->property_u( 'connect', $pos->(27.2) )
                              ->( [ undef, [] ], $scope, undef, $pos->(27.3) );
                        },
                        $pos->(26.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret;
            }
        );

        # Method event 'description' definition
        my $func_4 = method_event_def(
            $f, $scope,
            'description',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var( $scope, s => str( $f, "" ), $file_scope, $pos->(31.2) );
                if (
                    bool(
                        nequal(
                            $scope,
                            $pos->(32.2),
                            $$self->{'conns'}
                              ->property_u( 'length', $pos->(32.15) ),
                            num( $f, "1" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    var(
                        $scope,
                        s => str( $f, "s" ),
                        $file_scope, $pos->(32.4)
                    );
                }
                return $ret_func->(
                    add(
                        $scope,
                        $pos->(33.15),
                        str( $f, "IRC::Bot(" ),
                        $$self->{'conns'}
                          ->property_u( 'length', $pos->(33.25) ),
                        str( $f, " connection" ),
                        $$scope->{'s'},
                        str( $f, ")" )
                    )
                );
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            addConnection => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_2->inside_scope(
            removeConnection => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            connect => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_4->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    provides_namespaces( $context, $file_name, $pos->(34.1), qw(Bot) );
    load_namespaces( $context, $file_name, $pos->(34.1),
        qw(BotHandlers Connection) );
};

after_content($file_name);
