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
            $scope, undef, 1.31579
        ),
        1.10526
    );
    $scope->set_property_ow(
        $context,
        center => $scope->property_u('rect')->property_u('center'),
        3.4
    );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope, str( $f, "Center of rect: " ),
                $scope->property_u('center')
            )
        ],
        $scope, undef, 4.4
    );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope,
                str( $f, "Center distance from origin: " ),
                $scope->property_u('center')->property_u('distanceFromOrigin')
            )
        ],
        $scope, undef, 5.25
    );
    $scope->set_property_ow(
        $context,
        otherPt => $scope->property_u('Math::Point')
          ->call_u( [ num( $f, 9 ), num( $f, 2 ) ], $scope, undef, 7.54545 ),
        7.18182
    );
    $scope->set_property_ow(
        $context,
        midpoint => FF::create_set(
            $scope, $scope->property_u('center'),
            $scope->property_u('otherPt')
          )->property_u('midpoint')->call_u( {}, $scope, undef, 8.69231 )
          ->property_u('pretty')->call_u( {}, $scope, undef, 8.92308 ),
        8.15385
    );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope, str( $f, "Midpoint: " ),
                $scope->property_u('midpoint')
            )
        ],
        $scope, undef, 9.4
    );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope,
                str( $f, "Square root of four: " ),
                $scope->property_u('Math')->property_u('sqrt')
                  ->call_u( [ num( $f, 4 ) ], $scope, undef, 11.63636 )
            )
        ],
        $scope, undef, 11.18182
    );
};

FF::after_content();
