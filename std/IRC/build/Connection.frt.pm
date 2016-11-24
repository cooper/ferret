# === Document Model ===
#  Document './std/IRC/Connection.frt'
#      Package 'IRC'
#      Class 'Connection'
#          Instruction
#              Load
#                  Bareword 'Outgoing'
#          Class method 'initializer__'
#              Function body
#                  Instruction
#                      Need
#                          Instance variable '@addr'
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
#                      Need
#                          Instance variable '@nick'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Want
#                          Instance variable '@user'
#                          Argument type
#                              Bareword 'Str'
#                          Argument value
#                              String 'ferret'
#                  Instruction
#                      Want
#                          Instance variable '@real'
#                          Argument type
#                              Bareword 'Str'
#                          Argument value
#                              String 'Ferret IRC'
#                  Instruction
#                      Want
#                          Instance variable '@autojoin'
#                          Argument type
#                              Bareword 'List'
#                  Instruction
#                      Assignment
#                          Instance variable '@handlers'
#                          Object [0 items]
#                  Instruction
#                      Call
#                          Special property '*addParent'
#                              Instance variable '@handlers'
#                          Argument list [1 item]
#                              Item 0
#                                  Property 'handlers'
#                                      Bareword 'Handlers'
#                  Instruction
#                      Assignment
#                          Instance variable '@server'
#                          Call
#                              Bareword 'Server'
#                              Named argument list [2 items]
#                                  Item 0
#                                      Pair 'connection'
#                                          Special variable '*self'
#                                  Item 1
#                                      Pair 'name'
#                                          Instance variable '@addr'
#                  Instruction
#                      Assignment
#                          Instance variable '@me'
#                          Call
#                              Bareword 'User'
#                              Named argument list [3 items]
#                                  Item 0
#                                      Pair 'connection'
#                                          Special variable '*self'
#                                  Item 1
#                                      Pair 'nick'
#                                          Instance variable '@nick'
#                                  Item 2
#                                      Pair 'user'
#                                          Instance variable '@user'
#                  Instruction
#                      Assignment
#                          Instance variable '@users'
#                          Hash [0 items]
#                  Instruction
#                      Assignment
#                          Instance variable '@channels'
#                          Hash [0 items]
#                  Instruction
#                      Assignment
#                          Instance variable '@servers'
#                          Hash [0 items]
#                  Instruction
#                      Assignment
#                          Instance variable '@sock'
#                          Call
#                              Bareword 'Socket::TCP'
#                              Named argument list [3 items]
#                                  Item 0
#                                      Pair 'address'
#                                          Instance variable '@addr'
#                                  Item 1
#                                      Pair 'port'
#                                          Instance variable '@port'
#                                  Item 2
#                                      Pair 'readMode'
#                                          Symbol :line
#                  On ('sendRegistration' callback)
#                      Expression ('on' parameter)
#                          Property 'connected'
#                              Instance variable '@sock'
#                      Anonymous function
#                          Function body
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
#                              Instruction
#                                  Call
#                                      Instance variable '@connected'
#                                      Argument list [0 items]
#                  On ('handleLine' callback)
#                      Expression ('on' parameter)
#                          Property 'gotLine'
#                              Instance variable '@sock'
#                      Anonymous function
#                          Function body
#                              Instruction
#                                  Need
#                                      Lexical variable '$data'
#                              Instruction
#                                  Call
#                                      Instance variable '@_handleLine'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Lexical variable '$data'
#                  On ('resetState' callback)
#                      Expression ('on' parameter)
#                          Property 'disconnected'
#                              Instance variable '@sock'
#                      Anonymous function
#                          Function body
#                              Instruction
#                                  Call
#                                      Instance variable '@_resetState'
#                                      Argument list [0 items]
#          Method 'connect'
#              Function body
#                  Instruction
#                      Call
#                          Property 'connect'
#                              Instance variable '@sock'
#                          Argument list [0 items]
#          Method 'send'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$line'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 item]
#                              Item 0
#                                  Operation
#                                      String 'send: '
#                                      Addition operator (+)
#                                      Lexical variable '$line'
#                  Instruction
#                      Call
#                          Property 'println'
#                              Instance variable '@sock'
#                          Argument list [1 item]
#                              Item 0
#                                  Lexical variable '$line'
#          Method '_handleLine'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$line'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 item]
#                              Item 0
#                                  Operation
#                                      String 'recv: '
#                                      Addition operator (+)
#                                      Lexical variable '$line'
#                  Instruction
#                      Assignment
#                          Lexical variable '$msg'
#                          Call
#                              Bareword 'IRC::Massage'
#                              Argument list [2 items]
#                                  Item 0
#                                      Lexical variable '$line'
#                                  Item 1
#                                      Special variable '*self'
#                  Instruction
#                      Call
#                          Maybe
#                              Property (name evaluated at runtime)
#                                  Instance variable '@handlers'
#                                  Property index [1 item]
#                                      Item 0
#                                          Property 'command'
#                                              Lexical variable '$msg'
#                          Named argument list [3 items]
#                              Item 0
#                                  Pair '_this'
#                                      Special variable '*self'
#                              Item 1
#                                  Pair 'line'
#                                      Lexical variable '$line'
#                              Item 2
#                                  Pair 'msg'
#                                      Lexical variable '$msg'
#          Method 'getTarget'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$target'
#                          Argument type
#                              Bareword 'Str'
#                  If
#                      Expression ('if' parameter)
#                          Call
#                              Property 'hasPrefix'
#                                  Lexical variable '$target'
#                              Argument list [1 item]
#                                  Item 0
#                                      String '#'
#                      If body
#                          Instruction
#                              Return
#                                  Call
#                                      Instance variable '@getChannel'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Lexical variable '$target'
#                  Else
#                      Else body
#                          Instruction
#                              Return
#                                  Call
#                                      Instance variable '@getUser'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Lexical variable '$target'
#          Method 'getChannel'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$name'
#                          Argument type
#                              Bareword 'Str'
#                  If
#                      Expression ('if' parameter)
#                          Assignment
#                              Lexical variable '$channel'
#                              Index
#                                  Instance variable '@channels'
#                                  Index list [1 item]
#                                      Item 0
#                                          Property 'lowercase'
#                                              Lexical variable '$name'
#                      If body
#                          Instruction
#                              Return
#                                  Lexical variable '$channel'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Channel'
#                              Named argument list [2 items]
#                                  Item 0
#                                      Pair 'connection'
#                                          Special variable '*self'
#                                  Item 1
#                                      Pair 'name'
#                                          Lexical variable '$name'
#          Method 'getUser'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$nick'
#                          Argument type
#                              Bareword 'Str'
#                  If
#                      Expression ('if' parameter)
#                          Assignment
#                              Lexical variable '$user'
#                              Index
#                                  Instance variable '@users'
#                                  Index list [1 item]
#                                      Item 0
#                                          Property 'lowercase'
#                                              Lexical variable '$nick'
#                      If body
#                          Instruction
#                              Return
#                                  Lexical variable '$user'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'User'
#                              Named argument list [2 items]
#                                  Item 0
#                                      Pair 'connection'
#                                          Special variable '*self'
#                                  Item 1
#                                      Pair 'nick'
#                                          Lexical variable '$nick'
#          Method 'getServer'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$name'
#                          Argument type
#                              Bareword 'Str'
#                  If
#                      Expression ('if' parameter)
#                          Assignment
#                              Lexical variable '$server'
#                              Index
#                                  Instance variable '@servers'
#                                  Index list [1 item]
#                                      Item 0
#                                          Property 'lowercase'
#                                              Lexical variable '$name'
#                      If body
#                          Instruction
#                              Return
#                                  Lexical variable '$server'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Server'
#                              Named argument list [2 items]
#                                  Item 0
#                                      Pair 'connection'
#                                          Special variable '*self'
#                                  Item 1
#                                      Pair 'name'
#                                          Lexical variable '$name'
#          Method 'connected'
#          Method 'disconnected'
#              Function body
#                  Instruction
#                      Assignment
#                          Instance variable '@users'
#                          Hash [0 items]
#                  Instruction
#                      Assignment
#                          Instance variable '@servers'
#                          Hash [0 items]
#                  Instruction
#                      Assignment
#                          Instance variable '@channels'
#                          Hash [0 items]
#          Method 'copy'
#              Function body
#                  Instruction
#                      Return
#                          Call
#                              Special variable '*class'
#                              Named argument list [6 items]
#                                  Item 0
#                                      Pair 'addr'
#                                          Instance variable '@addr'
#                                  Item 1
#                                      Pair 'port'
#                                          Instance variable '@port'
#                                  Item 2
#                                      Pair 'nick'
#                                          Instance variable '@nick'
#                                  Item 3
#                                      Pair 'user'
#                                          Instance variable '@user'
#                                  Item 4
#                                      Pair 'real'
#                                          Instance variable '@real'
#                                  Item 5
#                                      Pair 'autojoin'
#                                          Call
#                                              Property 'copy'
#                                                  Instance variable '@autojoin'
#                                              Argument list [0 items]
#          Method 'description'
#              Function body
#                  Instruction
#                      Return
#                          Operation
#                              String 'IRC::Conne...'
#                              Addition operator (+)
#                              Instance variable '@addr'
#                              Addition operator (+)
#                              String '/'
#                              Addition operator (+)
#                              Instance variable '@port'
#                              Addition operator (+)
#                              String ')'
#      Include (Channel, Handlers, IRC, IRC::Massage, List, Num, Outgoing, Server, Socket, Socket::TCP, Str, User)
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

