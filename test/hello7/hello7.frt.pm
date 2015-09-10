# --- Tokens ---
#         VAR_LEX | "rect"
#       OP_ASSIGN | 
#        BAREWORD | "Math"
#         OP_PACK | 
#        BAREWORD | "Rect"
#      PAREN_CALL | 
#      PROP_VALUE | "x"
#          NUMBER | "5"
#        OP_COMMA | 
#      PROP_VALUE | "y"
#          NUMBER | "4"
#        OP_COMMA | 
#      PROP_VALUE | "width"
#          NUMBER | "12"
#        OP_COMMA | 
#      PROP_VALUE | "height"
#          NUMBER | "10"
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "center"
#       OP_ASSIGN | 
#         VAR_LEX | "rect"
#        PROPERTY | "center"
#         OP_CALL | 
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Center of rect: "]
#          OP_ADD | 
#         VAR_LEX | "center"
#        PROPERTY | "pretty"
#         OP_CALL | 
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Center distance from origin: "]
#          OP_ADD | 
#         VAR_LEX | "center"
#        PROPERTY | "distanceFromOrigin"
#         OP_CALL | 
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "otherPt"
#       OP_ASSIGN | 
#        BAREWORD | "Math"
#         OP_PACK | 
#        BAREWORD | "Point"
#      PAREN_CALL | 
#          NUMBER | "9"
#        OP_COMMA | 
#          NUMBER | "2"
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "midpoint"
#       OP_ASSIGN | 
#         PAREN_S | 
#         VAR_LEX | "center"
#        OP_COMMA | 
#         VAR_LEX | "otherPt"
#         PAREN_E | 
#        PROPERTY | "midpoint"
#         OP_CALL | 
#        PROPERTY | "pretty"
#         OP_CALL | 
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Midpoint: ",["VAR_LEX","midpoint",196]]
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Square root of four: "]
#          OP_ADD | 
#        BAREWORD | "Math"
#         OP_PACK | 
#        BAREWORD | "sqrt"
#      PAREN_CALL | 
#          NUMBER | "4"
#         PAREN_E | 
#         PAREN_E | 
#         OP_SEMI | 
# --- DOM ---
#  Document './test/hello7/hello7.frt'
#      Instruction
#          Assignment
#              Lexical variable '$rect'
#              Call
#                  Bareword 'Math::Rect'
#                  Hash [4 items]
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
#          Assignment
#              Lexical variable '$center'
#              Call
#                  Property 'center'
#                      Lexical variable '$rect'
#      Instruction
#          Call
#              Bareword 'say'
#              Structural list [1 items]
#                  Item 0
#                      Mathematical operation
#                          String 'Center of ...'
#                          Addition operator (+)
#                          Call
#                              Property 'pretty'
#                                  Lexical variable '$center'
#      Instruction
#          Call
#              Bareword 'say'
#              Structural list [1 items]
#                  Item 0
#                      Mathematical operation
#                          String 'Center dis...'
#                          Addition operator (+)
#                          Call
#                              Property 'distanceFromOrigin'
#                                  Lexical variable '$center'
#      Instruction
#          Assignment
#              Lexical variable '$otherPt'
#              Call
#                  Bareword 'Math::Point'
#                  Structural list [2 items]
#                      Item 0
#                          Number '9'
#                      Item 1
#                          Number '2'
#      Instruction
#          Assignment
#              Lexical variable '$midpoint'
#              Call
#                  Property 'pretty'
#                      Call
#                          Property 'midpoint'
#                              Structural list [2 items]
#                                  Item 0
#                                      Lexical variable '$center'
#                                  Item 1
#                                      Lexical variable '$otherPt'
#      Instruction
#          Call
#              Bareword 'say'
#              Structural list [1 items]
#                  Item 0
#                      Mathematical operation
#                          String 'Midpoint: '
#                          Addition operator (+)
#                          Lexical variable '$midpoint'
#      Instruction
#          Call
#              Bareword 'say'
#              Structural list [1 items]
#                  Item 0
#                      Mathematical operation
#                          String 'Square roo...'
#                          Addition operator (+)
#                          Call
#                              Bareword 'Math::sqrt'
#                              Structural list [1 items]
#                                  Item 0
#                                      Number '4'
#      Include (Math::Point, Math::Rect, Math)
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    my $libs = do '/etc/ferret.conf';
    ref $libs eq 'ARRAY' or die "config error";
    unshift @INC, @$libs;
}

use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello7.frt.pm'}++;

use Ferret::Core::Operations qw(add num str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    Ferret::space( $context, $_ ) for qw(Math::Point Math::Rect Math);
    $scope->set_property(
        rect => $scope->property('Math::Rect')->call(
            {
                x      => num( $f, 5 ),
                y      => num( $f, 4 ),
                width  => num( $f, 12 ),
                height => num( $f, 10 )
            },
            $scope
        )
    );
    $scope->set_property( center =>
          $scope->property('rect')->property('center')->call( [], $scope ) );
    $scope->property('say')->call(
        [
            add(
                $scope,
                str( $f, "Center of rect: " ),
                $scope->property('center')->property('pretty')
                  ->call( [], $scope )
            )
        ],
        $scope
    );
    $scope->property('say')->call(
        [
            add(
                $scope,
                str( $f, "Center distance from origin: " ),
                $scope->property('center')->property('distanceFromOrigin')
                  ->call( [], $scope )
            )
        ],
        $scope
    );
    $scope->set_property( otherPt => $scope->property('Math::Point')
          ->call( [ num( $f, 9 ), num( $f, 2 ) ], $scope ) );
    $scope->set_property( midpoint => $scope->property('center')
          ->create_set( $scope, $scope->property('otherPt') )
          ->property('midpoint')->call( [], $scope )->property('pretty')
          ->call( [], $scope ) );
    $scope->property('say')->call(
        [
            add(
                $scope, str( $f, "Midpoint: " ), $scope->property('midpoint')
            )
        ],
        $scope
    );
    $scope->property('say')->call(
        [
            add(
                $scope,
                str( $f, "Square root of four: " ),
                $scope->property('Math::sqrt')->call( [ num( $f, 4 ) ], $scope )
            )
        ],
        $scope
    );
}
