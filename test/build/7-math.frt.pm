# === Document Model ===
#  Document './test/7-math.frt'
#      Instruction
#          Assignment
#              Lexical variable '$rect'
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
#          Assignment
#              Lexical variable '$center'
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
#          Assignment
#              Lexical variable '$otherPt'
#              Call
#                  Bareword 'Math::Point'
#                  Argument list [2 items]
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
    my $config = $ENV{FERRET_CONFIG} || '/etc/ferret.conf';
    do $config or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('7-math.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    FF::load_namespaces( $context, qw(Math Math::Point Math::Rect) );
    FF::lex_assign(
        $scope,
        rect => $$scope->{'Math::Rect'}->(
            {
                x      => num( $f, "5" ),
                y      => num( $f, "4" ),
                width  => num( $f, "12" ),
                height => num( $f, "10" )
            },
            $scope, undef, 1.2
        ),
        undef,
        1.06667
    );
    FF::lex_assign(
        $scope,
        center => ${ $$scope->{'rect'} }->{'center'},
        undef, 3.2
    );
    $$scope->{'say'}->(
        [ add( $scope, str( $f, "Center of rect: " ), $$scope->{'center'} ) ],
        $scope, undef, 4.2
    );
    $$scope->{'say'}->(
        [
            add(
                $scope,
                str( $f, "Center distance from origin: " ),
                ${ $$scope->{'center'} }->{'distanceFromOrigin'}
            )
        ],
        $scope, undef, 5.2
    );
    FF::lex_assign(
        $scope,
        otherPt => $$scope->{'Math::Point'}
          ->( [ num( $f, "9" ), num( $f, "2" ) ], $scope, undef, 7.3 ),
        undef, 7.1
    );
    FF::lex_assign(
        $scope,
        midpoint => ${
            ${
                FF::create_set( $scope, $$scope->{'center'},
                    $$scope->{'otherPt'} )
            }->{'midpoint'}->( {}, $scope, undef, 8.45 )
          }->{'pretty'}->( {}, $scope, undef, 8.6 ),
        undef,
        8.1
    );
    $$scope->{'say'}->(
        [ add( $scope, str( $f, "Midpoint: " ), $$scope->{'midpoint'} ) ],
        $scope, undef, 9.2
    );
    $$scope->{'say'}->(
        [
            add(
                $scope,
                str( $f, "Square root of four: " ),
                ${ $$scope->{'Math'} }->{'sqrt'}
                  ->( [ num( $f, "4" ) ], $scope, undef, 11.35 )
            )
        ],
        $scope, undef, 11.1
    );
};

FF::after_content();
