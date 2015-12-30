# === Document Model ===
#  Document './test/10-irc-simple/Bot2.frt'
#      Class 'Bot2'
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Instance variable '@address'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Need
#                          Instance variable '@nick'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Need
#                          Instance variable '@user'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Want
#                          Instance variable '@port'
#                          Argument type
#                              Bareword 'Num'
#                          Argument value
#                              Number '6667'
#                  Instruction
#                      Want
#                          Instance variable '@real'
#                          Argument type
#                              Bareword 'Str'
#                          Argument value
#                              String 'Ferret IRC'
#                  Instruction
#                      Call
#                          Call
#                              Property 'init'
#                                  Bareword 'Socket::TCP'
#                              Argument list [1 items]
#                                  Item 0
#                                      Special variable '*self'
#                          Named argument list [2 items]
#                              Item 0
#                                  Pair 'addr'
#                                      Instance variable '@address'
#                              Item 1
#                                  Pair 'port'
#                                      Instance variable '@port'
#                  Instruction
#                      Assignment (instance variable '@send')
#                          Instance variable '@println'
#                  On
#                      Expression ('on' parameter)
#                          Instance variable '@connected'
#                      Anonymous function
#                          Body ('function' scope)
#                              Instruction
#                                  Call
#                                      Instance variable '@send'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Operation
#                                                  String 'USER '
#                                                  Addition operator (+)
#                                                  Instance variable '@user'
#                                                  Addition operator (+)
#                                                  String ' '
#                                                  Addition operator (+)
#                                                  String '*'
#                                                  Addition operator (+)
#                                                  String ' '
#                                                  Addition operator (+)
#                                                  String '*'
#                                                  Addition operator (+)
#                                                  String ' :'
#                                                  Addition operator (+)
#                                                  Instance variable '@real'
#                              Instruction
#                                  Call
#                                      Instance variable '@send'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Operation
#                                                  String 'NICK '
#                                                  Addition operator (+)
#                                                  Instance variable '@nick'
#                  On
#                      Expression ('on' parameter)
#                          Instance variable '@gotLine'
#                      Anonymous function
#                          Body ('function' scope)
#                              Instruction
#                                  Need
#                                      Lexical variable '$data'
#                              Instruction
#                                  Call
#                                      Bareword 'say'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Operation
#                                                  String 'recv: '
#                                                  Addition operator (+)
#                                                  Lexical variable '$data'
#                  On
#                      Expression ('on' parameter)
#                          Instance variable '@println'
#                      Anonymous function
#                          Body ('function' scope)
#                              Instruction
#                                  Need
#                                      Lexical variable '$data'
#                              Instruction
#                                  Call
#                                      Bareword 'say'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Operation
#                                                  String 'send: '
#                                                  Addition operator (+)
#                                                  Lexical variable '$data'
#      Include (Num, Socket, Socket::TCP, Str)
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

FF::before_content('Bot2.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, $scope, undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            $self->property_u('send')->call_u(
                [
                    add(
                        $scope,
                        str( $f, "USER " ),
                        $self->property_u('user'),
                        str( $f, " " ),
                        str( $f, "*" ),
                        str( $f, " " ),
                        str( $f, "*" ),
                        str( $f, " :" ),
                        $self->property_u('real')
                    )
                ],
                $scope, undef, 14.06667
            );
            $self->property_u('send')->call_u(
                [
                    add(
                        $scope, str( $f, "NICK " ), $self->property_u('nick')
                    )
                ],
                $scope, undef, 15.2
            );
            return $ret->return;
        }
    );

    # Anonymous function definition
    my $func_1 = FF::function_def(
        $f, $scope, undef,
        [ { name => 'data', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'data', 20.2 ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "recv: " ),
                        $scope->property_u('data')
                    )
                ],
                $scope, undef, 21.2
            );
            return $ret->return;
        }
    );

    # Anonymous function definition
    my $func_2 = FF::function_def(
        $f, $scope, undef,
        [ { name => 'data', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'data', 25.2 ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "send: " ),
                        $scope->property_u('data')
                    )
                ],
                $scope, undef, 26.2
            );
            return $ret->return;
        }
    );

    # Class 'Bot2'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Bot2', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
            [
                {
                    name     => 'address',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'nick',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'user',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                { name => 'port', type => 'Num', optional => 1, more => undef },
                { name => 'real', type => 'Str', optional => 1, more => undef }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                FF::need( $self, $args, 'address' ) or return;
                FF::need( $self, $args, 'nick' )    or return;
                FF::need( $self, $args, 'user' )    or return;
                FF::want( $self, $args, 'port', 5.1, num( $f, 6667 ) );
                FF::want( $self, $args, 'real', 5.4, str( $f, "Ferret IRC" ) );
                $scope->property_u('Socket::TCP')->property_u('init')
                  ->call_u( [ $scope->{special}->property_u('self') ],
                    $scope, undef, 8.25 )->call_u(
                    {
                        addr => $self->property_u('address'),
                        port => $self->property_u('port')
                    },
                    $scope, undef, 8.4
                    );
                $self->set_property(
                    send => $self->property_u('println'),
                    10.2
                );
                FF::on(
                    $self,
                    'connected',
                    $self, $scope,
                    $func_0->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    ),
                    {}
                );
                FF::on(
                    $self,
                    'gotLine',
                    $self, $scope,
                    $func_1->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    ),
                    {}
                );
                FF::on(
                    $self,
                    'println',
                    $self, $scope,
                    $func_2->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    ),
                    {}
                );
                return $ret->return;
            }
        );
        $method_0->inside_scope(
            _init_ => $scope,
            $class, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Num Socket Socket::TCP Str) );
};

FF::after_content();
