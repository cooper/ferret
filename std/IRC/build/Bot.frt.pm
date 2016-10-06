# === Document Model ===
#  Document './std/IRC/Bot.frt'
#      Package 'IRC'
#      Class 'Bot'
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Instance variable '@commands'
#                          Argument value
#                              Object [0 items]
#                  Instruction
#                      Assignment
#                          Instance variable '@conns'
#                          Value list [0 items]
#          Method 'addConnection'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$connection'
#                          Argument type
#                              Bareword 'Connection'
#                  Instruction
#                      Call
#                          Property 'push'
#                              Instance variable '@conns'
#                          Argument list [1 items]
#                              Item 0
#                                  Lexical variable '$connection'
#                  Instruction
#                      Assignment
#                          Lexical variable '$bot'
#                          Special variable '*self'
#                  Instruction
#                      Weaken modifier
#                          Lexical variable '$bot'
#                  On ('handleCommand' callback)
#                      Expression ('on' parameter)
#                          Property 'PRIVMSG'
#                              Property 'handlers'
#                                  Lexical variable '$connection'
#                      Anonymous function
#                          Body ('function' scope)
#                              Instruction
#                                  Need
#                                      Lexical variable '$msg'
#                              If
#                                  Expression ('if' parameter)
#                                      Negation
#                                          Call
#                                              Special property '*instanceOf'
#                                                  Property 'target'
#                                                      Lexical variable '$msg'
#                                              Argument list [1 items]
#                                                  Item 0
#                                                      Bareword 'Channel'
#                                  Body ('if' scope)
#                                      Instruction
#                                          Return
#                              Instruction
#                                  Assignment
#                                      Lexical variable '$trim'
#                                      Detail
#                                          Call
#                                              Property 'trimPrefix'
#                                                  Call
#                                                      Property 'word'
#                                                          Index
#                                                              Property 'params'
#                                                                  Lexical variable '$msg'
#                                                              Index list [1 items]
#                                                                  Item 0
#                                                                      Number '1'
#                                                      Argument list [1 items]
#                                                          Item 0
#                                                              Number '0'
#                                              Argument list [1 items]
#                                                  Item 0
#                                                      String '.'
#                              If
#                                  Expression ('if' parameter)
#                                      Negation
#                                          Property 'trimmed'
#                                              Lexical variable '$trim'
#                                  Body ('if' scope)
#                                      Instruction
#                                          Return
#                              Instruction
#                                  Assignment
#                                      Lexical variable '$command'
#                                      Property 'default'
#                                          Lexical variable '$trim'
#                              Instruction
#                                  Call
#                                      Maybe
#                                          Property (name evaluated at runtime)
#                                              Property 'commands'
#                                                  Maybe
#                                                      Lexical variable '$bot'
#                                              Property index [1 items]
#                                                  Item 0
#                                                      Property 'lowercase'
#                                                          Lexical variable '$command'
#                                      Named argument list [2 items]
#                                          Item 0
#                                              Pair 'msg'
#                                                  Lexical variable '$msg'
#                                          Item 1
#                                              Pair 'channel'
#                                                  Property 'target'
#                                                      Lexical variable '$msg'
#          Method 'connect'
#              Body ('method' scope)
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$c'
#                      Expression ('in' parameter)
#                          Instance variable '@conns'
#                      Body ('for' scope)
#                          Instruction
#                              Call
#                                  Property 'connect'
#                                      Lexical variable '$c'
#                                  Argument list [0 items]
#      Include (Channel, Connection)
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

my $pos = FF::before_content( 'Bot.frt', './std/IRC/Bot.frt' );

use Ferret::Core::Operations qw(_not all_true bool num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'IRC' );
    my $scope = $file_scope;
    FF::load_core('IRC');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, undef,
        'handleCommand',
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'msg', 18.2 ) or return;
            if (
                bool(
                    _not(
                        ${ ${ $$scope->{'msg'} }->{'target'} }->{'*instanceOf'}
                          ->(
                            [ $$scope->{'Channel'} ], $scope,
                            undef,                    $pos->(21.3)
                          )
                    )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            FF::lex_assign(
                $scope,
                trim => ${
                    ${
                        ${ $$scope->{'msg'} }->{'params'}
                          ->get_index_value( [ num( $f, "1" ) ],
                            $scope, $pos->(25.3) )
                      }->{'word'}
                      ->( [ num( $f, "0" ) ], $scope, undef, $pos->(25.5) )
                  }->{'trimPrefix'}
                  ->( [ str( $f, "." ) ], $scope, undef, $pos->(25.7), 1 ),
                $file_scope,
                $pos->(25.1)
            );
            if ( bool( _not( ${ $$scope->{'trim'} }->{'trimmed'} ) ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            FF::lex_assign(
                $scope,
                command => ${ $$scope->{'trim'} }->{'default'},
                $file_scope, $pos->(28.2)
            );
            {
                my $maybe_0 = $$scope->{'bot'};
                my $maybe_1 = ${$maybe_0}->{'commands'}
                  ->property_eval_u( ${ $$scope->{'command'} }->{'lowercase'} );
                if (
                    bool(
                        all_true( $scope, sub { $maybe_0 }, sub { $maybe_1 } )
                    )
                  )
                {
                    $maybe_1->(
                        [
                            undef,
                            [
                                msg     => $$scope->{'msg'},
                                channel => ${ $$scope->{'msg'} }->{'target'}
                            ]
                        ],
                        $scope, undef,
                        $pos->(31.5)
                    );
                }
            }
            return $ret;
        }
    );

    # Class 'Bot'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Bot', undef, undef );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
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
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::want( $self, $args, 'commands', 5.2,
                    FF::create_object( $f, [] ) );
                $self->set_property(
                    conns => FF::create_list( $f, [] ),
                    $pos->(6.2)
                );
                return $ret;
            }
        );

        # Method event 'addConnection' definition
        my $method_1 = FF::method_event_def(
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
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'connection', 10.2 ) or return;
                ${ $$self->{'conns'} }->{'push'}
                  ->( [ $$scope->{'connection'} ], $scope, undef,
                    $pos->(11.3) );
                FF::lex_assign(
                    $scope,
                    bot => ${ $scope->{special} }->{'self'},
                    $file_scope, $pos->(13.2)
                );
                $scope->weaken_property( 'bot', $pos->(14.1) );
                FF::on(
                    ${ $$scope->{'connection'} }->{'handlers'},
                    'PRIVMSG',
                    $self, $scope,
                    $func_0->inside_scope(
                        (undef) => $scope,
                        undef, $class, undef, undef
                    ),
                    {}
                );
                return $ret;
            }
        );

        # Method event 'connect' definition
        my $method_2 = FF::method_event_def(
            $f, $scope,
            'connect',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                {
                    my $loop_ret = FF::iterate(
                        $f, $scope,
                        $$self->{'conns'},
                        'c',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            ${ $$scope->{'c'} }->{'connect'}
                              ->( [ undef, [] ], $scope, undef, $pos->(40.3) );
                        },
                        $pos->(39.1)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            addConnection => $scope,
            $proto, $class, undef, undef
        );
        $method_2->inside_scope(
            connect => $scope,
            $proto, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Channel Connection) );
};

FF::after_content();
