# === Document Model ===
#  Document './test/hello20/IRC/Bot.frt'
#      Package 'IRC'
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
#                  Want
#                      Instance variable '@port'
#                      Expression ('want' parameter)
#                          Number '6667'
#                      Bareword 'Num'
#              Instruction
#                  Want
#                      Instance variable '@user'
#                      Expression ('want' parameter)
#                          String 'ferret'
#                      Bareword 'Str'
#              Instruction
#                  Want
#                      Instance variable '@real'
#                      Expression ('want' parameter)
#                          String 'Ferret IRC'
#                      Bareword 'Str'
#              Instruction
#                  Assignment
#                      Instance variable '@handlers'
#                      Hash [3 items]
#                          Item 0
#                              Pair 'MODE'
#                                  Bareword '_joinChannels'
#                          Item 1
#                              Pair 'PING'
#                                  Bareword '_pong'
#                          Item 2
#                              Pair 'PRIVMSG'
#                                  Bareword '_handleMessage'
#              Instruction
#                  Assignment
#                      Instance variable '@commands'
#                      Hash [3 items]
#                          Item 0
#                              Pair 'hello'
#                                  Bareword '_commandHello'
#                          Item 1
#                              Pair 'hi'
#                                  Bareword '_commandHello'
#                          Item 2
#                              Pair 'add'
#                                  Bareword '_commandAdd'
#              Instruction
#                  Assignment
#                      Instance variable '@factoids'
#                      Hash [0 items]
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
#                              Structural list [1 items]
#                                  Item 0
#                                      Operation
#                                          String 'NICK '
#                                          Addition operator (+)
#                                          Instance variable '@nick'
#              On
#                  Expression ('on' parameter)
#                      Property 'gotLine'
#                          Instance variable '@sock'
#                  Function 'callback'
#                      Instruction
#                          Need
#                              Lexical variable '$data'
#                      Instruction
#                          Call
#                              Instance variable '@handleLine'
#                              Structural list [1 items]
#                                  Item 0
#                                      Lexical variable '$data'
#          Method 'addCommand'
#              Instruction
#                  Need
#                      Lexical variable '$command'
#                      Bareword 'Str'
#              Instruction
#                  Need
#                      Lexical variable '$callback'
#                      Bareword 'Func'
#              If
#                  Expression ('if' parameter)
#                      Index
#                          Instance variable '@commands'
#                          Structural list [1 items]
#                              Item 0
#                                  Lexical variable '$command'
#                  Instruction
#                      Return pair 'overwrote'
#                          Boolean true
#              Instruction
#                  Assignment
#                      Index
#                          Instance variable '@commands'
#                          Structural list [1 items]
#                              Item 0
#                                  Lexical variable '$command'
#                      Lexical variable '$callback'
#              Instruction
#                  Return pair 'added'
#                      Boolean true
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
#                      Structural list [1 items]
#                          Item 0
#                              Operation
#                                  String 'send: '
#                                  Addition operator (+)
#                                  Lexical variable '$line'
#              Instruction
#                  Call
#                      Property 'println'
#                          Instance variable '@sock'
#                      Structural list [1 items]
#                          Item 0
#                              Lexical variable '$line'
#          Method 'handleLine'
#              Instruction
#                  Need
#                      Lexical variable '$line'
#              Instruction
#                  Assignment
#                      Lexical variable '$s'
#                      Call
#                          Property 'split'
#                              Lexical variable '$line'
#                          Structural list [1 items]
#                              Item 0
#                                  String ' '
#              Instruction
#                  Assignment
#                      Lexical variable '$command'
#                      Index
#                          Lexical variable '$s'
#                          Structural list [1 items]
#                              Item 0
#                                  Number '1'
#              If
#                  Expression ('if' parameter)
#                      Equality
#                          Index
#                              Lexical variable '$s'
#                              Structural list [1 items]
#                                  Item 0
#                                      Number '0'
#                          String 'PING'
#                  Instruction
#                      Assignment
#                          Lexical variable '$command'
#                          Index
#                              Lexical variable '$s'
#                              Structural list [1 items]
#                                  Item 0
#                                      Number '0'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Structural list [1 items]
#                          Item 0
#                              Operation
#                                  String 'recv['
#                                  Addition operator (+)
#                                  Lexical variable '$command'
#                                  Addition operator (+)
#                                  String ']: '
#                                  Addition operator (+)
#                                  Lexical variable '$line'
#              Instruction
#                  Call
#                      Maybe
#                          Index
#                              Instance variable '@handlers'
#                              Structural list [1 items]
#                                  Item 0
#                                      Lexical variable '$command'
#                      Hash [4 items]
#                          Item 0
#                              Pair 'line'
#                                  Lexical variable '$line'
#                          Item 1
#                              Pair '_self'
#                                  Special variable '*self'
#                          Item 2
#                              Pair 'command'
#                                  Lexical variable '$command'
#                          Item 3
#                              Pair 's'
#                                  Lexical variable '$s'
#          Method 'privmsg'
#              Instruction
#                  Need
#                      Lexical variable '$channel'
#              Instruction
#                  Need
#                      Lexical variable '$message'
#              For
#                  Expression ('for' parameter)
#                      Lexical variable '$line'
#                  Expression ('in' parameter)
#                      Call
#                          Property 'split'
#                              Lexical variable '$message'
#                          Structural list [1 items]
#                              Item 0
#                                  String '␤'
#                  Instruction
#                      Call
#                          Instance variable '@send'
#                          Structural list [1 items]
#                              Item 0
#                                  Operation
#                                      String 'PRIVMSG '
#                                      Addition operator (+)
#                                      Lexical variable '$channel'
#                                      Addition operator (+)
#                                      String ' :'
#                                      Addition operator (+)
#                                      Lexical variable '$line'
#          Function '_joinChannels'
#              If
#                  Expression ('if' parameter)
#                      Instance variable '@_joinedChannels'
#                  Instruction
#                      Return
#              Instruction
#                  Assignment
#                      Instance variable '@_joinedChannels'
#                      Boolean true
#              If
#                  Expression ('if' parameter)
#                      Instance variable '@autojoin'
#                  For
#                      Expression ('for' parameter)
#                          Lexical variable '$chan'
#                      Expression ('in' parameter)
#                          Instance variable '@autojoin'
#                      Instruction
#                          Call
#                              Instance variable '@send'
#                              Structural list [1 items]
#                                  Item 0
#                                      Operation
#                                          String 'JOIN '
#                                          Addition operator (+)
#                                          Lexical variable '$chan'
#          Function '_pong'
#              Instruction
#                  Need
#                      Lexical variable '$s'
#              Instruction
#                  Call
#                      Instance variable '@send'
#                      Structural list [1 items]
#                          Item 0
#                              Operation
#                                  String 'PONG '
#                                  Addition operator (+)
#                                  Index
#                                      Lexical variable '$s'
#                                      Structural list [1 items]
#                                          Item 0
#                                              Number '1'
#          Function '_handleMessage'
#              Instruction
#                  Need
#                      Lexical variable '$line'
#              Instruction
#                  Need
#                      Lexical variable '$s'
#              Instruction
#                  Assignment
#                      Lexical variable '$msg'
#                      Call
#                          Bareword 'IRC::Message'
#                          Structural list [1 items]
#                              Item 0
#                                  Lexical variable '$line'
#              If
#                  Expression ('if' parameter)
#                      Call
#                          Property 'command'
#                              Lexical variable '$msg'
#                          Structural list [0 items]
#                  Instruction
#                      Call
#                          Maybe
#                              Index
#                                  Instance variable '@commands'
#                                  Structural list [1 items]
#                                      Item 0
#                                          Call
#                                              Property 'command'
#                                                  Lexical variable '$msg'
#                                              Structural list [0 items]
#                          Hash [4 items]
#                              Item 0
#                                  Pair '_self'
#                                      Special variable '*self'
#                              Item 1
#                                  Pair 'line'
#                                      Lexical variable '$line'
#                              Item 2
#                                  Pair 's'
#                                      Lexical variable '$s'
#                              Item 3
#                                  Pair 'msg'
#                                      Lexical variable '$msg'
#          Function '_commandHello'
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#              Instruction
#                  Assignment
#                      Lexical variable '$nickname'
#                      Property 'nickname'
#                          Lexical variable '$msg'
#              Instruction
#                  Call
#                      Instance variable '@privmsg'
#                      Structural list [2 items]
#                          Item 0
#                              Property 'channel'
#                                  Lexical variable '$msg'
#                          Item 1
#                              Operation
#                                  String 'Hi '
#                                  Addition operator (+)
#                                  Lexical variable '$nickname'
#                                  Addition operator (+)
#                                  String '!'
#          Function '_commandAdd'
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#              Instruction
#                  Call
#                      Bareword 'inspect'
#                      Structural list [1 items]
#                          Item 0
#                              Lexical variable '$msg'
#              Instruction
#                  Assignment
#                      Lexical variable '$trigger'
#                      Index
#                          Property 'parts'
#                              Lexical variable '$msg'
#                          Structural list [1 items]
#                              Item 0
#                                  Number '1'
#              Instruction
#                  Assignment
#                      Lexical variable '$response'
#                      Call
#                          Property 'fromWord'
#                              Lexical variable '$msg'
#                          Structural list [1 items]
#                              Item 0
#                                  Number '2'
#              Instruction
#                  Assignment
#                      Index
#                          Instance variable '@factoids'
#                          Structural list [1 items]
#                              Item 0
#                                  Lexical variable '$trigger'
#                      Lexical variable '$response'
#              Instruction
#                  Assignment
#                      Index
#                          Instance variable '@commands'
#                          Structural list [1 items]
#                              Item 0
#                                  Lexical variable '$trigger'
#                      Bareword '_commandFactoid'
#              Instruction
#                  Call
#                      Instance variable '@privmsg'
#                      Structural list [2 items]
#                          Item 0
#                              Property 'channel'
#                                  Lexical variable '$msg'
#                          Item 1
#                              Operation
#                                  String 'alright, a...'
#                                  Addition operator (+)
#                                  Lexical variable '$trigger'
#                                  Addition operator (+)
#                                  String ' with ''
#                                  Addition operator (+)
#                                  Lexical variable '$response'
#                                  Addition operator (+)
#                                  String '''
#          Function '_commandFactoid'
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#              Instruction
#                  Assignment
#                      Lexical variable '$response'
#                      Index
#                          Instance variable '@factoids'
#                          Structural list [1 items]
#                              Item 0
#                                  Call
#                                      Property 'command'
#                                          Lexical variable '$msg'
#                                      Structural list [0 items]
#              Instruction
#                  Call
#                      Instance variable '@privmsg'
#                      Structural list [2 items]
#                          Item 0
#                              Property 'channel'
#                                  Lexical variable '$msg'
#                          Item 1
#                              Lexical variable '$response'
#      Include (Func, IRC, IRC::Message, Num, Socket, Socket::TCP, Str)
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
$Ferret::tried_files{'Bot.frt.pm'}++;

