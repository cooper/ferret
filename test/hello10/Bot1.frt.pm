# === Document Model ===
#  Document './test/hello10/Bot1.frt'
#      Class 'Bot1'
#          Main method '_init_'
#              Instruction
#                  Need
#                      Instance variable '@addr'
#                      Bareword 'Str'
#              Instruction
#                  Need
#                      Instance variable '@nick'
#                      Bareword 'Str'
#              Instruction
#                  Need
#                      Instance variable '@user'
#                      Bareword 'Str'
#              Instruction
#                  Want
#                      Instance variable '@port'
#                      Expression ('want' parameter)
#                          Number '6667'
#                      Bareword 'Num'
#              Instruction
#                  Want
#                      Instance variable '@real'
#                      Expression ('want' parameter)
#                          String 'Ferret IRC'
#                      Bareword 'Str'
#              Instruction
#                  Assignment (instance variable '@sock')
#                      Call
#                          Bareword 'Socket::TCP'
#                          Hash [2 items]
#                              Item 0
#                                  Pair 'address'
#                                      Instance variable '@addr'
#                              Item 1
#                                  Pair 'port'
#                                      Instance variable '@port'
#              On
#                  Expression ('on' parameter)
#                      Property 'connected'
#                          Instance variable '@sock'
#                  Anonymous function
#                      Instruction
#                          Call
#                              Instance variable '@send'
#                              Single value [1 items]
#                                  Item 0
#                                      Operation
#                                          String 'USER '
#                                          Addition operator (+)
#                                          Instance variable '@user'
#                                          Addition operator (+)
#                                          String ' '
#                                          Addition operator (+)
#                                          String '*'
#                                          Addition operator (+)
#                                          String ' '
#                                          Addition operator (+)
#                                          String '*'
#                                          Addition operator (+)
#                                          String ' :'
#                                          Addition operator (+)
#                                          Instance variable '@real'
#                      Instruction
#                          Call
#                              Instance variable '@send'
#                              Single value [1 items]
#                                  Item 0
#                                      Operation
#                                          String 'NICK '
#                                          Addition operator (+)
#                                          Instance variable '@nick'
#              On
#                  Expression ('on' parameter)
#                      Property 'gotLine'
#                          Instance variable '@sock'
#                  Anonymous function
#                      Instruction
#                          Need
#                              Lexical variable '$data'
#                      Instruction
#                          Call
#                              Bareword 'say'
#                              Single value [1 items]
#                                  Item 0
#                                      Operation
#                                          String 'recv: '
#                                          Addition operator (+)
#                                          Lexical variable '$data'
#          Method 'connect'
#              Instruction
#                  Call
#                      Property 'connect'
#                          Instance variable '@sock'
#                      Structural list [0 items]
#          Method 'send'
#              Instruction
#                  Need
#                      Lexical variable '$line'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Single value [1 items]
#                          Item 0
#                              Operation
#                                  String 'send: '
#                                  Addition operator (+)
#                                  Lexical variable '$line'
#              Instruction
#                  Call
#                      Property 'println'
#                          Instance variable '@sock'
#                      Single value [1 items]
#                          Item 0
#                              Lexical variable '$line'
#      Include (Num, Socket, Socket::TCP, Str)
use warnings;
use strict;
use utf8;
use 5.010;

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

FF::before_content('Bot1.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my @funcs;
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Anonymous function definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, anonymous => 1 );

        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
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
                $scope
            );
            $self->property_u('send')->call_u(
                [
                    add(
                        $scope, str( $f, "NICK " ), $self->property_u('nick')
                    )
                ],
                $scope
            );
            return $return;
        };
    }

    # Anonymous function definition
    {
        my $func = $funcs[1] = Ferret::Function->new( $f, anonymous => 1 );
        $func->add_argument( name => 'data', type => '', more => undef );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'data' ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "recv: " ),
                        $scope->property_u('data')
                    )
                ],
                $scope
            );
            return $return;
        };
    }

    # Class 'Bot1'
    {
        my @methods;
        my ( $class, $self );
        if ( not $class = $f->get_class( $context, 'Bot1' ) ) {
            $class = $self = Ferret::Class->new(
                $f,
                name    => 'Bot1',
                version => undef
            );
            $context->set_property( Bot1 => $class );
        }
        my $proto = $class->prototype;

        # Method event '_init_' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'addr', type => 'Str', more => undef );
            $func->add_argument( name => 'nick', type => 'Str', more => undef );
            $func->add_argument( name => 'user', type => 'Str', more => undef );
            $func->add_argument(
                name     => 'port',
                type     => 'Num',
                optional => 1,
                more     => undef
            );
            $func->add_argument(
                name     => 'real',
                type     => 'Str',
                optional => 1,
                more     => undef
            );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $self, $arguments, 'addr' ) or return;
                FF::need( $self, $arguments, 'nick' ) or return;
                FF::need( $self, $arguments, 'user' ) or return;
                do {
                    my $want_val = $arguments->{port};
                    $want_val ||= num( $f, 6667 );
                    $self->set_property( port => $want_val );
                };
                do {
                    my $want_val = $arguments->{real};
                    $want_val ||= str( $f, "Ferret IRC" );
                    $self->set_property( real => $want_val );
                };
                $self->set_property(
                    sock => $scope->property_u('Socket::TCP')->call_u(
                        {
                            address => $self->property_u('addr'),
                            port    => $self->property_u('port')
                        },
                        $scope
                    )
                );
                FF::on(
                    $self->property_u('sock'),
                    'connected',
                    $self, $scope,
                    $funcs[0]->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    )
                );
                FF::on(
                    $self->property_u('sock'),
                    'gotLine',
                    $self, $scope,
                    $funcs[1]->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    )
                );
                return $return;
            };
            $methods[0] = Ferret::Event->new(
                $f,
                name         => '_init_',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'connect' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $self->property_u('sock')->property_u('connect')
                  ->call_u( {}, $scope );
                return $return;
            };
            $methods[1] = Ferret::Event->new(
                $f,
                name         => 'connect',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'send' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'line', type => '', more => undef );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'line' ) or return;
                $scope->property_u('say')->call_u(
                    [
                        add(
                            $scope, str( $f, "send: " ),
                            $scope->property_u('line')
                        )
                    ],
                    $scope
                );
                $self->property_u('sock')->property_u('println')
                  ->call_u( [ $scope->property_u('line') ], $scope );
                return $return;
            };
            $methods[2] = Ferret::Event->new(
                $f,
                name         => 'send',
                default_func => [ undef, $func ]
            );
        }
        $methods[0]
          ->inside_scope( _init_ => $scope, $class, $class, undef, undef );
        $methods[1]
          ->inside_scope( connect => $scope, $proto, $class, undef, undef );
        $methods[2]
          ->inside_scope( send => $scope, $proto, $class, undef, undef );
    }
    FF::load_namespaces( $context, qw(Num Socket Socket::TCP Str) );
};

FF::after_content();
