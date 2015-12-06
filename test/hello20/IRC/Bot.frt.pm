# === Document Model ===
#  Document './test/hello20/IRC/Bot.frt'
#      Package 'IRC'
#      Class 'Bot'
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Instance variable '@addr'
#                          Bareword 'Str'
#                  Instruction
#                      Need
#                          Instance variable '@nick'
#                          Bareword 'Str'
#                  Instruction
#                      Want
#                          Instance variable '@port'
#                          Expression ('want' parameter)
#                              Number '6667'
#                          Bareword 'Num'
#                  Instruction
#                      Want
#                          Instance variable '@user'
#                          Expression ('want' parameter)
#                              String 'ferret'
#                          Bareword 'Str'
#                  Instruction
#                      Want
#                          Instance variable '@real'
#                          Expression ('want' parameter)
#                              String 'Ferret IRC'
#                          Bareword 'Str'
#                  Instruction
#                      Assignment (instance variable '@handlers')
#                          Hash [3 items]
#                              Item 0
#                                  Pair 'MODE'
#                                      Instance variable '@joinChannels'
#                              Item 1
#                                  Pair 'PING'
#                                      Instance variable '@pong'
#                              Item 2
#                                  Pair 'PRIVMSG'
#                                      Instance variable '@handleMessage'
#                  Instruction
#                      Assignment (instance variable '@commands')
#                          Hash [3 items]
#                              Item 0
#                                  Pair 'hello'
#                                      Instance variable '@commandHello'
#                              Item 1
#                                  Pair 'hi'
#                                      Instance variable '@commandHello'
#                              Item 2
#                                  Pair 'add'
#                                      Instance variable '@commandAdd'
#                  Instruction
#                      Assignment (instance variable '@factoids')
#                          Hash [0 items]
#                  Instruction
#                      Assignment (instance variable '@sock')
#                          Call
#                              Bareword 'Socket::TCP'
#                              Named argument list [2 items]
#                                  Item 0
#                                      Pair 'address'
#                                          Instance variable '@addr'
#                                  Item 1
#                                      Pair 'port'
#                                          Instance variable '@port'
#                  On
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
#                  On
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
#                                      Instance variable '@handleLine'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Lexical variable '$data'
#          Method 'addCommand'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$command'
#                          Bareword 'Str'
#                  Instruction
#                      Need
#                          Lexical variable '$callback'
#                  If
#                      Expression ('if' parameter)
#                          Index
#                              Instance variable '@commands'
#                              Single value [1 items]
#                                  Item 0
#                                      Lexical variable '$command'
#                      Body ('if' scope)
#                          Instruction
#                              Return pair 'overwrote'
#                                  Boolean true
#                  Instruction
#                      Assignment (index)
#                          Lexical variable '$callback'
#                  Instruction
#                      Return pair 'added'
#                          Boolean true
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
#          Method 'handleLine'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$line'
#                  Instruction
#                      Assignment (lexical variable '$s')
#                          Call
#                              Property 'split'
#                                  Lexical variable '$line'
#                              Argument list [1 items]
#                                  Item 0
#                                      String ' '
#                  Instruction
#                      Assignment (lexical variable '$command')
#                          Index
#                              Lexical variable '$s'
#                              Single value [1 items]
#                                  Item 0
#                                      Number '1'
#                  If
#                      Expression ('if' parameter)
#                          Equality
#                              Index
#                                  Lexical variable '$s'
#                                  Single value [1 items]
#                                      Item 0
#                                          Number '0'
#                              String 'PING'
#                      Body ('if' scope)
#                          Instruction
#                              Assignment (lexical variable '$command')
#                                  Index
#                                      Lexical variable '$s'
#                                      Single value [1 items]
#                                          Item 0
#                                              Number '0'
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      String 'recv['
#                                      Addition operator (+)
#                                      Lexical variable '$command'
#                                      Addition operator (+)
#                                      String ']: '
#                                      Addition operator (+)
#                                      Lexical variable '$line'
#                  Instruction
#                      Call
#                          Maybe
#                              Index
#                                  Instance variable '@handlers'
#                                  Single value [1 items]
#                                      Item 0
#                                          Lexical variable '$command'
#                          Named argument list [4 items]
#                              Item 0
#                                  Pair '_self'
#                                      Special variable '*self'
#                              Item 1
#                                  Pair 'line'
#                                      Lexical variable '$line'
#                              Item 2
#                                  Pair 'command'
#                                      Lexical variable '$command'
#                              Item 3
#                                  Pair 's'
#                                      Lexical variable '$s'
#          Method 'privmsg'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$channel'
#                          Bareword 'Str'
#                  Instruction
#                      Need
#                          Lexical variable '$message'
#                          Bareword 'Str'
#                  For
#                      Expression ('for' parameter)
#                          Lexical variable '$line'
#                      Expression ('in' parameter)
#                          Call
#                              Property 'split'
#                                  Lexical variable '$message'
#                              Argument list [1 items]
#                                  Item 0
#                                      String '␤'
#                      Body ('for' scope)
#                          If
#                              Expression ('if' parameter)
#                                  Equality
#                                      Property 'length'
#                                          Lexical variable '$line'
#                                      Number '0'
#                              Body ('if' scope)
#                                  Instruction
#                                      Call
#                                          Instance variable '@send'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  Operation
#                                                      String 'PRIVMSG '
#                                                      Addition operator (+)
#                                                      Lexical variable '$channel'
#                                                      Addition operator (+)
#                                                      String ' :'
#                                                      Addition operator (+)
#                                                      Lexical variable '$line'
#          Method 'joinChannels'
#              Body ('method' scope)
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@_joinedChannels'
#                      Body ('if' scope)
#                          Instruction
#                              Return
#                  Instruction
#                      Assignment (instance variable '@_joinedChannels')
#                          Boolean true
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@autojoin'
#                      Body ('if' scope)
#                          For
#                              Expression ('for' parameter)
#                                  Lexical variable '$chan'
#                              Expression ('in' parameter)
#                                  Instance variable '@autojoin'
#                              Body ('for' scope)
#                                  Instruction
#                                      Call
#                                          Instance variable '@send'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  Operation
#                                                      String 'JOIN '
#                                                      Addition operator (+)
#                                                      Lexical variable '$chan'
#          Method 'pong'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$s'
#                  Instruction
#                      Call
#                          Instance variable '@send'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      String 'PONG '
#                                      Addition operator (+)
#                                      Index
#                                          Lexical variable '$s'
#                                          Single value [1 items]
#                                              Item 0
#                                                  Number '1'
#          Method 'handleMessage'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$line'
#                  Instruction
#                      Need
#                          Lexical variable '$s'
#                  Instruction
#                      Assignment (lexical variable '$msg')
#                          Call
#                              Bareword 'IRC::Message'
#                              Argument list [1 items]
#                                  Item 0
#                                      Lexical variable '$line'
#                  Instruction
#                      Return pair 'msg'
#                          Lexical variable '$msg'
#                  If
#                      Expression ('if' parameter)
#                          Property 'command'
#                              Lexical variable '$msg'
#                      Body ('if' scope)
#                          Instruction
#                              Call
#                                  Maybe
#                                      Index
#                                          Instance variable '@commands'
#                                          Single value [1 items]
#                                              Item 0
#                                                  Property 'command'
#                                                      Lexical variable '$msg'
#                                  Named argument list [4 items]
#                                      Item 0
#                                          Pair '_self'
#                                              Special variable '*self'
#                                      Item 1
#                                          Pair 'line'
#                                              Lexical variable '$line'
#                                      Item 2
#                                          Pair 's'
#                                              Lexical variable '$s'
#                                      Item 3
#                                          Pair 'msg'
#                                              Lexical variable '$msg'
#          Method 'commandHello'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$msg'
#                  Instruction
#                      Assignment (lexical variable '$nickname')
#                          Property 'nickname'
#                              Lexical variable '$msg'
#                  Instruction
#                      Call
#                          Instance variable '@privmsg'
#                          Argument list [2 items]
#                              Item 0
#                                  Property 'channel'
#                                      Lexical variable '$msg'
#                              Item 1
#                                  Operation
#                                      String 'Hi '
#                                      Addition operator (+)
#                                      Lexical variable '$nickname'
#                                      Addition operator (+)
#                                      String '!'
#          Method 'commandAdd'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$msg'
#                  Instruction
#                      Call
#                          Bareword 'inspect'
#                          Argument list [1 items]
#                              Item 0
#                                  Lexical variable '$msg'
#                  Instruction
#                      Assignment (lexical variable '$trigger')
#                          Index
#                              Property 'parts'
#                                  Lexical variable '$msg'
#                              Single value [1 items]
#                                  Item 0
#                                      Number '1'
#                  Instruction
#                      Assignment (lexical variable '$response')
#                          Call
#                              Property 'fromWord'
#                                  Lexical variable '$msg'
#                              Argument list [1 items]
#                                  Item 0
#                                      Number '2'
#                  Instruction
#                      Assignment (index)
#                          Lexical variable '$response'
#                  Instruction
#                      Assignment (index)
#                          Instance variable '@commandFactoid'
#                  Instruction
#                      Call
#                          Instance variable '@privmsg'
#                          Argument list [2 items]
#                              Item 0
#                                  Property 'channel'
#                                      Lexical variable '$msg'
#                              Item 1
#                                  Operation
#                                      String 'alright, a...'
#                                      Addition operator (+)
#                                      Lexical variable '$trigger'
#                                      Addition operator (+)
#                                      String ' with ''
#                                      Addition operator (+)
#                                      Lexical variable '$response'
#                                      Addition operator (+)
#                                      String '''
#          Method 'commandFactoid'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$msg'
#                  Instruction
#                      Assignment (lexical variable '$response')
#                          Index
#                              Instance variable '@factoids'
#                              Single value [1 items]
#                                  Item 0
#                                      Property 'command'
#                                          Lexical variable '$msg'
#                  Instruction
#                      Call
#                          Instance variable '@privmsg'
#                          Argument list [2 items]
#                              Item 0
#                                  Property 'channel'
#                                      Lexical variable '$msg'
#                              Item 1
#                                  Lexical variable '$response'
#      Include (IRC, IRC::Message, Num, Socket, Socket::TCP, Str)
use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

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
my $f = FF::get_ferret();

