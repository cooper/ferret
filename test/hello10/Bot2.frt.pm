# === Tokenization ===
#       CLASS_DEC | {"name":"Bot2"}
#          METHOD | {"name":"_init_","main":1}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#        VAR_THIS | "address"
#        OP_VALUE | 
#        BAREWORD | "Str"
#        OP_COMMA | 
#        VAR_THIS | "nick"
#        OP_VALUE | 
#        BAREWORD | "Str"
#        OP_COMMA | 
#        VAR_THIS | "user"
#        OP_VALUE | 
#        BAREWORD | "Str"
#         OP_SEMI | 
#    KEYWORD_WANT | 
#        VAR_THIS | "port"
#        OP_VALUE | 
#        BAREWORD | "Num"
#       OP_ASSIGN | 
#          NUMBER | "6667"
#        OP_COMMA | 
#        VAR_THIS | "real"
#        OP_VALUE | 
#        BAREWORD | "Str"
#       OP_ASSIGN | 
#          STRING | ["Ferret IRC"]
#         OP_SEMI | 
#        BAREWORD | "Socket"
#         OP_PACK | 
#        BAREWORD | "TCP"
#        PROPERTY | "init"
#      PAREN_CALL | 
#        VAR_SPEC | "self"
#         PAREN_E | 
#      PAREN_CALL | 
#      PROP_VALUE | "addr"
#        VAR_THIS | "address"
#        OP_COMMA | 
#      PROP_VALUE | "port"
#        VAR_THIS | "port"
#         PAREN_E | 
#         OP_SEMI | 
#        VAR_THIS | "send"
#       OP_ASSIGN | 
#        VAR_THIS | "println"
#         OP_SEMI | 
#      KEYWORD_ON | 
#        VAR_THIS | "connected"
#       CLOSURE_S | 
#        VAR_THIS | "send"
#      PAREN_CALL | 
#          STRING | ["USER ",["VAR_THIS","user",15]," ","*"," ","*"," :",["VAR_THIS","real",15]]
#         PAREN_E | 
#         OP_SEMI | 
#        VAR_THIS | "send"
#      PAREN_CALL | 
#          STRING | ["NICK ",["VAR_THIS","nick",16]]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#      KEYWORD_ON | 
#        VAR_THIS | "gotLine"
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "data"
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["recv: ",["VAR_LEX","data",22]]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#      KEYWORD_ON | 
#        VAR_THIS | "println"
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "data"
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["send: ",["VAR_LEX","data",27]]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#       CLOSURE_E | 
# === Document Model ===
#  Document './test/hello10/Bot2.frt'
#      Class 'Bot2'
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Instance variable '@address'
#                          Bareword 'Str'
#                  Instruction
#                      Need
#                          Instance variable '@nick'
#                          Bareword 'Str'
#                  Instruction
#                      Need
#                          Instance variable '@user'
#                          Bareword 'Str'
#                  Instruction
#                      Want
#                          Instance variable '@port'
#                          Expression ('want' parameter)
#                              Number '6667'
#                          Bareword 'Num'
#                  Instruction
#                      Want
#                          Instance variable '@real'
#                          Expression ('want' parameter)
#                              String 'Ferret IRC'
#                          Bareword 'Str'
#                  Instruction
#                      Call
#                          Call
#                              Property 'init'
#                                  Bareword 'Socket::TCP'
#                              Argument list [1 items]
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
#                      Assignment (instance variable '@send')
#                          Instance variable '@println'
#                  On
#                      Expression ('on' parameter)
#                          Instance variable '@connected'
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
#                          Instance variable '@gotLine'
#                      Anonymous function
#                          Body ('function' scope)
#                              Instruction
#                                  Need
#                                      Lexical variable '$data'
#                              Instruction
#                                  Call
#                                      Bareword 'say'
#                                      Argument list [1 items]
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
#                                      Argument list [1 items]
#                                          Item 0
#                                              Operation
#                                                  String 'send: '
#                                                  Addition operator (+)
#                                                  Lexical variable '$data'
#      Include (Num, Socket, Socket::TCP, Str)
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

FF::before_content('Bot2.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

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
                $scope, undef, 14.4
            );
            $self->property_u('send')->call_u(
                [
                    add(
                        $scope, str( $f, "NICK " ), $self->property_u('nick')
                    )
                ],
                $scope, undef, 15.66667
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
            FF::need( $scope, $arguments, 'data', 20.66667 ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "recv: " ),
                        $scope->property_u('data')
                    )
                ],
                $scope, undef, 21.4
            );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_2 = FF::function_def(
        $f, $scope, undef,
        [ { name => 'data', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'data', 25.66667 ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "send: " ),
                        $scope->property_u('data')
                    )
                ],
                $scope, undef, 26.4
            );
            return $return;
        }
    );

    # Class 'Bot2'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Bot2', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
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
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $self, $arguments, 'address' ) or return;
                FF::need( $self, $arguments, 'nick' )    or return;
                FF::need( $self, $arguments, 'user' )    or return;
                FF::want( $self, $arguments, 'port', 5.16667, num( $f, 6667 ) );
                FF::want( $self, $arguments, 'real', 5.66667,
                    str( $f, "Ferret IRC" ) );
                $scope->property_u('Socket::TCP')->property_u('init')
                  ->call_u( [ $scope->{special}->property_u('self') ],
                    $scope, undef, 9.33333 )->call_u(
                    {
                        addr => $self->property_u('address'),
                        port => $self->property_u('port')
                    },
                    $scope, undef, 9.53333
                    );
                $self->set_property(
                    send => $self->property_u('println'),
                    11.5
                );
                FF::on(
                    $self,
                    'connected',
                    $self, $scope,
                    $func_0->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    ),
                    {}
                );
                FF::on(
                    $self,
                    'gotLine',
                    $self, $scope,
                    $func_1->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    ),
                    {}
                );
                FF::on(
                    $self,
                    'println',
                    $self, $scope,
                    $func_2->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    ),
                    {}
                );
                return $return;
            }
        );
        $method_0->inside_scope(
            _init_ => $scope,
            $class, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Num Socket Socket::TCP Str) );
};

FF::after_content();
