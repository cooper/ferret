# === Document Model ===
#  Document './test/hello20/Bot.frt'
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
#                              Mathematical operation
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
#                              Mathematical operation
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
#              Instruction
#                  Call
#                      Instance variable '@send'
#                      Structural list [1 items]
#                          Item 0
#                              Mathematical operation
#                                  String 'PRIVMSG '
#                                  Addition operator (+)
#                                  Lexical variable '$channel'
#                                  Addition operator (+)
#                                  String ' :'
#                                  Addition operator (+)
#                                  Lexical variable '$message'
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
#              Instruction
#                  Call
#                      Instance variable '@send'
#                      Structural list [1 items]
#                          Item 0
#                              String 'JOIN #k'
#          Method 'pong'
#              Instruction
#                  Need
#                      Lexical variable '$s'
#              Instruction
#                  Call
#                      Instance variable '@send'
#                      Structural list [1 items]
#                          Item 0
#                              Mathematical operation
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
#                          Bareword 'getMessage'
#                          Structural list [1 items]
#                              Item 0
#                                  Lexical variable '$line'
#              If
#                  Expression ('if' parameter)
#                      Property 'command'
#                          Lexical variable '$msg'
#                  Instruction
#                      Call
#                          Maybe
#                              Index
#                                  Instance variable '@commands'
#                                  Structural list [1 items]
#                                      Item 0
#                                          Property 'command'
#                                              Lexical variable '$msg'
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
#                              Mathematical operation
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
#                              Mathematical operation
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
#                                  Property 'command'
#                                      Lexical variable '$msg'
#              Instruction
#                  Call
#                      Instance variable '@privmsg'
#                      Structural list [2 items]
#                          Item 0
#                              Property 'channel'
#                                  Lexical variable '$msg'
#                          Item 1
#                              Lexical variable '$response'
#          Function 'getMessage'
#              Instruction
#                  Need
#                      Lexical variable '$line'
#              Instruction
#                  Assignment
#                      Lexical variable '$lineSplit'
#                      Call
#                          Property 'split'
#                              Lexical variable '$line'
#                          Hash [2 items]
#                              Item 0
#                                  Pair 'separator'
#                                      String ' '
#                              Item 1
#                                  Pair 'limit'
#                                      Number '4'
#              Instruction
#                  Assignment
#                      Lexical variable '$nickname'
#                      Index
#                          Call
#                              Property 'split'
#                                  Index
#                                      Lexical variable '$lineSplit'
#                                      Structural list [1 items]
#                                          Item 0
#                                              Number '0'
#                              Hash [2 items]
#                                  Item 0
#                                      Pair 'separator'
#                                          String '!'
#                                  Item 1
#                                      Pair 'limit'
#                                          Number '2'
#                          Structural list [1 items]
#                              Item 0
#                                  Number '0'
#              Instruction
#                  Call
#                      Property 'trimPrefix'
#                          Lexical variable '$nickname'
#                      Structural list [1 items]
#                          Item 0
#                              String ':'
#              Instruction
#                  Assignment
#                      Lexical variable '$message'
#                      Index
#                          Lexical variable '$lineSplit'
#                          Structural list [1 items]
#                              Item 0
#                                  Number '3'
#              Instruction
#                  Call
#                      Property 'trimPrefix'
#                          Lexical variable '$message'
#                      Structural list [1 items]
#                          Item 0
#                              String ':'
#              Instruction
#                  Assignment
#                      Lexical variable '$split'
#                      Call
#                          Property 'split'
#                              Lexical variable '$message'
#                          Structural list [1 items]
#                              Item 0
#                                  String ' '
#              If
#                  Expression ('if' parameter)
#                      Call
#                          Property 'hasPrefix'
#                              Index
#                                  Lexical variable '$split'
#                                  Structural list [1 items]
#                                      Item 0
#                                          Number '0'
#                          Structural list [1 items]
#                              Item 0
#                                  String '.'
#                  Instruction
#                      Return pair 'command'
#                          Call
#                              Property 'trimPrefix'
#                                  Call
#                                      Property 'copy'
#                                          Index
#                                              Lexical variable '$split'
#                                              Structural list [1 items]
#                                                  Item 0
#                                                      Number '0'
#                                      Structural list [0 items]
#                              Structural list [1 items]
#                                  Item 0
#                                      String '.'
#              Function 'fromWord'
#                  Instruction
#                      Need
#                          Lexical variable '$wordN'
#                          Bareword 'Num'
#                  Instruction
#                      Return
#                          Index
#                              Call
#                                  Property 'split'
#                                      Lexical variable '$message'
#                                  Hash [2 items]
#                                      Item 0
#                                          Pair 'separator'
#                                              String ' '
#                                      Item 1
#                                          Pair 'limit'
#                                              Mathematical operation
#                                                  Lexical variable '$wordN'
#                                                  Addition operator (+)
#                                                  Number '1'
#                              Structural list [1 items]
#                                  Item 0
#                                      Lexical variable '$wordN'
#              Instruction
#                  Return pair 'fromWord'
#                      Bareword 'fromWord'
#              Instruction
#                  Return pair 'nickname'
#                      Lexical variable '$nickname'
#              Instruction
#                  Return pair 'channel'
#                      Index
#                          Lexical variable '$lineSplit'
#                          Structural list [1 items]
#                              Item 0
#                                  Number '2'
#              Instruction
#                  Return pair 'message'
#                      Lexical variable '$message'
#              Instruction
#                  Return pair 'parts'
#                      Lexical variable '$split'
#      Include (Num, Socket, Socket::TCP, Str)
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

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'Bot.frt.pm'}++;

