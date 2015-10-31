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
#                  Assignment (instance variable '@handlers')
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
#                  Assignment (instance variable '@commands')
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
#                  Assignment (instance variable '@factoids')
#                      Hash [0 items]
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
#                      Property 'gotLine'
#                          Instance variable '@sock'
#                  Anonymous function
#                      Instruction
#                          Need
#                              Lexical variable '$data'
#                      Instruction
#                          Call
#                              Instance variable '@handleLine'
#                              Single value [1 items]
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
#              If
#                  Expression ('if' parameter)
#                      Index
#                          Instance variable '@commands'
#                          Single value [1 items]
#                              Item 0
#                                  Lexical variable '$command'
#                  Instruction
#                      Return pair 'overwrote'
#                          Boolean true
#              Instruction
#                  Assignment (index)
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
#          Method 'handleLine'
#              Instruction
#                  Need
#                      Lexical variable '$line'
#              Instruction
#                  Assignment (lexical variable '$s')
#                      Call
#                          Property 'split'
#                              Lexical variable '$line'
#                          Single value [1 items]
#                              Item 0
#                                  String ' '
#              Instruction
#                  Assignment (lexical variable '$command')
#                      Index
#                          Lexical variable '$s'
#                          Single value [1 items]
#                              Item 0
#                                  Number '1'
#              If
#                  Expression ('if' parameter)
#                      Equality
#                          Index
#                              Lexical variable '$s'
#                              Single value [1 items]
#                                  Item 0
#                                      Number '0'
#                          String 'PING'
#                  Instruction
#                      Assignment (lexical variable '$command')
#                          Index
#                              Lexical variable '$s'
#                              Single value [1 items]
#                                  Item 0
#                                      Number '0'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Single value [1 items]
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
#                              Single value [1 items]
#                                  Item 0
#                                      Lexical variable '$command'
#                      Hash [4 items]
#                          Item 0
#                              Pair '_self'
#                                  Special variable '*self'
#                          Item 1
#                              Pair 'line'
#                                  Lexical variable '$line'
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
#                      Bareword 'Str'
#              Instruction
#                  Need
#                      Lexical variable '$message'
#                      Bareword 'Str'
#              For
#                  Expression ('for' parameter)
#                      Lexical variable '$line'
#                  Expression ('in' parameter)
#                      Call
#                          Property 'split'
#                              Lexical variable '$message'
#                          Single value [1 items]
#                              Item 0
#                                  String '␤'
#                  If
#                      Expression ('if' parameter)
#                          Equality
#                              Call
#                                  Property 'length'
#                                      Lexical variable '$line'
#                                  Structural list [0 items]
#                              Number '0'
#                      Instruction
#                          Call
#                              Instance variable '@send'
#                              Single value [1 items]
#                                  Item 0
#                                      Operation
#                                          String 'PRIVMSG '
#                                          Addition operator (+)
#                                          Lexical variable '$channel'
#                                          Addition operator (+)
#                                          String ' :'
#                                          Addition operator (+)
#                                          Lexical variable '$line'
#          Method 'joinChannels'
#              If
#                  Expression ('if' parameter)
#                      Instance variable '@_joinedChannels'
#                  Instruction
#                      Return
#              Instruction
#                  Assignment (instance variable '@_joinedChannels')
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
#                              Single value [1 items]
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
#                      Single value [1 items]
#                          Item 0
#                              Operation
#                                  String 'PONG '
#                                  Addition operator (+)
#                                  Index
#                                      Lexical variable '$s'
#                                      Single value [1 items]
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
#                  Assignment (lexical variable '$msg')
#                      Call
#                          Bareword 'IRC::Message'
#                          Single value [1 items]
#                              Item 0
#                                  Lexical variable '$line'
#              Instruction
#                  Return pair 'msg'
#                      Lexical variable '$msg'
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
#                                  Single value [1 items]
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
#          Method 'commandHello'
#              Instruction
#                  Need
#                      Lexical variable '$msg'
#              Instruction
#                  Assignment (lexical variable '$nickname')
#                      Property 'nickname'
#                          Lexical variable '$msg'
#              Instruction
#                  Call
#                      Instance variable '@privmsg'
#                      Set [2 items]
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
#                      Single value [1 items]
#                          Item 0
#                              Lexical variable '$msg'
#              Instruction
#                  Assignment (lexical variable '$trigger')
#                      Index
#                          Property 'parts'
#                              Lexical variable '$msg'
#                          Single value [1 items]
#                              Item 0
#                                  Number '1'
#              Instruction
#                  Assignment (lexical variable '$response')
#                      Call
#                          Property 'fromWord'
#                              Lexical variable '$msg'
#                          Single value [1 items]
#                              Item 0
#                                  Number '2'
#              Instruction
#                  Assignment (index)
#                      Lexical variable '$response'
#              Instruction
#                  Assignment (index)
#                      Instance variable '@commandFactoid'
#              Instruction
#                  Call
#                      Instance variable '@privmsg'
#                      Set [2 items]
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
#                  Assignment (lexical variable '$response')
#                      Index
#                          Instance variable '@factoids'
#                          Single value [1 items]
#                              Item 0
#                                  Call
#                                      Property 'command'
#                                          Lexical variable '$msg'
#                                      Structural list [0 items]
#              Instruction
#                  Call
#                      Instance variable '@privmsg'
#                      Set [2 items]
#                          Item 0
#                              Property 'channel'
#                                  Lexical variable '$msg'
#                          Item 1
#                              Lexical variable '$response'
#      Include (IRC, IRC::Message, Num, Socket, Socket::TCP, Str)
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
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'Bot.frt.pm'}++;

