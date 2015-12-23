# === Tokenization ===
#       CLASS_DEC | {"version":"1.0","name":"Point"} | 1.1
#          METHOD |     {"name":"_init_","main":1} | 3.1
#       CLOSURE_S |                                | 3.2
#    KEYWORD_NEED |                                | 4.1
#         VAR_LEX |                            "x" | 4.2
#        OP_COMMA |                                | 4.3
#         VAR_LEX |                            "y" | 4.4
#         OP_SEMI |                              1 | 4.5
#        VAR_THIS |                            "x" | 5.1
#       OP_ASSIGN |                                | 5.2
#         VAR_LEX |                            "x" | 5.3
#         OP_SEMI |                              1 | 5.4
#        VAR_THIS |                            "y" | 6.1
#       OP_ASSIGN |                                | 6.2
#         VAR_LEX |                            "y" | 6.3
#         OP_SEMI |                              1 | 6.4
#       CLOSURE_E |                                | 7.1
#          METHOD |          {"name":"oneToRight"} | 9.1
#       CLOSURE_S |                                | 9.2
#         VAR_LEX |                           "pt" | 10.05
#       OP_ASSIGN |                                | 10.1
#        VAR_SPEC |                        "class" | 10.15
#      PAREN_CALL |                                | 10.2
#        VAR_THIS |                            "x" | 10.25
#          OP_ADD |                                | 10.3
#          NUMBER |                            "1" | 10.35
#        OP_COMMA |                                | 10.4
#        VAR_THIS |                            "y" | 10.45
#         PAREN_E |                                | 10.5
#         OP_SEMI |                              1 | 10.55
#  KEYWORD_RETURN |                                | 11.1
#         VAR_LEX |                           "pt" | 11.2
#         OP_SEMI |                              1 | 11.3
#       CLOSURE_E |                                | 12.1
#          METHOD |              {"name":"pretty"} | 14.1
#       CLOSURE_S |                                | 14.2
#  KEYWORD_RETURN |                                | 15.1
#         PAREN_S |                                | 15.2
#          STRING | ["(",["VAR_THIS","x",15],", ",["VAR_THIS","y",15],")"] | 15.3
#         PAREN_E |                                | 15.4
#         OP_SEMI |                              1 | 15.5
#       CLOSURE_E |                                | 16.1
#          METHOD |            {"name":"toString"} | 18.1
#       CLOSURE_S |                                | 18.2
#  KEYWORD_RETURN |                                | 19.1
#        VAR_THIS |                       "pretty" | 19.2
#      PAREN_CALL |                                | 19.3
#         PAREN_E |                                | 19.4
#         OP_SEMI |                              1 | 19.5
#       CLOSURE_E |                                | 20.1
#        FUNCTION |            {"name":"midpoint"} | 22.1
#       CLOSURE_S |                                | 22.2
#    KEYWORD_NEED |                                | 23.1
#         VAR_LEX |                          "pt1" | 23.2
#        OP_COMMA |                                | 23.3
#         VAR_LEX |                          "pt2" | 23.4
#         OP_SEMI |                              1 | 23.5
#  KEYWORD_RETURN |                                | 24.1
#        BAREWORD |                        "Point" | 24.2
#      PAREN_CALL |                                | 24.3
#      PROP_VALUE |                            "x" | 25.05
#         PAREN_S |                                | 25.1
#         VAR_LEX |                          "pt1" | 25.15
#        PROPERTY |                            "x" | 25.2
#          OP_ADD |                                | 25.25
#         VAR_LEX |                          "pt2" | 25.3
#        PROPERTY |                            "x" | 25.35
#         PAREN_E |                                | 25.4
#          OP_DIV |                                | 25.45
#          NUMBER |                            "2" | 25.5
#        OP_COMMA |                                | 25.55
#      PROP_VALUE |                            "y" | 26.05
#         PAREN_S |                                | 26.1
#         VAR_LEX |                          "pt1" | 26.15
#        PROPERTY |                            "y" | 26.2
#          OP_ADD |                                | 26.25
#         VAR_LEX |                          "pt2" | 26.3
#        PROPERTY |                            "y" | 26.35
#         PAREN_E |                                | 26.4
#          OP_DIV |                                | 26.45
#          NUMBER |                            "2" | 26.5
#         OP_SEMI |                              1 | 26.55
#         PAREN_E |                                | 27.1
#         OP_SEMI |                              1 | 27.2
#       CLOSURE_E |                                | 28.1
#     KEYWORD_END |                                | 30.1
#         VAR_LEX |                           "pt" | 32.05
#       OP_ASSIGN |                                | 32.1
#        BAREWORD |                        "Point" | 32.15
#      PAREN_CALL |                                | 32.2
#          NUMBER |                            "5" | 32.25
#        OP_COMMA |                                | 32.3
#          NUMBER |                            "3" | 32.35
#         PAREN_E |                                | 32.4
#         OP_SEMI |                              1 | 32.45
#        BAREWORD |                          "say" | 33.1
#      PAREN_CALL |                                | 33.2
#          STRING |  ["Point",["VAR_LEX","pt",33]] | 33.3
#         PAREN_E |                                | 33.4
#         OP_SEMI |                              1 | 33.5
#         VAR_LEX |                          "rpt" | 35.1
#       OP_ASSIGN |                                | 35.2
#         VAR_LEX |                           "pt" | 35.3
#        PROPERTY |                   "oneToRight" | 35.4
#         OP_CALL |                                | 35.5
#         OP_SEMI |                              1 | 35.6
#        BAREWORD |                          "say" | 36.1
#      PAREN_CALL |                                | 36.2
#          STRING | ["Right",["VAR_LEX","rpt",36]] | 36.3
#         PAREN_E |                                | 36.4
#         OP_SEMI |                              1 | 36.5
#         VAR_LEX |                         "mdpt" | 38.05
#       OP_ASSIGN |                                | 38.1
#        BAREWORD |                        "Point" | 38.15
#        PROPERTY |                     "midpoint" | 38.2
#      PAREN_CALL |                                | 38.25
#         VAR_LEX |                           "pt" | 38.3
#        OP_COMMA |                                | 38.35
#         VAR_LEX |                          "rpt" | 38.4
#         PAREN_E |                                | 38.45
#         OP_SEMI |                              1 | 38.5
#        BAREWORD |                          "say" | 39.1
#      PAREN_CALL |                                | 39.2
#          STRING | ["Midpoint",["VAR_LEX","mdpt",39]] | 39.3
#         PAREN_E |                                | 39.4
#         OP_SEMI |                              1 | 39.5
#         VAR_LEX |                     "nineteen" | 41.1
#       OP_ASSIGN |                                | 41.2
#          NUMBER |                            "4" | 41.3
#          OP_ADD |                                | 41.4
#          NUMBER |                           "45" | 41.5
#          OP_DIV |                                | 41.6
#          NUMBER |                            "3" | 41.7
#         OP_SEMI |                              1 | 41.8
#        BAREWORD |                          "say" | 42.1
#      PAREN_CALL |                                | 42.2
#          STRING | ["Nineteen: ",["VAR_LEX","nineteen",42]] | 42.3
#         PAREN_E |                                | 42.4
#         OP_SEMI |                              1 | 42.5
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
                FF::need( $scope, $arguments, 'x', 4.2 ) or return;
                FF::need( $scope, $arguments, 'y', 4.4 ) or return;
                $self->set_property( x => $scope->property_u('x'), 5.2 );
                $self->set_property( y => $scope->property_u('y'), 6.2 );
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
                        $scope, undef, 10.2
                    ),
                    10.1
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
                  ->call_u( {}, $scope, undef, 19.3 );
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
                FF::need( $scope, $arguments, 'pt1', 23.2 ) or return;
                FF::need( $scope, $arguments, 'pt2', 23.4 ) or return;
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
                    $scope, undef, 24.3
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
          ->call_u( [ num( $f, 5 ), num( $f, 3 ) ], $scope, undef, 32.2 ),
        32.1
    );
    $scope->property_u('say')
      ->call_u( [ add( $scope, str( $f, "Point" ), $scope->property_u('pt') ) ],
        $scope, undef, 33.2 );
    $scope->set_property_ow(
        $context,
        rpt => $scope->property_u('pt')->property_u('oneToRight')
          ->call_u( {}, $scope, undef, 35.5 ),
        35.2
    );
    $scope->property_u('say')
      ->call_u(
        [ add( $scope, str( $f, "Right" ), $scope->property_u('rpt') ) ],
        $scope, undef, 36.2 );
    $scope->set_property_ow(
        $context,
        mdpt => $scope->property_u('Point')->property_u('midpoint')->call_u(
            [ $scope->property_u('pt'), $scope->property_u('rpt') ], $scope,
            undef, 38.25
        ),
        38.1
    );
    $scope->property_u('say')
      ->call_u(
        [ add( $scope, str( $f, "Midpoint" ), $scope->property_u('mdpt') ) ],
        $scope, undef, 39.2 );
    $scope->set_property_ow(
        $context,
        nineteen => add(
            $scope,
            num( $f, 4 ),
            div( $scope, num( $f, 45 ), num( $f, 3 ) )
        ),
        41.2
    );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope, str( $f, "Nineteen: " ),
                $scope->property_u('nineteen')
            )
        ],
        $scope, undef, 42.2
    );
};

FF::after_content();
