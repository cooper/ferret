# === Tokenization ===
#       CLASS_DEC |                {"name":"Test"} | 1.5
#          METHOD |     {"name":"_init_","main":1} | 3.33333
#       CLOSURE_S |                                | 3.66667
#    KEYWORD_WANT |                                | 4.16667
#        VAR_THIS |                         "name" | 4.33333
#       OP_ASSIGN |                                | 4.5
#          STRING |                       ["Test"] | 4.66667
#         OP_SEMI |                                | 4.83333
#    KEYWORD_WANT |                                | 5.16667
#        VAR_THIS |                        "fatal" | 5.33333
#       OP_ASSIGN |                                | 5.5
#    KEYWORD_TRUE |                                | 5.66667
#         OP_SEMI |                                | 5.83333
#        VAR_THIS |                       "tested" | 6.2
#       OP_ASSIGN |                                | 6.4
#          NUMBER |                            "0" | 6.6
#         OP_SEMI |                                | 6.8
#        VAR_THIS |                       "passed" | 7.2
#       OP_ASSIGN |                                | 7.4
#          NUMBER |                            "0" | 7.6
#         OP_SEMI |                                | 7.8
#       CLOSURE_E |                                | 8.5
#          METHOD |           {"name":"trueValue"} | 11.33333
#       CLOSURE_S |                                | 11.66667
#    KEYWORD_WANT |                                | 12.25
#         VAR_LEX |                            "a" | 12.5
#         OP_SEMI |                                | 12.75
#  KEYWORD_RETURN |                                | 13.08333
#        VAR_THIS |                        "_test" | 13.16667
#      PAREN_CALL |                                | 13.25
#        BAREWORD |                         "Bool" | 13.33333
#      PAREN_CALL |                                | 13.41667
#         VAR_LEX |                            "a" | 13.5
#         PAREN_E |                                | 13.58333
#        OP_COMMA |                                | 13.66667
#          STRING |         ["Value must be true"] | 13.75
#         PAREN_E |                                | 13.83333
#         OP_SEMI |                                | 13.91667
#       CLOSURE_E |                                | 14.5
#          METHOD |            {"name":"veryTrue"} | 17.33333
#       CLOSURE_S |                                | 17.66667
#    KEYWORD_WANT |                                | 18.25
#         VAR_LEX |                            "a" | 18.5
#         OP_SEMI |                                | 18.75
#  KEYWORD_RETURN |                                | 19.09091
#        VAR_THIS |                        "_test" | 19.18182
#      PAREN_CALL |                                | 19.27273
#         VAR_LEX |                            "a" | 19.36364
#      OP_EQUAL_I |                                | 19.45455
#    KEYWORD_TRUE |                                | 19.54545
#        OP_COMMA |                                | 19.63636
#          STRING | ["Value must be exactly true"] | 19.72727
#         PAREN_E |                                | 19.81818
#         OP_SEMI |                                | 19.90909
#       CLOSURE_E |                                | 20.5
#          METHOD |               {"name":"equal"} | 23.33333
#       CLOSURE_S |                                | 23.66667
#    KEYWORD_WANT |                                | 24.16667
#         VAR_LEX |                            "a" | 24.33333
#        OP_COMMA |                                | 24.5
#         VAR_LEX |                            "b" | 24.66667
#         OP_SEMI |                                | 24.83333
#  KEYWORD_RETURN |                                | 25.09091
#        VAR_THIS |                        "_test" | 25.18182
#      PAREN_CALL |                                | 25.27273
#         VAR_LEX |                            "a" | 25.36364
#        OP_EQUAL |                                | 25.45455
#         VAR_LEX |                            "b" | 25.54545
#        OP_COMMA |                                | 25.63636
#          STRING |       ["Values must be equal"] | 25.72727
#         PAREN_E |                                | 25.81818
#         OP_SEMI |                                | 25.90909
#       CLOSURE_E |                                | 26.5
#          METHOD |        {"name":"objectsEqual"} | 29.33333
#       CLOSURE_S |                                | 29.66667
#    KEYWORD_WANT |                                | 30.16667
#         VAR_LEX |                            "a" | 30.33333
#        OP_COMMA |                                | 30.5
#         VAR_LEX |                            "b" | 30.66667
#         OP_SEMI |                                | 30.83333
#  KEYWORD_RETURN |                                | 31.09091
#        VAR_THIS |                        "_test" | 31.18182
#      PAREN_CALL |                                | 31.27273
#         VAR_LEX |                            "a" | 31.36364
#      OP_EQUAL_I |                                | 31.45455
#         VAR_LEX |                            "b" | 31.54545
#        OP_COMMA |                                | 31.63636
#          STRING | ["Objects must be exactly equal"] | 31.72727
#         PAREN_E |                                | 31.81818
#         OP_SEMI |                                | 31.90909
#       CLOSURE_E |                                | 32.5
#          METHOD |            {"name":"notEqual"} | 35.33333
#       CLOSURE_S |                                | 35.66667
#    KEYWORD_WANT |                                | 36.16667
#         VAR_LEX |                            "a" | 36.33333
#        OP_COMMA |                                | 36.5
#         VAR_LEX |                            "b" | 36.66667
#         OP_SEMI |                                | 36.83333
#  KEYWORD_RETURN |                                | 37.09091
#        VAR_THIS |                        "_test" | 37.18182
#      PAREN_CALL |                                | 37.27273
#         VAR_LEX |                            "a" | 37.36364
#       OP_NEQUAL |                                | 37.45455
#         VAR_LEX |                            "b" | 37.54545
#        OP_COMMA |                                | 37.63636
#          STRING |   ["Values must not be equal"] | 37.72727
#         PAREN_E |                                | 37.81818
#         OP_SEMI |                                | 37.90909
#       CLOSURE_E |                                | 38.5
#          METHOD |     {"name":"objectsNotEqual"} | 41.33333
#       CLOSURE_S |                                | 41.66667
#    KEYWORD_WANT |                                | 42.16667
#         VAR_LEX |                            "a" | 42.33333
#        OP_COMMA |                                | 42.5
#         VAR_LEX |                            "b" | 42.66667
#         OP_SEMI |                                | 42.83333
#  KEYWORD_RETURN |                                | 43.09091
#        VAR_THIS |                        "_test" | 43.18182
#      PAREN_CALL |                                | 43.27273
#         VAR_LEX |                            "a" | 43.36364
#     OP_NEQUAL_I |                                | 43.45455
#         VAR_LEX |                            "b" | 43.54545
#        OP_COMMA |                                | 43.63636
#          STRING |  ["Objects must not be equal"] | 43.72727
#         PAREN_E |                                | 43.81818
#         OP_SEMI |                                | 43.90909
#       CLOSURE_E |                                | 44.5
#          METHOD |              {"name":"review"} | 46.33333
#       CLOSURE_S |                                | 46.66667
#         VAR_LEX |                       "failed" | 47.14286
#       OP_ASSIGN |                                | 47.28571
#        VAR_THIS |                       "tested" | 47.42857
#          OP_SUB |                                | 47.57143
#        VAR_THIS |                       "passed" | 47.71429
#         OP_SEMI |                                | 47.85714
#        BAREWORD |                          "say" | 48.16667
#      PAREN_CALL |                                | 48.33333
#          STRING | ["[",["VAR_THIS","name",48],"] ",["VAR_THIS","tested",48]," tests ",["VAR_THIS","passed",48]," passed ",["VAR_LEX","failed",48]," failed"] | 48.5
#         PAREN_E |                                | 48.66667
#         OP_SEMI |                                | 48.83333
#        BAREWORD |                        "tests" | 50.2
#       OP_RETURN |                                | 50.4
#        VAR_THIS |                       "tested" | 50.6
#         OP_SEMI |                                | 50.8
#        BAREWORD |                        "fails" | 51.2
#       OP_RETURN |                                | 51.4
#         VAR_LEX |                       "failed" | 51.6
#         OP_SEMI |                                | 51.8
#        BAREWORD |                       "passes" | 52.2
#       OP_RETURN |                                | 52.4
#        VAR_THIS |                       "passed" | 52.6
#         OP_SEMI |                                | 52.8
#        BAREWORD |                        "allOK" | 53.14286
#       OP_RETURN |                                | 53.28571
#        VAR_THIS |                       "passed" | 53.42857
#        OP_EQUAL |                                | 53.57143
#        VAR_THIS |                       "tested" | 53.71429
#         OP_SEMI |                                | 53.85714
#       CLOSURE_E |                                | 54.5
#          METHOD |               {"name":"_test"} | 56.33333
#       CLOSURE_S |                                | 56.66667
#    KEYWORD_WANT |                                | 57.16667
#         VAR_LEX |                          "yes" | 57.33333
#        OP_COMMA |                                | 57.5
#         VAR_LEX |                      "message" | 57.66667
#         OP_SEMI |                                | 57.83333
#        VAR_THIS |                       "tested" | 59.14286
#       OP_ASSIGN |                                | 59.28571
#        VAR_THIS |                       "tested" | 59.42857
#          OP_ADD |                                | 59.57143
#          NUMBER |                            "1" | 59.71429
#         OP_SEMI |                                | 59.85714
#        BAREWORD |                         "pass" | 60.2
#       OP_RETURN |                                | 60.4
#         VAR_LEX |                          "yes" | 60.6
#         OP_SEMI |                                | 60.8
#      KEYWORD_IF |                                | 62.25
#         VAR_LEX |                          "yes" | 62.5
#       CLOSURE_S |                                | 62.75
#        VAR_THIS |                       "passed" | 63.14286
#       OP_ASSIGN |                                | 63.28571
#        VAR_THIS |                       "passed" | 63.42857
#          OP_ADD |                                | 63.57143
#          NUMBER |                            "1" | 63.71429
#         OP_SEMI |                                | 63.85714
#  KEYWORD_RETURN |                                | 64.33333
#         OP_SEMI |                                | 64.66667
#       CLOSURE_E |                                | 65.5
#      KEYWORD_IF |                                | 67.25
#        VAR_THIS |                        "fatal" | 67.5
#        OP_VALUE |                                | 67.75
#        BAREWORD |                        "Error" | 68.11111
#      PAREN_CALL |                                | 68.22222
#         VAR_LEX |                      "message" | 68.33333
#         PAREN_E |                                | 68.44444
#        PROPERTY |                        "panic" | 68.55556
#      PAREN_CALL |                                | 68.66667
#         PAREN_E |                                | 68.77778
#         OP_SEMI |                                | 68.88889
#        BAREWORD |                      "message" | 70.2
#       OP_RETURN |                                | 70.4
#         VAR_LEX |                      "message" | 70.6
#         OP_SEMI |                                | 70.8
#       CLOSURE_E |                                | 71.5
# === Document Model ===
#  Document './std/Test.frt'
#      Class 'Test'
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Instance variable '@name'
#                          Expression ('want' parameter)
#                              String 'Test'
#                  Instruction
#                      Want
#                          Instance variable '@fatal'
#                          Expression ('want' parameter)
#                              Boolean true
#                  Instruction
#                      Assignment (instance variable '@tested')
#                          Number '0'
#                  Instruction
#                      Assignment (instance variable '@passed')
#                          Number '0'
#          Method 'trueValue'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Lexical variable '$a'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@_test'
#                              Argument list [2 items]
#                                  Item 0
#                                      Call
#                                          Bareword 'Bool'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  Lexical variable '$a'
#                                  Item 1
#                                      String 'Value must...'
#          Method 'veryTrue'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Lexical variable '$a'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@_test'
#                              Argument list [2 items]
#                                  Item 0
#                                      Equality
#                                          Lexical variable '$a'
#                                          Boolean true
#                                  Item 1
#                                      String 'Value must...'
#          Method 'equal'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Lexical variable '$a'
#                  Instruction
#                      Want
#                          Lexical variable '$b'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@_test'
#                              Argument list [2 items]
#                                  Item 0
#                                      Equality
#                                          Lexical variable '$a'
#                                          Lexical variable '$b'
#                                  Item 1
#                                      String 'Values mus...'
#          Method 'objectsEqual'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Lexical variable '$a'
#                  Instruction
#                      Want
#                          Lexical variable '$b'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@_test'
#                              Argument list [2 items]
#                                  Item 0
#                                      Equality
#                                          Lexical variable '$a'
#                                          Lexical variable '$b'
#                                  Item 1
#                                      String 'Objects mu...'
#          Method 'notEqual'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Lexical variable '$a'
#                  Instruction
#                      Want
#                          Lexical variable '$b'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@_test'
#                              Argument list [2 items]
#                                  Item 0
#                                      Equality
#                                          Lexical variable '$a'
#                                          Lexical variable '$b'
#                                  Item 1
#                                      String 'Values mus...'
#          Method 'objectsNotEqual'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Lexical variable '$a'
#                  Instruction
#                      Want
#                          Lexical variable '$b'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@_test'
#                              Argument list [2 items]
#                                  Item 0
#                                      Equality
#                                          Lexical variable '$a'
#                                          Lexical variable '$b'
#                                  Item 1
#                                      String 'Objects mu...'
#          Method 'review'
#              Body ('method' scope)
#                  Instruction
#                      Assignment (lexical variable '$failed')
#                          Operation
#                              Instance variable '@tested'
#                              Subtraction operator (-)
#                              Instance variable '@passed'
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      String '['
#                                      Addition operator (+)
#                                      Instance variable '@name'
#                                      Addition operator (+)
#                                      String '] '
#                                      Addition operator (+)
#                                      Instance variable '@tested'
#                                      Addition operator (+)
#                                      String ' tests '
#                                      Addition operator (+)
#                                      Instance variable '@passed'
#                                      Addition operator (+)
#                                      String ' passed '
#                                      Addition operator (+)
#                                      Lexical variable '$failed'
#                                      Addition operator (+)
#                                      String ' failed'
#                  Instruction
#                      Return pair 'tests'
#                          Instance variable '@tested'
#                  Instruction
#                      Return pair 'fails'
#                          Lexical variable '$failed'
#                  Instruction
#                      Return pair 'passes'
#                          Instance variable '@passed'
#                  Instruction
#                      Return pair 'allOK'
#                          Equality
#                              Instance variable '@passed'
#                              Instance variable '@tested'
#          Method '_test'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Lexical variable '$yes'
#                  Instruction
#                      Want
#                          Lexical variable '$message'
#                  Instruction
#                      Assignment (instance variable '@tested')
#                          Operation
#                              Instance variable '@tested'
#                              Addition operator (+)
#                              Number '1'
#                  Instruction
#                      Return pair 'pass'
#                          Lexical variable '$yes'
#                  If
#                      Expression ('if' parameter)
#                          Lexical variable '$yes'
#                      Body ('if' scope)
#                          Instruction
#                              Assignment (instance variable '@passed')
#                                  Operation
#                                      Instance variable '@passed'
#                                      Addition operator (+)
#                                      Number '1'
#                          Instruction
#                              Return
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@fatal'
#                      Body ('if' scope)
#                          Instruction
#                              Call
#                                  Property 'panic'
#                                      Call
#                                          Bareword 'Error'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  Lexical variable '$message'
#                                  Argument list [0 items]
#                  Instruction
#                      Return pair 'message'
#                          Lexical variable '$message'
#      Include (Bool, Error)
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

