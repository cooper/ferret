# === Tokenization ===
#       CLASS_DEC | {"name":"Point","version":"1.0"}
#          METHOD | {"main":1,"name":"_init_"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "x"
#        OP_COMMA | 
#         VAR_LEX | "y"
#         OP_SEMI | 
#        VAR_THIS | "x"
#       OP_ASSIGN | 
#         VAR_LEX | "x"
#         OP_SEMI | 
#        VAR_THIS | "y"
#       OP_ASSIGN | 
#         VAR_LEX | "y"
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"oneToRight"}
#       CLOSURE_S | 
#         VAR_LEX | "pt"
#       OP_ASSIGN | 
#        VAR_SPEC | "class"
#      PAREN_CALL | 
#        VAR_THIS | "x"
#          OP_ADD | 
#          NUMBER | "1"
#        OP_COMMA | 
#        VAR_THIS | "y"
#         PAREN_E | 
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#         VAR_LEX | "pt"
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"pretty"}
#       CLOSURE_S | 
#  KEYWORD_RETURN | 
#         PAREN_S | 
#          STRING | ["(",["VAR_THIS","x",16],", ",["VAR_THIS","y",16],")"]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"toString"}
#       CLOSURE_S | 
#  KEYWORD_RETURN | 
#        VAR_THIS | "pretty"
#      PAREN_CALL | 
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#        FUNCTION | {"name":"midpoint"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "pt1"
#        OP_COMMA | 
#         VAR_LEX | "pt2"
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#        BAREWORD | "Point"
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
#     KEYWORD_END | 
#         VAR_LEX | "pt"
#       OP_ASSIGN | 
#        BAREWORD | "Point"
#      PAREN_CALL | 
#          NUMBER | "5"
#        OP_COMMA | 
#          NUMBER | "3"
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Point",["VAR_LEX","pt",34]]
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "rpt"
#       OP_ASSIGN | 
#         VAR_LEX | "pt"
#        PROPERTY | "oneToRight"
#         OP_CALL | 
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Right",["VAR_LEX","rpt",37]]
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "mdpt"
#       OP_ASSIGN | 
#        BAREWORD | "Point"
#        PROPERTY | "midpoint"
#      PAREN_CALL | 
#         VAR_LEX | "pt"
#        OP_COMMA | 
#         VAR_LEX | "rpt"
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Midpoint",["VAR_LEX","mdpt",40]]
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "nineteen"
#       OP_ASSIGN | 
#          NUMBER | "4"
#          OP_ADD | 
#          NUMBER | "45"
#          OP_DIV | 
#          NUMBER | "3"
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Nineteen: ",["VAR_LEX","nineteen",43]]
#         PAREN_E | 
#         OP_SEMI | 
# === Document Model ===
#  Document './test/hello5.frt'
#      Class 'Point' version 1.0
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$x'
#                  Instruction
#                      Need
#                          Lexical variable '$y'
#                  Instruction
#                      Assignment (instance variable '@x')
#                          Lexical variable '$x'
#                  Instruction
#                      Assignment (instance variable '@y')
#                          Lexical variable '$y'
#          Method 'oneToRight'
#              Body ('method' scope)
#                  Instruction
#                      Assignment (lexical variable '$pt')
#                          Call
#                              Special variable '*class'
#                              Argument list [2 items]
#                                  Item 0
#                                      Operation
#                                          Instance variable '@x'
#                                          Addition operator (+)
#                                          Number '1'
#                                  Item 1
#                                      Instance variable '@y'
#                  Instruction
#                      Return
#                          Lexical variable '$pt'
#          Method 'pretty'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Single value [1 items]
#                              Item 0
#                                  Operation
#                                      String '('
#                                      Addition operator (+)
#                                      Instance variable '@x'
#                                      Addition operator (+)
#                                      String ', '
#                                      Addition operator (+)
#                                      Instance variable '@y'
#                                      Addition operator (+)
#                                      String ')'
#          Method 'toString'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@pretty'
#                              Argument list [0 items]
#          Class method 'midpoint'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$pt1'
#                  Instruction
#                      Need
#                          Lexical variable '$pt2'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Point'
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
#      Instruction
#          Assignment (lexical variable '$pt')
#              Call
#                  Bareword 'Point'
#                  Argument list [2 items]
#                      Item 0
#                          Number '5'
#                      Item 1
#                          Number '3'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Point'
#                          Addition operator (+)
#                          Lexical variable '$pt'
#      Instruction
#          Assignment (lexical variable '$rpt')
#              Call
#                  Property 'oneToRight'
#                      Lexical variable '$pt'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Right'
#                          Addition operator (+)
#                          Lexical variable '$rpt'
#      Instruction
#          Assignment (lexical variable '$mdpt')
#              Call
#                  Property 'midpoint'
#                      Bareword 'Point'
#                  Argument list [2 items]
#                      Item 0
#                          Lexical variable '$pt'
#                      Item 1
#                          Lexical variable '$rpt'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Midpoint'
#                          Addition operator (+)
#                          Lexical variable '$mdpt'
#      Instruction
#          Assignment (lexical variable '$nineteen')
#              Operation
#                  Number '4'
#                  Addition operator (+)
#                  Number '45'
#                  Division operator (/)
#                  Number '3'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Nineteen: '
#                          Addition operator (+)
#                          Lexical variable '$nineteen'
#      Include (Point)
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