use Ferret::Core::Operations qw(add bool num str);
{
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
            $self->property('handleLine')
              ->call( [ $scope->property('data') ], $scope );
            return $return;
        };
    }

    # Function event 'fromWord' callback definition
    {
        my $func = Ferret::Function->new( $f, name => 'default' );
        $func->add_argument( name => 'wordN' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{wordN};
                $scope->set_property( wordN => $arguments->{wordN} );
            };
            return $scope->property('message')->property('split')->call(
                {
                    separator => str( $f, " " ),
                    limit =>
                      add( $scope, $scope->property('wordN'), num( $f, 1 ) )
                },
                $scope
            )->get_index_value( [ $scope->property('wordN') ], $scope );
            return $return;
        };
        $funcs[2] = Ferret::Event->new(
            $f,
            name         => 'fromWord',
            default_func => [ undef, $func ]
        );
    }

    # Function event 'getMessage' callback definition
    {
        my $func = Ferret::Function->new( $f, name => 'default' );
        $func->add_argument( name => 'line' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $funcs[2]->inside_scope( fromWord => $scope, $scope );
            do {
                return unless defined $arguments->{line};
                $scope->set_property( line => $arguments->{line} );
            };
            $scope->set_property_ow(
                lineSplit => $scope->property('line')->property('split')->call(
                    { separator => str( $f, " " ), limit => num( $f, 4 ) },
                    $scope
                )
            );
            $scope->set_property_ow(
                nickname => $scope->property('lineSplit')
                  ->get_index_value( [ num( $f, 0 ) ], $scope )
                  ->property('split')
                  ->call(
                    { separator => str( $f, "!" ), limit => num( $f, 2 ) },
                    $scope )->get_index_value( [ num( $f, 0 ) ], $scope )
            );
            $scope->property('nickname')->property('trimPrefix')
              ->call( [ str( $f, ":" ) ], $scope );
            $scope->set_property_ow( message => $scope->property('lineSplit')
                  ->get_index_value( [ num( $f, 3 ) ], $scope ) );
            $scope->property('message')->property('trimPrefix')
              ->call( [ str( $f, ":" ) ], $scope );
            $scope->set_property_ow(
                split => $scope->property('message')->property('split')
                  ->call( [ str( $f, " " ) ], $scope ) );
            if (
                bool(
                    $scope->property('split')
                      ->get_index_value( [ num( $f, 0 ) ], $scope )
                      ->property('hasPrefix')
                      ->call( [ str( $f, "." ) ], $scope )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $return->set_property( command => $scope->property('split')
                      ->get_index_value( [ num( $f, 0 ) ], $scope )
                      ->property('copy')->call( {}, $scope )
                      ->property('trimPrefix')
                      ->call( [ str( $f, "." ) ], $scope ) );
            }
            $return->set_property( fromWord => $scope->property('fromWord') );
            $return->set_property( nickname => $scope->property('nickname') );
            $return->set_property( channel => $scope->property('lineSplit')
                  ->get_index_value( [ num( $f, 2 ) ], $scope ) );
            $return->set_property( message => $scope->property('message') );
            $return->set_property( parts   => $scope->property('split') );
            return $return;
        };
        $funcs[3] = Ferret::Event->new(
            $f,
            name         => 'getMessage',
            default_func => [ undef, $func ]
        );
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
                    my $on_func = do {
                        $funcs[0]->inside_scope( +undef => $scope, $scope );
                    };
                    $self->property('sock')->property('connected')
                      ->add_function_with_self( $self, $on_func );
                }

                # On
                {
                    my $on_func = do {
                        $funcs[1]->inside_scope( +undef => $scope, $scope );
                    };
                    $self->property('sock')->property('gotLine')
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
            $methods[2] = Ferret::Event->new(
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
                $scope->set_property_ow(
                    s => $scope->property('line')->property('split')
                      ->call( [ str( $f, " " ) ], $scope ) );
                $scope->set_property_ow( command => $scope->property('s')
                      ->get_index_value( [ num( $f, 1 ) ], $scope ) );
                if (
                    bool(
                        $scope->property('s')
                          ->get_index_value( [ num( $f, 0 ) ], $scope )
                          ->create_set( $scope, str( $f, "PING" ) )
                          ->property('equal')->call
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $scope->set_property_ow( command => $scope->property('s')
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
            $methods[3] = Ferret::Event->new(
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
                $self->property('send')->call(
                    [
                        add(
                            $scope,
                            str( $f, "PRIVMSG " ),
                            $scope->property('channel'),
                            str( $f, " :" ),
                            $scope->property('message')
                        )
                    ],
                    $scope
                );
                return $return;
            };
            $methods[4] = Ferret::Event->new(
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
                $self->property('send')
                  ->call( [ str( $f, "JOIN #k" ) ], $scope );
                return $return;
            };
            $methods[5] = Ferret::Event->new(
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
            $methods[6] = Ferret::Event->new(
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
                $scope->set_property_ow( msg => $scope->property('getMessage')
                      ->call( [ $scope->property('line') ], $scope ) );
                if ( bool( $scope->property('msg')->property('command') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    {
                        my $maybe_0 =
                          $self->property('commands')
                          ->get_index_value(
                            [ $scope->property('msg')->property('command') ],
                            $scope );
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
            $methods[7] = Ferret::Event->new(
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
                $scope->set_property_ow(
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
            $methods[8] = Ferret::Event->new(
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
                $scope->set_property_ow(
                    trigger => $scope->property('msg')->property('parts')
                      ->get_index_value( [ num( $f, 1 ) ], $scope ) );
                $scope->set_property_ow(
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
            $methods[9] = Ferret::Event->new(
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
                    response => $self->property('factoids')->get_index_value(
                        [ $scope->property('msg')->property('command') ],
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
            $methods[10] = Ferret::Event->new(
                $f,
                name         => 'commandFactoid',
                default_func => [ undef, $func ]
            );
        }
        $methods[0]->inside_scope( _init_        => $scope, $class, $class );
        $methods[1]->inside_scope( connect       => $scope, $proto, $class );
        $methods[2]->inside_scope( send          => $scope, $proto, $class );
        $methods[3]->inside_scope( handleLine    => $scope, $proto, $class );
        $methods[4]->inside_scope( privmsg       => $scope, $proto, $class );
        $methods[5]->inside_scope( joinChannels  => $scope, $proto, $class );
        $methods[6]->inside_scope( pong          => $scope, $proto, $class );
        $methods[7]->inside_scope( handleMessage => $scope, $proto, $class );
        $methods[8]->inside_scope( commandHello  => $scope, $proto, $class );
        $methods[9]->inside_scope( commandAdd    => $scope, $proto, $class );
        $methods[10]->inside_scope( commandFactoid => $scope, $proto, $class );
        $funcs[3]->inside_scope( getMessage => $scope, $scope );
    }
    Ferret::space( $context, $_ ) for qw(Num Socket Socket::TCP Str);
}

Ferret::runtime();