FF::before_content('Test.frt');

use Ferret::Core::Operations qw(_not _sub add bool num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Class 'Test'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Test', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
            [
                { name => 'name', type => undef, optional => 1, more => undef },
                {
                    name     => 'fatal',
                    type     => undef,
                    optional => 1,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::want( $self, $arguments, 'name', 4.33333,
                    str( $f, "Test" ) );
                FF::want( $self, $arguments, 'fatal', 5.33333, $true );
                $self->set_property( tested => num( $f, 0 ), 6.4 );
                $self->set_property( passed => num( $f, 0 ), 7.4 );
                return $return;
            }
        );

        # Method event 'trueValue' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'trueValue',
            [ { name => 'a', type => undef, optional => 1, more => undef } ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::want( $scope, $arguments, 'a', 12.5 );
                return $self->property_u('_test')->call_u(
                    [
                        $scope->property_u('Bool')->call_u(
                            [ $scope->property_u('a') ], $scope,
                            undef,                       13.41667
                        ),
                        str( $f, "Value must be true" )
                    ],
                    $scope, undef, 13.25
                );
                return $return;
            }
        );

        # Method event 'veryTrue' definition
        my $method_2 = FF::method_event_def(
            $f, $scope,
            'veryTrue',
            [ { name => 'a', type => undef, optional => 1, more => undef } ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::want( $scope, $arguments, 'a', 18.5 );
                return $self->property_u('_test')->call_u(
                    [
                        $scope->property_u('a')
                          ->equal_to_exactly( $true, $scope ),
                        str( $f, "Value must be exactly true" )
                    ],
                    $scope, undef, 19.27273
                );
                return $return;
            }
        );

        # Method event 'equal' definition
        my $method_3 = FF::method_event_def(
            $f, $scope, 'equal',
            [
                { name => 'a', type => undef, optional => 1, more => undef },
                { name => 'b', type => undef, optional => 1, more => undef }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::want( $scope, $arguments, 'a', 24.33333 );
                FF::want( $scope, $arguments, 'b', 24.66667 );
                return $self->property_u('_test')->call_u(
                    [
                        $scope->property_u('a')
                          ->equal_to( $scope->property_u('b'), $scope ),
                        str( $f, "Values must be equal" )
                    ],
                    $scope, undef, 25.27273
                );
                return $return;
            }
        );

        # Method event 'objectsEqual' definition
        my $method_4 = FF::method_event_def(
            $f, $scope,
            'objectsEqual',
            [
                { name => 'a', type => undef, optional => 1, more => undef },
                { name => 'b', type => undef, optional => 1, more => undef }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::want( $scope, $arguments, 'a', 30.33333 );
                FF::want( $scope, $arguments, 'b', 30.66667 );
                return $self->property_u('_test')->call_u(
                    [
                        $scope->property_u('a')
                          ->equal_to_exactly( $scope->property_u('b'), $scope ),
                        str( $f, "Objects must be exactly equal" )
                    ],
                    $scope, undef, 31.27273
                );
                return $return;
            }
        );

        # Method event 'notEqual' definition
        my $method_5 = FF::method_event_def(
            $f, $scope,
            'notEqual',
            [
                { name => 'a', type => undef, optional => 1, more => undef },
                { name => 'b', type => undef, optional => 1, more => undef }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::want( $scope, $arguments, 'a', 36.33333 );
                FF::want( $scope, $arguments, 'b', 36.66667 );
                return $self->property_u('_test')->call_u(
                    [
                        _not(
                            $scope->property_u('a')
                              ->equal_to( $scope->property_u('b'), $scope )
                        ),
                        str( $f, "Values must not be equal" )
                    ],
                    $scope, undef, 37.27273
                );
                return $return;
            }
        );

        # Method event 'objectsNotEqual' definition
        my $method_6 = FF::method_event_def(
            $f, $scope,
            'objectsNotEqual',
            [
                { name => 'a', type => undef, optional => 1, more => undef },
                { name => 'b', type => undef, optional => 1, more => undef }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::want( $scope, $arguments, 'a', 42.33333 );
                FF::want( $scope, $arguments, 'b', 42.66667 );
                return $self->property_u('_test')->call_u(
                    [
                        _not(
                            $scope->property_u('a')->equal_to_exactly(
                                $scope->property_u('b'), $scope
                            )
                        ),
                        str( $f, "Objects must not be equal" )
                    ],
                    $scope, undef, 43.27273
                );
                return $return;
            }
        );

        # Method event 'review' definition
        my $method_7 = FF::method_event_def(
            $f, $scope, 'review',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property_ow(
                    $context,
                    failed => _sub(
                        $scope,
                        $self->property_u('tested'),
                        $self->property_u('passed')
                    ),
                    47.28571
                );
                $scope->property_u('say')->call_u(
                    [
                        add(
                            $scope,
                            str( $f, "[" ),
                            $self->property_u('name'),
                            str( $f, "] " ),
                            $self->property_u('tested'),
                            str( $f, " tests " ),
                            $self->property_u('passed'),
                            str( $f, " passed " ),
                            $scope->property_u('failed'),
                            str( $f, " failed" )
                        )
                    ],
                    $scope, undef, 48.33333
                );
                $return->set_property(
                    tests => $self->property_u('tested'),
                    50.4
                );
                $return->set_property(
                    fails => $scope->property_u('failed'),
                    51.4
                );
                $return->set_property(
                    passes => $self->property_u('passed'),
                    52.4
                );
                $return->set_property(
                    allOK => $self->property_u('passed')
                      ->equal_to( $self->property_u('tested'), $scope ),
                    53.28571
                );
                return $return;
            }
        );

        # Method event '_test' definition
        my $method_8 = FF::method_event_def(
            $f, $scope, '_test',
            [
                { name => 'yes', type => undef, optional => 1, more => undef },
                {
                    name     => 'message',
                    type     => undef,
                    optional => 1,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::want( $scope, $arguments, 'yes',     57.33333 );
                FF::want( $scope, $arguments, 'message', 57.66667 );
                $self->set_property(
                    tested =>
                      add( $scope, $self->property_u('tested'), num( $f, 1 ) ),
                    59.28571
                );
                $return->set_property(
                    pass => $scope->property_u('yes'),
                    60.4
                );
                if ( bool( $scope->property_u('yes') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $self->set_property(
                        passed => add(
                            $scope, $self->property_u('passed'),
                            num( $f, 1 )
                        ),
                        63.28571
                    );
                    return $return;
                }
                if ( bool( $self->property_u('fatal') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $scope->property_u('Error')
                      ->call_u( [ $scope->property_u('message') ],
                        $scope, undef, 68.22222 )->property_u('panic')
                      ->call_u( {}, $scope, undef, 68.66667 );
                }
                $return->set_property(
                    message => $scope->property_u('message'),
                    70.4
                );
                return $return;
            }
        );
        $method_0->inside_scope(
            _init_ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            trueValue => $scope,
            $proto, $class, undef, undef
        );
        $method_2->inside_scope(
            veryTrue => $scope,
            $proto, $class, undef, undef
        );
        $method_3->inside_scope(
            equal => $scope,
            $proto, $class, undef, undef
        );
        $method_4->inside_scope(
            objectsEqual => $scope,
            $proto, $class, undef, undef
        );
        $method_5->inside_scope(
            notEqual => $scope,
            $proto, $class, undef, undef
        );
        $method_6->inside_scope(
            objectsNotEqual => $scope,
            $proto, $class, undef, undef
        );
        $method_7->inside_scope(
            review => $scope,
            $proto, $class, undef, undef
        );
        $method_8->inside_scope(
            _test => $scope,
            $proto, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Bool Error) );
};

FF::after_content();
