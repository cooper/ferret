# === Tokenization ===
#         VAR_LEX |                         "rect" | 1.05
#       OP_ASSIGN |                                | 1.1
#        BAREWORD |                         "Math" | 1.15
#         OP_PACK |                                | 1.2
#        BAREWORD |                         "Rect" | 1.25
#      PAREN_CALL |                                | 1.3
#      PROP_VALUE |                            "x" | 1.35
#          NUMBER |                            "5" | 1.4
#        OP_COMMA |                                | 1.45
#      PROP_VALUE |                            "y" | 1.5
#          NUMBER |                            "4" | 1.55
#        OP_COMMA |                                | 1.6
#      PROP_VALUE |                        "width" | 1.65
#          NUMBER |                           "12" | 1.7
#        OP_COMMA |                                | 1.75
#      PROP_VALUE |                       "height" | 1.8
#          NUMBER |                           "10" | 1.85
#         PAREN_E |                                | 1.9
#         OP_SEMI |                              1 | 1.95
#         VAR_LEX |                       "center" | 3.16667
#       OP_ASSIGN |                                | 3.33333
#         VAR_LEX |                         "rect" | 3.5
#        PROPERTY |                       "center" | 3.66667
#         OP_SEMI |                              1 | 3.83333
#        BAREWORD |                          "say" | 4.16667
#      PAREN_CALL |                                | 4.33333
#          STRING | ["Center of rect: ",["VAR_LEX","center",4]] | 4.5
#         PAREN_E |                                | 4.66667
#         OP_SEMI |                              1 | 4.83333
#        BAREWORD |                          "say" | 5.11111
#      PAREN_CALL |                                | 5.22222
#          STRING | ["Center distance from origin: "] | 5.33333
#          OP_ADD |                                | 5.44444
#         VAR_LEX |                       "center" | 5.55556
#        PROPERTY |           "distanceFromOrigin" | 5.66667
#         PAREN_E |                                | 5.77778
#         OP_SEMI |                              1 | 5.88889
#         VAR_LEX |                      "otherPt" | 7.08333
#       OP_ASSIGN |                                | 7.16667
#        BAREWORD |                         "Math" | 7.25
#         OP_PACK |                                | 7.33333
#        BAREWORD |                        "Point" | 7.41667
#      PAREN_CALL |                                | 7.5
#          NUMBER |                            "9" | 7.58333
#        OP_COMMA |                                | 7.66667
#          NUMBER |                            "2" | 7.75
#         PAREN_E |                                | 7.83333
#         OP_SEMI |                              1 | 7.91667
#         VAR_LEX |                     "midpoint" | 8.07143
#       OP_ASSIGN |                                | 8.14286
#         PAREN_S |                                | 8.21429
#         VAR_LEX |                       "center" | 8.28571
#        OP_COMMA |                                | 8.35714
#         VAR_LEX |                      "otherPt" | 8.42857
#         PAREN_E |                                | 8.5
#        PROPERTY |                     "midpoint" | 8.57143
#      PAREN_CALL |                                | 8.64286
#         PAREN_E |                                | 8.71429
#        PROPERTY |                       "pretty" | 8.78571
#         OP_CALL |                                | 8.85714
#         OP_SEMI |                              1 | 8.92857
#        BAREWORD |                          "say" | 9.16667
#      PAREN_CALL |                                | 9.33333
#          STRING | ["Midpoint: ",["VAR_LEX","midpoint",9]] | 9.5
#         PAREN_E |                                | 9.66667
#         OP_SEMI |                              1 | 9.83333
#        BAREWORD |                          "say" | 11.08333
#      PAREN_CALL |                                | 11.16667
#          STRING |      ["Square root of four: "] | 11.25
#          OP_ADD |                                | 11.33333
#        BAREWORD |                         "Math" | 11.41667
#        PROPERTY |                         "sqrt" | 11.5
#      PAREN_CALL |                                | 11.58333
#          NUMBER |                            "4" | 11.66667
#         PAREN_E |                                | 11.75
#         PAREN_E |                                | 11.83333
#         OP_SEMI |                              1 | 11.91667
# === Document Model ===
#  Document './test/hello7/hello7.frt'
#      Instruction
#          Assignment (lexical variable '$rect')
#              Call
#                  Bareword 'Math::Rect'
#                  Named argument list [4 items]
#                      Item 0
#                          Pair 'x'
#                              Number '5'
#                      Item 1
#                          Pair 'y'
#                              Number '4'
#                      Item 2
#                          Pair 'width'
#                              Number '12'
#                      Item 3
#                          Pair 'height'
#                              Number '10'
#      Instruction
#          Assignment (lexical variable '$center')
#              Property 'center'
#                  Lexical variable '$rect'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Center of ...'
#                          Addition operator (+)
#                          Lexical variable '$center'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Center dis...'
#                          Addition operator (+)
#                          Property 'distanceFromOrigin'
#                              Lexical variable '$center'
#      Instruction
#          Assignment (lexical variable '$otherPt')
#              Call
#                  Bareword 'Math::Point'
#                  Argument list [2 items]
#                      Item 0
#                          Number '9'
#                      Item 1
#                          Number '2'
#      Instruction
#          Assignment (lexical variable '$midpoint')
#              Call
#                  Property 'pretty'
#                      Call
#                          Property 'midpoint'
#                              Set [2 items]
#                                  Item 0
#                                      Lexical variable '$center'
#                                  Item 1
#                                      Lexical variable '$otherPt'
#                          Argument list [0 items]
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Midpoint: '
#                          Addition operator (+)
#                          Lexical variable '$midpoint'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Square roo...'
#                          Addition operator (+)
#                          Call
#                              Property 'sqrt'
#                                  Bareword 'Math'
#                              Argument list [1 items]
#                                  Item 0
#                                      Number '4'
#      Include (Math, Math::Point, Math::Rect)
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

