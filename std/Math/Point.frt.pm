# === Tokenization ===
#         PKG_DEC | {"name":"Math"}
#       CLASS_DEC | {"name":"Point"}
#          METHOD | {"main":1,"name":"_init_"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#        VAR_THIS | "x"
#        OP_VALUE | 
#        BAREWORD | "Num"
#        OP_COMMA | 
#        VAR_THIS | "y"
#        OP_VALUE | 
#        BAREWORD | "Num"
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"distanceTo"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "pt2"
#        OP_VALUE | 
#        BAREWORD | "Point"
#         OP_SEMI | 
#         VAR_LEX | "dx"
#       OP_ASSIGN | 
#        VAR_THIS | "x"
#          OP_SUB | 
#         VAR_LEX | "pt2"
#        PROPERTY | "x"
#         OP_SEMI | 
#         VAR_LEX | "dy"
#       OP_ASSIGN | 
#        VAR_THIS | "y"
#          OP_SUB | 
#         VAR_LEX | "pt2"
#        PROPERTY | "y"
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#        BAREWORD | "sqrt"
#      PAREN_CALL | 
#         VAR_LEX | "dx"
#          OP_POW | 
#          NUMBER | "2"
#          OP_ADD | 
#         VAR_LEX | "dy"
#          OP_POW | 
#          NUMBER | "2"
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"distanceFromOrigin","p_set":null,"is_prop":1}
#       CLOSURE_S | 
#  KEYWORD_RETURN | 
#        VAR_THIS | "distanceTo"
#      PAREN_CALL | 
#        VAR_SPEC | "class"
#      PAREN_CALL | 
#          NUMBER | "0"
#        OP_COMMA | 
#          NUMBER | "0"
#         PAREN_E | 
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"is_prop":1,"name":"pretty","p_set":null}
#       CLOSURE_S | 
#  KEYWORD_RETURN | 
#          STRING | ["(",["VAR_THIS","x",21],", ",["VAR_THIS","y",21],")"]
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"toString"}
#       CLOSURE_S | 
#  KEYWORD_RETURN | 
#        VAR_THIS | "pretty"
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"description"}
#       CLOSURE_S | 
#  KEYWORD_RETURN | 
#          STRING | ["Point"]
#          OP_ADD | 
#        VAR_THIS | "pretty"
#         OP_SEMI | 
#       CLOSURE_E | 
#        FUNCTION | {"name":"midpoint"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "pt1"
#        OP_VALUE | 
#        BAREWORD | "Point"
#        OP_COMMA | 
#         VAR_LEX | "pt2"
#        OP_VALUE | 
#        BAREWORD | "Point"
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#        VAR_SPEC | "class"
#      PAREN_CALL | 
#      PROP_VALUE | "x"
#         PAREN_S | 
#         VAR_LEX | "pt1"
#        PROPERTY | "x"
#          OP_ADD | 
#         VAR_LEX | "pt2"
#        PROPERTY | "x"
#         PAREN_E | 
#          OP_DIV | 
#          NUMBER | "2"
#        OP_COMMA | 
#      PROP_VALUE | "y"
#         PAREN_S | 
#         VAR_LEX | "pt1"
#        PROPERTY | "y"
#          OP_ADD | 
#         VAR_LEX | "pt2"
#        PROPERTY | "y"
#         PAREN_E | 
#          OP_DIV | 
#          NUMBER | "2"
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#        FUNCTION | {"name":"distanceBetween"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "pt1"
#        OP_VALUE | 
#        BAREWORD | "Point"
#        OP_COMMA | 
#         VAR_LEX | "pt2"
#        OP_VALUE | 
#        BAREWORD | "Point"
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#         VAR_LEX | "pt1"
#        PROPERTY | "distanceTo"
#      PAREN_CALL | 
#         VAR_LEX | "pt2"
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
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
                FF::need( $scope, $arguments, 'pt2', 9.4 ) or return;
                $scope->set_property_ow(
                    $context,
                    dx => _sub(
                        $scope,
                        $self->property_u('x'),
                        $scope->property_u('pt2')->property_u('x')
                    ),
                    10.28571
                );
                $scope->set_property_ow(
                    $context,
                    dy => _sub(
                        $scope,
                        $self->property_u('y'),
                        $scope->property_u('pt2')->property_u('y')
                    ),
                    11.28571
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
                    $scope, undef, 12.25
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
                            undef, 16.45455
                        )
                    ],
                    $scope, undef, 16.27273
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
                FF::need( $scope, $arguments, 'pt1', 32.22222 ) or return;
                FF::need( $scope, $arguments, 'pt2', 32.66667 ) or return;
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
                    $scope, undef, 34
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
                FF::need( $scope, $arguments, 'pt1', 40.22222 ) or return;
                FF::need( $scope, $arguments, 'pt2', 40.66667 ) or return;
                return $scope->property_u('pt1')->property_u('distanceTo')
                  ->call_u( [ $scope->property_u('pt2') ],
                    $scope, undef, 41.57143 );
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
