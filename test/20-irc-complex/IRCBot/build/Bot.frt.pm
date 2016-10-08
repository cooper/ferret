# === Document Model ===
#  Document './test/20-irc-complex/IRCBot/Bot.frt'
#      Package 'IRCBot'
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
#                                  Pair '_this'
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
#                  For (values)
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
#                                  Negation
#                                      Property 'empty'
#                                          Lexical variable '$line'
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
#                          This variable '%_joinedChannels'
#                      Body ('if' scope)
#                          Instruction
#                              Return
#                  If
#                      Expression ('if' parameter)
#                          This variable '%autojoin'
#                      Body ('if' scope)
#                          For (values)
#                              Expression ('for' parameter)
#                                  Lexical variable '$chan'
#                              Expression ('in' parameter)
#                                  This variable '%autojoin'
#                              Body ('for' scope)
#                                  Instruction
#                                      Call
#                                          This variable '%send'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  Operation
#                                                      String 'JOIN '
#                                                      Addition operator (+)
#                                                      Lexical variable '$chan'
#                  Instruction
#                      Assignment
#                          This variable '%_joinedChannels'
#                          Boolean true
#          Function '_pong'
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$s'
#                  Instruction
#                      Call
#                          This variable '%send'
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
#                              Bareword 'Message'
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
#                                          This variable '%commands'
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
#                          This variable '%privmsg'
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
#                              This variable '%factoids'
#                              Index list [1 items]
#                                  Item 0
#                                      Lexical variable '$trigger'
#                          Lexical variable '$response'
#                  Instruction
#                      Assignment
#                          Index
#                              This variable '%commands'
#                              Index list [1 items]
#                                  Item 0
#                                      Lexical variable '$trigger'
#                          Bareword '_commandFactoid'
#                  Instruction
#                      Call
#                          This variable '%privmsg'
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
#                          Call
#                              Property 'fill'
#                                  Index
#                                      This variable '%factoids'
#                                      Index list [1 items]
#                                          Item 0
#                                              Property 'command'
#                                                  Lexical variable '$msg'
#                              Named argument list [4 items]
#                                  Item 0
#                                      Pair 'nick'
#                                          Property 'nickname'
#                                              Lexical variable '$msg'
#                                  Item 1
#                                      Pair 'cmd'
#                                          Property 'command'
#                                              Lexical variable '$msg'
#                                  Item 2
#                                      Pair 'chan'
#                                          Property 'channel'
#                                              Lexical variable '$msg'
#                                  Item 3
#                                      Pair 'nl'
#                                          String '␤'
#                  Instruction
#                      Call
#                          This variable '%privmsg'
#                          Argument list [2 items]
#                              Item 0
#                                  Property 'channel'
#                                      Lexical variable '$msg'
#                              Item 1
#                                  Lexical variable '$response'
#      Include (Message, Num, Socket, Socket::TCP, Str, Str::LC)
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

my $self;
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $pos = before_content( 'Bot.frt', './test/20-irc-complex/IRCBot/Bot.frt' );

