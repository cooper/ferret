# === Tokenization ===
#         PKG_DEC | {"name":"IRC"}
#       CLASS_DEC | {"name":"Message"}
#          METHOD | {"name":"_init_","main":1}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#        VAR_THIS | "line"
#        OP_VALUE | 
#        BAREWORD | "Str"
#         OP_SEMI | 
#         VAR_LEX | "lineSplit"
#       OP_ASSIGN | 
#        VAR_THIS | "line"
#        PROPERTY | "split"
#      PAREN_CALL | 
#      PROP_VALUE | "separator"
#          STRING | [" "]
#        OP_COMMA | 
#      PROP_VALUE | "limit"
#          NUMBER | "4"
#         PAREN_E | 
#         OP_SEMI | 
#        VAR_THIS | "channel"
#       OP_ASSIGN | 
#         VAR_LEX | "lineSplit"
#     BRACKET_IDX | 
#          NUMBER | "2"
#       BRACKET_E | 
#         OP_SEMI | 
#        VAR_THIS | "nickname"
#       OP_ASSIGN | 
#         VAR_LEX | "lineSplit"
#     BRACKET_IDX | 
#          NUMBER | "0"
#       BRACKET_E | 
#        PROPERTY | "split"
#      PAREN_CALL | 
#      PROP_VALUE | "separator"
#          STRING | ["!"]
#        OP_COMMA | 
#      PROP_VALUE | "limit"
#          NUMBER | "2"
#         PAREN_E | 
#     BRACKET_IDX | 
#          NUMBER | "0"
#       BRACKET_E | 
#         OP_SEMI | 
#        VAR_THIS | "nickname"
#       OP_ASSIGN | 
#        VAR_THIS | "nickname"
#        PROPERTY | "trimPrefix"
#      PAREN_CALL | 
#          STRING | [":"]
#         PAREN_E | 
#         OP_SEMI | 
#        VAR_THIS | "message"
#       OP_ASSIGN | 
#         VAR_LEX | "lineSplit"
#     BRACKET_IDX | 
#          NUMBER | "3"
#       BRACKET_E | 
#         OP_SEMI | 
#        VAR_THIS | "message"
#       OP_ASSIGN | 
#        VAR_THIS | "message"
#        PROPERTY | "trimPrefix"
#      PAREN_CALL | 
#          STRING | [":"]
#         PAREN_E | 
#         OP_SEMI | 
#        VAR_THIS | "parts"
#       OP_ASSIGN | 
#        VAR_THIS | "message"
#        PROPERTY | "split"
#      PAREN_CALL | 
#          STRING | [" "]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"is_prop":1,"p_set":1,"name":"command"}
#       CLOSURE_S | 
#      KEYWORD_IF | 
#        VAR_THIS | "parts"
#     BRACKET_IDX | 
#          NUMBER | "0"
#       BRACKET_E | 
#        PROPERTY | "hasPrefix"
#      PAREN_CALL | 
#          STRING | ["."]
#         PAREN_E | 
#       CLOSURE_S | 
#         VAR_LEX | "cmd"
#       OP_ASSIGN | 
#        VAR_THIS | "parts"
#     BRACKET_IDX | 
#          NUMBER | "0"
#       BRACKET_E | 
#        PROPERTY | "trimPrefix"
#      PAREN_CALL | 
#          STRING | ["."]
#         PAREN_E | 
#         OP_SEMI | 
#      KEYWORD_IF | 
#         VAR_LEX | "cmd"
#        PROPERTY | "length"
#        OP_VALUE | 
#  KEYWORD_RETURN | 
#         VAR_LEX | "cmd"
#         OP_SEMI | 
#       CLOSURE_E | 
#  KEYWORD_RETURN | 
#   KEYWORD_FALSE | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"commandHasParameters","p_set":1,"is_prop":1}
#       CLOSURE_S | 
#  KEYWORD_RETURN | 
#        VAR_THIS | "parts"
#        PROPERTY | "length"
#       OP_NEQUAL | 
#          NUMBER | "1"
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"fromWord"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "wordN"
#        OP_VALUE | 
#        BAREWORD | "Num"
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#        VAR_THIS | "message"
#        PROPERTY | "split"
#      PAREN_CALL | 
#      PROP_VALUE | "separator"
#          STRING | [" "]
#        OP_COMMA | 
#      PROP_VALUE | "limit"
#         VAR_LEX | "wordN"
#          OP_ADD | 
#          NUMBER | "1"
#         PAREN_E | 
#     BRACKET_IDX | 
#         VAR_LEX | "wordN"
#       BRACKET_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
# === Document Model ===
#  Document './test/hello20/IRC/Message.frt'
#      Package 'IRC'
#      Class 'Message'
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Instance variable '@line'
#                          Bareword 'Str'
#                  Instruction
#                      Assignment (lexical variable '$lineSplit')
#                          Call
#                              Property 'split'
#                                  Instance variable '@line'
#                              Named argument list [2 items]
#                                  Item 0
#                                      Pair 'separator'
#                                          String ' '
#                                  Item 1
#                                      Pair 'limit'
#                                          Number '4'
#                  Instruction
#                      Assignment (instance variable '@channel')
#                          Index
#                              Lexical variable '$lineSplit'
#                              Single value [1 items]
#                                  Item 0
#                                      Number '2'
#                  Instruction
#                      Assignment (instance variable '@nickname')
#                          Index
#                              Call
#                                  Property 'split'
#                                      Index
#                                          Lexical variable '$lineSplit'
#                                          Single value [1 items]
#                                              Item 0
#                                                  Number '0'
#                                  Named argument list [2 items]
#                                      Item 0
#                                          Pair 'separator'
#                                              String '!'
#                                      Item 1
#                                          Pair 'limit'
#                                              Number '2'
#                              Single value [1 items]
#                                  Item 0
#                                      Number '0'
#                  Instruction
#                      Assignment (instance variable '@nickname')
#                          Call
#                              Property 'trimPrefix'
#                                  Instance variable '@nickname'
#                              Argument list [1 items]
#                                  Item 0
#                                      String ':'
#                  Instruction
#                      Assignment (instance variable '@message')
#                          Index
#                              Lexical variable '$lineSplit'
#                              Single value [1 items]
#                                  Item 0
#                                      Number '3'
#                  Instruction
#                      Assignment (instance variable '@message')
#                          Call
#                              Property 'trimPrefix'
#                                  Instance variable '@message'
#                              Argument list [1 items]
#                                  Item 0
#                                      String ':'
#                  Instruction
#                      Assignment (instance variable '@parts')
#                          Call
#                              Property 'split'
#                                  Instance variable '@message'
#                              Argument list [1 items]
#                                  Item 0
#                                      String ' '
#          Computed property 'command' (lazy)
#              Body ('method' scope)
#                  If
#                      Expression ('if' parameter)
#                          Call
#                              Property 'hasPrefix'
#                                  Index
#                                      Instance variable '@parts'
#                                      Single value [1 items]
#                                          Item 0
#                                              Number '0'
#                              Argument list [1 items]
#                                  Item 0
#                                      String '.'
#                      Body ('if' scope)
#                          Instruction
#                              Assignment (lexical variable '$cmd')
#                                  Call
#                                      Property 'trimPrefix'
#                                          Index
#                                              Instance variable '@parts'
#                                              Single value [1 items]
#                                                  Item 0
#                                                      Number '0'
#                                      Argument list [1 items]
#                                          Item 0
#                                              String '.'
#                          If
#                              Expression ('if' parameter)
#                                  Property 'length'
#                                      Lexical variable '$cmd'
#                              Body ('if' scope)
#                                  Instruction
#                                      Return
#                                          Lexical variable '$cmd'
#                  Instruction
#                      Return
#                          Boolean false
#          Computed property 'commandHasParameters' (lazy)
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Equality
#                              Property 'length'
#                                  Instance variable '@parts'
#                              Number '1'
#          Method 'fromWord'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$wordN'
#                          Bareword 'Num'
#                  Instruction
#                      Return
#                          Index
#                              Call
#                                  Property 'split'
#                                      Instance variable '@message'
#                                  Named argument list [2 items]
#                                      Item 0
#                                          Pair 'separator'
#                                              String ' '
#                                      Item 1
#                                          Pair 'limit'
#                                              Operation
#                                                  Lexical variable '$wordN'
#                                                  Addition operator (+)
#                                                  Number '1'
#                              Single value [1 items]
#                                  Item 0
#                                      Lexical variable '$wordN'
#      Include (Num, Str)
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

