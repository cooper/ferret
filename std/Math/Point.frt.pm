# === Tokenization ===
#         PKG_DEC |                {"name":"Math"} | 1.1
#       CLASS_DEC |               {"name":"Point"} | 2.1
#          METHOD |     {"name":"_init_","main":1} | 4.1
#       CLOSURE_S |                                | 4.2
#    KEYWORD_NEED |                                | 5.05
#        VAR_THIS |                            "x" | 5.1
#        OP_VALUE |                                | 5.15
#        BAREWORD |                          "Num" | 5.2
#        OP_COMMA |                                | 5.25
#        VAR_THIS |                            "y" | 5.3
#        OP_VALUE |                                | 5.35
#        BAREWORD |                          "Num" | 5.4
#         OP_SEMI |                              1 | 5.45
#       CLOSURE_E |                                | 6.1
#          METHOD |          {"name":"distanceTo"} | 8.1
#       CLOSURE_S |                                | 8.2
#    KEYWORD_NEED |                                | 9.1
#         VAR_LEX |                          "pt2" | 9.2
#        OP_VALUE |                                | 9.3
#        BAREWORD |                        "Point" | 9.4
#         OP_SEMI |                              1 | 9.5
#         VAR_LEX |                           "dx" | 10.1
#       OP_ASSIGN |                                | 10.2
#        VAR_THIS |                            "x" | 10.3
#          OP_SUB |                                | 10.4
#         VAR_LEX |                          "pt2" | 10.5
#        PROPERTY |                            "x" | 10.6
#         OP_SEMI |                              1 | 10.7
#         VAR_LEX |                           "dy" | 11.1
#       OP_ASSIGN |                                | 11.2
#        VAR_THIS |                            "y" | 11.3
#          OP_SUB |                                | 11.4
#         VAR_LEX |                          "pt2" | 11.5
#        PROPERTY |                            "y" | 11.6
#         OP_SEMI |                              1 | 11.7
#  KEYWORD_RETURN |                                | 12.05
#        BAREWORD |                         "sqrt" | 12.1
#      PAREN_CALL |                                | 12.15
#         VAR_LEX |                           "dx" | 12.2
#          OP_POW |                                | 12.25
#          NUMBER |                            "2" | 12.3
#          OP_ADD |                                | 12.35
#         VAR_LEX |                           "dy" | 12.4
#          OP_POW |                                | 12.45
#          NUMBER |                            "2" | 12.5
#         PAREN_E |                                | 12.55
#         OP_SEMI |                              1 | 12.6
#       CLOSURE_E |                                | 13.1
#          METHOD | {"p_set":null,"is_prop":1,"name":"distanceFromOrigin"} | 15.1
#       CLOSURE_S |                                | 15.2
#  KEYWORD_RETURN |                                | 16.05
#        VAR_THIS |                   "distanceTo" | 16.1
#      PAREN_CALL |                                | 16.15
#        VAR_SPEC |                        "class" | 16.2
#      PAREN_CALL |                                | 16.25
#          NUMBER |                            "0" | 16.3
#        OP_COMMA |                                | 16.35
#          NUMBER |                            "0" | 16.4
#         PAREN_E |                                | 16.45
#         PAREN_E |                                | 16.5
#         OP_SEMI |                              1 | 16.55
#       CLOSURE_E |                                | 17.1
#          METHOD | {"name":"pretty","is_prop":1,"p_set":null} | 19.1
#       CLOSURE_S |                                | 19.2
#  KEYWORD_RETURN |                                | 20.1
#          STRING | ["(",["VAR_THIS","x",20],", ",["VAR_THIS","y",20],")"] | 20.2
#         OP_SEMI |                              1 | 20.3
#       CLOSURE_E |                                | 21.1
#          METHOD |            {"name":"toString"} | 23.1
#       CLOSURE_S |                                | 23.2
#  KEYWORD_RETURN |                                | 24.1
#        VAR_THIS |                       "pretty" | 24.2
#         OP_SEMI |                              1 | 24.3
#       CLOSURE_E |                                | 25.1
#          METHOD |         {"name":"description"} | 27.1
#       CLOSURE_S |                                | 27.2
#  KEYWORD_RETURN |                                | 28.1
#          STRING |                      ["Point"] | 28.2
#          OP_ADD |                                | 28.3
#        VAR_THIS |                       "pretty" | 28.4
#         OP_SEMI |                              1 | 28.5
#       CLOSURE_E |                                | 29.1
#        FUNCTION |            {"name":"midpoint"} | 31.1
#       CLOSURE_S |                                | 31.2
#    KEYWORD_NEED |                                | 32.05
#         VAR_LEX |                          "pt1" | 32.1
#        OP_VALUE |                                | 32.15
#        BAREWORD |                        "Point" | 32.2
#        OP_COMMA |                                | 32.25
#         VAR_LEX |                          "pt2" | 32.3
#        OP_VALUE |                                | 32.35
#        BAREWORD |                        "Point" | 32.4
#         OP_SEMI |                              1 | 32.45
#  KEYWORD_RETURN |                                | 33.1
#        VAR_SPEC |                        "class" | 33.2
#      PAREN_CALL |                                | 33.3
#      PROP_VALUE |                            "x" | 34.05
#         PAREN_S |                                | 34.1
#         VAR_LEX |                          "pt1" | 34.15
#        PROPERTY |                            "x" | 34.2
#          OP_ADD |                                | 34.25
#         VAR_LEX |                          "pt2" | 34.3
#        PROPERTY |                            "x" | 34.35
#         PAREN_E |                                | 34.4
#          OP_DIV |                                | 34.45
#          NUMBER |                            "2" | 34.5
#        OP_COMMA |                                | 34.55
#      PROP_VALUE |                            "y" | 35.05
#         PAREN_S |                                | 35.1
#         VAR_LEX |                          "pt1" | 35.15
#        PROPERTY |                            "y" | 35.2
#          OP_ADD |                                | 35.25
#         VAR_LEX |                          "pt2" | 35.3
#        PROPERTY |                            "y" | 35.35
#         PAREN_E |                                | 35.4
#          OP_DIV |                                | 35.45
#          NUMBER |                            "2" | 35.5
#         OP_SEMI |                              1 | 35.55
#         PAREN_E |                                | 36.1
#         OP_SEMI |                              1 | 36.2
#       CLOSURE_E |                                | 37.1
#        FUNCTION |     {"name":"distanceBetween"} | 39.1
#       CLOSURE_S |                                | 39.2
#    KEYWORD_NEED |                                | 40.05
#         VAR_LEX |                          "pt1" | 40.1
#        OP_VALUE |                                | 40.15
#        BAREWORD |                        "Point" | 40.2
#        OP_COMMA |                                | 40.25
#         VAR_LEX |                          "pt2" | 40.3
#        OP_VALUE |                                | 40.35
#        BAREWORD |                        "Point" | 40.4
#         OP_SEMI |                              1 | 40.45
#  KEYWORD_RETURN |                                | 41.1
#         VAR_LEX |                          "pt1" | 41.2
#        PROPERTY |                   "distanceTo" | 41.3
#      PAREN_CALL |                                | 41.4
#         VAR_LEX |                          "pt2" | 41.5
#         PAREN_E |                                | 41.6
#         OP_SEMI |                              1 | 41.7
#       CLOSURE_E |                                | 42.1
# === Document Model ===
#  Document './std/Math/Point.frt'
#      Package 'Math'
#      Class 'Point'
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Instance variable '@x'
#                          Bareword 'Num'
#                  Instruction
#                      Need
#                          Instance variable '@y'
#                          Bareword 'Num'
#          Method 'distanceTo'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$pt2'
#                          Bareword 'Point'
#                  Instruction
#                      Assignment (lexical variable '$dx')
#                          Operation
#                              Instance variable '@x'
#                              Subtraction operator (-)
#                              Property 'x'
#                                  Lexical variable '$pt2'
#                  Instruction
#                      Assignment (lexical variable '$dy')
#                          Operation
#                              Instance variable '@y'
#                              Subtraction operator (-)
#                              Property 'y'
#                                  Lexical variable '$pt2'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'sqrt'
#                              Argument list [1 items]
#                                  Item 0
#                                      Operation
#                                          Lexical variable '$dx'
#                                          Exponent operator (^)
#                                          Number '2'
#                                          Addition operator (+)
#                                          Lexical variable '$dy'
#                                          Exponent operator (^)
#                                          Number '2'
#          Computed property 'distanceFromOrigin'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@distanceTo'
#                              Argument list [1 items]
#                                  Item 0
#                                      Call
#                                          Special variable '*class'
#                                          Argument list [2 items]
#                                              Item 0
#                                                  Number '0'
#                                              Item 1
#                                                  Number '0'
#          Computed property 'pretty'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Operation
#                              String '('
#                              Addition operator (+)
#                              Instance variable '@x'
#                              Addition operator (+)
#                              String ', '
#                              Addition operator (+)
#                              Instance variable '@y'
#                              Addition operator (+)
#                              String ')'
#          Method 'toString'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Instance variable '@pretty'
#          Method 'description'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Operation
#                              String 'Point'
#                              Addition operator (+)
#                              Instance variable '@pretty'
#          Class method 'midpoint'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$pt1'
#                          Bareword 'Point'
#                  Instruction
#                      Need
#                          Lexical variable '$pt2'
#                          Bareword 'Point'
#                  Instruction
#                      Return
#                          Call
#                              Special variable '*class'
#                              Named argument list [2 items]
#                                  Item 0
#                                      Pair 'x'
#                                          Operation
#                                              Single value [1 items]
#                                                  Item 0
#                                                      Operation
#                                                          Property 'x'
#                                                              Lexical variable '$pt1'
#                                                          Addition operator (+)
#                                                          Property 'x'
#                                                              Lexical variable '$pt2'
#                                              Division operator (/)
#                                              Number '2'
#                                  Item 1
#                                      Pair 'y'
#                                          Operation
#                                              Single value [1 items]
#                                                  Item 0
#                                                      Operation
#                                                          Property 'y'
#                                                              Lexical variable '$pt1'
#                                                          Addition operator (+)
#                                                          Property 'y'
#                                                              Lexical variable '$pt2'
#                                              Division operator (/)
#                                              Number '2'
#          Class method 'distanceBetween'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$pt1'
#                          Bareword 'Point'
#                  Instruction
#                      Need
#                          Lexical variable '$pt2'
#                          Bareword 'Point'
#                  Instruction
#                      Return
#                          Call
#                              Property 'distanceTo'
#                                  Lexical variable '$pt1'
#                              Argument list [1 items]
#                                  Item 0
#                                      Lexical variable '$pt2'
#      Include (Num, Point)
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

