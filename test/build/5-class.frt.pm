# === Document Model ===
#  Document './test/5-class.frt'
#      Class 'Point' version 1.0
#          Class method 'initializer__'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$x'
#                  Instruction
#                      Need
#                          Lexical variable '$y'
#                  Instruction
#                      Assignment
#                          Instance variable '@x'
#                          Lexical variable '$x'
#                  Instruction
#                      Assignment
#                          Instance variable '@y'
#                          Lexical variable '$y'
#          Method 'oneToRight'
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$pt'
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
#              Function body
#                  Instruction
#                      Return
#                          Single value [1 item]
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
#              Function body
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@pretty'
#                              Argument list [0 items]
#          Class method 'midpoint'
#              Function body
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
#                                              Single value [1 item]
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
#                                              Single value [1 item]
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
#          Assignment
#              Lexical variable '$pt'
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
#              Argument list [1 item]
#                  Item 0
#                      Operation
#                          String 'Point'
#                          Addition operator (+)
#                          Lexical variable '$pt'
#      Instruction
#          Assignment
#              Lexical variable '$rpt'
#              Call
#                  Property 'oneToRight'
#                      Lexical variable '$pt'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 item]
#                  Item 0
#                      Operation
#                          String 'Right'
#                          Addition operator (+)
#                          Lexical variable '$rpt'
#      Instruction
#          Assignment
#              Lexical variable '$mdpt'
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
#              Argument list [1 item]
#                  Item 0
#                      Operation
#                          String 'Midpoint'
#                          Addition operator (+)
#                          Lexical variable '$mdpt'
#      Instruction
#          Assignment
#              Lexical variable '$nineteen'
#              Operation
#                  Number '4'
#                  Addition operator (+)
#                  Number '45'
#                  Division operator (/)
#                  Number '3'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 item]
#                  Item 0
#                      Operation
#                          String 'Nineteen: '
#                          Addition operator (+)
#                          Lexical variable '$nineteen'
#      Include (Point)
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

my ( $self, $ins );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $pos = before_content( '5-class.frt', './test/5-class.frt' );

use Ferret::Core::Operations qw(add div num str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'Point'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Point', 1.0, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def( $f, $scope, 'initializer__' );

        # Method event 'oneToRight' definition
        my $func_1 = method_event_def( $f, $scope, 'oneToRight' );

        # Method event 'pretty' definition
        my $func_2 = method_event_def( $f, $scope, 'pretty' );

        # Method event 'toString' definition
        my $func_3 = method_event_def( $f, $scope, 'toString' );

        # Method event 'midpoint' definition
        my $func_4 = method_event_def( $f, $scope, 'midpoint' );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            oneToRight => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_2->inside_scope(
            pretty => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            toString => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_4->inside_scope(
            midpoint => $scope,
            $class, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Point) );
    var(
        $scope,
        pt => $$scope->{'Point'}
          ->( [ num( $f, "5" ), num( $f, "3" ) ], $scope, undef, $pos->(32.2) ),
        undef, $pos->(32.1)
    );
    $$scope->{'say'}->(
        [ add( $scope, str( $f, "Point" ), $$scope->{'pt'} ) ],
        $scope, undef, $pos->(33.2)
    );
    var(
        $scope,
        rpt => $$scope->{'pt'}->property_u( 'oneToRight', $pos->(35.4) )
          ->( [ undef, [] ], $scope, undef, $pos->(35.5) ),
        undef, $pos->(35.2)
    );
    $$scope->{'say'}->(
        [ add( $scope, str( $f, "Right" ), $$scope->{'rpt'} ) ],
        $scope, undef, $pos->(36.2)
    );
    var(
        $scope,
        mdpt => $$scope->{'Point'}->property_u( 'midpoint', $pos->(38.2) )->(
            [ $$scope->{'pt'}, $$scope->{'rpt'} ], $scope,
            undef, $pos->(38.25)
        ),
        undef,
        $pos->(38.1)
    );
    $$scope->{'say'}->(
        [ add( $scope, str( $f, "Midpoint" ), $$scope->{'mdpt'} ) ],
        $scope, undef, $pos->(39.2)
    );
    var(
        $scope,
        nineteen => add(
            $scope,
            num( $f, "4" ),
            div( $scope, num( $f, "45" ), num( $f, "3" ) )
        ),
        undef,
        $pos->(41.2)
    );
    $$scope->{'say'}->(
        [ add( $scope, str( $f, "Nineteen: " ), $$scope->{'nineteen'} ) ],
        $scope, undef, $pos->(42.2)
    );
};

after_content();
