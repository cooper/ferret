# === Tokenization ===
#       CLASS_DEC | {"name":"Point","version":"1.0"} | 1.5
#          METHOD |     {"name":"_init_","main":1} | 3.33333
#       CLOSURE_S |                                | 3.66667
#    KEYWORD_NEED |                                | 4.16667
#         VAR_LEX |                            "x" | 4.33333
#        OP_COMMA |                                | 4.5
#         VAR_LEX |                            "y" | 4.66667
#         OP_SEMI |                                | 4.83333
#        VAR_THIS |                            "x" | 5.2
#       OP_ASSIGN |                                | 5.4
#         VAR_LEX |                            "x" | 5.6
#         OP_SEMI |                                | 5.8
#        VAR_THIS |                            "y" | 6.2
#       OP_ASSIGN |                                | 6.4
#         VAR_LEX |                            "y" | 6.6
#         OP_SEMI |                                | 6.8
#       CLOSURE_E |                                | 7.5
#          METHOD |          {"name":"oneToRight"} | 9.33333
#       CLOSURE_S |                                | 9.66667
#         VAR_LEX |                           "pt" | 10.08333
#       OP_ASSIGN |                                | 10.16667
#        VAR_SPEC |                        "class" | 10.25
#      PAREN_CALL |                                | 10.33333
#        VAR_THIS |                            "x" | 10.41667
#          OP_ADD |                                | 10.5
#          NUMBER |                            "1" | 10.58333
#        OP_COMMA |                                | 10.66667
#        VAR_THIS |                            "y" | 10.75
#         PAREN_E |                                | 10.83333
#         OP_SEMI |                                | 10.91667
#  KEYWORD_RETURN |                                | 11.25
#         VAR_LEX |                           "pt" | 11.5
#         OP_SEMI |                                | 11.75
#       CLOSURE_E |                                | 12.5
#          METHOD |              {"name":"pretty"} | 14.33333
#       CLOSURE_S |                                | 14.66667
#  KEYWORD_RETURN |                                | 15.16667
#         PAREN_S |                                | 15.33333
#          STRING | ["(",["VAR_THIS","x",15],", ",["VAR_THIS","y",15],")"] | 15.5
#         PAREN_E |                                | 15.66667
#         OP_SEMI |                                | 15.83333
#       CLOSURE_E |                                | 16.5
#          METHOD |            {"name":"toString"} | 18.33333
#       CLOSURE_S |                                | 18.66667
#  KEYWORD_RETURN |                                | 19.16667
#        VAR_THIS |                       "pretty" | 19.33333
#      PAREN_CALL |                                | 19.5
#         PAREN_E |                                | 19.66667
#         OP_SEMI |                                | 19.83333
#       CLOSURE_E |                                | 20.5
#        FUNCTION |            {"name":"midpoint"} | 22.33333
#       CLOSURE_S |                                | 22.66667
#    KEYWORD_NEED |                                | 23.16667
#         VAR_LEX |                          "pt1" | 23.33333
#        OP_COMMA |                                | 23.5
#         VAR_LEX |                          "pt2" | 23.66667
#         OP_SEMI |                                | 23.83333
#  KEYWORD_RETURN |                                | 24.25
#        BAREWORD |                        "Point" | 24.5
#      PAREN_CALL |                                | 24.75
#      PROP_VALUE |                            "x" | 25.08333
#         PAREN_S |                                | 25.16667
#         VAR_LEX |                          "pt1" | 25.25
#        PROPERTY |                            "x" | 25.33333
#          OP_ADD |                                | 25.41667
#         VAR_LEX |                          "pt2" | 25.5
#        PROPERTY |                            "x" | 25.58333
#         PAREN_E |                                | 25.66667
#          OP_DIV |                                | 25.75
#          NUMBER |                            "2" | 25.83333
#        OP_COMMA |                                | 25.91667
#      PROP_VALUE |                            "y" | 26.08333
#         PAREN_S |                                | 26.16667
#         VAR_LEX |                          "pt1" | 26.25
#        PROPERTY |                            "y" | 26.33333
#          OP_ADD |                                | 26.41667
#         VAR_LEX |                          "pt2" | 26.5
#        PROPERTY |                            "y" | 26.58333
#         PAREN_E |                                | 26.66667
#          OP_DIV |                                | 26.75
#          NUMBER |                            "2" | 26.83333
#        OP_COMMA |                                | 26.91667
#         PAREN_E |                                | 27.33333
#         OP_SEMI |                                | 27.66667
#       CLOSURE_E |                                | 28.5
#     KEYWORD_END |                                | 30.5
#         VAR_LEX |                           "pt" | 32.1
#       OP_ASSIGN |                                | 32.2
#        BAREWORD |                        "Point" | 32.3
#      PAREN_CALL |                                | 32.4
#          NUMBER |                            "5" | 32.5
#        OP_COMMA |                                | 32.6
#          NUMBER |                            "3" | 32.7
#         PAREN_E |                                | 32.8
#         OP_SEMI |                                | 32.9
#        BAREWORD |                          "say" | 33.16667
#      PAREN_CALL |                                | 33.33333
#          STRING |  ["Point",["VAR_LEX","pt",33]] | 33.5
#         PAREN_E |                                | 33.66667
#         OP_SEMI |                                | 33.83333
#         VAR_LEX |                          "rpt" | 35.14286
#       OP_ASSIGN |                                | 35.28571
#         VAR_LEX |                           "pt" | 35.42857
#        PROPERTY |                   "oneToRight" | 35.57143
#         OP_CALL |                                | 35.71429
#         OP_SEMI |                                | 35.85714
#        BAREWORD |                          "say" | 36.16667
#      PAREN_CALL |                                | 36.33333
#          STRING | ["Right",["VAR_LEX","rpt",36]] | 36.5
#         PAREN_E |                                | 36.66667
#         OP_SEMI |                                | 36.83333
#         VAR_LEX |                         "mdpt" | 38.09091
#       OP_ASSIGN |                                | 38.18182
#        BAREWORD |                        "Point" | 38.27273
#        PROPERTY |                     "midpoint" | 38.36364
#      PAREN_CALL |                                | 38.45455
#         VAR_LEX |                           "pt" | 38.54545
#        OP_COMMA |                                | 38.63636
#         VAR_LEX |                          "rpt" | 38.72727
#         PAREN_E |                                | 38.81818
#         OP_SEMI |                                | 38.90909
#        BAREWORD |                          "say" | 39.16667
#      PAREN_CALL |                                | 39.33333
#          STRING | ["Midpoint",["VAR_LEX","mdpt",39]] | 39.5
#         PAREN_E |                                | 39.66667
#         OP_SEMI |                                | 39.83333
#         VAR_LEX |                     "nineteen" | 41.11111
#       OP_ASSIGN |                                | 41.22222
#          NUMBER |                            "4" | 41.33333
#          OP_ADD |                                | 41.44444
#          NUMBER |                           "45" | 41.55556
#          OP_DIV |                                | 41.66667
#          NUMBER |                            "3" | 41.77778
#         OP_SEMI |                                | 41.88889
#        BAREWORD |                          "say" | 42.16667
#      PAREN_CALL |                                | 42.33333
#          STRING | ["Nineteen: ",["VAR_LEX","nineteen",42]] | 42.5
#         PAREN_E |                                | 42.66667
#         OP_SEMI |                                | 42.83333
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
                FF::need( $scope, $arguments, 'x', 4.33333 ) or return;
                FF::need( $scope, $arguments, 'y', 4.66667 ) or return;
                $self->set_property( x => $scope->property_u('x'), 5.4 );
                $self->set_property( y => $scope->property_u('y'), 6.4 );
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
                        $scope, undef, 10.33333
                    ),
                    10.16667
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
                  ->call_u( {}, $scope, undef, 19.5 );
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
                FF::need( $scope, $arguments, 'pt1', 23.33333 ) or return;
                FF::need( $scope, $arguments, 'pt2', 23.66667 ) or return;
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
                    $scope, undef, 24.75
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
          ->call_u( [ num( $f, 5 ), num( $f, 3 ) ], $scope, undef, 32.4 ),
        32.2
    );
    $scope->property_u('say')
      ->call_u( [ add( $scope, str( $f, "Point" ), $scope->property_u('pt') ) ],
        $scope, undef, 33.33333 );
    $scope->set_property_ow(
        $context,
        rpt => $scope->property_u('pt')->property_u('oneToRight')
          ->call_u( {}, $scope, undef, 35.71429 ),
        35.28571
    );
    $scope->property_u('say')
      ->call_u(
        [ add( $scope, str( $f, "Right" ), $scope->property_u('rpt') ) ],
        $scope, undef, 36.33333 );
    $scope->set_property_ow(
        $context,
        mdpt => $scope->property_u('Point')->property_u('midpoint')->call_u(
            [ $scope->property_u('pt'), $scope->property_u('rpt') ], $scope,
            undef, 38.45455
        ),
        38.18182
    );
    $scope->property_u('say')
      ->call_u(
        [ add( $scope, str( $f, "Midpoint" ), $scope->property_u('mdpt') ) ],
        $scope, undef, 39.33333 );
    $scope->set_property_ow(
        $context,
        nineteen => add(
            $scope,
            num( $f, 4 ),
            div( $scope, num( $f, 45 ), num( $f, 3 ) )
        ),
        41.22222
    );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope, str( $f, "Nineteen: " ),
                $scope->property_u('nineteen')
            )
        ],
        $scope, undef, 42.33333
    );
};

FF::after_content();
