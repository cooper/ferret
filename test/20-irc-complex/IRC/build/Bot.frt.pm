# === Document Model ===
#  Document './test/20-irc-complex/IRC/Bot.frt'
#      Package 'IRC'
#      Class 'Bot'
#          Instruction
#              Shared variable declaration
#                  Assignment
#                      Lexical variable '$handlers'
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
#          Instruction
#              Shared variable declaration
#                  Assignment
#                      Lexical variable '$initialCommands'
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
#                      Assignment
#                          Instance variable '@commands'
#                          Call
#                              Property 'copy'
#                                  Lexical variable '$initialCommands'
#                              Argument list [0 items]
#                  Instruction
#                      Assignment
#                          Instance variable '@factoids'
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
#                                      Instance variable '@handleLine'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Lexical variable '$data'
#          Method 'addCommand'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$command'
#                          Argument type
#                              Bareword 'Str::LC'
#                  Instruction
#                      Need
#                          Lexical variable '$callback'
#                  If
#                      Expression ('if' parameter)
#                          Index
#                              Instance variable '@commands'
#                              Index list [1 items]
#                                  Item 0
#                                      Lexical variable '$command'
#                      Body ('if' scope)
#                          Instruction
#                              Return pair 'overwrote'
#                                  Boolean true
#                  Instruction
#                      Assignment
#                          Index
#                              Instance variable '@commands'
#                              Index list [1 items]
#                                  Item 0
#                                      Lexical variable '$command'
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
#                      Assignment
#                          Lexical variable '$s'
#                          Call
#                              Property 'split'
#                                  Lexical variable '$line'
#                              Argument list [1 items]
#                                  Item 0
#                                      String ' '
#                  Instruction
#                      Assignment
#                          Lexical variable '$command'
#                          Index
#                              Lexical variable '$s'
#                              Index list [1 items]
#                                  Item 0
#                                      Number '1'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Index
#                                  Lexical variable '$s'
#                                  Index list [1 items]
#                                      Item 0
#                                          Number '0'
#                              Equality operator (==)
#                              String 'PING'
#                      Body ('if' scope)
#                          Instruction
#                              Assignment
#                                  Lexical variable '$command'
#                                  Index
#                                      Lexical variable '$s'
#                                      Index list [1 items]
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
#                                  Lexical variable '$handlers'
#                                  Index list [1 items]
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
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Need
#                          Lexical variable '$message'
#                          Argument type
#                              Bareword 'Str'
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
#                                  Operation
#                                      Property 'length'
#                                          Lexical variable '$line'
#                                      Negated equality operator (!=)
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
#          Function '_joinChannels'
#              Body ('function' scope)
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@_joinedChannels'
#                      Body ('if' scope)
#                          Instruction
#                              Return
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
#                  Instruction
#                      Assignment
#                          Instance variable '@_joinedChannels'
#                          Boolean true
#          Function '_pong'
#              Body ('function' scope)
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
#                                          Index list [1 items]
#                                              Item 0
#                                                  Number '1'
#          Function '_handleMessage'
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$line'
#                  Instruction
#                      Need
#                          Lexical variable '$s'
#                  Instruction
#                      Assignment
#                          Lexical variable '$msg'
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
#                                          Index list [1 items]
#                                              Item 0
#                                                  Property 'lowercase'
#                                                      Property 'command'
#                                                          Lexical variable '$msg'
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
#          Function '_commandHello'
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$msg'
#                  Instruction
#                      Assignment
#                          Lexical variable '$nickname'
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
#          Function '_commandAdd'
#              Body ('function' scope)
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
#                      Assignment
#                          Lexical variable '$trigger'
#                          Index
#                              Property 'parts'
#                                  Lexical variable '$msg'
#                              Index list [1 items]
#                                  Item 0
#                                      Number '1'
#                  Instruction
#                      Assignment
#                          Lexical variable '$response'
#                          Call
#                              Property 'fromWord'
#                                  Lexical variable '$msg'
#                              Argument list [1 items]
#                                  Item 0
#                                      Number '2'
#                  Instruction
#                      Assignment
#                          Index
#                              Instance variable '@factoids'
#                              Index list [1 items]
#                                  Item 0
#                                      Lexical variable '$trigger'
#                          Lexical variable '$response'
#                  Instruction
#                      Assignment
#                          Index
#                              Instance variable '@commands'
#                              Index list [1 items]
#                                  Item 0
#                                      Lexical variable '$trigger'
#                          Bareword '_commandFactoid'
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
#          Function '_commandFactoid'
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$msg'
#                  Instruction
#                      Assignment
#                          Lexical variable '$response'
#                          Index
#                              Instance variable '@factoids'
#                              Index list [1 items]
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
#      Include (IRC, IRC::Message, Num, Socket, Socket::TCP, Str, Str::LC)
use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('Bot.frt');