use Ferret::Core::Operations qw(_not add bool num on str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('IRC');
    undef;
    Ferret::space( $context, 'CORE' ) or die 'CORE error';

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
        $func->add_argument( name => 'data', type => '', more => undef );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{data};
                $scope->set_property( data => $arguments->{data} );
            };
            $self->property_u('handleLine')
              ->call_u( [ $scope->property_u('data') ], $scope );
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
            $func->add_argument( name => 'addr', type => 'Str', more => undef );
            $func->add_argument( name => 'nick', type => 'Str', more => undef );
            $func->add_argument(
                name     => 'port',
                type     => 'Num',
                optional => 1,
                more     => undef
            );
            $func->add_argument(
                name     => 'user',
                type     => 'Str',
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
                            MODE    => $self->property_u('joinChannels'),
                            PING    => $self->property_u('pong'),
                            PRIVMSG => $self->property_u('handleMessage')
                        }
                    )
                );
                $self->set_property(
                    commands => Ferret::Hash->new(
                        $f,
                        pairs => {
                            hello => $self->property_u('commandHello'),
                            hi    => $self->property_u('commandHello'),
                            add   => $self->property_u('commandAdd')
                        }
                    )
                );
                $self->set_property(
                    factoids => Ferret::Hash->new( $f, pairs => {} ) );
                $self->set_property(
                    sock => $scope->property_u('Socket::TCP')->call_u(
                        {
                            address => $self->property_u('addr'),
                            port    => $self->property_u('port')
                        },
                        $scope
                    )
                );
                on( $self->property_u('sock'),
                    'connected', $self, $scope,
                    $funcs[0]->inside_scope( (undef) => $scope, $scope ) );
                on( $self->property_u('sock'),
                    'gotLine', $self, $scope,
                    $funcs[1]->inside_scope( (undef) => $scope, $scope ) );
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
            $func->add_argument(
                name => 'command',
                type => 'Str',
                more => undef
            );
            $func->add_argument(
                name => 'callback',
                type => '',
                more => undef
            );
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
                  ->call_u( {}, $scope );
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
            $func->add_argument( name => 'line', type => '', more => undef );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{line};
                    $scope->set_property( line => $arguments->{line} );
                };
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
            $func->add_argument( name => 'line', type => '', more => undef );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{line};
                    $scope->set_property( line => $arguments->{line} );
                };
                $scope->set_property_ow( $context,
                    s => $scope->property_u('line')->property_u('split')
                      ->call_u( [ str( $f, " " ) ], $scope ) );
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
                $scope->property_u('say')->call_u(
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
                        $maybe_0->call_u(
                            {
                                _self => $scope->{special}->property_u('self'),
                                line  => $scope->property_u('line'),
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
            $func->add_argument(
                name => 'channel',
                type => 'Str',
                more => undef
            );
            $func->add_argument(
                name => 'message',
                type => 'Str',
                more => undef
            );
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
                    ->call_u( [ str( $f, "\n" ) ], $scope )->iterate )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );
                    $scope->set_property( line => $_ );

                    if (
                        bool(
                            _not(
                                $scope->property_u('line')
                                  ->property_u('length')->call_u( {}, $scope )
                                  ->equal_to( num( $f, 0 ), $scope )
                            )
                        )
                      )
                    {
                        my $scope = Ferret::Scope->new( $f, parent => $scope );

                        $self->property_u('send')->call_u(
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

                        $self->property_u('send')->call_u(
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
            $func->add_argument( name => 's', type => '', more => undef );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{s};
                    $scope->set_property( s => $arguments->{s} );
                };
                $self->property_u('send')->call_u(
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
            $func->add_argument( name => 'line', type => '', more => undef );
            $func->add_argument( name => 's',    type => '', more => undef );
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
                    msg => $scope->property_u('IRC::Message')
                      ->call_u( [ $scope->property_u('line') ], $scope ) );
                $return->set_property( msg => $scope->property_u('msg') );
                if (
                    bool(
                        $scope->property_u('msg')->property_u('command')
                          ->call_u( {}, $scope )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    {
                        my $maybe_0 =
                          $self->property_u('commands')->get_index_value(
                            [
                                $scope->property_u('msg')
                                  ->property_u('command')->call_u( {}, $scope )
                            ],
                            $scope
                          );
                        if ( bool($maybe_0) ) {
                            $maybe_0->call_u(
                                {
                                    _self =>
                                      $scope->{special}->property_u('self'),
                                    line => $scope->property_u('line'),
                                    s    => $scope->property_u('s'),
                                    msg  => $scope->property_u('msg')
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
            $func->add_argument( name => 'msg', type => '', more => undef );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{msg};
                    $scope->set_property( msg => $arguments->{msg} );
                };
                $scope->set_property_ow( $context,
                    nickname =>
                      $scope->property_u('msg')->property_u('nickname') );
                $self->property_u('privmsg')->call_u(
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
            $func->add_argument( name => 'msg', type => '', more => undef );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{msg};
                    $scope->set_property( msg => $arguments->{msg} );
                };
                $scope->property_u('inspect')
                  ->call_u( [ $scope->property_u('msg') ], $scope );
                $scope->set_property_ow( $context,
                    trigger => $scope->property_u('msg')->property_u('parts')
                      ->get_index_value( [ num( $f, 1 ) ], $scope ) );
                $scope->set_property_ow( $context,
                    response =>
                      $scope->property_u('msg')->property_u('fromWord')
                      ->call_u( [ num( $f, 2 ) ], $scope ) );
                $self->property_u('factoids')
                  ->set_index_value( [ $scope->property_u('trigger') ],
                    $scope->property_u('response'), $scope );
                $self->property_u('commands')
                  ->set_index_value( [ $scope->property_u('trigger') ],
                    $self->property_u('commandFactoid'), $scope );
                $self->property_u('privmsg')->call_u(
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
            $func->add_argument( name => 'msg', type => '', more => undef );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{msg};
                    $scope->set_property( msg => $arguments->{msg} );
                };
                $scope->set_property_ow(
                    $context,
                    response => $self->property_u('factoids')->get_index_value(
                        [
                            $scope->property_u('msg')->property_u('command')
                              ->call_u( {}, $scope )
                        ],
                        $scope
                    )
                );
                $self->property_u('privmsg')->call_u(
                    [
                        $scope->property_u('msg')->property_u('channel'),
                        $scope->property_u('response')
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
      for
      qw(IRC::Num IRC::Socket IRC::Socket::TCP IRC::Str IRC IRC::Message Num Socket Socket::TCP Str);
};

Ferret::runtime();