use Ferret::Core::Operations qw(add bool num str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('IRC');

    # Anonymous function definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, anonymous => 1 );

        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $self->property_u('send')->call(
                [
                    add(
                        $scope,                    str( $f, "USER " ),
                        $self->property_u('user'), str( $f, " * * :" ),
                        $self->property_u('real')
                    )
                ],
                $scope
            );
            $self->property_u('send')->call(
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
        $func->add_argument( name => 'data' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{data};
                $scope->set_property( data => $arguments->{data} );
            };
            $self->property_u('handleLine')
              ->call( [ $scope->property_u('data') ], $scope );
            return $return;
        };
    }

    # Function event '_joinChannels' callback definition
    {
        my $func = Ferret::Function->new( $f, name => 'default' );

        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            if ( bool( $self->property_u('_joinedChannels') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $return;
            }
            $self->set_property( _joinedChannels => Ferret::true );
            if ( bool( $self->property_u('autojoin') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                foreach ( $self->property_u('autojoin')->iterate ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );
                    $scope->set_property( chan => $_ );

                    $self->property_u('send')->call(
                        [
                            add(
                                $scope,
                                str( $f, "JOIN " ),
                                $scope->property_u('chan')
                            )
                        ],
                        $scope
                    );
                }
            }
            return $return;
        };
        $funcs[2] = Ferret::Event->new(
            $f,
            name         => '_joinChannels',
            default_func => [ undef, $func ]
        );
    }

    # Function event '_pong' callback definition
    {
        my $func = Ferret::Function->new( $f, name => 'default' );
        $func->add_argument( name => 's' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{s};
                $scope->set_property( s => $arguments->{s} );
            };
            $self->property_u('send')->call(
                [
                    add(
                        $scope,
                        str( $f, "PONG " ),
                        $scope->property_u('s')
                          ->get_index_value( [ num( $f, 1 ) ], $scope )
                    )
                ],
                $scope
            );
            return $return;
        };
        $funcs[3] = Ferret::Event->new(
            $f,
            name         => '_pong',
            default_func => [ undef, $func ]
        );
    }

    # Function event '_handleMessage' callback definition
    {
        my $func = Ferret::Function->new( $f, name => 'default' );
        $func->add_argument( name => 'line' );
        $func->add_argument( name => 's' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{line};
                $scope->set_property( line => $arguments->{line} );
            };
            do {
                return unless defined $arguments->{s};
                $scope->set_property( s => $arguments->{s} );
            };
            $scope->set_property_ow( $context,
                msg => $scope->property_u('IRC::Message')
                  ->call( [ $scope->property_u('line') ], $scope ) );
            if (
                bool(
                    $scope->property_u('msg')->property_u('command')
                      ->call( {}, $scope )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                {
                    my $maybe_0 =
                      $self->property_u('commands')->get_index_value(
                        [
                            $scope->property_u('msg')->property_u('command')
                              ->call( {}, $scope )
                        ],
                        $scope
                      );
                    if ( bool($maybe_0) ) {
                        $maybe_0->call(
                            {
                                _self => $scope->{special}->property_u('self'),
                                line  => $scope->property_u('line'),
                                s     => $scope->property_u('s'),
                                msg   => $scope->property_u('msg')
                            },
                            $scope
                        );
                    }
                }
            }
            return $return;
        };
        $funcs[4] = Ferret::Event->new(
            $f,
            name         => '_handleMessage',
            default_func => [ undef, $func ]
        );
    }

    # Function event '_commandHello' callback definition
    {
        my $func = Ferret::Function->new( $f, name => 'default' );
        $func->add_argument( name => 'msg' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{msg};
                $scope->set_property( msg => $arguments->{msg} );
            };
            $scope->set_property_ow( $context,
                nickname => $scope->property_u('msg')->property_u('nickname') );
            $self->property_u('privmsg')->call(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    add(
                        $scope,                         str( $f, "Hi " ),
                        $scope->property_u('nickname'), str( $f, "!" )
                    )
                ],
                $scope
            );
            return $return;
        };
        $funcs[5] = Ferret::Event->new(
            $f,
            name         => '_commandHello',
            default_func => [ undef, $func ]
        );
    }

    # Function event '_commandAdd' callback definition
    {
        my $func = Ferret::Function->new( $f, name => 'default' );
        $func->add_argument( name => 'msg' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{msg};
                $scope->set_property( msg => $arguments->{msg} );
            };
            $scope->property_u('inspect')
              ->call( [ $scope->property_u('msg') ], $scope );
            $scope->set_property_ow( $context,
                trigger => $scope->property_u('msg')->property_u('parts')
                  ->get_index_value( [ num( $f, 1 ) ], $scope ) );
            $scope->set_property_ow( $context,
                response => $scope->property_u('msg')->property_u('fromWord')
                  ->call( [ num( $f, 2 ) ], $scope ) );
            $self->property_u('factoids')
              ->set_index_value( [ $scope->property_u('trigger') ],
                $scope->property_u('response'), $scope );
            $self->property_u('commands')
              ->set_index_value( [ $scope->property_u('trigger') ],
                $scope->property_u('_commandFactoid'), $scope );
            $self->property_u('privmsg')->call(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    add(
                        $scope,
                        str( $f, "alright, associating ." ),
                        $scope->property_u('trigger'),
                        str( $f, " with '" ),
                        $scope->property_u('response'),
                        str( $f, "'" )
                    )
                ],
                $scope
            );
            return $return;
        };
        $funcs[6] = Ferret::Event->new(
            $f,
            name         => '_commandAdd',
            default_func => [ undef, $func ]
        );
    }

    # Function event '_commandFactoid' callback definition
    {
        my $func = Ferret::Function->new( $f, name => 'default' );
        $func->add_argument( name => 'msg' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{msg};
                $scope->set_property( msg => $arguments->{msg} );
            };
            $scope->set_property_ow(
                $context,
                response => $self->property_u('factoids')->get_index_value(
                    [
                        $scope->property_u('msg')->property_u('command')
                          ->call( {}, $scope )
                    ],
                    $scope
                )
            );
            $self->property_u('privmsg')->call(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('response')
                ],
                $scope
            );
            return $return;
        };
        $funcs[7] = Ferret::Event->new(
            $f,
            name         => '_commandFactoid',
            default_func => [ undef, $func ]
        );
    }

    # Class 'Bot'
    {
        my @methods;
        my ( $class, $self );
        if ( not $class = $f->get_class( $context, 'Bot' ) ) {
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
            $func->add_argument( name => 'port', optional => 1 );
            $func->add_argument( name => 'user', optional => 1 );
            $func->add_argument( name => 'real', optional => 1 );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{addr};
                    $self->set_property( addr => $arguments->{addr} );
                };
                do {
                    return unless defined $arguments->{nick};
                    $self->set_property( nick => $arguments->{nick} );
                };
                do {
                    my $want_val = $arguments->{port};
                    $want_val ||= num( $f, 6667 );
                    $self->set_property( port => $want_val );
                };
                do {
                    my $want_val = $arguments->{user};
                    $want_val ||= str( $f, "ferret" );
                    $self->set_property( user => $want_val );
                };
                do {
                    my $want_val = $arguments->{real};
                    $want_val ||= str( $f, "Ferret IRC" );
                    $self->set_property( real => $want_val );
                };
                $self->set_property(
                    handlers => Ferret::Hash->new(
                        $f,
                        pairs => {
                            MODE    => $scope->property_u('_joinChannels'),
                            PING    => $scope->property_u('_pong'),
                            PRIVMSG => $scope->property_u('_handleMessage')
                        }
                    )
                );
                $self->set_property(
                    commands => Ferret::Hash->new(
                        $f,
                        pairs => {
                            hello => $scope->property_u('_commandHello'),
                            hi    => $scope->property_u('_commandHello'),
                            add   => $scope->property_u('_commandAdd')
                        }
                    )
                );
                $self->set_property(
                    factoids => Ferret::Hash->new( $f, pairs => {} ) );
                $self->set_property(
                    sock => $scope->property_u('Socket::TCP')->call(
                        {
                            address => $self->property_u('addr'),
                            port    => $self->property_u('port')
                        },
                        $scope
                    )
                );

                # On
                {
                    my $on_func =
                      $funcs[0]->inside_scope( +undef => $scope, $scope );
                    $self->property_u('sock')->property_u('connected')
                      ->add_function_with_self_and_scope( $self, $scope,
                        $on_func );
                }

                # On
                {
                    my $on_func =
                      $funcs[1]->inside_scope( +undef => $scope, $scope );
                    $self->property_u('sock')->property_u('gotLine')
                      ->add_function_with_self_and_scope( $self, $scope,
                        $on_func );
                }
                return $return;
            };
            $methods[0] = Ferret::Event->new(
                $f,
                name         => '_init_',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'addCommand' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'command' );
            $func->add_argument( name => 'callback' );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{command};
                    $scope->set_property( command => $arguments->{command} );
                };
                do {
                    return unless defined $arguments->{callback};
                    $scope->set_property( callback => $arguments->{callback} );
                };
                if (
                    bool(
                        $self->property_u('commands')->get_index_value(
                            [ $scope->property_u('command') ], $scope
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $return->set_property( overwrote => Ferret::true );
                }
                $self->property_u('commands')
                  ->set_index_value( [ $scope->property_u('command') ],
                    $scope->property_u('callback'), $scope );
                $return->set_property( added => Ferret::true );
                return $return;
            };
            $methods[1] = Ferret::Event->new(
                $f,
                name         => 'addCommand',
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
                  ->call( {}, $scope );
                return $return;
            };
            $methods[2] = Ferret::Event->new(
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
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{line};
                    $scope->set_property( line => $arguments->{line} );
                };
                $scope->property_u('say')->call(
                    [
                        add(
                            $scope, str( $f, "send: " ),
                            $scope->property_u('line')
                        )
                    ],
                    $scope
                );
                $self->property_u('sock')->property_u('println')
                  ->call( [ $scope->property_u('line') ], $scope );
                return $return;
            };
            $methods[3] = Ferret::Event->new(
                $f,
                name         => 'send',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'handleLine' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'line' );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{line};
                    $scope->set_property( line => $arguments->{line} );
                };
                $scope->set_property_ow( $context,
                    s => $scope->property_u('line')->property_u('split')
                      ->call( [ str( $f, " " ) ], $scope ) );
                $scope->set_property_ow( $context,
                    command => $scope->property_u('s')
                      ->get_index_value( [ num( $f, 1 ) ], $scope ) );
                if (
                    bool(
                        $scope->property_u('s')
                          ->get_index_value( [ num( $f, 0 ) ], $scope )
                          ->equal_to( str( $f, "PING" ), $scope )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $scope->set_property_ow( $context,
                        command => $scope->property_u('s')
                          ->get_index_value( [ num( $f, 0 ) ], $scope ) );
                }
                $scope->property_u('say')->call(
                    [
                        add(
                            $scope,                        str( $f, "recv[" ),
                            $scope->property_u('command'), str( $f, "]: " ),
                            $scope->property_u('line')
                        )
                    ],
                    $scope
                );
                {
                    my $maybe_0 =
                      $self->property_u('handlers')
                      ->get_index_value( [ $scope->property_u('command') ],
                        $scope );
                    if ( bool($maybe_0) ) {
                        $maybe_0->call(
                            {
                                line  => $scope->property_u('line'),
                                _self => $scope->{special}->property_u('self'),
                                command => $scope->property_u('command'),
                                s       => $scope->property_u('s')
                            },
                            $scope
                        );
                    }
                }
                return $return;
            };
            $methods[4] = Ferret::Event->new(
                $f,
                name         => 'handleLine',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'privmsg' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'channel' );
            $func->add_argument( name => 'message' );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{channel};
                    $scope->set_property( channel => $arguments->{channel} );
                };
                do {
                    return unless defined $arguments->{message};
                    $scope->set_property( message => $arguments->{message} );
                };
                foreach ( $scope->property_u('message')->property_u('split')
                    ->call( [ str( $f, "\n" ) ], $scope )->iterate )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );
                    $scope->set_property( line => $_ );

                    $self->property_u('send')->call(
                        [
                            add(
                                $scope,
                                str( $f, "PRIVMSG " ),
                                $scope->property_u('channel'),
                                str( $f, " :" ),
                                $scope->property_u('line')
                            )
                        ],
                        $scope
                    );
                }
                return $return;
            };
            $methods[5] = Ferret::Event->new(
                $f,
                name         => 'privmsg',
                default_func => [ undef, $func ]
            );
        }
        $methods[0]->inside_scope( _init_     => $scope, $class, $class );
        $methods[1]->inside_scope( addCommand => $scope, $proto, $class );
        $methods[2]->inside_scope( connect    => $scope, $proto, $class );
        $methods[3]->inside_scope( send       => $scope, $proto, $class );
        $methods[4]->inside_scope( handleLine => $scope, $proto, $class );
        $methods[5]->inside_scope( privmsg    => $scope, $proto, $class );
        $funcs[2]->inside_scope( _joinChannels   => $scope, $scope );
        $funcs[3]->inside_scope( _pong           => $scope, $scope );
        $funcs[4]->inside_scope( _handleMessage  => $scope, $scope );
        $funcs[5]->inside_scope( _commandHello   => $scope, $scope );
        $funcs[6]->inside_scope( _commandAdd     => $scope, $scope );
        $funcs[7]->inside_scope( _commandFactoid => $scope, $scope );
    }
    Ferret::space( $context, $_ )
      for qw(Func IRC IRC::Message Num Socket Socket::TCP Str);
};

Ferret::runtime();
