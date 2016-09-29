# === Document Model ===
#  Document './std/IRC/Connection.frt'
#      Package 'IRC'
#      Class 'Connection'
#          Instruction
#              Load
#                  Bareword 'Outgoing'
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Instance variable '@addr'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Need
#                          Instance variable '@nick'
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
#                      Want
#                          Instance variable '@handlers'
#                          Argument value
#                              Object [0 items]
#                  Instruction
#                      Call
#                          Special property '*addParent'
#                              Instance variable '@handlers'
#                          Argument list [1 items]
#                              Item 0
#                                  Property 'handlers'
#                                      Bareword 'IRC::Handlers'
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
#                  On ('handleLine' callback)
#                      Expression ('on' parameter)
#                          Property 'gotLine'
#                              Instance variable '@sock'
#                      Anonymous function
#                          Body ('function' scope)
#                              Instruction
#                                  Need
#                                      Lexical variable '$data'
#                              Instruction
#                                  Call
#                                      Instance variable '@_handleLine'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Lexical variable '$data'
#                  On ('resetState' callback)
#                      Expression ('on' parameter)
#                          Property 'disconnected'
#                              Instance variable '@sock'
#                      Anonymous function
#                          Body ('function' scope)
#                              Instruction
#                                  Call
#                                      Bareword 'resetState'
#                                      Argument list [0 items]
#          Method 'connect'
#              Body ('method' scope)
#                  Instruction
#                      Call
#                          Property 'connect'
#                              Instance variable '@sock'
#                          Argument list [0 items]
#          Method 'send'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$line'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      String 'send: '
#                                      Addition operator (+)
#                                      Lexical variable '$line'
#                  Instruction
#                      Call
#                          Property 'println'
#                              Instance variable '@sock'
#                          Argument list [1 items]
#                              Item 0
#                                  Lexical variable '$line'
#          Method '_handleLine'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$line'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
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
#                              Argument list [1 items]
#                                  Item 0
#                                      Lexical variable '$line'
#                  Instruction
#                      Call
#                          Maybe
#                              Property (name evaluated at runtime)
#                                  Instance variable '@handlers'
#                                  Property index [1 items]
#                                      Item 0
#                                          Property 'command'
#                                              Lexical variable '$msg'
#                          Named argument list [3 items]
#                              Item 0
#                                  Pair '_self'
#                                      Special variable '*self'
#                              Item 1
#                                  Pair 'line'
#                                      Lexical variable '$line'
#                              Item 2
#                                  Pair 'msg'
#                                      Lexical variable '$msg'
#          Method 'getChannel'
#              Body ('method' scope)
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
#                                  Index list [1 items]
#                                      Item 0
#                                          Property 'lowercase'
#                                              Lexical variable '$name'
#                      Body ('if' scope)
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
#              Body ('method' scope)
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
#                                  Index list [1 items]
#                                      Item 0
#                                          Property 'lowercase'
#                                              Lexical variable '$nick'
#                      Body ('if' scope)
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
#              Body ('method' scope)
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
#                                  Index list [1 items]
#                                      Item 0
#                                          Property 'lowercase'
#                                              Lexical variable '$name'
#                      Body ('if' scope)
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
#          Method 'resetState'
#              Body ('method' scope)
#                  Instruction
#                      Delete modifier
#                          Instance variable '@registered'
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
#      Include (Channel, IRC, IRC::Handlers, IRC::Massage, List, Num, Outgoing, Server, Socket, Socket::TCP, Str, User)
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

FF::before_content('Connection.frt');

