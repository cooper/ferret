# --- DOM ---
#  Document './test/hello10/Bot1.frt'
#      Class 'Bot'
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
#                  Assignment
#                      Instance variable '@sock'
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
#                  Function 'callback'
#                      Instruction
#                          Call
#                              Instance variable '@send'
#                              Structural list [1 items]
#                                  Item 0
#                                      Mathematical operation
#                                          String 'USER '
#                                          Addition operator (+)
#                                          Instance variable '@user'
#                                          Addition operator (+)
#                                          String ' * * :'
#                                          Addition operator (+)
#                                          Instance variable '@real'
#                      Instruction
#                          Call
#                              Instance variable '@send'
#                              Structural list [1 items]
#                                  Item 0
#                                      Mathematical operation
#                                          String 'NICK '
#                                          Addition operator (+)
#                                          Instance variable '@nick'
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
#                      Property 'println'
#                          Instance variable '@sock'
#                      Structural list [1 items]
#                          Item 0
#                              Lexical variable '$line'
#      Include (Socket::TCP, Str, Socket, Num)
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    my $libs = do '/etc/ferret.conf';
    ref $libs eq 'ARRAY' or die "config error";
    unshift @INC, @$libs;
}

use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'Bot1.frt.pm'}++;

use Ferret::Core::Operations qw(add num str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    # Function '+undef' definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, name => '+undef' );

        $func->{code} = sub {
            my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
            $self->property('send')->call(
                [
                    add(
                        $scope,                  str( $f, "USER " ),
                        $self->property('user'), str( $f, " * * :" ),
                        $self->property('real')
                    )
                ],
                $scope
            );
            $self->property('send')->call(
                [ add( $scope, str( $f, "NICK " ), $self->property('nick') ) ],
                $scope
            );
            return $return;
        };
    }

    # Class 'Bot'
    {
        my @methods;
        my ( $class, $self );
        if ( $context->has_property('Bot') ) {
            $class = $self = $context->property('Bot');
        }
        else {
            $class = $self = Ferret::Class->new(
                $f,
                name    => 'Bot',
                version => undef
            );
            $context->set_property( Bot => $class );
        }
        my $proto = $class->prototype;

        # Method event '_init_' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'addr' );
            $func->add_argument( name => 'nick' );
            $func->add_argument( name => 'user' );
            $func->add_argument( name => 'port', optional => 1 );
            $func->{code} = sub {
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{addr};
                    $self->set_property( addr => $arguments->{addr} );
                };
                do {
                    return unless defined $arguments->{nick};
                    $self->set_property( nick => $arguments->{nick} );
                };
                do {
                    return unless defined $arguments->{user};
                    $self->set_property( user => $arguments->{user} );
                };
                do {
                    my $want_val = $arguments->{port};
                    $want_val ||= num( $f, 6667 );
                    $self->set_property( port => $want_val );
                    $want_val;
                };
                $self->set_property(
                    sock => $scope->property('Socket::TCP')->call(
                        {
                            address => $self->property('addr'),
                            port    => $self->property('port')
                        },
                        $scope
                    )
                );

                # On
                {
                    my $on_func = do {
                        $funcs[0]->inside_scope( +undef => $scope, $scope );
                    };
                    $self->property('sock')->property('connected')
                      ->add_function($on_func);
                }
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
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                $self->property('sock')->property('connect')
                  ->call( [], $scope );
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
            $func->add_argument( name => 'line' );
            $func->{code} = sub {
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{line};
                    $scope->set_property( line => $arguments->{line} );
                };
                $self->property('sock')->property('println')
                  ->call( [ $scope->property('line') ], $scope );
                return $return;
            };
            $methods[2] = Ferret::Event->new(
                $f,
                name         => 'send',
                default_func => [ undef, $func ]
            );
        }
        $methods[0]->inside_scope( _init_  => $scope, $class, $class );
        $methods[1]->inside_scope( connect => $scope, $proto, $class );
        $methods[2]->inside_scope( send    => $scope, $proto, $class );
    }
    Ferret::space( $context, $_ ) for qw(Socket::TCP Str Socket Num);
}

Ferret::runtime();
