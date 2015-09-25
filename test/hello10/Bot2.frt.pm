# === Document Model ===
#  Document './test/hello10/Bot2.frt'
#      Class 'Bot2'
#          Main method '_init_'
#              Instruction
#                  Need
#                      Instance variable '@address'
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
#                  Call
#                      Call
#                          Property 'init'
#                              Bareword 'Socket::TCP'
#                          Structural list [1 items]
#                              Item 0
#                                  Special variable '*self'
#                      Hash [2 items]
#                          Item 0
#                              Pair 'addr'
#                                  Instance variable '@address'
#                          Item 1
#                              Pair 'port'
#                                  Instance variable '@port'
#              Instruction
#                  Assignment
#                      Instance variable '@send'
#                      Instance variable '@println'
#              On
#                  Expression ('on' parameter)
#                      Instance variable '@connected'
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
#              On
#                  Expression ('on' parameter)
#                      Instance variable '@gotLine'
#                  Function 'callback'
#                      Instruction
#                          Need
#                              Lexical variable '$data'
#                      Instruction
#                          Call
#                              Bareword 'say'
#                              Structural list [1 items]
#                                  Item 0
#                                      Mathematical operation
#                                          String 'recv: '
#                                          Addition operator (+)
#                                          Lexical variable '$data'
#              On
#                  Expression ('on' parameter)
#                      Instance variable '@println'
#                  Function 'callback'
#                      Instruction
#                          Need
#                              Lexical variable '$data'
#                      Instruction
#                          Call
#                              Bareword 'say'
#                              Structural list [1 items]
#                                  Item 0
#                                      Mathematical operation
#                                          String 'send: '
#                                          Addition operator (+)
#                                          Lexical variable '$data'
#      Include (Num, Socket, Socket::TCP, Str)
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die "config error";
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'Bot2.frt.pm'}++;

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    # Function '+undef' definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, name => '+undef' );

        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
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

    # Function '+undef' definition
    {
        my $func = $funcs[1] = Ferret::Function->new( $f, name => '+undef' );
        $func->add_argument( name => 'data' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{data};
                $scope->set_property( data => $arguments->{data} );
            };
            $scope->property('say')->call(
                [
                    add(
                        $scope, str( $f, "recv: " ), $scope->property('data')
                    )
                ],
                $scope
            );
            return $return;
        };
    }

    # Function '+undef' definition
    {
        my $func = $funcs[2] = Ferret::Function->new( $f, name => '+undef' );
        $func->add_argument( name => 'data' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{data};
                $scope->set_property( data => $arguments->{data} );
            };
            $scope->property('say')->call(
                [
                    add(
                        $scope, str( $f, "send: " ), $scope->property('data')
                    )
                ],
                $scope
            );
            return $return;
        };
    }

    # Class 'Bot2'
    {
        my @methods;
        my ( $class, $self );
        if ( $context->has_property('Bot2') ) {
            $class = $self = $context->property('Bot2');
        }
        else {
            $class = $self = Ferret::Class->new(
                $f,
                name    => 'Bot2',
                version => undef
            );
            $context->set_property( Bot2 => $class );
        }
        my $proto = $class->prototype;

        # Method event '_init_' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'address' );
            $func->add_argument( name => 'nick' );
            $func->add_argument( name => 'user' );
            $func->add_argument( name => 'port', optional => 1 );
            $func->add_argument( name => 'real', optional => 1 );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{address};
                    $self->set_property( address => $arguments->{address} );
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
                };
                do {
                    my $want_val = $arguments->{real};
                    $want_val ||= str( $f, "Ferret IRC" );
                    $self->set_property( real => $want_val );
                };
                $scope->property('Socket::TCP')->property('init')
                  ->call( [ $scope->{special}->property('self') ], $scope )
                  ->call(
                    {
                        addr => $self->property('address'),
                        port => $self->property('port')
                    },
                    $scope
                  );
                $self->set_property( send => $self->property('println') );

                # On
                {
                    my $on_func =
                      $funcs[0]->inside_scope( +undef => $scope, $scope );
                    $self->property('connected')
                      ->add_function_with_self( $self, $on_func );
                }

                # On
                {
                    my $on_func =
                      $funcs[1]->inside_scope( +undef => $scope, $scope );
                    $self->property('gotLine')
                      ->add_function_with_self( $self, $on_func );
                }

                # On
                {
                    my $on_func =
                      $funcs[2]->inside_scope( +undef => $scope, $scope );
                    $self->property('println')
                      ->add_function_with_self( $self, $on_func );
                }
                return $return;
            };
            $methods[0] = Ferret::Event->new(
                $f,
                name         => '_init_',
                default_func => [ undef, $func ]
            );
        }
        $methods[0]->inside_scope( _init_ => $scope, $class, $class );
    }
    Ferret::space( $context, $_ ) for qw(Num Socket Socket::TCP Str);
};

Ferret::runtime();
