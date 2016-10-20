# === Document Model ===
#  Document './test/10-irc-simple/Bot2.frt'
#      Class 'Bot2'
#          Class method 'initializer__'
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
#                              Argument list [1 item]
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
#                      Assignment
#                          Instance variable '@send'
#                          Instance variable '@println'
#                  On
#                      Expression ('on' parameter)
#                          Instance variable '@connected'
#                      Anonymous function
#                          Body ('function' scope)
#                              Instruction
#                                  Call
#                                      Instance variable '@send'
#                                      Argument list [1 item]
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
#                                      Argument list [1 item]
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
#                                      Argument list [1 item]
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
#                                      Argument list [1 item]
#                                          Item 0
#                                              Operation
#                                                  String 'send: '
#                                                  Addition operator (+)
#                                                  Lexical variable '$data'
#      Include (Num, Socket, Socket::TCP, Str)
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

my ( $self, $ins );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $pos = before_content( 'Bot2.frt', './test/10-irc-simple/Bot2.frt' );

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Anonymous function definition
    my $func_0 = function_def(
        $f, undef, undef,
        [],
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            $$self->{'send'}->(
                [
                    add(
                        $scope,
                        str( $f, "USER " ),
                        $$self->{'user'},
                        str( $f, " " ),
                        str( $f, "*" ),
                        str( $f, " " ),
                        str( $f, "*" ),
                        str( $f, " :" ),
                        $$self->{'real'}
                    )
                ],
                $scope, undef,
                $pos->(14.06667)
            );
            $$self->{'send'}->(
                [ add( $scope, str( $f, "NICK " ), $$self->{'nick'} ) ],
                $scope, undef, $pos->(15.2)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_1 = function_def(
        $f, undef, undef,
        [ { name => 'data', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'data', 20.2 ) or return;
            $$scope->{'say'}->(
                [ add( $scope, str( $f, "recv: " ), $$scope->{'data'} ) ],
                $scope, undef, $pos->(21.2)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_2 = function_def(
        $f, undef, undef,
        [ { name => 'data', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'data', 25.2 ) or return;
            $$scope->{'say'}->(
                [ add( $scope, str( $f, "send: " ), $$scope->{'data'} ) ],
                $scope, undef, $pos->(26.2)
            );
            return $ret;
        }
    );

    # Class 'Bot2'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Bot2', undef, undef );

        # Method event 'initializer__' definition
        my $method_0 = method_event_def(
            $f, $scope,
            'initializer__',
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
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $self, $args, 'address' ) or return;
                need( $self, $args, 'nick' )    or return;
                need( $self, $args, 'user' )    or return;
                want( $self, $args, 'port', 5.1, num( $f, "6667" ) );
                want( $self, $args, 'real', 5.4, str( $f, "Ferret IRC" ) );
                $$scope->{'Socket::TCP'}->property_u( 'init', $pos->(8.2) )->(
                    [ ${ $scope->{special} }->{'self'} ],
                    $scope, undef, $pos->(8.25)
                  )->(
                    [
                        undef,
                        [
                            addr => $$self->{'address'},
                            port => $$self->{'port'}
                        ]
                    ],
                    $scope, undef,
                    $pos->(8.4)
                  );
                $self->set_property(
                    send => $$self->{'println'},
                    $pos->(10.2)
                );
                on(
                    $self,
                    'connected',
                    $self, $scope,
                    $func_0->inside_scope(
                        (undef) => $scope,
                        undef, $class, $ins, undef, undef
                    ),
                    {}
                );
                on(
                    $self,
                    'gotLine',
                    $self, $scope,
                    $func_1->inside_scope(
                        (undef) => $scope,
                        undef, $class, $ins, undef, undef
                    ),
                    {}
                );
                on(
                    $self,
                    'println',
                    $self, $scope,
                    $func_2->inside_scope(
                        (undef) => $scope,
                        undef, $class, $ins, undef, undef
                    ),
                    {}
                );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Num Socket Socket::TCP Str) );
};

after_content();
