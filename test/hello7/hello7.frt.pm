# === Document Model ===
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
#                          Lexical variable '$center'
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
#      Include (Math, Math::Point, Math::Rect)
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

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello7.frt.pm'}++;

use Ferret::Core::Operations qw(add num str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    Ferret::space( $context, $_ ) for qw(Math Math::Point Math::Rect);
    $scope->set_property_ow(
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
    $scope->set_property_ow( center =>
          $scope->property('rect')->property('center')->call( {}, $scope ) );
    $scope->property('say')->call(
        [
            add(
                $scope, str( $f, "Center of rect: " ),
                $scope->property('center')
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
                  ->call( {}, $scope )
            )
        ],
        $scope
    );
    $scope->set_property_ow( otherPt => $scope->property('Math::Point')
          ->call( [ num( $f, 9 ), num( $f, 2 ) ], $scope ) );
    $scope->set_property_ow( midpoint => $scope->property('center')
          ->create_set( $scope, $scope->property('otherPt') )
          ->property('midpoint')->call( {}, $scope )->property('pretty')
          ->call( {}, $scope ) );
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

Ferret::runtime();