FF::before_content('Message.frt');

use Ferret::Core::Operations qw(_not add bool num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'IRC' );
    FF::load_core('IRC');

    # Class 'Message'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Message', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
            [
                {
                    name     => 'line',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $self, $arguments, 'line' ) or return;
                $scope->set_property_ow(
                    $context,
                    lineSplit =>
                      $self->property_u('line')->property_u('split')->call_u(
                        { separator => str( $f, " " ), limit => num( $f, 4 ) },
                        $scope,
                        undef,
                        6.71429
                      ),
                    6.28571
                );
                $self->set_property(
                    channel => $scope->property_u('lineSplit')
                      ->get_index_value( [ num( $f, 2 ) ], $scope ),
                    8.28571
                );
                $self->set_property(
                    nickname => $scope->property_u('lineSplit')
                      ->get_index_value( [ num( $f, 0 ) ], $scope )
                      ->property_u('split')->call_u(
                        { separator => str( $f, "!" ), limit => num( $f, 2 ) },
                        $scope,
                        undef,
                        10.44444
                      )->get_index_value( [ num( $f, 0 ) ], $scope ),
                    10.11111
                );
                $self->set_property(
                    nickname =>
                      $self->property_u('nickname')->property_u('trimPrefix')
                      ->call_u( [ str( $f, ":" ) ], $scope, undef, 11.83333 ),
                    11.33333
                );
                $self->set_property(
                    message => $scope->property_u('lineSplit')
                      ->get_index_value( [ num( $f, 3 ) ], $scope ),
                    14.28571
                );
                $self->set_property(
                    message =>
                      $self->property_u('message')->property_u('trimPrefix')
                      ->call_u( [ str( $f, ":" ) ], $scope, undef, 15.83333 ),
                    15.33333
                );
                $self->set_property(
                    parts => $self->property_u('message')->property_u('split')
                      ->call_u( [ str( $f, " " ) ], $scope, undef, 18.83333 ),
                    18.33333
                );
                return $return;
            }
        );

        # Method event 'command' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'command',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                if (
                    bool(
                        $self->property_u('parts')
                          ->get_index_value( [ num( $f, 0 ) ], $scope )
                          ->property_u('hasPrefix')
                          ->call_u( [ str( $f, "." ) ], $scope, undef, 26.7 )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $scope->set_property_ow(
                        $context,
                        cmd => $self->property_u('parts')
                          ->get_index_value( [ num( $f, 0 ) ], $scope )
                          ->property_u('trimPrefix')->call_u(
                            [ str( $f, "." ) ],
                            $scope, undef, 27.88889
                          ),
                        27.22222
                    );
                    if ( bool( $scope->property_u('cmd')->property_u('length') )
                      )
                    {
                        my $scope = Ferret::Scope->new( $f, parent => $scope );

                        return $scope->property_u('cmd');
                    }
                }
                return $false;
                return $return;
            }
        );

        # Method event 'commandHasParameters' definition
        my $method_2 = FF::method_event_def(
            $f, $scope,
            'commandHasParameters',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return _not( $self->property_u('parts')->property_u('length')
                      ->equal_to( num( $f, 1 ), $scope ) );
                return $return;
            }
        );

        # Method event 'fromWord' definition
        my $method_3 = FF::method_event_def(
            $f, $scope,
            'fromWord',
            [
                {
                    name     => 'wordN',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'wordN', 41.4 ) or return;
                return $self->property_u('message')->property_u('split')
                  ->call_u(
                    {
                        separator => str( $f, " " ),
                        limit     => add(
                            $scope, $scope->property_u('wordN'),
                            num( $f, 1 )
                        )
                    },
                    $scope, undef, 42.25
                  )->get_index_value( [ $scope->property_u('wordN') ], $scope );
                return $return;
            }
        );
        $method_0->inside_scope(
            _init_ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope( command => $scope, $proto, $class, 1, 1 );
        $method_2->inside_scope(
            commandHasParameters => $scope,
            $proto, $class, 1, 1
        );
        $method_3->inside_scope(
            fromWord => $scope,
            $proto, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Num Str) );
};

FF::after_content();
