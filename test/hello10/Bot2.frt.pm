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
#                          Single value [1 items]
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
#                  Assignment (instance variable '@send')
#                      Instance variable '@println'
#              On
#                  Expression ('on' parameter)
#                      Instance variable '@connected'
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
#                                          String ' * * :'
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
#                      Instance variable '@gotLine'
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
#              On
#                  Expression ('on' parameter)
#                      Instance variable '@println'
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

use Ferret::Core::Operations qw(add num on str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    undef;

    # Anonymous function definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, anonymous => 1 );

        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $self->property_u('send')->call_u(
                [
                    add(
                        $scope,                    str( $f, "USER " ),
                        $self->property_u('user'), str( $f, " * * :" ),
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
        $func->add_argument( name => 'data', type => '' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{data};
                $scope->set_property( data => $arguments->{data} );
            };
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

    # Anonymous function definition
    {
        my $func = $funcs[2] = Ferret::Function->new( $f, anonymous => 1 );
        $func->add_argument( name => 'data', type => '' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{data};
                $scope->set_property( data => $arguments->{data} );
            };
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "send: " ),
                        $scope->property_u('data')
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
        if ( not $class = $f->get_class( $context, 'Bot2' ) ) {
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
            $func->add_argument( name => 'address', type => 'Str' );
            $func->add_argument( name => 'nick',    type => 'Str' );
            $func->add_argument( name => 'user',    type => 'Str' );
            $func->add_argument( name => 'port', type => 'Num', optional => 1 );
            $func->add_argument( name => 'real', type => 'Str', optional => 1 );
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
                $scope->property_u('Socket::TCP')->property_u('init')
                  ->call_u( [ $scope->{special}->property_u('self') ], $scope )
                  ->call_u(
                    {
                        addr => $self->property_u('address'),
                        port => $self->property_u('port')
                    },
                    $scope
                  );
                $self->set_property( send => $self->property_u('println') );
                on( $self, "connected", $self, $scope,
                    $funcs[0]->inside_scope( (undef) => $scope, $scope ) );
                on( $self, "gotLine", $self, $scope,
                    $funcs[1]->inside_scope( (undef) => $scope, $scope ) );
                on( $self, "println", $self, $scope,
                    $funcs[2]->inside_scope( (undef) => $scope, $scope ) );
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
