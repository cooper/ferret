# === Tokenization ===
#         VAR_LEX |                         "rect" | 1.03333
#       OP_ASSIGN |                                | 1.06667
#        BAREWORD |                         "Math" | 1.1
#         OP_PACK |                                | 1.13333
#        BAREWORD |                         "Rect" | 1.16667
#      PAREN_CALL |                                | 1.2
#      PROP_VALUE |                            "x" | 1.23333
#          NUMBER |                            "5" | 1.26667
#        OP_COMMA |                                | 1.3
#      PROP_VALUE |                            "y" | 1.33333
#          NUMBER |                            "4" | 1.36667
#        OP_COMMA |                                | 1.4
#      PROP_VALUE |                        "width" | 1.43333
#          NUMBER |                           "12" | 1.46667
#        OP_COMMA |                                | 1.5
#      PROP_VALUE |                       "height" | 1.53333
#          NUMBER |                           "10" | 1.56667
#         PAREN_E |                                | 1.6
#         OP_SEMI |                              1 | 1.63333
#         VAR_LEX |                       "center" | 3.1
#       OP_ASSIGN |                                | 3.2
#         VAR_LEX |                         "rect" | 3.3
#        PROPERTY |                       "center" | 3.4
#         OP_SEMI |                              1 | 3.5
#        BAREWORD |                          "say" | 4.1
#      PAREN_CALL |                                | 4.2
#          STRING | ["Center of rect: ",["VAR_LEX","center",4]] | 4.3
#         PAREN_E |                                | 4.4
#         OP_SEMI |                              1 | 4.5
#        BAREWORD |                          "say" | 5.1
#      PAREN_CALL |                                | 5.2
#          STRING | ["Center distance from origin: "] | 5.3
#          OP_ADD |                                | 5.4
#         VAR_LEX |                       "center" | 5.5
#        PROPERTY |           "distanceFromOrigin" | 5.6
#         PAREN_E |                                | 5.7
#         OP_SEMI |                              1 | 5.8
#         VAR_LEX |                      "otherPt" | 7.05
#       OP_ASSIGN |                                | 7.1
#        BAREWORD |                         "Math" | 7.15
#         OP_PACK |                                | 7.2
#        BAREWORD |                        "Point" | 7.25
#      PAREN_CALL |                                | 7.3
#          NUMBER |                            "9" | 7.35
#        OP_COMMA |                                | 7.4
#          NUMBER |                            "2" | 7.45
#         PAREN_E |                                | 7.5
#         OP_SEMI |                              1 | 7.55
#         VAR_LEX |                     "midpoint" | 8.05
#       OP_ASSIGN |                                | 8.1
#         PAREN_S |                                | 8.15
#         VAR_LEX |                       "center" | 8.2
#        OP_COMMA |                                | 8.25
#         VAR_LEX |                      "otherPt" | 8.3
#         PAREN_E |                                | 8.35
#        PROPERTY |                     "midpoint" | 8.4
#      PAREN_CALL |                                | 8.45
#         PAREN_E |                                | 8.5
#        PROPERTY |                       "pretty" | 8.55
#         OP_CALL |                                | 8.6
#         OP_SEMI |                              1 | 8.65
#        BAREWORD |                          "say" | 9.1
#      PAREN_CALL |                                | 9.2
#          STRING | ["Midpoint: ",["VAR_LEX","midpoint",9]] | 9.3
#         PAREN_E |                                | 9.4
#         OP_SEMI |                              1 | 9.5
#        BAREWORD |                          "say" | 11.05
#      PAREN_CALL |                                | 11.1
#          STRING |      ["Square root of four: "] | 11.15
#          OP_ADD |                                | 11.2
#        BAREWORD |                         "Math" | 11.25
#        PROPERTY |                         "sqrt" | 11.3
#      PAREN_CALL |                                | 11.35
#          NUMBER |                            "4" | 11.4
#         PAREN_E |                                | 11.45
#         PAREN_E |                                | 11.5
#         OP_SEMI |                              1 | 11.55
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
            $scope, undef, 1.2
        ),
        1.06667
    );
    $scope->set_property_ow(
        $context,
        center => $scope->property_u('rect')->property_u('center'),
        3.2
    );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope, str( $f, "Center of rect: " ),
                $scope->property_u('center')
            )
        ],
        $scope, undef, 4.2
    );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope,
                str( $f, "Center distance from origin: " ),
                $scope->property_u('center')->property_u('distanceFromOrigin')
            )
        ],
        $scope, undef, 5.2
    );
    $scope->set_property_ow(
        $context,
        otherPt => $scope->property_u('Math::Point')
          ->call_u( [ num( $f, 9 ), num( $f, 2 ) ], $scope, undef, 7.3 ),
        7.1
    );
    $scope->set_property_ow(
        $context,
        midpoint => FF::create_set(
            $scope, $scope->property_u('center'),
            $scope->property_u('otherPt')
          )->property_u('midpoint')->call_u( {}, $scope, undef, 8.45 )
          ->property_u('pretty')->call_u( {}, $scope, undef, 8.6 ),
        8.1
    );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope, str( $f, "Midpoint: " ),
                $scope->property_u('midpoint')
            )
        ],
        $scope, undef, 9.2
    );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope,
                str( $f, "Square root of four: " ),
                $scope->property_u('Math')->property_u('sqrt')
                  ->call_u( [ num( $f, 4 ) ], $scope, undef, 11.35 )
            )
        ],
        $scope, undef, 11.1
    );
};

FF::after_content();