use Ferret::Core::Operations qw(_not add bool equal num str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'IRCBot' );
    my $scope = $file_scope;
    load_core('IRCBot');

    # Anonymous function definition
    my $func_0 = function_def(
        $f, undef,
        'sendRegistration',
        [],
        sub {
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
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
                $scope, undef,
                $pos->(30.06667)
            );
            $$self->{'send'}->(
                [ add( $scope, str( $f, "NICK " ), $$self->{'nick'} ) ],
                $scope, undef, $pos->(31.2)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_1 = function_def(
        $f, undef,
        'handleLine',
        [ { name => 'data', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            need( $scope, $args, 'data', 36.2 ) or return;
            $$self->{'handleLine'}
              ->( [ $$scope->{'data'} ], $scope, undef, $pos->(37.2) );
            return $ret;
        }
    );

    # Function event '_joinChannels' definition
    my $func_2 = function_event_def(
        $f, $scope,
        '_joinChannels',
        undef,
        [],
        sub {
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            if ( bool( $$this->{'_joinedChannels'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                return $ret_func->();
            }
            if ( bool( $$this->{'autojoin'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                {
                    my $loop_ret = iterate(
                        $f, $scope,
                        $$this->{'autojoin'},
                        'chan',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            $$this->{'send'}->(
                                [
                                    add(
                                        $scope, str( $f, "JOIN " ),
                                        $$scope->{'chan'}
                                    )
                                ],
                                $scope, undef,
                                $pos->(99.2)
                            );
                        },
                        $pos->(98.1)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
            }
            $this->set_property( _joinedChannels => $true, $pos->(103.2) );
            return $ret;
        }
    );

    # Function event '_pong' definition
    my $func_3 = function_event_def(
        $f, $scope, '_pong', undef,
        [ { name => 's', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            need( $scope, $args, 's', 109.2 ) or return;
            $$this->{'send'}->(
                [
                    add(
                        $scope,
                        str( $f, "PONG " ),
                        $$scope->{'s'}->get_index_value(
                            [ num( $f, "1" ) ],
                            $scope, $pos->(110.3)
                        )
                    )
                ],
                $scope, undef,
                $pos->(110.1)
            );
            return $ret;
        }
    );

    # Function event '_handleMessage' definition
    my $func_4 = function_event_def(
        $f, $scope,
        '_handleMessage',
        undef,
        [
            { name => 'line', type => undef, optional => undef, more => undef },
            { name => 's',    type => undef, optional => undef, more => undef }
        ],
        sub {
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            need( $scope, $args, 'line', 114.2 ) or return;
            need( $scope, $args, 's',    114.4 ) or return;
            lex_assign(
                $scope,
                msg => $$scope->{'Message'}
                  ->( [ $$scope->{'line'} ], $scope, undef, $pos->(117.4) ),
                $file_scope, $pos->(117.2)
            );
            $ret->set_property( msg => $$scope->{'msg'}, $pos->(118.2) );
            if (
                bool(
                    $$scope->{'msg'}->property_u( 'command', $pos->(121.15) )
                )
              )
            {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                {
                    my $maybe_0 = $$this->{'commands'}->get_index_value(
                        [
                            $$scope->{'msg'}
                              ->property_u( 'command',   $pos->(121.4) )
                              ->property_u( 'lowercase', $pos->(121.45) )
                        ],
                        $scope,
                        $pos->(121.3)
                    );
                    if ( bool($maybe_0) ) {
                        $maybe_0->(
                            [
                                undef,
                                [
                                    _self => ${ $scope->{special} }->{'self'},
                                    line  => $$scope->{'line'},
                                    s     => $$scope->{'s'},
                                    msg   => $$scope->{'msg'}
                                ]
                            ],
                            $scope, undef,
                            $pos->(121.6)
                        );
                    }
                }
            }
            return $ret;
        }
    );

    # Function event '_commandHello' definition
    my $func_5 = function_event_def(
        $f, $scope,
        '_commandHello',
        undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            need( $scope, $args, 'msg', 131.2 ) or return;
            lex_assign(
                $scope,
                nickname =>
                  $$scope->{'msg'}->property_u( 'nickname', $pos->(132.4) ),
                $file_scope, $pos->(132.2)
            );
            $$this->{'privmsg'}->(
                [
                    $$scope->{'msg'}->property_u( 'channel', $pos->(133.2) ),
                    add(
                        $scope,                str( $f, "Hi " ),
                        $$scope->{'nickname'}, str( $f, "!" )
                    )
                ],
                $scope, undef,
                $pos->(133.1)
            );
            return $ret;
        }
    );

    # Function event '_commandAdd' definition
    my $func_6 = function_event_def(
        $f, $scope,
        '_commandAdd',
        undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            need( $scope, $args, 'msg', 137.2 ) or return;
            $$scope->{'inspect'}
              ->( [ $$scope->{'msg'} ], $scope, undef, $pos->(138.2) );
            lex_assign(
                $scope,
                trigger =>
                  $$scope->{'msg'}->property_u( 'parts', $pos->(141.4) )
                  ->get_index_value(
                    [ num( $f, "1" ) ], $scope, $pos->(141.5)
                  ),
                $file_scope,
                $pos->(141.2)
            );
            lex_assign(
                $scope,
                response =>
                  $$scope->{'msg'}->property_u( 'fromWord', $pos->(142.4) )
                  ->( [ num( $f, "2" ) ], $scope, undef, $pos->(142.5) ),
                $file_scope, $pos->(142.2)
            );
            $$this->{'factoids'}->set_index_value( [ $$scope->{'trigger'} ],
                $$scope->{'response'}, $scope, $pos->(145.5) );
            $$this->{'commands'}->set_index_value(
                [ $$scope->{'trigger'} ],
                $$scope->{'_commandFactoid'},
                $scope, $pos->(146.5)
            );
            $$this->{'privmsg'}->(
                [
                    $$scope->{'msg'}->property_u( 'channel', $pos->(148.2) ),
                    add(
                        $scope,
                        str( $f, "alright, associating ." ),
                        $$scope->{'trigger'},
                        str( $f, " with '" ),
                        $$scope->{'response'},
                        str( $f, "'" )
                    )
                ],
                $scope, undef,
                $pos->(148.1)
            );
            return $ret;
        }
    );

    # Function event '_commandFactoid' definition
    my $func_7 = function_event_def(
        $f, $scope,
        '_commandFactoid',
        undef,
        [ { name => 'msg', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            need( $scope, $args, 'msg', 152.2 ) or return;
            lex_assign(
                $scope,
                response => $$this->{'factoids'}->get_index_value(
                    [
                        $$scope->{'msg'}->property_u( 'command', $pos->(153.3) )
                    ],
                    $scope,
                    $pos->(153.2)
                  )->property_u( 'fill', $pos->(153.4) )->(
                    [
                        undef,
                        [
                            nick => $$scope->{'msg'}
                              ->property_u( 'nickname', $pos->(154.3) ),
                            cmd => $$scope->{'msg'}
                              ->property_u( 'command', $pos->(155.3) ),
                            chan => $$scope->{'msg'}
                              ->property_u( 'channel', $pos->(156.3) ),
                            nl => str( $f, "\n" )
                        ]
                    ],
                    $scope, undef,
                    $pos->(153.45)
                  ),
                $file_scope,
                $pos->(153.1)
            );
            $$this->{'privmsg'}->(
                [
                    $$scope->{'msg'}->property_u( 'channel', $pos->(159.4) ),
                    $$scope->{'response'}
                ],
                $scope, undef,
                $pos->(159.2)
            );
            return $ret;
        }
    );

    # Class 'Bot'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Bot', undef, undef );

        # Method event 'initializer__' definition
        my $method_0 = method_event_def(
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
                my ( $scope, $self, $this, $args, $ret ) = &args_v1;
                need( $self, $args, 'addr' ) or return;
                need( $self, $args, 'nick' ) or return;
                want( $self, $args, 'port', 18.2, num( $f, "6667" ) );
                want( $self, $args, 'user', 19.2, str( $f, "ferret" ) );
                want( $self, $args, 'real', 20.2, str( $f, "Ferret IRC" ) );
                $self->set_property(
                    commands => $$scope->{'initialCommands'}
                      ->property_u( 'copy', $pos->(22.4) )
                      ->( [ undef, [] ], $scope, undef, $pos->(22.5) ),
                    $pos->(22.2)
                );
                $self->set_property(
                    factoids => create_hash( $f, [] ),
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
                        undef, $class, undef, undef
                    ),
                    {}
                );
                on(
                    $$self->{'sock'},
                    'gotLine',
                    $self, $scope,
                    $func_1->inside_scope(
                        (undef) => $scope,
                        undef, $class, undef, undef
                    ),
                    {}
                );
                return $ret;
            }
        );

        # Method event 'addCommand' definition
        my $method_1 = method_event_def(
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
                my ( $scope, $self, $this, $args, $ret ) = &args_v1;
                need( $scope, $args, 'command',  43.1 ) or return;
                need( $scope, $args, 'callback', 43.4 ) or return;
                if (
                    bool(
                        $$self->{'commands'}->get_index_value(
                            [ $$scope->{'command'} ],
                            $scope, $pos->(44.3)
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $ret->set_property( overwrote => $true, $pos->(45.2) );
                }
                $$self->{'commands'}->set_index_value( [ $$scope->{'command'} ],
                    $$scope->{'callback'}, $scope, $pos->(46.5) );
                $ret->set_property( added => $true, $pos->(47.2) );
                return $ret;
            }
        );

        # Method event 'connect' definition
        my $method_2 = method_event_def(
            $f, $scope,
            'connect',
            [],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &args_v1;
                $$self->{'sock'}->property_u( 'connect', $pos->(51.2) )
                  ->( [ undef, [] ], $scope, undef, $pos->(51.3) );
                return $ret;
            }
        );

        # Method event 'send' definition
        my $method_3 = method_event_def(
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
                my ( $scope, $self, $this, $args, $ret ) = &args_v1;
                need( $scope, $args, 'line', 55.2 ) or return;
                $$scope->{'say'}->(
                    [ add( $scope, str( $f, "send: " ), $$scope->{'line'} ) ],
                    $scope, undef, $pos->(56.2)
                );
                $$self->{'sock'}->property_u( 'println', $pos->(57.2) )
                  ->( [ $$scope->{'line'} ], $scope, undef, $pos->(57.3) );
                return $ret;
            }
        );

        # Method event 'handleLine' definition
        my $method_4 = method_event_def(
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
                my ( $scope, $self, $this, $args, $ret ) = &args_v1;
                need( $scope, $args, 'line', 61.2 ) or return;
                lex_assign(
                    $scope,
                    s => $$scope->{'line'}->property_u( 'split', $pos->(64.4) )
                      ->( [ str( $f, " " ) ], $scope, undef, $pos->(64.5) ),
                    $file_scope, $pos->(64.2)
                );
                lex_assign(
                    $scope,
                    command => $$scope->{'s'}->get_index_value(
                        [ num( $f, "1" ) ],
                        $scope, $pos->(65.4)
                    ),
                    $file_scope,
                    $pos->(65.2)
                );
                if (
                    bool(
                        equal(
                            $scope,
                            $$scope->{'s'}->get_index_value(
                                [ num( $f, "0" ) ],
                                $scope, $pos->(68.3)
                            ),
                            str( $f, "PING" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    lex_assign(
                        $scope,
                        command => $$scope->{'s'}->get_index_value(
                            [ num( $f, "0" ) ],
                            $scope, $pos->(69.4)
                        ),
                        $file_scope,
                        $pos->(69.2)
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
                    $scope, undef,
                    $pos->(71.1)
                );
                {
                    my $maybe_0 =
                      $$scope->{'handlers'}
                      ->get_index_value( [ $$scope->{'command'} ],
                        $scope, $pos->(74.2) );
                    if ( bool($maybe_0) ) {
                        $maybe_0->(
                            [
                                undef,
                                [
                                    _this   => ${ $scope->{special} }->{'self'},
                                    line    => $$scope->{'line'},
                                    command => $$scope->{'command'},
                                    s       => $$scope->{'s'}
                                ]
                            ],
                            $scope, undef,
                            $pos->(74.6)
                        );
                    }
                }
                return $ret;
            }
        );

        # Method event 'privmsg' definition
        my $method_5 = method_event_def(
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
                my ( $scope, $self, $this, $args, $ret ) = &args_v1;
                need( $scope, $args, 'channel', 84.1 ) or return;
                need( $scope, $args, 'message', 84.3 ) or return;
                {
                    my $loop_ret = iterate(
                        $f, $scope,
                        $$scope->{'message'}
                          ->property_u( 'split', $pos->(85.25) )->(
                            [ str( $f, "\n" ) ], $scope, undef, $pos->(85.3)
                          ),
                        'line',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            if (
                                bool(
                                    _not(
                                        $$scope->{'line'}
                                          ->property_u( 'empty', $pos->(86.4) )
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
                                    $scope, undef,
                                    $pos->(87.1)
                                );
                            }
                        },
                        $pos->(85.05)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret;
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
        lex_assign(
            $class,
            handlers => create_hash(
                $f,
                [
                    MODE    => $$scope->{'_joinChannels'},
                    PING    => $$scope->{'_pong'},
                    PRIVMSG => $$scope->{'_handleMessage'}
                ]
            ),
            undef,
            $pos->(4.3)
        );
        lex_assign(
            $class,
            initialCommands => create_hash(
                $f,
                [
                    hello => $$scope->{'_commandHello'},
                    hi    => $$scope->{'_commandHello'},
                    add   => $$scope->{'_commandAdd'}
                ]
            ),
            undef,
            $pos->(10.3)
        );
    }
    load_namespaces( $context, qw(Message Num Socket Socket::TCP Str Str::LC) );
};

after_content();