FF::before_content('Point.frt');

use Ferret::Core::Operations qw(_sub add div num pow str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'Math' );
    FF::load_core('Math');

    # Class 'Point'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Point', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
            [
                {
                    name     => 'x',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'y',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $self, $arguments, 'x' ) or return;
                FF::need( $self, $arguments, 'y' ) or return;
                return $return;
            }
        );

        # Method event 'distanceTo' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'distanceTo',
            [
                {
                    name     => 'pt2',
                    type     => 'Point',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'pt2', 9.2 ) or return;
                $scope->set_property_ow(
                    $context,
                    dx => _sub(
                        $scope,
                        $self->property_u('x'),
                        $scope->property_u('pt2')->property_u('x')
                    ),
                    10.2
                );
                $scope->set_property_ow(
                    $context,
                    dy => _sub(
                        $scope,
                        $self->property_u('y'),
                        $scope->property_u('pt2')->property_u('y')
                    ),
                    11.2
                );
                return $scope->property_u('sqrt')->call_u(
                    [
                        add(
                            $scope,
                            pow(
                                $scope, $scope->property_u('dx'),
                                num( $f, 2 )
                            ),
                            pow(
                                $scope, $scope->property_u('dy'),
                                num( $f, 2 )
                            )
                        )
                    ],
                    $scope, undef, 12.15
                );
                return $return;
            }
        );

        # Method event 'distanceFromOrigin' definition
        my $method_2 = FF::method_event_def(
            $f, $scope,
            'distanceFromOrigin',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return $self->property_u('distanceTo')->call_u(
                    [
                        $scope->{special}->property_u('class')->call_u(
                            [ num( $f, 0 ), num( $f, 0 ) ], $scope,
                            undef, 16.25
                        )
                    ],
                    $scope, undef, 16.15
                );
                return $return;
            }
        );

        # Method event 'pretty' definition
        my $method_3 = FF::method_event_def(
            $f, $scope, 'pretty',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return add(
                    $scope,                 str( $f, "(" ),
                    $self->property_u('x'), str( $f, ", " ),
                    $self->property_u('y'), str( $f, ")" )
                );
                return $return;
            }
        );

        # Method event 'toString' definition
        my $method_4 = FF::method_event_def(
            $f, $scope,
            'toString',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return $self->property_u('pretty');
                return $return;
            }
        );

        # Method event 'description' definition
        my $method_5 = FF::method_event_def(
            $f, $scope,
            'description',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return add( $scope, str( $f, "Point" ),
                    $self->property_u('pretty') );
                return $return;
            }
        );

        # Method event 'midpoint' definition
        my $method_6 = FF::method_event_def(
            $f, $scope,
            'midpoint',
            [
                {
                    name     => 'pt1',
                    type     => 'Point',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'pt2',
                    type     => 'Point',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'pt1', 32.1 ) or return;
                FF::need( $scope, $arguments, 'pt2', 32.3 ) or return;
                return $scope->{special}->property_u('class')->call_u(
                    {
                        x => div(
                            $scope,
                            add(
                                $scope,
                                $scope->property_u('pt1')->property_u('x'),
                                $scope->property_u('pt2')->property_u('x')
                            ),
                            num( $f, 2 )
                        ),
                        y => div(
                            $scope,
                            add(
                                $scope,
                                $scope->property_u('pt1')->property_u('y'),
                                $scope->property_u('pt2')->property_u('y')
                            ),
                            num( $f, 2 )
                        )
                    },
                    $scope, undef, 33.3
                );
                return $return;
            }
        );

        # Method event 'distanceBetween' definition
        my $method_7 = FF::method_event_def(
            $f, $scope,
            'distanceBetween',
            [
                {
                    name     => 'pt1',
                    type     => 'Point',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'pt2',
                    type     => 'Point',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'pt1', 40.1 ) or return;
                FF::need( $scope, $arguments, 'pt2', 40.3 ) or return;
                return $scope->property_u('pt1')->property_u('distanceTo')
                  ->call_u( [ $scope->property_u('pt2') ], $scope, undef,
                    41.4 );
                return $return;
            }
        );
        $method_0->inside_scope(
            _init_ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            distanceTo => $scope,
            $proto, $class, undef, undef
        );
        $method_2->inside_scope(
            distanceFromOrigin => $scope,
            $proto, $class, 1, undef
        );
        $method_3->inside_scope( pretty => $scope, $proto, $class, 1, undef );
        $method_4->inside_scope(
            toString => $scope,
            $proto, $class, undef, undef
        );
        $method_5->inside_scope(
            description => $scope,
            $proto, $class, undef, undef
        );
        $method_6->inside_scope(
            midpoint => $scope,
            $class, $class, undef, undef
        );
        $method_7->inside_scope(
            distanceBetween => $scope,
            $class, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Num Point) );
};

FF::after_content();
