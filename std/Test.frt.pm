# === Tokenization ===
#       CLASS_DEC |                {"name":"Test"} | 1.1
#          METHOD |     {"main":1,"name":"_init_"} | 3.1
#       CLOSURE_S |                                | 3.2
#    KEYWORD_WANT |                                | 4.1
#        VAR_THIS |                         "name" | 4.2
#       OP_ASSIGN |                                | 4.3
#          STRING |                       ["Test"] | 4.4
#         OP_SEMI |                              1 | 4.5
#    KEYWORD_WANT |                                | 5.1
#        VAR_THIS |                        "fatal" | 5.2
#       OP_ASSIGN |                                | 5.3
#    KEYWORD_TRUE |                                | 5.4
#         OP_SEMI |                              1 | 5.5
#        VAR_THIS |                       "tested" | 6.1
#       OP_ASSIGN |                                | 6.2
#          NUMBER |                            "0" | 6.3
#         OP_SEMI |                              1 | 6.4
#        VAR_THIS |                       "passed" | 7.1
#       OP_ASSIGN |                                | 7.2
#          NUMBER |                            "0" | 7.3
#         OP_SEMI |                              1 | 7.4
#       CLOSURE_E |                                | 8.1
#          METHOD |           {"name":"trueValue"} | 11.1
#       CLOSURE_S |                                | 11.2
#    KEYWORD_WANT |                                | 12.1
#         VAR_LEX |                            "a" | 12.2
#         OP_SEMI |                              1 | 12.3
#  KEYWORD_RETURN |                                | 13.05
#        VAR_THIS |                        "_test" | 13.1
#      PAREN_CALL |                                | 13.15
#        BAREWORD |                         "Bool" | 13.2
#      PAREN_CALL |                                | 13.25
#         VAR_LEX |                            "a" | 13.3
#         PAREN_E |                                | 13.35
#        OP_COMMA |                                | 13.4
#          STRING |         ["Value must be true"] | 13.45
#         PAREN_E |                                | 13.5
#         OP_SEMI |                              1 | 13.55
#       CLOSURE_E |                                | 14.1
#          METHOD |            {"name":"veryTrue"} | 17.1
#       CLOSURE_S |                                | 17.2
#    KEYWORD_WANT |                                | 18.1
#         VAR_LEX |                            "a" | 18.2
#         OP_SEMI |                              1 | 18.3
#  KEYWORD_RETURN |                                | 19.05
#        VAR_THIS |                        "_test" | 19.1
#      PAREN_CALL |                                | 19.15
#         VAR_LEX |                            "a" | 19.2
#      OP_EQUAL_I |                                | 19.25
#    KEYWORD_TRUE |                                | 19.3
#        OP_COMMA |                                | 19.35
#          STRING | ["Value must be exactly true"] | 19.4
#         PAREN_E |                                | 19.45
#         OP_SEMI |                              1 | 19.5
#       CLOSURE_E |                                | 20.1
#          METHOD |               {"name":"equal"} | 23.1
#       CLOSURE_S |                                | 23.2
#    KEYWORD_WANT |                                | 24.1
#         VAR_LEX |                            "a" | 24.2
#        OP_COMMA |                                | 24.3
#         VAR_LEX |                            "b" | 24.4
#         OP_SEMI |                              1 | 24.5
#  KEYWORD_RETURN |                                | 25.05
#        VAR_THIS |                        "_test" | 25.1
#      PAREN_CALL |                                | 25.15
#         VAR_LEX |                            "a" | 25.2
#        OP_EQUAL |                                | 25.25
#         VAR_LEX |                            "b" | 25.3
#        OP_COMMA |                                | 25.35
#          STRING |       ["Values must be equal"] | 25.4
#         PAREN_E |                                | 25.45
#         OP_SEMI |                              1 | 25.5
#       CLOSURE_E |                                | 26.1
#          METHOD |        {"name":"objectsEqual"} | 29.1
#       CLOSURE_S |                                | 29.2
#    KEYWORD_WANT |                                | 30.1
#         VAR_LEX |                            "a" | 30.2
#        OP_COMMA |                                | 30.3
#         VAR_LEX |                            "b" | 30.4
#         OP_SEMI |                              1 | 30.5
#  KEYWORD_RETURN |                                | 31.05
#        VAR_THIS |                        "_test" | 31.1
#      PAREN_CALL |                                | 31.15
#         VAR_LEX |                            "a" | 31.2
#      OP_EQUAL_I |                                | 31.25
#         VAR_LEX |                            "b" | 31.3
#        OP_COMMA |                                | 31.35
#          STRING | ["Objects must be exactly equal"] | 31.4
#         PAREN_E |                                | 31.45
#         OP_SEMI |                              1 | 31.5
#       CLOSURE_E |                                | 32.1
#          METHOD |            {"name":"notEqual"} | 35.1
#       CLOSURE_S |                                | 35.2
#    KEYWORD_WANT |                                | 36.1
#         VAR_LEX |                            "a" | 36.2
#        OP_COMMA |                                | 36.3
#         VAR_LEX |                            "b" | 36.4
#         OP_SEMI |                              1 | 36.5
#  KEYWORD_RETURN |                                | 37.05
#        VAR_THIS |                        "_test" | 37.1
#      PAREN_CALL |                                | 37.15
#         VAR_LEX |                            "a" | 37.2
#       OP_NEQUAL |                                | 37.25
#         VAR_LEX |                            "b" | 37.3
#        OP_COMMA |                                | 37.35
#          STRING |   ["Values must not be equal"] | 37.4
#         PAREN_E |                                | 37.45
#         OP_SEMI |                              1 | 37.5
#       CLOSURE_E |                                | 38.1
#          METHOD |     {"name":"objectsNotEqual"} | 41.1
#       CLOSURE_S |                                | 41.2
#    KEYWORD_WANT |                                | 42.1
#         VAR_LEX |                            "a" | 42.2
#        OP_COMMA |                                | 42.3
#         VAR_LEX |                            "b" | 42.4
#         OP_SEMI |                              1 | 42.5
#  KEYWORD_RETURN |                                | 43.05
#        VAR_THIS |                        "_test" | 43.1
#      PAREN_CALL |                                | 43.15
#         VAR_LEX |                            "a" | 43.2
#     OP_NEQUAL_I |                                | 43.25
#         VAR_LEX |                            "b" | 43.3
#        OP_COMMA |                                | 43.35
#          STRING |  ["Objects must not be equal"] | 43.4
#         PAREN_E |                                | 43.45
#         OP_SEMI |                              1 | 43.5
#       CLOSURE_E |                                | 44.1
#          METHOD |              {"name":"review"} | 46.1
#       CLOSURE_S |                                | 46.2
#         VAR_LEX |                       "failed" | 47.1
#       OP_ASSIGN |                                | 47.2
#        VAR_THIS |                       "tested" | 47.3
#          OP_SUB |                                | 47.4
#        VAR_THIS |                       "passed" | 47.5
#         OP_SEMI |                              1 | 47.6
#        BAREWORD |                          "say" | 48.1
#      PAREN_CALL |                                | 48.2
#          STRING | ["[",["VAR_THIS","name",48],"] ",["VAR_THIS","tested",48]," tests ",["VAR_THIS","passed",48]," passed ",["VAR_LEX","failed",48]," failed"] | 48.3
#         PAREN_E |                                | 48.4
#         OP_SEMI |                              1 | 48.5
#        BAREWORD |                        "tests" | 50.1
#       OP_RETURN |                                | 50.2
#        VAR_THIS |                       "tested" | 50.3
#         OP_SEMI |                              1 | 50.4
#        BAREWORD |                        "fails" | 51.1
#       OP_RETURN |                                | 51.2
#         VAR_LEX |                       "failed" | 51.3
#         OP_SEMI |                              1 | 51.4
#        BAREWORD |                       "passes" | 52.1
#       OP_RETURN |                                | 52.2
#        VAR_THIS |                       "passed" | 52.3
#         OP_SEMI |                              1 | 52.4
#        BAREWORD |                        "allOK" | 53.1
#       OP_RETURN |                                | 53.2
#        VAR_THIS |                       "passed" | 53.3
#        OP_EQUAL |                                | 53.4
#        VAR_THIS |                       "tested" | 53.5
#         OP_SEMI |                              1 | 53.6
#       CLOSURE_E |                                | 54.1
#          METHOD |               {"name":"_test"} | 56.1
#       CLOSURE_S |                                | 56.2
#    KEYWORD_WANT |                                | 57.1
#         VAR_LEX |                          "yes" | 57.2
#        OP_COMMA |                                | 57.3
#         VAR_LEX |                      "message" | 57.4
#         OP_SEMI |                              1 | 57.5
#        VAR_THIS |                       "tested" | 59.1
#       OP_ASSIGN |                                | 59.2
#        VAR_THIS |                       "tested" | 59.3
#          OP_ADD |                                | 59.4
#          NUMBER |                            "1" | 59.5
#         OP_SEMI |                              1 | 59.6
#        BAREWORD |                         "pass" | 60.1
#       OP_RETURN |                                | 60.2
#         VAR_LEX |                          "yes" | 60.3
#         OP_SEMI |                              1 | 60.4
#      KEYWORD_IF |                                | 62.1
#         VAR_LEX |                          "yes" | 62.2
#       CLOSURE_S |                                | 62.3
#        VAR_THIS |                       "passed" | 63.1
#       OP_ASSIGN |                                | 63.2
#        VAR_THIS |                       "passed" | 63.3
#          OP_ADD |                                | 63.4
#          NUMBER |                            "1" | 63.5
#         OP_SEMI |                              1 | 63.6
#  KEYWORD_RETURN |                                | 64.1
#         OP_SEMI |                              1 | 64.2
#       CLOSURE_E |                                | 65.1
#      KEYWORD_IF |                                | 67.1
#        VAR_THIS |                        "fatal" | 67.2
#        OP_VALUE |                                | 67.3
#        BAREWORD |                        "Error" | 68.1
#      PAREN_CALL |                                | 68.2
#         VAR_LEX |                      "message" | 68.3
#         PAREN_E |                                | 68.4
#        PROPERTY |                        "panic" | 68.5
#      PAREN_CALL |                                | 68.6
#         PAREN_E |                                | 68.7
#         OP_SEMI |                              1 | 68.8
#        BAREWORD |                      "message" | 70.1
#       OP_RETURN |                                | 70.2
#         VAR_LEX |                      "message" | 70.3
#         OP_SEMI |                              1 | 70.4
#       CLOSURE_E |                                | 71.1
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
                FF::want( $self, $arguments, 'name', 4.2, str( $f, "Test" ) );
                FF::want( $self, $arguments, 'fatal', 5.2, $true );
                $self->set_property( tested => num( $f, 0 ), 6.2 );
                $self->set_property( passed => num( $f, 0 ), 7.2 );
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
                FF::want( $scope, $arguments, 'a', 12.2 );
                return $self->property_u('_test')->call_u(
                    [
                        $scope->property_u('Bool')->call_u(
                            [ $scope->property_u('a') ], $scope,
                            undef,                       13.25
                        ),
                        str( $f, "Value must be true" )
                    ],
                    $scope, undef, 13.15
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
                FF::want( $scope, $arguments, 'a', 18.2 );
                return $self->property_u('_test')->call_u(
                    [
                        $scope->property_u('a')
                          ->equal_to_exactly( $true, $scope ),
                        str( $f, "Value must be exactly true" )
                    ],
                    $scope, undef, 19.15
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
                FF::want( $scope, $arguments, 'a', 24.2 );
                FF::want( $scope, $arguments, 'b', 24.4 );
                return $self->property_u('_test')->call_u(
                    [
                        $scope->property_u('a')
                          ->equal_to( $scope->property_u('b'), $scope ),
                        str( $f, "Values must be equal" )
                    ],
                    $scope, undef, 25.15
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
                FF::want( $scope, $arguments, 'a', 30.2 );
                FF::want( $scope, $arguments, 'b', 30.4 );
                return $self->property_u('_test')->call_u(
                    [
                        $scope->property_u('a')
                          ->equal_to_exactly( $scope->property_u('b'), $scope ),
                        str( $f, "Objects must be exactly equal" )
                    ],
                    $scope, undef, 31.15
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
                FF::want( $scope, $arguments, 'a', 36.2 );
                FF::want( $scope, $arguments, 'b', 36.4 );
                return $self->property_u('_test')->call_u(
                    [
                        _not(
                            $scope->property_u('a')
                              ->equal_to( $scope->property_u('b'), $scope )
                        ),
                        str( $f, "Values must not be equal" )
                    ],
                    $scope, undef, 37.15
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
                FF::want( $scope, $arguments, 'a', 42.2 );
                FF::want( $scope, $arguments, 'b', 42.4 );
                return $self->property_u('_test')->call_u(
                    [
                        _not(
                            $scope->property_u('a')->equal_to_exactly(
                                $scope->property_u('b'), $scope
                            )
                        ),
                        str( $f, "Objects must not be equal" )
                    ],
                    $scope, undef, 43.15
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
                    47.2
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
                    $scope, undef, 48.2
                );
                $return->set_property(
                    tests => $self->property_u('tested'),
                    50.2
                );
                $return->set_property(
                    fails => $scope->property_u('failed'),
                    51.2
                );
                $return->set_property(
                    passes => $self->property_u('passed'),
                    52.2
                );
                $return->set_property(
                    allOK => $self->property_u('passed')
                      ->equal_to( $self->property_u('tested'), $scope ),
                    53.2
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
                FF::want( $scope, $arguments, 'yes',     57.2 );
                FF::want( $scope, $arguments, 'message', 57.4 );
                $self->set_property(
                    tested =>
                      add( $scope, $self->property_u('tested'), num( $f, 1 ) ),
                    59.2
                );
                $return->set_property(
                    pass => $scope->property_u('yes'),
                    60.2
                );
                if ( bool( $scope->property_u('yes') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $self->set_property(
                        passed => add(
                            $scope, $self->property_u('passed'),
                            num( $f, 1 )
                        ),
                        63.2
                    );
                    return $return;
                }
                if ( bool( $self->property_u('fatal') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $scope->property_u('Error')
                      ->call_u( [ $scope->property_u('message') ],
                        $scope, undef, 68.2 )->property_u('panic')
                      ->call_u( {}, $scope, undef, 68.6 );
                }
                $return->set_property(
                    message => $scope->property_u('message'),
                    70.2
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
