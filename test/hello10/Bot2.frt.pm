# --- DOM ---
#  Document './test/hello10/Bot2.frt'
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
#                                  Instance variable '@addr'
#                          Item 1
#                              Pair 'port'
#                                  Instance variable '@port'
#              On
#                  Expression ('on' parameter)
#                      Instance variable '@connected'
#                  Function 'callback'
#                      Instruction
#                          Call
#                              Instance variable '@println'
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
#                              Instance variable '@println'
#                              Structural list [1 items]
#                                  Item 0
#                                      Mathematical operation
#                                          String 'NICK '
#                                          Addition operator (+)
#                                          Instance variable '@nick'
#      Include (Socket, Num, Socket::TCP, Str)
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
$Ferret::tried_files{'Bot2.frt.pm'}++;

use Ferret::Core::Operations qw(add num str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    # Function '+undef' definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, name => '+undef' );

        $func->{code} = sub {
            my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
            $self->property('println')->call(
                [
                    add(
                        $scope,                  str( $f, "USER " ),
                        $self->property('user'), str( $f, " * * :" ),
                        $self->property('real')
                    )
                ],
                $scope
            );
            $self->property('println')->call(
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
                $scope->property('Socket::TCP')->property('init')
                  ->call( [ $scope->{special}->property('self') ], $scope )
                  ->call(
                    {
                        addr => $self->property('addr'),
                        port => $self->property('port')
                    },
                    $scope
                  );

                # On
                {
                    my $on_func = do {
                        $funcs[0]->inside_scope( +undef => $scope, $scope );
                    };
                    $self->property('connected')->add_function($on_func);
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
    Ferret::space( $context, $_ ) for qw(Socket Num Socket::TCP Str);
}

Ferret::runtime();
