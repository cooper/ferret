# === Tokenization ===
#       CLASS_DEC | {"name":"Test"}
#          METHOD | {"main":1,"name":"_init_"}
#       CLOSURE_S | 
#    KEYWORD_WANT | 
#        VAR_THIS | "name"
#       OP_ASSIGN | 
#          STRING | ["Test"]
#         OP_SEMI | 
#    KEYWORD_WANT | 
#        VAR_THIS | "fatal"
#       OP_ASSIGN | 
#    KEYWORD_TRUE | 
#         OP_SEMI | 
#        VAR_THIS | "tested"
#       OP_ASSIGN | 
#          NUMBER | "0"
#         OP_SEMI | 
#        VAR_THIS | "passed"
#       OP_ASSIGN | 
#          NUMBER | "0"
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"trueValue"}
#       CLOSURE_S | 
#    KEYWORD_WANT | 
#         VAR_LEX | "a"
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#        VAR_THIS | "_test"
#      PAREN_CALL | 
#        BAREWORD | "Bool"
#      PAREN_CALL | 
#         VAR_LEX | "a"
#         PAREN_E | 
#        OP_COMMA | 
#          STRING | ["Value must be true"]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"veryTrue"}
#       CLOSURE_S | 
#    KEYWORD_WANT | 
#         VAR_LEX | "a"
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#        VAR_THIS | "_test"
#      PAREN_CALL | 
#         VAR_LEX | "a"
#      OP_EQUAL_I | 
#    KEYWORD_TRUE | 
#        OP_COMMA | 
#          STRING | ["Value must be exactly true"]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"equal"}
#       CLOSURE_S | 
#    KEYWORD_WANT | 
#         VAR_LEX | "a"
#        OP_COMMA | 
#         VAR_LEX | "b"
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#        VAR_THIS | "_test"
#      PAREN_CALL | 
#         VAR_LEX | "a"
#        OP_EQUAL | 
#         VAR_LEX | "b"
#        OP_COMMA | 
#          STRING | ["Values must be equal"]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"objectsEqual"}
#       CLOSURE_S | 
#    KEYWORD_WANT | 
#         VAR_LEX | "a"
#        OP_COMMA | 
#         VAR_LEX | "b"
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#        VAR_THIS | "_test"
#      PAREN_CALL | 
#         VAR_LEX | "a"
#      OP_EQUAL_I | 
#         VAR_LEX | "b"
#        OP_COMMA | 
#          STRING | ["Objects must be exactly equal"]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"notEqual"}
#       CLOSURE_S | 
#    KEYWORD_WANT | 
#         VAR_LEX | "a"
#        OP_COMMA | 
#         VAR_LEX | "b"
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#        VAR_THIS | "_test"
#      PAREN_CALL | 
#         VAR_LEX | "a"
#       OP_NEQUAL | 
#         VAR_LEX | "b"
#        OP_COMMA | 
#          STRING | ["Values must not be equal"]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"objectsNotEqual"}
#       CLOSURE_S | 
#    KEYWORD_WANT | 
#         VAR_LEX | "a"
#        OP_COMMA | 
#         VAR_LEX | "b"
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#        VAR_THIS | "_test"
#      PAREN_CALL | 
#         VAR_LEX | "a"
#     OP_NEQUAL_I | 
#         VAR_LEX | "b"
#        OP_COMMA | 
#          STRING | ["Objects must not be equal"]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"review"}
#       CLOSURE_S | 
#         VAR_LEX | "failed"
#       OP_ASSIGN | 
#        VAR_THIS | "tested"
#          OP_SUB | 
#        VAR_THIS | "passed"
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["[",["VAR_THIS","name",49],"] ",["VAR_THIS","tested",49]," tests; ",["VAR_THIS","passed",49]," passed; ",["VAR_LEX","failed",49]," failed"]
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "tests"
#       OP_RETURN | 
#        VAR_THIS | "tested"
#         OP_SEMI | 
#        BAREWORD | "fails"
#       OP_RETURN | 
#         VAR_LEX | "failed"
#         OP_SEMI | 
#        BAREWORD | "passes"
#       OP_RETURN | 
#        VAR_THIS | "passed"
#         OP_SEMI | 
#        BAREWORD | "allOK"
#       OP_RETURN | 
#        VAR_THIS | "passed"
#        OP_EQUAL | 
#        VAR_THIS | "tested"
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"_test"}
#       CLOSURE_S | 
#    KEYWORD_WANT | 
#         VAR_LEX | "yes"
#        OP_COMMA | 
#         VAR_LEX | "message"
#         OP_SEMI | 
#        VAR_THIS | "tested"
#       OP_ASSIGN | 
#        VAR_THIS | "tested"
#          OP_ADD | 
#          NUMBER | "1"
#         OP_SEMI | 
#        BAREWORD | "pass"
#       OP_RETURN | 
#         VAR_LEX | "yes"
#         OP_SEMI | 
#      KEYWORD_IF | 
#         VAR_LEX | "yes"
#       CLOSURE_S | 
#        VAR_THIS | "passed"
#       OP_ASSIGN | 
#        VAR_THIS | "passed"
#          OP_ADD | 
#          NUMBER | "1"
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#         OP_SEMI | 
#       CLOSURE_E | 
#      KEYWORD_IF | 
#        VAR_THIS | "fatal"
#        OP_VALUE | 
#        BAREWORD | "Error"
#      PAREN_CALL | 
#         VAR_LEX | "message"
#         PAREN_E | 
#        PROPERTY | "panic"
#      PAREN_CALL | 
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "message"
#       OP_RETURN | 
#         VAR_LEX | "message"
#         OP_SEMI | 
#       CLOSURE_E | 
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
#                                      String ' tests; '
#                                      Addition operator (+)
#                                      Instance variable '@passed'
#                                      Addition operator (+)
#                                      String ' passed; '
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
                FF::want( $self, $arguments, 'name', 4.5, str( $f, "Test" ) );
                FF::want( $self, $arguments, 'fatal', 6.4, $true );
                $self->set_property( tested => num( $f, 0 ), 7.5 );
                $self->set_property( passed => num( $f, 0 ), 8.5 );
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
                FF::want( $scope, $arguments, 'a', 12.66667 );
                return $self->property_u('_test')->call_u(
                    [
                        $scope->property_u('Bool')->call_u(
                            [ $scope->property_u('a') ], $scope,
                            undef,                       13.55556
                        ),
                        str( $f, "Value must be true" )
                    ],
                    $scope, undef, 13.33333
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
                FF::want( $scope, $arguments, 'a', 18.66667 );
                return $self->property_u('_test')->call_u(
                    [
                        $scope->property_u('a')
                          ->equal_to_exactly( $true, $scope ),
                        str( $f, "Value must be exactly true" )
                    ],
                    $scope, undef, 19.375
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
                FF::want( $scope, $arguments, 'a', 24.4 );
                FF::want( $scope, $arguments, 'b', 24.8 );
                return $self->property_u('_test')->call_u(
                    [
                        $scope->property_u('a')
                          ->equal_to( $scope->property_u('b'), $scope ),
                        str( $f, "Values must be equal" )
                    ],
                    $scope, undef, 25.375
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
                FF::want( $scope, $arguments, 'a', 30.4 );
                FF::want( $scope, $arguments, 'b', 30.8 );
                return $self->property_u('_test')->call_u(
                    [
                        $scope->property_u('a')
                          ->equal_to_exactly( $scope->property_u('b'), $scope ),
                        str( $f, "Objects must be exactly equal" )
                    ],
                    $scope, undef, 31.375
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
                FF::want( $scope, $arguments, 'a', 36.4 );
                FF::want( $scope, $arguments, 'b', 36.8 );
                return $self->property_u('_test')->call_u(
                    [
                        _not(
                            $scope->property_u('a')
                              ->equal_to( $scope->property_u('b'), $scope )
                        ),
                        str( $f, "Values must not be equal" )
                    ],
                    $scope, undef, 37.375
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
                FF::want( $scope, $arguments, 'a', 42.4 );
                FF::want( $scope, $arguments, 'b', 42.8 );
                return $self->property_u('_test')->call_u(
                    [
                        _not(
                            $scope->property_u('a')->equal_to_exactly(
                                $scope->property_u('b'), $scope
                            )
                        ),
                        str( $f, "Objects must not be equal" )
                    ],
                    $scope, undef, 43.3
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
                    47.33333
                );
                $scope->property_u('say')->call_u(
                    [
                        add(
                            $scope,
                            str( $f, "[" ),
                            $self->property_u('name'),
                            str( $f, "] " ),
                            $self->property_u('tested'),
                            str( $f, " tests; " ),
                            $self->property_u('passed'),
                            str( $f, " passed; " ),
                            $scope->property_u('failed'),
                            str( $f, " failed" )
                        )
                    ],
                    $scope, undef, 48.4
                );
                $return->set_property(
                    tests => $self->property_u('tested'),
                    50.5
                );
                $return->set_property(
                    fails => $scope->property_u('failed'),
                    51.5
                );
                $return->set_property(
                    passes => $self->property_u('passed'),
                    52.5
                );
                $return->set_property(
                    allOK => $self->property_u('passed')
                      ->equal_to( $self->property_u('tested'), $scope ),
                    53.33333
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
                FF::want( $scope, $arguments, 'yes',     57.4 );
                FF::want( $scope, $arguments, 'message', 57.8 );
                $self->set_property(
                    tested =>
                      add( $scope, $self->property_u('tested'), num( $f, 1 ) ),
                    59.33333
                );
                $return->set_property(
                    pass => $scope->property_u('yes'),
                    60.5
                );
                if ( bool( $scope->property_u('yes') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $self->set_property(
                        passed => add(
                            $scope, $self->property_u('passed'),
                            num( $f, 1 )
                        ),
                        63.33333
                    );
                    return $return;
                }
                if ( bool( $self->property_u('fatal') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $scope->property_u('Error')
                      ->call_u( [ $scope->property_u('message') ],
                        $scope, undef, 68.25 )->property_u('panic')
                      ->call_u( {}, $scope, undef, 68.75 );
                }
                $return->set_property(
                    message => $scope->property_u('message'),
                    70.5
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