use Ferret::Core::Operations qw(add bool equal nequal num str);
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
            $ret->inc;
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
                $scope, undef, 30.06667
            );
            $$self->{'send'}->(
                [ add( $scope, str( $f, "NICK " ), $$self->{'nick'} ) ],
                $scope, undef, 31.2
            );
            return $ret->return;
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
            $ret->inc;
            FF::need( $scope, $args, 'data', 36.2 ) or return;
            $$self->{'handleLine'}
              ->( [ $$scope->{'data'} ], $scope, undef, 37.2 );
            return $ret->return;
        }
    );

    # Function event '_joinChannels' definition
    my $func_2 = FF::function_event_def(
        $f, $scope,
        '_joinChannels',
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            if ( bool( $$self->{'_joinedChannels'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret->return();
            }
            if ( bool( $$self->{'autojoin'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                FF::iterate(
                    $f, $scope,
                    $$self->{'autojoin'},
                    'chan',
                    sub {
                        my $scope   = shift;
                        my $lv_chan = $scope->property_u('chan');
                        $$self->{'send'}->(
                            [
                                add(
                                    $scope, str( $f, "JOIN " ),
                                    $$scope->{'chan'}
                                )
                            ],
                            $scope, undef, 99.2
                        );
                    },
                    98.1
                );
            }
            $self->set_property( _joinedChannels => $true, 103.2 );
            return $ret->return;
        }
    );

    # Function event '_pong' definition
    my $func_3 = FF::function_event_def(
        $f, $scope, '_pong',
        [ { name => 's', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 's', 109.2 ) or return;
            $$self->{'send'}->(
                [
                    add(
                        $scope,
                        str( $f, "PONG " ),
                        $$scope->{'s'}
                          ->get_index_value( [ num( $f, 1 ) ], $scope )
                    )
                ],
                $scope, undef, 110.1
            );
            return $ret->return;
        }
    );

    # Function event '_handleMessage' definition
    my $func_4 = FF::function_event_def(
        $f, $scope,
        '_handleMessage',
        [
            { name => 'line', type => undef, optional => undef, more => undef },
            { name => 's',    type => undef, optional => undef, more => undef }
        ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'line', 114.2 ) or return;
            FF::need( $scope, $args, 's',    114.4 ) or return;
            my $lv_msg = FF::lex_assign(
                $scope,
                msg => $$scope->{'IRC::Message'}
                  ->( [ $$scope->{'line'} ], $scope, undef, 117.3 ),
                $file_scope, 117.1
            );
            $ret->set_property( msg => $$scope->{'msg'}, 118.2 );
            if ( bool( ${ $$scope->{'msg'} }->{'command'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                {
                    my $maybe_0 = $$self->{'commands'}->get_index_value(
                        [
                            ${ ${ $$scope->{'msg'} }->{'command'} }
                              ->{'lowercase'}
                        ],
                        $scope
                    );
                    if ( bool($maybe_0) ) {
                        $maybe_0->(
                            {
                                _self => ${ $scope->{special} }->{'self'},
                                line  => $$scope->{'line'},
                                s     => $$scope->{'s'},
                                msg   => $$scope->{'msg'}
                            },
                            $scope, undef, 121.6
                        );
                    }
                }
            }
            return $ret->return;
        }
    );

    # Function event '_commandHello' definition
    my $func_5 = FF::function_event_def(
        $f, $scope,
        '_commandHello',
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'msg', 131.2 ) or return;
            my $lv_nickname = FF::lex_assign(
                $scope,
                nickname => ${ $$scope->{'msg'} }->{'nickname'},
                $file_scope, 132.2
            );
            $$self->{'privmsg'}->(
                [
                    ${ $$scope->{'msg'} }->{'channel'},
                    add(
                        $scope,                str( $f, "Hi " ),
                        $$scope->{'nickname'}, str( $f, "!" )
                    )
                ],
                $scope, undef, 133.1
            );
            return $ret->return;
        }
    );

    # Function event '_commandAdd' definition
    my $func_6 = FF::function_event_def(
        $f, $scope,
        '_commandAdd',
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'msg', 137.2 ) or return;
            $$scope->{'inspect'}
              ->( [ $$scope->{'msg'} ], $scope, undef, 138.2 );
            my $lv_trigger = FF::lex_assign(
                $scope,
                trigger => ${ $$scope->{'msg'} }->{'parts'}
                  ->get_index_value( [ num( $f, 1 ) ], $scope ),
                $file_scope, 141.2
            );
            my $lv_response = FF::lex_assign(
                $scope,
                response => ${ $$scope->{'msg'} }->{'fromWord'}
                  ->( [ num( $f, 2 ) ], $scope, undef, 142.5 ),
                $file_scope, 142.2
            );
            $$self->{'factoids'}->set_index_value( [ $$scope->{'trigger'} ],
                $$scope->{'response'}, $scope );
            $$self->{'commands'}->set_index_value( [ $$scope->{'trigger'} ],
                $$scope->{'_commandFactoid'}, $scope );
            $$self->{'privmsg'}->(
                [
                    ${ $$scope->{'msg'} }->{'channel'},
                    add(
                        $scope,
                        str( $f, "alright, associating ." ),
                        $$scope->{'trigger'},
                        str( $f, " with '" ),
                        $$scope->{'response'},
                        str( $f, "'" )
                    )
                ],
                $scope, undef, 148.1
            );
            return $ret->return;
        }
    );

    # Function event '_commandFactoid' definition
    my $func_7 = FF::function_event_def(
        $f, $scope,
        '_commandFactoid',
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'msg', 152.2 ) or return;
            my $lv_response = FF::lex_assign(
                $scope,
                response => $$self->{'factoids'}->get_index_value(
                    [ ${ $$scope->{'msg'} }->{'command'} ], $scope
                ),
                $file_scope,
                153.2
            );
            $$self->{'privmsg'}->(
                [ ${ $$scope->{'msg'} }->{'channel'}, $$scope->{'response'} ],
                $scope, undef, 154.2
            );
            return $ret->return;
        }
    );

    # Class 'Bot'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Bot', undef );

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
                { name => 'real', type => 'Str', optional => 1, more => undef }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                FF::need( $self, $args, 'addr' ) or return;
                FF::need( $self, $args, 'nick' ) or return;
                FF::want( $self, $args, 'port', 18.2, num( $f, 6667 ) );
                FF::want( $self, $args, 'user', 19.2, str( $f, "ferret" ) );
                FF::want( $self, $args, 'real', 20.2, str( $f, "Ferret IRC" ) );
                $self->set_property(
                    commands => ${ $$scope->{'initialCommands'} }->{'copy'}
                      ->( {}, $scope, undef, 22.5 ),
                    22.2
                );
                $self->set_property(
                    factoids => FF::create_hash( $f, {} ),
                    23.2
                );
                $self->set_property(
                    sock => $$scope->{'Socket::TCP'}->(
                        {
                            address  => $$self->{'addr'},
                            port     => $$self->{'port'},
                            readMode => FF::get_symbol( $f, 'line' )
                        },
                        $scope, undef, 26.3
                    ),
                    26.1
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
                return $ret->return;
            }
        );

        # Method event 'addCommand' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'addCommand',
            [
                {
                    name     => 'command',
                    type     => 'Str::LC',
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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                FF::need( $scope, $args, 'command',  43.1 ) or return;
                FF::need( $scope, $args, 'callback', 43.4 ) or return;
                if (
                    bool(
                        $$self->{'commands'}
                          ->get_index_value( [ $$scope->{'command'} ], $scope )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $ret->set_property( overwrote => $true, 45.2 );
                }
                $$self->{'commands'}->set_index_value( [ $$scope->{'command'} ],
                    $$scope->{'callback'}, $scope );
                $ret->set_property( added => $true, 47.2 );
                return $ret->return;
            }
        );

        # Method event 'connect' definition
        my $method_2 = FF::method_event_def(
            $f, $scope,
            'connect',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                ${ $$self->{'sock'} }->{'connect'}->( {}, $scope, undef, 51.3 );
                return $ret->return;
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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                FF::need( $scope, $args, 'line', 55.2 ) or return;
                $$scope->{'say'}->(
                    [ add( $scope, str( $f, "send: " ), $$scope->{'line'} ) ],
                    $scope, undef, 56.2
                );
                ${ $$self->{'sock'} }->{'println'}
                  ->( [ $$scope->{'line'} ], $scope, undef, 57.3 );
                return $ret->return;
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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                FF::need( $scope, $args, 'line', 61.2 ) or return;
                my $lv_s = FF::lex_assign(
                    $scope,
                    s => ${ $$scope->{'line'} }->{'split'}
                      ->( [ str( $f, " " ) ], $scope, undef, 64.5 ),
                    $file_scope, 64.2
                );
                my $lv_command = FF::lex_assign(
                    $scope,
                    command => $$scope->{'s'}
                      ->get_index_value( [ num( $f, 1 ) ], $scope ),
                    $file_scope, 65.2
                );
                if (
                    bool(
                        equal(
                            $scope,
                            $$scope->{'s'}
                              ->get_index_value( [ num( $f, 0 ) ], $scope ),
                            str( $f, "PING" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    my $lv_command = FF::lex_assign(
                        $scope,
                        command => $$scope->{'s'}
                          ->get_index_value( [ num( $f, 0 ) ], $scope ),
                        $file_scope, 69.2
                    );
                }
                $$scope->{'say'}->(
                    [
                        add(
                            $scope,               str( $f, "recv[" ),
                            $$scope->{'command'}, str( $f, "]: " ),
                            $$scope->{'line'}
                        )
                    ],
                    $scope, undef, 71.1
                );
                {
                    my $maybe_0 = $$scope->{'handlers'}
                      ->get_index_value( [ $$scope->{'command'} ], $scope );
                    if ( bool($maybe_0) ) {
                        $maybe_0->(
                            {
                                _self   => ${ $scope->{special} }->{'self'},
                                line    => $$scope->{'line'},
                                command => $$scope->{'command'},
                                s       => $$scope->{'s'}
                            },
                            $scope, undef, 74.6
                        );
                    }
                }
                return $ret->return;
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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                FF::need( $scope, $args, 'channel', 84.1 ) or return;
                FF::need( $scope, $args, 'message', 84.3 ) or return;
                FF::iterate(
                    $f, $scope,
                    ${ $$scope->{'message'} }->{'split'}
                      ->( [ str( $f, "\n" ) ], $scope, undef, 85.3 ),
                    'line',
                    sub {
                        my $scope   = shift;
                        my $lv_line = $scope->property_u('line');
                        if (
                            bool(
                                nequal(
                                    $scope,
                                    ${ $$scope->{'line'} }->{'length'},
                                    num( $f, 0 )
                                )
                            )
                          )
                        {
                            my $scope =
                              Ferret::Scope->new( $f, parent => $scope );

                            $$self->{'send'}->(
                                [
                                    add(
                                        $scope,
                                        str( $f, "PRIVMSG " ),
                                        $$scope->{'channel'},
                                        str( $f, " :" ),
                                        $$scope->{'line'}
                                    )
                                ],
                                $scope, undef, 87.1
                            );
                        }
                    },
                    85.05
                );
                return $ret->return;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
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
        $func_2->inside_scope(
            _joinChannels => $scope,
            $scope, $class, undef, undef
        );
        $func_3->inside_scope( _pong => $scope, $scope, $class, undef, undef );
        $func_4->inside_scope(
            _handleMessage => $scope,
            $scope, $class, undef, undef
        );
        $func_5->inside_scope(
            _commandHello => $scope,
            $scope, $class, undef, undef
        );
        $func_6->inside_scope(
            _commandAdd => $scope,
            $scope, $class, undef, undef
        );
        $func_7->inside_scope(
            _commandFactoid => $scope,
            $scope, $class, undef, undef
        );
        my $lv_handlers = FF::lex_assign(
            $class,
            handlers => FF::create_hash(
                $f,
                {
                    MODE    => $$scope->{'_joinChannels'},
                    PING    => $$scope->{'_pong'},
                    PRIVMSG => $$scope->{'_handleMessage'}
                }
            ),
            undef,
            4.3
        );
        my $lv_initialCommands = FF::lex_assign(
            $class,
            initialCommands => FF::create_hash(
                $f,
                {
                    hello => $$scope->{'_commandHello'},
                    hi    => $$scope->{'_commandHello'},
                    add   => $$scope->{'_commandAdd'}
                }
            ),
            undef,
            10.3
        );
    }
    FF::load_namespaces( $context,
        qw(IRC IRC::Message Num Socket Socket::TCP Str Str::LC) );
};

FF::after_content();