FF::before_content('hello5.frt');

use Ferret::Core::Operations qw(add div num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Class 'Point'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Point', 1.0 );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
            [
                {
                    name     => 'x',
                    type     => undef,
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'y',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'x', 4.4 ) or return;
                FF::need( $scope, $arguments, 'y', 4.8 ) or return;
                $self->set_property( x => $scope->property_u('x'), 5.5 );
                $self->set_property( y => $scope->property_u('y'), 6.5 );
                return $return;
            }
        );

        # Method event 'oneToRight' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'oneToRight',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property_ow(
                    $context,
                    pt => $scope->{special}->property_u('class')->call_u(
                        [
                            add( $scope, $self->property_u('x'), num( $f, 1 ) ),
                            $self->property_u('y')
                        ],
                        $scope, undef, 10.36364
                    ),
                    10.18182
                );
                return $scope->property_u('pt');
                return $return;
            }
        );

        # Method event 'pretty' definition
        my $method_2 = FF::method_event_def(
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
        my $method_3 = FF::method_event_def(
            $f, $scope,
            'toString',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return $self->property_u('pretty')
                  ->call_u( {}, $scope, undef, 19.6 );
                return $return;
            }
        );

        # Method event 'midpoint' definition
        my $method_4 = FF::method_event_def(
            $f, $scope,
            'midpoint',
            [
                {
                    name     => 'pt1',
                    type     => undef,
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'pt2',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'pt1', 23.4 ) or return;
                FF::need( $scope, $arguments, 'pt2', 23.8 ) or return;
                return $scope->property_u('Point')->call_u(
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
                    $scope, undef, 25
                );
                return $return;
            }
        );
        $method_0->inside_scope(
            _init_ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            oneToRight => $scope,
            $proto, $class, undef, undef
        );
        $method_2->inside_scope(
            pretty => $scope,
            $proto, $class, undef, undef
        );
        $method_3->inside_scope(
            toString => $scope,
            $proto, $class, undef, undef
        );
        $method_4->inside_scope(
            midpoint => $scope,
            $class, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Point) );
    $scope->set_property_ow(
        $context,
        pt => $scope->property_u('Point')
          ->call_u( [ num( $f, 5 ), num( $f, 3 ) ], $scope, undef, 32.44444 ),
        32.22222
    );
    $scope->property_u('say')
      ->call_u( [ add( $scope, str( $f, "Point" ), $scope->property_u('pt') ) ],
        $scope, undef, 33.4 );
    $scope->set_property_ow(
        $context,
        rpt => $scope->property_u('pt')->property_u('oneToRight')
          ->call_u( {}, $scope, undef, 35.83333 ),
        35.33333
    );
    $scope->property_u('say')
      ->call_u(
        [ add( $scope, str( $f, "Right" ), $scope->property_u('rpt') ) ],
        $scope, undef, 36.4 );
    $scope->set_property_ow(
        $context,
        mdpt => $scope->property_u('Point')->property_u('midpoint')->call_u(
            [ $scope->property_u('pt'), $scope->property_u('rpt') ], $scope,
            undef, 38.5
        ),
        38.2
    );
    $scope->property_u('say')
      ->call_u(
        [ add( $scope, str( $f, "Midpoint" ), $scope->property_u('mdpt') ) ],
        $scope, undef, 39.4 );
    $scope->set_property_ow(
        $context,
        nineteen => add(
            $scope,
            num( $f, 4 ),
            div( $scope, num( $f, 45 ), num( $f, 3 ) )
        ),
        41.25
    );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope, str( $f, "Nineteen: " ),
                $scope->property_u('nineteen')
            )
        ],
        $scope, undef, 42.4
    );
};

FF::after_content();
