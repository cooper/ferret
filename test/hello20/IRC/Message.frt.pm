# === Tokenization ===
#         PKG_DEC |                 {"name":"IRC"} | 1.1
#       CLASS_DEC |             {"name":"Message"} | 2.1
#          METHOD |     {"name":"_init_","main":1} | 4.1
#       CLOSURE_S |                                | 4.2
#    KEYWORD_NEED |                                | 5.1
#        VAR_THIS |                         "line" | 5.2
#        OP_VALUE |                                | 5.3
#        BAREWORD |                          "Str" | 5.4
#         OP_SEMI |                              1 | 5.5
#         VAR_LEX |                    "lineSplit" | 6.05
#       OP_ASSIGN |                                | 6.1
#        VAR_THIS |                         "line" | 6.15
#        PROPERTY |                        "split" | 6.2
#      PAREN_CALL |                                | 6.25
#      PROP_VALUE |                    "separator" | 6.3
#          STRING |                          [" "] | 6.35
#        OP_COMMA |                                | 6.4
#      PROP_VALUE |                        "limit" | 6.45
#          NUMBER |                            "4" | 6.5
#         PAREN_E |                                | 6.55
#         OP_SEMI |                              1 | 6.6
#        VAR_THIS |                      "channel" | 7.1
#       OP_ASSIGN |                                | 7.2
#         VAR_LEX |                    "lineSplit" | 7.3
#     BRACKET_IDX |                                | 7.4
#          NUMBER |                            "2" | 7.5
#       BRACKET_E |                                | 7.6
#         OP_SEMI |                              1 | 7.7
#        VAR_THIS |                     "nickname" | 10.05
#       OP_ASSIGN |                                | 10.1
#         VAR_LEX |                    "lineSplit" | 10.15
#     BRACKET_IDX |                                | 10.2
#          NUMBER |                            "0" | 10.25
#       BRACKET_E |                                | 10.3
#        PROPERTY |                        "split" | 10.35
#      PAREN_CALL |                                | 10.4
#      PROP_VALUE |                    "separator" | 10.45
#          STRING |                          ["!"] | 10.5
#        OP_COMMA |                                | 10.55
#      PROP_VALUE |                        "limit" | 10.6
#          NUMBER |                            "2" | 10.65
#         PAREN_E |                                | 10.7
#     BRACKET_IDX |                                | 10.75
#          NUMBER |                            "0" | 10.8
#       BRACKET_E |                                | 10.85
#         OP_SEMI |                              1 | 10.9
#        VAR_THIS |                     "nickname" | 11.1
#       OP_ASSIGN |                                | 11.2
#        VAR_THIS |                     "nickname" | 11.3
#        PROPERTY |                   "trimPrefix" | 11.4
#      PAREN_CALL |                                | 11.5
#          STRING |                          [":"] | 11.6
#         PAREN_E |                                | 11.7
#         OP_SEMI |                              1 | 11.8
#        VAR_THIS |                      "message" | 14.1
#       OP_ASSIGN |                                | 14.2
#         VAR_LEX |                    "lineSplit" | 14.3
#     BRACKET_IDX |                                | 14.4
#          NUMBER |                            "3" | 14.5
#       BRACKET_E |                                | 14.6
#         OP_SEMI |                              1 | 14.7
#        VAR_THIS |                      "message" | 15.1
#       OP_ASSIGN |                                | 15.2
#        VAR_THIS |                      "message" | 15.3
#        PROPERTY |                   "trimPrefix" | 15.4
#      PAREN_CALL |                                | 15.5
#          STRING |                          [":"] | 15.6
#         PAREN_E |                                | 15.7
#         OP_SEMI |                              1 | 15.8
#        VAR_THIS |                        "parts" | 18.1
#       OP_ASSIGN |                                | 18.2
#        VAR_THIS |                      "message" | 18.3
#        PROPERTY |                        "split" | 18.4
#      PAREN_CALL |                                | 18.5
#          STRING |                          [" "] | 18.6
#         PAREN_E |                                | 18.7
#         OP_SEMI |                              1 | 18.8
#       CLOSURE_E |                                | 20.1
#          METHOD | {"p_set":1,"name":"command","is_prop":1} | 23.1
#       CLOSURE_S |                                | 23.2
#      KEYWORD_IF |                                | 26.05
#        VAR_THIS |                        "parts" | 26.1
#     BRACKET_IDX |                                | 26.15
#          NUMBER |                            "0" | 26.2
#       BRACKET_E |                                | 26.25
#        PROPERTY |                    "hasPrefix" | 26.3
#      PAREN_CALL |                                | 26.35
#          STRING |                          ["."] | 26.4
#         PAREN_E |                                | 26.45
#       CLOSURE_S |                                | 26.5
#         VAR_LEX |                          "cmd" | 27.05
#       OP_ASSIGN |                                | 27.1
#        VAR_THIS |                        "parts" | 27.15
#     BRACKET_IDX |                                | 27.2
#          NUMBER |                            "0" | 27.25
#       BRACKET_E |                                | 27.3
#        PROPERTY |                   "trimPrefix" | 27.35
#      PAREN_CALL |                                | 27.4
#          STRING |                          ["."] | 27.45
#         PAREN_E |                                | 27.5
#         OP_SEMI |                              1 | 27.55
#      KEYWORD_IF |                                | 28.1
#         VAR_LEX |                          "cmd" | 28.2
#        PROPERTY |                       "length" | 28.3
#        OP_VALUE |                                | 28.4
#  KEYWORD_RETURN |                                | 29.1
#         VAR_LEX |                          "cmd" | 29.2
#         OP_SEMI |                              1 | 29.3
#       CLOSURE_E |                                | 30.1
#  KEYWORD_RETURN |                                | 32.1
#   KEYWORD_FALSE |                                | 32.2
#         OP_SEMI |                              1 | 32.3
#       CLOSURE_E |                                | 33.1
#          METHOD | {"is_prop":1,"name":"commandHasParameters","p_set":1} | 35.1
#       CLOSURE_S |                                | 35.2
#  KEYWORD_RETURN |                                | 36.1
#        VAR_THIS |                        "parts" | 36.2
#        PROPERTY |                       "length" | 36.3
#       OP_NEQUAL |                                | 36.4
#          NUMBER |                            "1" | 36.5
#         OP_SEMI |                              1 | 36.6
#       CLOSURE_E |                                | 37.1
#          METHOD |            {"name":"fromWord"} | 40.1
#       CLOSURE_S |                                | 40.2
#    KEYWORD_NEED |                                | 41.1
#         VAR_LEX |                        "wordN" | 41.2
#        OP_VALUE |                                | 41.3
#        BAREWORD |                          "Num" | 41.4
#         OP_SEMI |                              1 | 41.5
#  KEYWORD_RETURN |                                | 42.05
#        VAR_THIS |                      "message" | 42.1
#        PROPERTY |                        "split" | 42.15
#      PAREN_CALL |                                | 42.2
#      PROP_VALUE |                    "separator" | 42.25
#          STRING |                          [" "] | 42.3
#        OP_COMMA |                                | 42.35
#      PROP_VALUE |                        "limit" | 42.4
#         VAR_LEX |                        "wordN" | 42.45
#          OP_ADD |                                | 42.5
#          NUMBER |                            "1" | 42.55
#         PAREN_E |                                | 42.6
#     BRACKET_IDX |                                | 42.65
#         VAR_LEX |                        "wordN" | 42.7
#       BRACKET_E |                                | 42.75
#         OP_SEMI |                              1 | 42.8
#       CLOSURE_E |                                | 43.1
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
                        6.25
                      ),
                    6.1
                );
                $self->set_property(
                    channel => $scope->property_u('lineSplit')
                      ->get_index_value( [ num( $f, 2 ) ], $scope ),
                    7.2
                );
                $self->set_property(
                    nickname => $scope->property_u('lineSplit')
                      ->get_index_value( [ num( $f, 0 ) ], $scope )
                      ->property_u('split')->call_u(
                        { separator => str( $f, "!" ), limit => num( $f, 2 ) },
                        $scope,
                        undef,
                        10.4
                      )->get_index_value( [ num( $f, 0 ) ], $scope ),
                    10.1
                );
                $self->set_property(
                    nickname =>
                      $self->property_u('nickname')->property_u('trimPrefix')
                      ->call_u( [ str( $f, ":" ) ], $scope, undef, 11.5 ),
                    11.2
                );
                $self->set_property(
                    message => $scope->property_u('lineSplit')
                      ->get_index_value( [ num( $f, 3 ) ], $scope ),
                    14.2
                );
                $self->set_property(
                    message =>
                      $self->property_u('message')->property_u('trimPrefix')
                      ->call_u( [ str( $f, ":" ) ], $scope, undef, 15.5 ),
                    15.2
                );
                $self->set_property(
                    parts => $self->property_u('message')->property_u('split')
                      ->call_u( [ str( $f, " " ) ], $scope, undef, 18.5 ),
                    18.2
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
                          ->call_u( [ str( $f, "." ) ], $scope, undef, 26.35 )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $scope->set_property_ow(
                        $context,
                        cmd => $self->property_u('parts')
                          ->get_index_value( [ num( $f, 0 ) ], $scope )
                          ->property_u('trimPrefix')
                          ->call_u( [ str( $f, "." ) ], $scope, undef, 27.4 ),
                        27.1
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
                FF::need( $scope, $arguments, 'wordN', 41.2 ) or return;
                return $self->property_u('message')->property_u('split')
                  ->call_u(
                    {
                        separator => str( $f, " " ),
                        limit     => add(
                            $scope, $scope->property_u('wordN'),
                            num( $f, 1 )
                        )
                    },
                    $scope, undef, 42.2
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