my $pos = before_content( 'Connection.frt', './std/IRC/Connection.frt' );

use Ferret::Core::Operations qw(add bool num str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'IRC' );
    my $scope = $file_scope;
    load_core('IRC');

    # Anonymous function definition
    my $func_0 = function_def(
        $f, undef,
        'sendRegistration',
        undef, undef,
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
                $pos->(30.06667)
            );
            $$self->{'send'}->(
                [ add( $scope, str( $f, "NICK " ), $$self->{'nick'} ) ],
                $scope, undef, $pos->(31.2)
            );
            $$self->{'connected'}
              ->( [ undef, [] ], $scope, undef, $pos->(32.2) );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_1 = function_def(
        $f, undef,
        'handleLine',
        [ { name => 'data', type => undef, optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'data', 37.2 ) || return $ret_func->();
            $$self->{'_handleLine'}
              ->( [ $$scope->{'data'} ], $scope, undef, $pos->(38.2) );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_2 = function_def(
        $f, undef,
        'resetState',
        undef, undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            $$self->{'_resetState'}
              ->( [ undef, [] ], $scope, undef, $pos->(43.2) );
            return $ret;
        }
    );

    # Class 'Connection'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Connection', undef, undef );

        # Method event 'initializer__' definition
        my $func_3 = method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'addr',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                { name => 'port', type => 'Num', optional => 1, more => undef },
                {
                    name     => 'nick',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                { name => 'user', type => 'Str', optional => 1, more => undef },
                { name => 'real', type => 'Str', optional => 1, more => undef },
                {
                    name     => 'autojoin',
                    type     => 'List',
                    optional => 1,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $self, $args, 'addr' ) || return $ret_func->();
                want( $self, $args, 'port', 8.2, num( $f, "6667" ) );
                need( $self, $args, 'nick' ) || return $ret_func->();
                want( $self, $args, 'user', 10.2, str( $f, "ferret" ) );
                want( $self, $args, 'real', 11.2, str( $f, "Ferret IRC" ) );
                want( $self, $args, 'autojoin', 12.2 );
                $self->set_property(
                    handlers => create_object( $f, [] ),
                    $pos->(15.2)
                );
                $$self->{'handlers'}->property_u( '*addParent', $pos->(16.2) )
                  ->(
                    [
                        $$scope->{'Handlers'}
                          ->property_u( 'handlers', $pos->(16.5) )
                    ],
                    $scope, undef,
                    $pos->(16.3)
                  );
                $self->set_property(
                    server => $$scope->{'Server'}->(
                        [
                            undef,
                            [
                                connection => ${ $scope->{special} }->{'self'},
                                name       => $$self->{'addr'}
                            ]
                        ],
                        $scope, undef,
                        $pos->(19.2)
                    ),
                    $pos->(19.1)
                );
                $self->set_property(
                    me => $$scope->{'User'}->(
                        [
                            undef,
                            [
                                connection => ${ $scope->{special} }->{'self'},
                                nick       => $$self->{'nick'},
                                user       => $$self->{'user'}
                            ]
                        ],
                        $scope, undef,
                        $pos->(20.2)
                    ),
                    $pos->(20.1)
                );
                $self->set_property(
                    users => create_hash( $f, [] ),
                    $pos->(21.2)
                );
                $self->set_property(
                    channels => create_hash( $f, [] ),
                    $pos->(22.2)
                );
                $self->set_property(
                    servers => create_hash( $f, [] ),
                    $pos->(23.2)
                );
                $self->set_property(
                    sock => $$scope->{'Socket::TCP'}->(
                        [
                            undef,
                            [
                                address  => $$self->{'addr'},
                                port     => $$self->{'port'},
                                readMode => get_symbol( $f, 'line' )
                            ]
                        ],
                        $scope, undef,
                        $pos->(26.3)
                    ),
                    $pos->(26.1)
                );
                on(
                    $$self->{'sock'},
                    'connected',
                    $self, $scope,
                    $func_0->inside_scope(
                        (undef) => $scope,
                        undef, $class, $ins, undef, undef
                    ),
                    {}
                );
                on(
                    $$self->{'sock'},
                    'gotLine',
                    $self, $scope,
                    $func_1->inside_scope(
                        (undef) => $scope,
                        undef, $class, $ins, undef, undef
                    ),
                    {}
                );
                on(
                    $$self->{'sock'},
                    'disconnected',
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

        # Method event 'connect' definition
        my $func_4 = method_event_def(
            $f, $scope,
            'connect',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                $$self->{'sock'}->property_u( 'connect', $pos->(51.2) )
                  ->( [ undef, [] ], $scope, undef, $pos->(51.3) );
                return $ret;
            }
        );

        # Method event 'send' definition
        my $func_5 = method_event_def(
            $f, $scope, 'send',
            [
                {
                    name     => 'line',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'line', 56.2 ) || return $ret_func->();
                $$scope->{'say'}->(
                    [ add( $scope, str( $f, "send: " ), $$scope->{'line'} ) ],
                    $scope, undef, $pos->(57.2)
                );
                $$self->{'sock'}->property_u( 'println', $pos->(58.2) )
                  ->( [ $$scope->{'line'} ], $scope, undef, $pos->(58.3) );
                return $ret;
            }
        );

        # Method event '_handleLine' definition
        my $func_6 = method_event_def(
            $f, $scope,
            '_handleLine',
            [
                {
                    name     => 'line',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'line', 63.2 ) || return $ret_func->();
                $$scope->{'say'}->(
                    [ add( $scope, str( $f, "recv: " ), $$scope->{'line'} ) ],
                    $scope, undef, $pos->(64.2)
                );
                var(
                    $scope,
                    msg => $$scope->{'IRC::Massage'}->(
                        [ $$scope->{'line'}, ${ $scope->{special} }->{'self'} ],
                        $scope,
                        undef,
                        $pos->(67.3)
                    ),
                    $file_scope,
                    $pos->(67.1)
                );
                {
                    my $maybe_0 = $$self->{'handlers'}->property_u(
                        $$scope->{'msg'}->property_u( 'command', $pos->(70.5) ),
                        $pos->(70.2)
                    );
                    if ( bool($maybe_0) ) {
                        $maybe_0->(
                            [
                                undef,
                                [
                                    _this => ${ $scope->{special} }->{'self'},
                                    line  => $$scope->{'line'},
                                    msg   => $$scope->{'msg'}
                                ]
                            ],
                            $scope, undef,
                            $pos->(70.8)
                        );
                    }
                }
                return $ret;
            }
        );

        # Method event 'getTarget' definition
        my $func_7 = method_event_def(
            $f, $scope,
            'getTarget',
            [
                {
                    name     => 'target',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'target', 84.2 ) || return $ret_func->();
                if (
                    bool(
                        $$scope->{'target'}
                          ->property_u( 'hasPrefix', $pos->(86.3) )
                          ->( [ str( $f, "#" ) ], $scope, undef, $pos->(86.4) )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $$self->{'getChannel'}->(
                            [ $$scope->{'target'} ], $scope,
                            undef,                   $pos->(87.3)
                        )
                    );
                }
                else {
                    return $ret_func->(
                        $$self->{'getUser'}->(
                            [ $$scope->{'target'} ], $scope,
                            undef,                   $pos->(89.3)
                        )
                    );
                }
                return $ret;
            }
        );

        # Method event 'getChannel' definition
        my $func_8 = method_event_def(
            $f, $scope,
            'getChannel',
            [
                {
                    name     => 'name',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'name', 94.2 ) || return $ret_func->();
                if (
                    bool(
                        var(
                            $scope,
                            channel => $$self->{'channels'}->get_index_value(
                                [
                                    $$scope->{'name'}->property_u(
                                        'lowercase', $pos->(95.35)
                                    )
                                ],
                                $scope,
                                $pos->(95.25)
                            ),
                            $file_scope,
                            $pos->(95.15)
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( $$scope->{'channel'} );
                }
                return $ret_func->(
                    $$scope->{'Channel'}->(
                        [
                            undef,
                            [
                                connection => ${ $scope->{special} }->{'self'},
                                name       => $$scope->{'name'}
                            ]
                        ],
                        $scope, undef,
                        $pos->(97.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'getUser' definition
        my $func_9 = method_event_def(
            $f, $scope,
            'getUser',
            [
                {
                    name     => 'nick',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'nick', 102.2 ) || return $ret_func->();
                if (
                    bool(
                        var(
                            $scope,
                            user => $$self->{'users'}->get_index_value(
                                [
                                    $$scope->{'nick'}->property_u(
                                        'lowercase', $pos->(103.35)
                                    )
                                ],
                                $scope,
                                $pos->(103.25)
                            ),
                            $file_scope,
                            $pos->(103.15)
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( $$scope->{'user'} );
                }
                return $ret_func->(
                    $$scope->{'User'}->(
                        [
                            undef,
                            [
                                connection => ${ $scope->{special} }->{'self'},
                                nick       => $$scope->{'nick'}
                            ]
                        ],
                        $scope, undef,
                        $pos->(105.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'getServer' definition
        my $func_10 = method_event_def(
            $f, $scope,
            'getServer',
            [
                {
                    name     => 'name',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'name', 110.2 ) || return $ret_func->();
                if (
                    bool(
                        var(
                            $scope,
                            server => $$self->{'servers'}->get_index_value(
                                [
                                    $$scope->{'name'}->property_u(
                                        'lowercase', $pos->(111.35)
                                    )
                                ],
                                $scope,
                                $pos->(111.25)
                            ),
                            $file_scope,
                            $pos->(111.15)
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( $$scope->{'server'} );
                }
                return $ret_func->(
                    $$scope->{'Server'}->(
                        [
                            undef,
                            [
                                connection => ${ $scope->{special} }->{'self'},
                                name       => $$scope->{'name'}
                            ]
                        ],
                        $scope, undef,
                        $pos->(113.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'connected' definition
        my $func_11 = method_event_def( $f, $scope, 'connected' );

        # Method event 'disconnected' definition
        my $func_12 = method_event_def(
            $f, $scope,
            'disconnected',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                $self->set_property(
                    users => create_hash( $f, [] ),
                    $pos->(124.2)
                );
                $self->set_property(
                    servers => create_hash( $f, [] ),
                    $pos->(125.2)
                );
                $self->set_property(
                    channels => create_hash( $f, [] ),
                    $pos->(126.2)
                );
                return $ret;
            }
        );

        # Method event 'copy' definition
        my $func_13 = method_event_def(
            $f, $scope, 'copy', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    ${ $scope->{special} }->{'class'}->(
                        [
                            undef,
                            [
                                addr     => $$self->{'addr'},
                                port     => $$self->{'port'},
                                nick     => $$self->{'nick'},
                                user     => $$self->{'user'},
                                real     => $$self->{'real'},
                                autojoin => $$self->{'autojoin'}
                                  ->property_u( 'copy', $pos->(139.3) )->(
                                    [ undef, [] ], $scope,
                                    undef, $pos->(139.4)
                                  )
                            ]
                        ],
                        $scope, undef,
                        $pos->(133.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $func_14 = method_event_def(
            $f, $scope,
            'description',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    add(
                        $scope,           str( $f, "IRC::Connection(" ),
                        $$self->{'addr'}, str( $f, "/" ),
                        $$self->{'port'}, str( $f, ")" )
                    )
                );
                return $ret;
            }
        );
        $func_3->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_4->inside_scope(
            connect => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_5->inside_scope(
            send => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_6->inside_scope(
            _handleLine => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_7->inside_scope(
            getTarget => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_8->inside_scope(
            getChannel => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_9->inside_scope(
            getUser => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_10->inside_scope(
            getServer => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_11->inside_scope(
            connected => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_12->inside_scope(
            disconnected => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_13->inside_scope(
            copy => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_14->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context,
        qw(Channel Handlers IRC IRC::Massage List Num Outgoing Server Socket Socket::TCP Str User)
    );
};

after_content();
