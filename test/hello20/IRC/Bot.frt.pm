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
#                                  Instance variable '@joinChannels'
#                          Item 1
#                              Pair 'PING'
#                                  Instance variable '@pong'
#                          Item 2
#                              Pair 'PRIVMSG'
#                                  Instance variable '@handleMessage'
#              Instruction
#                  Assignment
#                      Instance variable '@commands'
#                      Hash [3 items]
#                          Item 0
#                              Pair 'hello'
#                                  Instance variable '@commandHello'
#                          Item 1
#                              Pair 'hi'
#                                  Instance variable '@commandHello'
#                          Item 2
#                              Pair 'add'
#                                  Instance variable '@commandAdd'
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
#                      Hash [3 items]
#                          Item 0
#                              Pair 'line'
#                                  Lexical variable '$line'
#                          Item 1
#                              Pair 'command'
#                                  Lexical variable '$command'
#                          Item 2
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
#          Method 'joinChannels'
#              If
#                  Expression ('if' parameter)
#                      Instance variable '@joinedChannels'
#                  Instruction
#                      Return
#              Instruction
#                  Assignment
#                      Instance variable '@joinedChannels'
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
#          Method 'pong'
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
#          Method 'handleMessage'
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
#                          Hash [3 items]
#                              Item 0
#                                  Pair 'line'
#                                      Lexical variable '$line'
#                              Item 1
#                                  Pair 's'
#                                      Lexical variable '$s'
#                              Item 2
#                                  Pair 'msg'
#                                      Lexical variable '$msg'
#          Method 'commandHello'
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
#          Method 'commandAdd'
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
#                      Instance variable '@commandFactoid'
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
#          Method 'commandFactoid'
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
            $self->property('handleLine')
              ->call( [ $scope->property('data') ], $scope );
            return $return;
        };
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
                            MODE    => $self->property('joinChannels'),
                            PING    => $self->property('pong'),
                            PRIVMSG => $self->property('handleMessage')
                        }
                    )
                );
                $self->set_property(
                    commands => Ferret::Hash->new(
                        $f,
                        pairs => {
                            hello => $self->property('commandHello'),
                            hi    => $self->property('commandHello'),
                            add   => $self->property('commandAdd')
                        }
                    )
                );
                $self->set_property(
                    factoids => Ferret::Hash->new( $f, pairs => {} ) );
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
                    my $on_func =
                      $funcs[0]->inside_scope( +undef => $scope, $scope );
                    $self->property('sock')->property('connected')
                      ->add_function_with_self_and_scope( $self, $scope,
                        $on_func );
                }

                # On
                {
                    my $on_func =
                      $funcs[1]->inside_scope( +undef => $scope, $scope );
                    $self->property('sock')->property('gotLine')
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
                        $self->property('commands')->get_index_value(
                            [ $scope->property('command') ], $scope
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $return->set_property( overwrote => Ferret::true );
                }
                $self->property('commands')
                  ->set_index_value( [ $scope->property('command') ],
                    $scope->property('callback'), $scope );
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
                $self->property('sock')->property('connect')
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
                $scope->property('say')->call(
                    [
                        add(
                            $scope, str( $f, "send: " ),
                            $scope->property('line')
                        )
                    ],
                    $scope
                );
                $self->property('sock')->property('println')
                  ->call( [ $scope->property('line') ], $scope );
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
                    s => $scope->property('line')->property('split')
                      ->call( [ str( $f, " " ) ], $scope ) );
                $scope->set_property_ow( $context,
                    command => $scope->property('s')
                      ->get_index_value( [ num( $f, 1 ) ], $scope ) );
                if (
                    bool(
                        $scope->property('s')
                          ->get_index_value( [ num( $f, 0 ) ], $scope )
                          ->equal_to( str( $f, "PING" ), $scope )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $scope->set_property_ow( $context,
                        command => $scope->property('s')
                          ->get_index_value( [ num( $f, 0 ) ], $scope ) );
                }
                $scope->property('say')->call(
                    [
                        add(
                            $scope,                      str( $f, "recv[" ),
                            $scope->property('command'), str( $f, "]: " ),
                            $scope->property('line')
                        )
                    ],
                    $scope
                );
                {
                    my $maybe_0 =
                      $self->property('handlers')
                      ->get_index_value( [ $scope->property('command') ],
                        $scope );
                    if ( bool($maybe_0) ) {
                        $maybe_0->call(
                            {
                                line    => $scope->property('line'),
                                command => $scope->property('command'),
                                s       => $scope->property('s')
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
                foreach ( $scope->property('message')->property('split')
                    ->call( [ str( $f, "\n" ) ], $scope )->iterate )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );
                    $scope->set_property( line => $_ );

                    $self->property('send')->call(
                        [
                            add(
                                $scope,
                                str( $f, "PRIVMSG " ),
                                $scope->property('channel'),
                                str( $f, " :" ),
                                $scope->property('line')
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

        # Method event 'joinChannels' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                if ( bool( $self->property('joinedChannels') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $return;
                }
                $self->set_property( joinedChannels => Ferret::true );
                if ( bool( $self->property('autojoin') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    foreach ( $self->property('autojoin')->iterate ) {
                        my $scope = Ferret::Scope->new( $f, parent => $scope );
                        $scope->set_property( chan => $_ );

                        $self->property('send')->call(
                            [
                                add(
                                    $scope,
                                    str( $f, "JOIN " ),
                                    $scope->property('chan')
                                )
                            ],
                            $scope
                        );
                    }
                }
                return $return;
            };
            $methods[6] = Ferret::Event->new(
                $f,
                name         => 'joinChannels',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'pong' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 's' );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{s};
                    $scope->set_property( s => $arguments->{s} );
                };
                $self->property('send')->call(
                    [
                        add(
                            $scope,
                            str( $f, "PONG " ),
                            $scope->property('s')
                              ->get_index_value( [ num( $f, 1 ) ], $scope )
                        )
                    ],
                    $scope
                );
                return $return;
            };
            $methods[7] = Ferret::Event->new(
                $f,
                name         => 'pong',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'handleMessage' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'line' );
            $func->add_argument( name => 's' );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{line};
                    $scope->set_property( line => $arguments->{line} );
                };
                do {
                    return unless defined $arguments->{s};
                    $scope->set_property( s => $arguments->{s} );
                };
                $scope->set_property_ow( $context,
                    msg => $scope->property('IRC::Message')
                      ->call( [ $scope->property('line') ], $scope ) );
                if (
                    bool(
                        $scope->property('msg')->property('command')
                          ->call( {}, $scope )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    {
                        my $maybe_0 =
                          $self->property('commands')->get_index_value(
                            [
                                $scope->property('msg')->property('command')
                                  ->call( {}, $scope )
                            ],
                            $scope
                          );
                        if ( bool($maybe_0) ) {
                            $maybe_0->call(
                                {
                                    line => $scope->property('line'),
                                    s    => $scope->property('s'),
                                    msg  => $scope->property('msg')
                                },
                                $scope
                            );
                        }
                    }
                }
                return $return;
            };
            $methods[8] = Ferret::Event->new(
                $f,
                name         => 'handleMessage',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'commandHello' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'msg' );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{msg};
                    $scope->set_property( msg => $arguments->{msg} );
                };
                $scope->set_property_ow( $context,
                    nickname => $scope->property('msg')->property('nickname') );
                $self->property('privmsg')->call(
                    [
                        $scope->property('msg')->property('channel'),
                        add(
                            $scope,                       str( $f, "Hi " ),
                            $scope->property('nickname'), str( $f, "!" )
                        )
                    ],
                    $scope
                );
                return $return;
            };
            $methods[9] = Ferret::Event->new(
                $f,
                name         => 'commandHello',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'commandAdd' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'msg' );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{msg};
                    $scope->set_property( msg => $arguments->{msg} );
                };
                $scope->property('inspect')
                  ->call( [ $scope->property('msg') ], $scope );
                $scope->set_property_ow( $context,
                    trigger => $scope->property('msg')->property('parts')
                      ->get_index_value( [ num( $f, 1 ) ], $scope ) );
                $scope->set_property_ow( $context,
                    response => $scope->property('msg')->property('fromWord')
                      ->call( [ num( $f, 2 ) ], $scope ) );
                $self->property('factoids')
                  ->set_index_value( [ $scope->property('trigger') ],
                    $scope->property('response'), $scope );
                $self->property('commands')
                  ->set_index_value( [ $scope->property('trigger') ],
                    $self->property('commandFactoid'), $scope );
                $self->property('privmsg')->call(
                    [
                        $scope->property('msg')->property('channel'),
                        add(
                            $scope,
                            str( $f, "alright, associating ." ),
                            $scope->property('trigger'),
                            str( $f, " with '" ),
                            $scope->property('response'),
                            str( $f, "'" )
                        )
                    ],
                    $scope
                );
                return $return;
            };
            $methods[10] = Ferret::Event->new(
                $f,
                name         => 'commandAdd',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'commandFactoid' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'msg' );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{msg};
                    $scope->set_property( msg => $arguments->{msg} );
                };
                $scope->set_property_ow(
                    $context,
                    response => $self->property('factoids')->get_index_value(
                        [
                            $scope->property('msg')->property('command')
                              ->call( {}, $scope )
                        ],
                        $scope
                    )
                );
                $self->property('privmsg')->call(
                    [
                        $scope->property('msg')->property('channel'),
                        $scope->property('response')
                    ],
                    $scope
                );
                return $return;
            };
            $methods[11] = Ferret::Event->new(
                $f,
                name         => 'commandFactoid',
                default_func => [ undef, $func ]
            );
        }
        $methods[0]->inside_scope( _init_        => $scope, $class, $class );
        $methods[1]->inside_scope( addCommand    => $scope, $proto, $class );
        $methods[2]->inside_scope( connect       => $scope, $proto, $class );
        $methods[3]->inside_scope( send          => $scope, $proto, $class );
        $methods[4]->inside_scope( handleLine    => $scope, $proto, $class );
        $methods[5]->inside_scope( privmsg       => $scope, $proto, $class );
        $methods[6]->inside_scope( joinChannels  => $scope, $proto, $class );
        $methods[7]->inside_scope( pong          => $scope, $proto, $class );
        $methods[8]->inside_scope( handleMessage => $scope, $proto, $class );
        $methods[9]->inside_scope( commandHello  => $scope, $proto, $class );
        $methods[10]->inside_scope( commandAdd     => $scope, $proto, $class );
        $methods[11]->inside_scope( commandFactoid => $scope, $proto, $class );
    }
    Ferret::space( $context, $_ )
      for qw(Func IRC IRC::Message Num Socket Socket::TCP Str);
};

Ferret::runtime();
