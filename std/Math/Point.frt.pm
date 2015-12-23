# === Tokenization ===
#         PKG_DEC |                {"name":"Math"} | 1.5
#       CLASS_DEC |               {"name":"Point"} | 2.5
#          METHOD |     {"main":1,"name":"_init_"} | 4.33333
#       CLOSURE_S |                                | 4.66667
#    KEYWORD_NEED |                                | 5.1
#        VAR_THIS |                            "x" | 5.2
#        OP_VALUE |                                | 5.3
#        BAREWORD |                          "Num" | 5.4
#        OP_COMMA |                                | 5.5
#        VAR_THIS |                            "y" | 5.6
#        OP_VALUE |                                | 5.7
#        BAREWORD |                          "Num" | 5.8
#         OP_SEMI |                                | 5.9
#       CLOSURE_E |                                | 6.5
#          METHOD |          {"name":"distanceTo"} | 8.33333
#       CLOSURE_S |                                | 8.66667
#    KEYWORD_NEED |                                | 9.16667
#         VAR_LEX |                          "pt2" | 9.33333
#        OP_VALUE |                                | 9.5
#        BAREWORD |                        "Point" | 9.66667
#         OP_SEMI |                                | 9.83333
#         VAR_LEX |                           "dx" | 10.125
#       OP_ASSIGN |                                | 10.25
#        VAR_THIS |                            "x" | 10.375
#          OP_SUB |                                | 10.5
#         VAR_LEX |                          "pt2" | 10.625
#        PROPERTY |                            "x" | 10.75
#         OP_SEMI |                                | 10.875
#         VAR_LEX |                           "dy" | 11.125
#       OP_ASSIGN |                                | 11.25
#        VAR_THIS |                            "y" | 11.375
#          OP_SUB |                                | 11.5
#         VAR_LEX |                          "pt2" | 11.625
#        PROPERTY |                            "y" | 11.75
#         OP_SEMI |                                | 11.875
#  KEYWORD_RETURN |                                | 12.07692
#        BAREWORD |                         "sqrt" | 12.15385
#      PAREN_CALL |                                | 12.23077
#         VAR_LEX |                           "dx" | 12.30769
#          OP_POW |                                | 12.38462
#          NUMBER |                            "2" | 12.46154
#          OP_ADD |                                | 12.53846
#         VAR_LEX |                           "dy" | 12.61538
#          OP_POW |                                | 12.69231
#          NUMBER |                            "2" | 12.76923
#         PAREN_E |                                | 12.84615
#         OP_SEMI |                                | 12.92308
#       CLOSURE_E |                                | 13.5
#          METHOD | {"is_prop":1,"name":"distanceFromOrigin","p_set":null} | 15.33333
#       CLOSURE_S |                                | 15.66667
#  KEYWORD_RETURN |                                | 16.08333
#        VAR_THIS |                   "distanceTo" | 16.16667
#      PAREN_CALL |                                | 16.25
#        VAR_SPEC |                        "class" | 16.33333
#      PAREN_CALL |                                | 16.41667
#          NUMBER |                            "0" | 16.5
#        OP_COMMA |                                | 16.58333
#          NUMBER |                            "0" | 16.66667
#         PAREN_E |                                | 16.75
#         PAREN_E |                                | 16.83333
#         OP_SEMI |                                | 16.91667
#       CLOSURE_E |                                | 17.5
#          METHOD | {"p_set":null,"name":"pretty","is_prop":1} | 19.33333
#       CLOSURE_S |                                | 19.66667
#  KEYWORD_RETURN |                                | 20.25
#          STRING | ["(",["VAR_THIS","x",20],", ",["VAR_THIS","y",20],")"] | 20.5
#         OP_SEMI |                                | 20.75
#       CLOSURE_E |                                | 21.5
#          METHOD |            {"name":"toString"} | 23.33333
#       CLOSURE_S |                                | 23.66667
#  KEYWORD_RETURN |                                | 24.25
#        VAR_THIS |                       "pretty" | 24.5
#         OP_SEMI |                                | 24.75
#       CLOSURE_E |                                | 25.5
#          METHOD |         {"name":"description"} | 27.33333
#       CLOSURE_S |                                | 27.66667
#  KEYWORD_RETURN |                                | 28.16667
#          STRING |                      ["Point"] | 28.33333
#          OP_ADD |                                | 28.5
#        VAR_THIS |                       "pretty" | 28.66667
#         OP_SEMI |                                | 28.83333
#       CLOSURE_E |                                | 29.5
#        FUNCTION |            {"name":"midpoint"} | 31.33333
#       CLOSURE_S |                                | 31.66667
#    KEYWORD_NEED |                                | 32.1
#         VAR_LEX |                          "pt1" | 32.2
#        OP_VALUE |                                | 32.3
#        BAREWORD |                        "Point" | 32.4
#        OP_COMMA |                                | 32.5
#         VAR_LEX |                          "pt2" | 32.6
#        OP_VALUE |                                | 32.7
#        BAREWORD |                        "Point" | 32.8
#         OP_SEMI |                                | 32.9
#  KEYWORD_RETURN |                                | 33.25
#        VAR_SPEC |                        "class" | 33.5
#      PAREN_CALL |                                | 33.75
#      PROP_VALUE |                            "x" | 34.08333
#         PAREN_S |                                | 34.16667
#         VAR_LEX |                          "pt1" | 34.25
#        PROPERTY |                            "x" | 34.33333
#          OP_ADD |                                | 34.41667
#         VAR_LEX |                          "pt2" | 34.5
#        PROPERTY |                            "x" | 34.58333
#         PAREN_E |                                | 34.66667
#          OP_DIV |                                | 34.75
#          NUMBER |                            "2" | 34.83333
#        OP_COMMA |                                | 34.91667
#      PROP_VALUE |                            "y" | 35.08333
#         PAREN_S |                                | 35.16667
#         VAR_LEX |                          "pt1" | 35.25
#        PROPERTY |                            "y" | 35.33333
#          OP_ADD |                                | 35.41667
#         VAR_LEX |                          "pt2" | 35.5
#        PROPERTY |                            "y" | 35.58333
#         PAREN_E |                                | 35.66667
#          OP_DIV |                                | 35.75
#          NUMBER |                            "2" | 35.83333
#        OP_COMMA |                                | 35.91667
#         PAREN_E |                                | 36.33333
#         OP_SEMI |                                | 36.66667
#       CLOSURE_E |                                | 37.5
#        FUNCTION |     {"name":"distanceBetween"} | 39.33333
#       CLOSURE_S |                                | 39.66667
#    KEYWORD_NEED |                                | 40.1
#         VAR_LEX |                          "pt1" | 40.2
#        OP_VALUE |                                | 40.3
#        BAREWORD |                        "Point" | 40.4
#        OP_COMMA |                                | 40.5
#         VAR_LEX |                          "pt2" | 40.6
#        OP_VALUE |                                | 40.7
#        BAREWORD |                        "Point" | 40.8
#         OP_SEMI |                                | 40.9
#  KEYWORD_RETURN |                                | 41.125
#         VAR_LEX |                          "pt1" | 41.25
#        PROPERTY |                   "distanceTo" | 41.375
#      PAREN_CALL |                                | 41.5
#         VAR_LEX |                          "pt2" | 41.625
#         PAREN_E |                                | 41.75
#         OP_SEMI |                                | 41.875
#       CLOSURE_E |                                | 42.5
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
                FF::need( $scope, $arguments, 'pt2', 9.33333 ) or return;
                $scope->set_property_ow(
                    $context,
                    dx => _sub(
                        $scope,
                        $self->property_u('x'),
                        $scope->property_u('pt2')->property_u('x')
                    ),
                    10.25
                );
                $scope->set_property_ow(
                    $context,
                    dy => _sub(
                        $scope,
                        $self->property_u('y'),
                        $scope->property_u('pt2')->property_u('y')
                    ),
                    11.25
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
                    $scope, undef, 12.23077
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
                            undef, 16.41667
                        )
                    ],
                    $scope, undef, 16.25
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
                FF::need( $scope, $arguments, 'pt1', 32.2 ) or return;
                FF::need( $scope, $arguments, 'pt2', 32.6 ) or return;
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
                    $scope, undef, 33.75
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
                FF::need( $scope, $arguments, 'pt1', 40.2 ) or return;
                FF::need( $scope, $arguments, 'pt2', 40.6 ) or return;
                return $scope->property_u('pt1')->property_u('distanceTo')
                  ->call_u( [ $scope->property_u('pt2') ], $scope, undef,
                    41.5 );
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