use Ferret::Core::Operations qw(add bool num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'IRC' );
    my $scope = $file_scope;
    FF::load_core('IRC');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, undef,
        'sendRegistration',
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
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
                $scope, undef, 27.06667
            );
            $$self->{'send'}->(
                [ add( $scope, str( $f, "NICK " ), $$self->{'nick'} ) ],
                $scope, undef, 28.2
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_1 = FF::function_def(
        $f, undef,
        'handleLine',
        [ { name => 'data', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'data', 33.2 ) or return;
            $$self->{'_handleLine'}
              ->( [ $$scope->{'data'} ], $scope, undef, 34.2 );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_2 = FF::function_def(
        $f, undef,
        'resetState',
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $$scope->{'resetState'}->( {}, $scope, undef, 39.2 );
            return $ret;
        }
    );

    # Class 'Connection'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Connection', undef,
            undef );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'addr',
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
                { name => 'port', type => 'Num', optional => 1, more => undef },
                { name => 'user', type => 'Str', optional => 1, more => undef },
                { name => 'real', type => 'Str', optional => 1, more => undef },
                {
                    name     => 'autojoin',
                    type     => 'List',
                    optional => 1,
                    more     => undef
                },
                {
                    name     => 'handlers',
                    type     => undef,
                    optional => 1,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $self, $args, 'addr' ) or return;
                FF::need( $self, $args, 'nick' ) or return;
                FF::want( $self, $args, 'port', 8.2, num( $f, "6667" ) );
                FF::want( $self, $args, 'user', 9.2,  str( $f, "ferret" ) );
                FF::want( $self, $args, 'real', 10.2, str( $f, "Ferret IRC" ) );
                FF::want( $self, $args, 'autojoin', 11.2 );
                $self->set_property(
                    me => $$scope->{'User'}->(
                        {
                            connection => ${ $scope->{special} }->{'self'},
                            nick       => $$self->{'nick'},
                            user       => $$self->{'user'}
                        },
                        $scope, undef, 13.2
                    ),
                    13.1
                );
                $self->set_property( users => FF::create_hash( $f, {} ), 14.2 );
                $self->set_property(
                    channels => FF::create_hash( $f, {} ),
                    15.2
                );
                $self->set_property(
                    servers => FF::create_hash( $f, {} ),
                    16.2
                );
                FF::want( $self, $args, 'handlers', 19.2,
                    FF::create_object( $f, {} ) );
                ${ $$self->{'handlers'} }->{'*addParent'}->(
                    [ ${ $$scope->{'IRC::Handlers'} }->{'handlers'} ],
                    $scope, undef, 20.15
                );
                $self->set_property(
                    sock => $$scope->{'Socket::TCP'}->(
                        {
                            address  => $$self->{'addr'},
                            port     => $$self->{'port'},
                            readMode => FF::get_symbol( $f, 'line' )
                        },
                        $scope, undef, 23.3
                    ),
                    23.1
                );
                FF::on(
                    $$self->{'sock'},
                    'connected',
                    $self, $scope,
                    $func_0->inside_scope(
                        (undef) => $scope,
                        undef, $class, undef, undef
                    ),
                    {}
                );
                FF::on(
                    $$self->{'sock'},
                    'gotLine',
                    $self, $scope,
                    $func_1->inside_scope(
                        (undef) => $scope,
                        undef, $class, undef, undef
                    ),
                    {}
                );
                FF::on(
                    $$self->{'sock'},
                    'disconnected',
                    $self, $scope,
                    $func_2->inside_scope(
                        (undef) => $scope,
                        undef, $class, undef, undef
                    ),
                    {}
                );
                return $ret;
            }
        );

        # Method event 'connect' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'connect',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                ${ $$self->{'sock'} }->{'connect'}->( {}, $scope, undef, 47.3 );
                return $ret;
            }
        );

        # Method event 'send' definition
        my $method_2 = FF::method_event_def(
            $f, $scope, 'send',
            [
                {
                    name     => 'line',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'line', 52.2 ) or return;
                $$scope->{'say'}->(
                    [ add( $scope, str( $f, "send: " ), $$scope->{'line'} ) ],
                    $scope, undef, 53.2
                );
                ${ $$self->{'sock'} }->{'println'}
                  ->( [ $$scope->{'line'} ], $scope, undef, 54.3 );
                return $ret;
            }
        );

        # Method event '_handleLine' definition
        my $method_3 = FF::method_event_def(
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
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'line', 59.2 ) or return;
                $$scope->{'say'}->(
                    [ add( $scope, str( $f, "recv: " ), $$scope->{'line'} ) ],
                    $scope, undef, 60.2
                );
                FF::lex_assign(
                    $scope,
                    msg => $$scope->{'IRC::Massage'}
                      ->( [ $$scope->{'line'} ], $scope, undef, 63.3 ),
                    $file_scope, 63.1
                );
                {
                    my $maybe_0 = $$self->{'handlers'}
                      ->property_eval_u( ${ $$scope->{'msg'} }->{'command'} );
                    if ( bool($maybe_0) ) {
                        $maybe_0->(
                            {
                                _self => ${ $scope->{special} }->{'self'},
                                line  => $$scope->{'line'},
                                msg   => $$scope->{'msg'}
                            },
                            $scope, undef, 66.8
                        );
                    }
                }
                return $ret;
            }
        );

        # Method event 'getChannel' definition
        my $method_4 = FF::method_event_def(
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
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'name', 80.2 ) or return;
                if (
                    bool(
                        FF::lex_assign(
                            $scope,
                            channel => $$self->{'channels'}->get_index_value(
                                [ ${ $$scope->{'name'} }->{'lowercase'} ],
                                $scope, 81.25
                            ),
                            $file_scope,
                            81.15
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( $$scope->{'channel'} );
                }
                return $ret_func->(
                    $$scope->{'Channel'}->(
                        {
                            connection => ${ $scope->{special} }->{'self'},
                            name       => $$scope->{'name'}
                        },
                        $scope, undef, 83.15
                    )
                );
                return $ret;
            }
        );

        # Method event 'getUser' definition
        my $method_5 = FF::method_event_def(
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
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'nick', 88.2 ) or return;
                if (
                    bool(
                        FF::lex_assign(
                            $scope,
                            user => $$self->{'users'}->get_index_value(
                                [ ${ $$scope->{'nick'} }->{'lowercase'} ],
                                $scope, 89.25
                            ),
                            $file_scope,
                            89.15
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( $$scope->{'user'} );
                }
                return $ret_func->(
                    $$scope->{'User'}->(
                        {
                            connection => ${ $scope->{special} }->{'self'},
                            nick       => $$scope->{'nick'}
                        },
                        $scope, undef, 91.15
                    )
                );
                return $ret;
            }
        );

        # Method event 'getServer' definition
        my $method_6 = FF::method_event_def(
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
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'name', 96.2 ) or return;
                if (
                    bool(
                        FF::lex_assign(
                            $scope,
                            server => $$self->{'servers'}->get_index_value(
                                [ ${ $$scope->{'name'} }->{'lowercase'} ],
                                $scope, 97.25
                            ),
                            $file_scope,
                            97.15
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( $$scope->{'server'} );
                }
                return $ret_func->(
                    $$scope->{'Server'}->(
                        {
                            connection => ${ $scope->{special} }->{'self'},
                            name       => $$scope->{'name'}
                        },
                        $scope, undef, 99.15
                    )
                );
                return $ret;
            }
        );

        # Method event 'resetState' definition
        my $method_7 = FF::method_event_def(
            $f, $scope,
            'resetState',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $self->delete_property( 'registered', 105.1 );
                $self->set_property(
                    me => $$scope->{'User'}->(
                        {
                            connection => ${ $scope->{special} }->{'self'},
                            nick       => $$self->{'nick'},
                            user       => $$self->{'user'}
                        },
                        $scope, undef, 106.2
                    ),
                    106.1
                );
                $self->set_property(
                    users => FF::create_hash( $f, {} ),
                    107.2
                );
                $self->set_property(
                    channels => FF::create_hash( $f, {} ),
                    108.2
                );
                $self->set_property(
                    servers => FF::create_hash( $f, {} ),
                    109.2
                );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            connect => $scope,
            $proto, $class, undef, undef
        );
        $method_2->inside_scope( send => $scope, $proto, $class, undef, undef );
        $method_3->inside_scope(
            _handleLine => $scope,
            $proto, $class, undef, undef
        );
        $method_4->inside_scope(
            getChannel => $scope,
            $proto, $class, undef, undef
        );
        $method_5->inside_scope(
            getUser => $scope,
            $proto, $class, undef, undef
        );
        $method_6->inside_scope(
            getServer => $scope,
            $proto, $class, undef, undef
        );
        $method_7->inside_scope(
            resetState => $scope,
            $proto, $class, undef, undef
        );
    }
    FF::load_namespaces( $context,
        qw(Channel IRC IRC::Handlers IRC::Massage List Num Outgoing Server Socket Socket::TCP Str User)
    );
};

FF::after_content();