FF::before_content('Bot.frt');

use Ferret::Core::Operations qw(_not add bool num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'IRC' );
    FF::load_core('IRC');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, $scope, undef,
        [],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $self->property_u('send')->call_u(
                [
                    add(
                        $scope,
                        str( $f, "USER " ),
                        $self->property_u('user'),
                        str( $f, " " ),
                        str( $f, "*" ),
                        str( $f, " " ),
                        str( $f, "*" ),
                        str( $f, " :" ),
                        $self->property_u('real')
                    )
                ],
                $scope, undef,
                30.0007275372863
            );
            $self->property_u('send')->call_u(
                [
                    add(
                        $scope, str( $f, "NICK " ), $self->property_u('nick')
                    )
                ],
                $scope, undef,
                31.0007275372863
            );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_1 = FF::function_def(
        $f, $scope, undef,
        [ { name => 'data', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'data' ) or return;
            $self->property_u('handleLine')
              ->call_u( [ $scope->property_u('data') ],
                $scope, undef, 37.0007275372863 );
            return $return;
        }
    );

    # Class 'Bot'
    {
        my ( $class, $self, $proto ) =
          FF::get_class( $f, $context, 'Bot', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
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
                { name => 'real', type => 'Str', optional => 1, more => undef }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $self, $arguments, 'addr' ) or return;
                FF::need( $self, $arguments, 'nick' ) or return;
                do {
                    my $want_val = $arguments->{port};
                    $want_val ||= num( $f, 6667 );
                    $self->set_property( port => $want_val, 6.00036376864314 );
                };
                do {
                    my $want_val = $arguments->{user};
                    $want_val ||= str( $f, "ferret" );
                    $self->set_property( user => $want_val, 7.00218261185886 );
                };
                do {
                    my $want_val = $arguments->{real};
                    $want_val ||= str( $f, "Ferret IRC" );
                    $self->set_property( real => $want_val, 8.00218261185885 );
                };
                $self->set_property(
                    handlers => FF::create_hash(
                        $f,
                        {
                            MODE    => $self->property_u('joinChannels'),
                            PING    => $self->property_u('pong'),
                            PRIVMSG => $self->property_u('handleMessage')
                        }
                    ),
                    13.0007275372863
                );
                $self->set_property(
                    commands => FF::create_hash(
                        $f,
                        {
                            hello => $self->property_u('commandHello'),
                            hi    => $self->property_u('commandHello'),
                            add   => $self->property_u('commandAdd')
                        }
                    ),
                    19.0007275372863
                );
                $self->set_property(
                    factoids => FF::create_hash( $f, {} ),
                    25.0007275372863
                );
                $self->set_property(
                    sock => $scope->property_u('Socket::TCP')->call_u(
                        {
                            address => $self->property_u('addr'),
                            port    => $self->property_u('port')
                        },
                        $scope, undef,
                        27.0021826118589
                    ),
                    27.0007275372863
                );
                FF::on(
                    $self->property_u('sock'),
                    'connected',
                    $self, $scope,
                    $func_0->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    )
                );
                FF::on(
                    $self->property_u('sock'),
                    'gotLine',
                    $self, $scope,
                    $func_1->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    )
                );
                return $return;
            }
        );

        # Method event 'addCommand' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'addCommand',
            [
                {
                    name     => 'command',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'callback',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'command' )  or return;
                FF::need( $scope, $arguments, 'callback' ) or return;
                if (
                    bool(
                        $self->property_u('commands')->get_index_value(
                            [ $scope->property_u('command') ], $scope
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $return->set_property(
                        overwrote => Ferret::true,
                        45.0007275372863
                    );
                }
                $self->property_u('commands')
                  ->set_index_value( [ $scope->property_u('command') ],
                    $scope->property_u('callback'), $scope );
                $return->set_property(
                    added => Ferret::true,
                    47.0007275372863
                );
                return $return;
            }
        );

        # Method event 'connect' definition
        my $method_2 = FF::method_event_def(
            $f, $scope,
            'connect',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $self->property_u('sock')->property_u('connect')
                  ->call_u( {}, $scope, undef, 51.0010913059294 );
                return $return;
            }
        );

        # Method event 'send' definition
        my $method_3 = FF::method_event_def(
            $f, $scope, 'send',
            [
                {
                    name     => 'line',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'line' ) or return;
                $scope->property_u('say')->call_u(
                    [
                        add(
                            $scope, str( $f, "send: " ),
                            $scope->property_u('line')
                        )
                    ],
                    $scope, undef,
                    56.0007275372863
                );
                $self->property_u('sock')->property_u('println')
                  ->call_u( [ $scope->property_u('line') ],
                    $scope, undef, 58.0010913059294 );
                return $return;
            }
        );

        # Method event 'handleLine' definition
        my $method_4 = FF::method_event_def(
            $f, $scope,
            'handleLine',
            [
                {
                    name     => 'line',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'line' ) or return;
                $scope->set_property_ow(
                    $context,
                    s =>
                      $scope->property_u('line')->property_u('split')->call_u(
                        [ str( $f, " " ) ],
                        $scope, undef, 64.0018188432157
                      ),
                    64.0007275372863
                );
                $scope->set_property_ow(
                    $context,
                    command => $scope->property_u('s')
                      ->get_index_value( [ num( $f, 1 ) ], $scope ),
                    66.0007275372863
                );
                if (
                    bool(
                        $scope->property_u('s')
                          ->get_index_value( [ num( $f, 0 ) ], $scope )
                          ->equal_to( str( $f, "PING" ), $scope )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $scope->set_property_ow(
                        $context,
                        command => $scope->property_u('s')
                          ->get_index_value( [ num( $f, 0 ) ], $scope ),
                        69.0007275372863
                    );
                }
                $scope->property_u('say')->call_u(
                    [
                        add(
                            $scope,                        str( $f, "recv[" ),
                            $scope->property_u('command'), str( $f, "]: " ),
                            $scope->property_u('line')
                        )
                    ],
                    $scope, undef,
                    71.0007275372863
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
                            $scope, undef,
                            74.0021826118588
                        );
                    }
                }
                return $return;
            }
        );

        # Method event 'privmsg' definition
        my $method_5 = FF::method_event_def(
            $f, $scope,
            'privmsg',
            [
                {
                    name     => 'channel',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'message',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'channel' ) or return;
                FF::need( $scope, $arguments, 'message' ) or return;
                FF::iterate(
                    $f, $scope,
                    $scope->property_u('message')->property_u('split')->call_u(
                        [ str( $f, "\n" ) ], $scope,
                        undef, 85.0021826118588
                    ),
                    'line',
                    sub {
                        my $scope = shift;
                        if (
                            bool(
                                _not(
                                    $scope->property_u('line')
                                      ->property_u('length')
                                      ->equal_to( num( $f, 0 ), $scope )
                                )
                            )
                          )
                        {
                            my $scope =
                              Ferret::Scope->new( $f, parent => $scope );

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
                                $scope, undef,
                                87.0007275372863
                            );
                        }
                    }
                );
                return $return;
            }
        );

        # Method event 'joinChannels' definition
        my $method_6 = FF::method_event_def(
            $f, $scope,
            'joinChannels',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                if ( bool( $self->property_u('_joinedChannels') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $return;
                }
                $self->set_property(
                    _joinedChannels => Ferret::true,
                    96.0007275372863
                );
                if ( bool( $self->property_u('autojoin') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    FF::iterate(
                        $f, $scope,
                        $self->property_u('autojoin'),
                        'chan',
                        sub {
                            my $scope = shift;
                            $self->property_u('send')->call_u(
                                [
                                    add(
                                        $scope,
                                        str( $f, "JOIN " ),
                                        $scope->property_u('chan')
                                    )
                                ],
                                $scope, undef,
                                100.000727537286
                            );
                        }
                    );
                }
                return $return;
            }
        );

        # Method event 'pong' definition
        my $method_7 = FF::method_event_def(
            $f, $scope, 'pong',
            [
                {
                    name     => 's',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 's' ) or return;
                $self->property_u('send')->call_u(
                    [
                        add(
                            $scope,
                            str( $f, "PONG " ),
                            $scope->property_u('s')
                              ->get_index_value( [ num( $f, 1 ) ], $scope )
                        )
                    ],
                    $scope, undef,
                    107.000727537286
                );
                return $return;
            }
        );

        # Method event 'handleMessage' definition
        my $method_8 = FF::method_event_def(
            $f, $scope,
            'handleMessage',
            [
                {
                    name     => 'line',
                    type     => undef,
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 's',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'line' ) or return;
                FF::need( $scope, $arguments, 's' )    or return;
                $scope->set_property_ow(
                    $context,
                    msg => $scope->property_u('IRC::Message')->call_u(
                        [ $scope->property_u('line') ], $scope,
                        undef,                          115.002182611859
                    ),
                    115.000727537286
                );
                $return->set_property(
                    msg => $scope->property_u('msg'),
                    116.000727537286
                );
                if ( bool( $scope->property_u('msg')->property_u('command') ) )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    {
                        my $maybe_0 =
                          $self->property_u('commands')->get_index_value(
                            [
                                $scope->property_u('msg')->property_u('command')
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
                                $scope, undef,
                                118.004001455075
                            );
                        }
                    }
                }
                return $return;
            }
        );

        # Method event 'commandHello' definition
        my $method_9 = FF::method_event_def(
            $f, $scope,
            'commandHello',
            [
                {
                    name     => 'msg',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'msg' ) or return;
                $scope->set_property_ow(
                    $context,
                    nickname =>
                      $scope->property_u('msg')->property_u('nickname'),
                    129.000727537286
                );
                $self->property_u('privmsg')->call_u(
                    [
                        $scope->property_u('msg')->property_u('channel'),
                        add(
                            $scope,                         str( $f, "Hi " ),
                            $scope->property_u('nickname'), str( $f, "!" )
                        )
                    ],
                    $scope, undef,
                    130.000727537286
                );
                return $return;
            }
        );

        # Method event 'commandAdd' definition
        my $method_10 = FF::method_event_def(
            $f, $scope,
            'commandAdd',
            [
                {
                    name     => 'msg',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'msg' ) or return;
                $scope->property_u('inspect')
                  ->call_u( [ $scope->property_u('msg') ],
                    $scope, undef, 137.000727537286 );
                $scope->set_property_ow(
                    $context,
                    trigger => $scope->property_u('msg')->property_u('parts')
                      ->get_index_value( [ num( $f, 1 ) ], $scope ),
                    139.000727537286
                );
                $scope->set_property_ow(
                    $context,
                    response =>
                      $scope->property_u('msg')->property_u('fromWord')
                      ->call_u(
                        [ num( $f, 2 ) ],
                        $scope, undef, 140.001818843216
                      ),
                    140.000727537286
                );
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
                    $scope, undef,
                    145.000727537286
                );
                return $return;
            }
        );

        # Method event 'commandFactoid' definition
        my $method_11 = FF::method_event_def(
            $f, $scope,
            'commandFactoid',
            [
                {
                    name     => 'msg',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'msg' ) or return;
                $scope->set_property_ow(
                    $context,
                    response => $self->property_u('factoids')->get_index_value(
                        [ $scope->property_u('msg')->property_u('command') ],
                        $scope
                    ),
                    150.000727537286
                );
                $self->property_u('privmsg')->call_u(
                    [
                        $scope->property_u('msg')->property_u('channel'),
                        $scope->property_u('response')
                    ],
                    $scope, undef,
                    151.000727537286
                );
                return $return;
            }
        );
        $method_0->inside_scope(
            _init_ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            addCommand => $scope,
            $proto, $class, undef, undef
        );
        $method_2->inside_scope(
            connect => $scope,
            $proto, $class, undef, undef
        );
        $method_3->inside_scope( send => $scope, $proto, $class, undef, undef );
        $method_4->inside_scope(
            handleLine => $scope,
            $proto, $class, undef, undef
        );
        $method_5->inside_scope(
            privmsg => $scope,
            $proto, $class, undef, undef
        );
        $method_6->inside_scope(
            joinChannels => $scope,
            $proto, $class, undef, undef
        );
        $method_7->inside_scope( pong => $scope, $proto, $class, undef, undef );
        $method_8->inside_scope(
            handleMessage => $scope,
            $proto, $class, undef, undef
        );
        $method_9->inside_scope(
            commandHello => $scope,
            $proto, $class, undef, undef
        );
        $method_10->inside_scope(
            commandAdd => $scope,
            $proto, $class, undef, undef
        );
        $method_11->inside_scope(
            commandFactoid => $scope,
            $proto, $class, undef, undef
        );
    }
    FF::load_namespaces( $context,
        qw(IRC::Num IRC::Socket IRC::Socket::TCP IRC::Str IRC IRC::Message Num Socket Socket::TCP Str)
    );
};

FF::after_content();
