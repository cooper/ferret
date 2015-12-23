# === Tokenization ===
#         PKG_DEC |                 {"name":"IRC"} | 1.5
#       CLASS_DEC |             {"name":"Message"} | 2.5
#          METHOD |     {"main":1,"name":"_init_"} | 4.33333
#       CLOSURE_S |                                | 4.66667
#    KEYWORD_NEED |                                | 5.16667
#        VAR_THIS |                         "line" | 5.33333
#        OP_VALUE |                                | 5.5
#        BAREWORD |                          "Str" | 5.66667
#         OP_SEMI |                                | 5.83333
#         VAR_LEX |                    "lineSplit" | 6.07692
#       OP_ASSIGN |                                | 6.15385
#        VAR_THIS |                         "line" | 6.23077
#        PROPERTY |                        "split" | 6.30769
#      PAREN_CALL |                                | 6.38462
#      PROP_VALUE |                    "separator" | 6.46154
#          STRING |                          [" "] | 6.53846
#        OP_COMMA |                                | 6.61538
#      PROP_VALUE |                        "limit" | 6.69231
#          NUMBER |                            "4" | 6.76923
#         PAREN_E |                                | 6.84615
#         OP_SEMI |                                | 6.92308
#        VAR_THIS |                      "channel" | 7.125
#       OP_ASSIGN |                                | 7.25
#         VAR_LEX |                    "lineSplit" | 7.375
#     BRACKET_IDX |                                | 7.5
#          NUMBER |                            "2" | 7.625
#       BRACKET_E |                                | 7.75
#         OP_SEMI |                                | 7.875
#        VAR_THIS |                     "nickname" | 10.05263
#       OP_ASSIGN |                                | 10.10526
#         VAR_LEX |                    "lineSplit" | 10.15789
#     BRACKET_IDX |                                | 10.21053
#          NUMBER |                            "0" | 10.26316
#       BRACKET_E |                                | 10.31579
#        PROPERTY |                        "split" | 10.36842
#      PAREN_CALL |                                | 10.42105
#      PROP_VALUE |                    "separator" | 10.47368
#          STRING |                          ["!"] | 10.52632
#        OP_COMMA |                                | 10.57895
#      PROP_VALUE |                        "limit" | 10.63158
#          NUMBER |                            "2" | 10.68421
#         PAREN_E |                                | 10.73684
#     BRACKET_IDX |                                | 10.78947
#          NUMBER |                            "0" | 10.84211
#       BRACKET_E |                                | 10.89474
#         OP_SEMI |                                | 10.94737
#        VAR_THIS |                     "nickname" | 11.11111
#       OP_ASSIGN |                                | 11.22222
#        VAR_THIS |                     "nickname" | 11.33333
#        PROPERTY |                   "trimPrefix" | 11.44444
#      PAREN_CALL |                                | 11.55556
#          STRING |                          [":"] | 11.66667
#         PAREN_E |                                | 11.77778
#         OP_SEMI |                                | 11.88889
#        VAR_THIS |                      "message" | 14.125
#       OP_ASSIGN |                                | 14.25
#         VAR_LEX |                    "lineSplit" | 14.375
#     BRACKET_IDX |                                | 14.5
#          NUMBER |                            "3" | 14.625
#       BRACKET_E |                                | 14.75
#         OP_SEMI |                                | 14.875
#        VAR_THIS |                      "message" | 15.11111
#       OP_ASSIGN |                                | 15.22222
#        VAR_THIS |                      "message" | 15.33333
#        PROPERTY |                   "trimPrefix" | 15.44444
#      PAREN_CALL |                                | 15.55556
#          STRING |                          [":"] | 15.66667
#         PAREN_E |                                | 15.77778
#         OP_SEMI |                                | 15.88889
#        VAR_THIS |                        "parts" | 18.11111
#       OP_ASSIGN |                                | 18.22222
#        VAR_THIS |                      "message" | 18.33333
#        PROPERTY |                        "split" | 18.44444
#      PAREN_CALL |                                | 18.55556
#          STRING |                          [" "] | 18.66667
#         PAREN_E |                                | 18.77778
#         OP_SEMI |                                | 18.88889
#       CLOSURE_E |                                | 20.5
#          METHOD | {"is_prop":1,"p_set":1,"name":"command"} | 23.33333
#       CLOSURE_S |                                | 23.66667
#      KEYWORD_IF |                                | 26.09091
#        VAR_THIS |                        "parts" | 26.18182
#     BRACKET_IDX |                                | 26.27273
#          NUMBER |                            "0" | 26.36364
#       BRACKET_E |                                | 26.45455
#        PROPERTY |                    "hasPrefix" | 26.54545
#      PAREN_CALL |                                | 26.63636
#          STRING |                          ["."] | 26.72727
#         PAREN_E |                                | 26.81818
#       CLOSURE_S |                                | 26.90909
#         VAR_LEX |                          "cmd" | 27.08333
#       OP_ASSIGN |                                | 27.16667
#        VAR_THIS |                        "parts" | 27.25
#     BRACKET_IDX |                                | 27.33333
#          NUMBER |                            "0" | 27.41667
#       BRACKET_E |                                | 27.5
#        PROPERTY |                   "trimPrefix" | 27.58333
#      PAREN_CALL |                                | 27.66667
#          STRING |                          ["."] | 27.75
#         PAREN_E |                                | 27.83333
#         OP_SEMI |                                | 27.91667
#      KEYWORD_IF |                                | 28.2
#         VAR_LEX |                          "cmd" | 28.4
#        PROPERTY |                       "length" | 28.6
#        OP_VALUE |                                | 28.8
#  KEYWORD_RETURN |                                | 29.25
#         VAR_LEX |                          "cmd" | 29.5
#         OP_SEMI |                                | 29.75
#       CLOSURE_E |                                | 30.5
#  KEYWORD_RETURN |                                | 32.25
#   KEYWORD_FALSE |                                | 32.5
#         OP_SEMI |                                | 32.75
#       CLOSURE_E |                                | 33.5
#          METHOD | {"name":"commandHasParameters","p_set":1,"is_prop":1} | 35.33333
#       CLOSURE_S |                                | 35.66667
#  KEYWORD_RETURN |                                | 36.14286
#        VAR_THIS |                        "parts" | 36.28571
#        PROPERTY |                       "length" | 36.42857
#       OP_NEQUAL |                                | 36.57143
#          NUMBER |                            "1" | 36.71429
#         OP_SEMI |                                | 36.85714
#       CLOSURE_E |                                | 37.5
#          METHOD |            {"name":"fromWord"} | 40.33333
#       CLOSURE_S |                                | 40.66667
#    KEYWORD_NEED |                                | 41.16667
#         VAR_LEX |                        "wordN" | 41.33333
#        OP_VALUE |                                | 41.5
#        BAREWORD |                          "Num" | 41.66667
#         OP_SEMI |                                | 41.83333
#  KEYWORD_RETURN |                                | 42.05882
#        VAR_THIS |                      "message" | 42.11765
#        PROPERTY |                        "split" | 42.17647
#      PAREN_CALL |                                | 42.23529
#      PROP_VALUE |                    "separator" | 42.29412
#          STRING |                          [" "] | 42.35294
#        OP_COMMA |                                | 42.41176
#      PROP_VALUE |                        "limit" | 42.47059
#         VAR_LEX |                        "wordN" | 42.52941
#          OP_ADD |                                | 42.58824
#          NUMBER |                            "1" | 42.64706
#         PAREN_E |                                | 42.70588
#     BRACKET_IDX |                                | 42.76471
#         VAR_LEX |                        "wordN" | 42.82353
#       BRACKET_E |                                | 42.88235
#         OP_SEMI |                                | 42.94118
#       CLOSURE_E |                                | 43.5
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
                        6.38462
                      ),
                    6.15385
                );
                $self->set_property(
                    channel => $scope->property_u('lineSplit')
                      ->get_index_value( [ num( $f, 2 ) ], $scope ),
                    7.25
                );
                $self->set_property(
                    nickname => $scope->property_u('lineSplit')
                      ->get_index_value( [ num( $f, 0 ) ], $scope )
                      ->property_u('split')->call_u(
                        { separator => str( $f, "!" ), limit => num( $f, 2 ) },
                        $scope,
                        undef,
                        10.42105
                      )->get_index_value( [ num( $f, 0 ) ], $scope ),
                    10.10526
                );
                $self->set_property(
                    nickname =>
                      $self->property_u('nickname')->property_u('trimPrefix')
                      ->call_u( [ str( $f, ":" ) ], $scope, undef, 11.55556 ),
                    11.22222
                );
                $self->set_property(
                    message => $scope->property_u('lineSplit')
                      ->get_index_value( [ num( $f, 3 ) ], $scope ),
                    14.25
                );
                $self->set_property(
                    message =>
                      $self->property_u('message')->property_u('trimPrefix')
                      ->call_u( [ str( $f, ":" ) ], $scope, undef, 15.55556 ),
                    15.22222
                );
                $self->set_property(
                    parts => $self->property_u('message')->property_u('split')
                      ->call_u( [ str( $f, " " ) ], $scope, undef, 18.55556 ),
                    18.22222
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
                          ->property_u('hasPrefix')->call_u(
                            [ str( $f, "." ) ],
                            $scope, undef, 26.63636
                          )
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
                            $scope, undef, 27.66667
                          ),
                        27.16667
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
                FF::need( $scope, $arguments, 'wordN', 41.33333 ) or return;
                return $self->property_u('message')->property_u('split')
                  ->call_u(
                    {
                        separator => str( $f, " " ),
                        limit     => add(
                            $scope, $scope->property_u('wordN'),
                            num( $f, 1 )
                        )
                    },
                    $scope, undef, 42.23529
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