FF::before_content('hello7.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    FF::load_namespaces( $context, qw(Math Math::Point Math::Rect) );
    $scope->set_property_ow(
        $context,
        rect => $scope->property_u('Math::Rect')->call_u(
            {
                x      => num( $f, 5 ),
                y      => num( $f, 4 ),
                width  => num( $f, 12 ),
                height => num( $f, 10 )
            },
            $scope, undef, 1.3
        ),
        1.1
    );
    $scope->set_property_ow(
        $context,
        center => $scope->property_u('rect')->property_u('center'),
        3.33333
    );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope, str( $f, "Center of rect: " ),
                $scope->property_u('center')
            )
        ],
        $scope, undef, 4.33333
    );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope,
                str( $f, "Center distance from origin: " ),
                $scope->property_u('center')->property_u('distanceFromOrigin')
            )
        ],
        $scope, undef, 5.22222
    );
    $scope->set_property_ow(
        $context,
        otherPt => $scope->property_u('Math::Point')
          ->call_u( [ num( $f, 9 ), num( $f, 2 ) ], $scope, undef, 7.5 ),
        7.16667
    );
    $scope->set_property_ow(
        $context,
        midpoint => FF::create_set(
            $scope, $scope->property_u('center'),
            $scope->property_u('otherPt')
          )->property_u('midpoint')->call_u( {}, $scope, undef, 8.64286 )
          ->property_u('pretty')->call_u( {}, $scope, undef, 8.85714 ),
        8.14286
    );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope, str( $f, "Midpoint: " ),
                $scope->property_u('midpoint')
            )
        ],
        $scope, undef, 9.33333
    );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope,
                str( $f, "Square root of four: " ),
                $scope->property_u('Math')->property_u('sqrt')
                  ->call_u( [ num( $f, 4 ) ], $scope, undef, 11.58333 )
            )
        ],
        $scope, undef, 11.16667
    );
};

FF::after_content();
