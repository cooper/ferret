# === Document Model ===
#  File './test/7-math.frt'
#      Package 'main'
#          Instruction
#              Assignment
#                  Lexical variable '$rect'
#                  Call
#                      Bareword 'Math::Rect'
#                      Named argument list [4 items]
#                          Item 0
#                              Pair 'x'
#                                  Number '5'
#                          Item 1
#                              Pair 'y'
#                                  Number '4'
#                          Item 2
#                              Pair 'width'
#                                  Number '12'
#                          Item 3
#                              Pair 'height'
#                                  Number '10'
#          Instruction
#              Assignment
#                  Lexical variable '$center'
#                  Property 'center'
#                      Lexical variable '$rect'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Argument list [1 item]
#                      Item 0
#                          Operation
#                              String 'Center of ...'
#                              Addition operator (+)
#                              Lexical variable '$center'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Argument list [1 item]
#                      Item 0
#                          Operation
#                              String 'Center dis...'
#                              Addition operator (+)
#                              Property 'distanceFromOrigin'
#                                  Lexical variable '$center'
#          Instruction
#              Assignment
#                  Lexical variable '$otherPt'
#                  Call
#                      Bareword 'Math::Point'
#                      Argument list [2 items]
#                          Item 0
#                              Number '9'
#                          Item 1
#                              Number '2'
#          Instruction
#              Assignment
#                  Lexical variable '$midpoint'
#                  Call
#                      Property 'pretty'
#                          Call
#                              Property 'midpoint'
#                                  Set [2 items]
#                                      Item 0
#                                          Lexical variable '$center'
#                                      Item 1
#                                          Lexical variable '$otherPt'
#                              Argument list [0 items]
#          Instruction
#              Call
#                  Bareword 'say'
#                  Argument list [1 item]
#                      Item 0
#                          Operation
#                              String 'Midpoint: '
#                              Addition operator (+)
#                              Lexical variable '$midpoint'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Argument list [1 item]
#                      Item 0
#                          Operation
#                              String 'Square roo...'
#                              Addition operator (+)
#                              Call
#                                  Property 'sqrt'
#                                      Bareword 'Math'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Number '4'
#          Include (Math, Math::Point, Math::Rect)
package FF;

use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    my $config = $ENV{FERRET_CONFIG} || '/etc/ferret.conf';
    do $config or die "config error: " . ( $@ || $! );
}

use Ferret;
use Ferret::Core::Operations qw(add num str);

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) = before_content( '7-math.frt', './test/7-math.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    provides_namespaces( $context, $file_name, qw() );
    load_namespaces( $context, $file_name, qw(Math Math::Point Math::Rect) );
    var(
        $scope,
        rect => $$scope->{'Math::Rect'}->(
            [
                undef,
                [
                    x      => num( $f, "5" ),
                    y      => num( $f, "4" ),
                    width  => num( $f, "12" ),
                    height => num( $f, "10" )
                ]
            ],
            $scope, undef,
            $pos->(1.2)
        ),
        undef,
        $pos->(1.06667)
    );
    var(
        $scope,
        center => $$scope->{'rect'}->property_u( 'center', $pos->(3.4) ),
        undef, $pos->(3.2)
    );
    $$scope->{'say'}->(
        [
            add(
                $scope, $pos->(4.4),
                str( $f, "Center of rect: " ), $$scope->{'center'}
            )
        ],
        $scope, undef,
        $pos->(4.2)
    );
    $$scope->{'say'}->(
        [
            add(
                $scope,
                $pos->(5.4),
                str( $f, "Center distance from origin: " ),
                $$scope->{'center'}
                  ->property_u( 'distanceFromOrigin', $pos->(5.6) )
            )
        ],
        $scope, undef,
        $pos->(5.2)
    );
    var(
        $scope,
        otherPt => $$scope->{'Math::Point'}
          ->( [ num( $f, "9" ), num( $f, "2" ) ], $scope, undef, $pos->(7.3) ),
        undef, $pos->(7.1)
    );
    var(
        $scope,
        midpoint =>
          create_set( $scope, $$scope->{'center'}, $$scope->{'otherPt'} )
          ->property_u( 'midpoint', $pos->(8.4) )
          ->( [ undef, [] ], $scope, undef, $pos->(8.45) )
          ->property_u( 'pretty', $pos->(8.55) )
          ->( [ undef, [] ], $scope, undef, $pos->(8.6) ),
        undef, $pos->(8.1)
    );
    $$scope->{'say'}->(
        [
            add(
                $scope, $pos->(9.4),
                str( $f, "Midpoint: " ), $$scope->{'midpoint'}
            )
        ],
        $scope, undef,
        $pos->(9.2)
    );
    $$scope->{'say'}->(
        [
            add(
                $scope,
                $pos->(11.2),
                str( $f, "Square root of four: " ),
                $$scope->{'Math'}->property_u( 'sqrt', $pos->(11.3) )
                  ->( [ num( $f, "4" ) ], $scope, undef, $pos->(11.35) )
            )
        ],
        $scope, undef,
        $pos->(11.1)
    );
};

after_content($file_name);
