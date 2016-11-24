# === Document Model ===
#  Document './std/Math/Line.frt'
#      Package 'Math'
#      Class 'Line'
#          Class method 'initializer__'
#              Function body
#                  Instruction
#                      Need
#                          Instance variable '@pt1'
#                          Argument type
#                              Bareword 'Point'
#                  Instruction
#                      Need
#                          Instance variable '@pt2'
#                          Argument type
#                              Bareword 'Point'
#          Computed property 'endpoints'
#              Function body
#                  Instruction
#                      Return
#                          Value list [2 items]
#                              Item 0
#                                  Instance variable '@pt1'
#                              Item 1
#                                  Instance variable '@pt2'
#          Computed property 'pretty'
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$mp'
#                          Instance variable '@midpoint'
#                  Instruction
#                      Assignment
#                          Lexical variable '$pox'
#                          Property 'x'
#                              Instance variable '@pt1'
#                  Instruction
#                      Assignment
#                          Lexical variable '$poy'
#                          Property 'y'
#                              Instance variable '@pt1'
#                  Instruction
#                      Assignment
#                          Lexical variable '$ptx'
#                          Property 'x'
#                              Instance variable '@pt2'
#                  Instruction
#                      Assignment
#                          Lexical variable '$pty'
#                          Property 'y'
#                              Instance variable '@pt2'
#                  Instruction
#                      Assignment
#                          Lexical variable '$mx'
#                          Property 'x'
#                              Lexical variable '$mp'
#                  Instruction
#                      Assignment
#                          Lexical variable '$my'
#                          Property 'y'
#                              Lexical variable '$mp'
#                  Instruction
#                      Return
#                          Operation
#                              String 'Segment( |('
#                              Addition operator (+)
#                              Lexical variable '$pox'
#                              Addition operator (+)
#                              String ', '
#                              Addition operator (+)
#                              Lexical variable '$poy'
#                              Addition operator (+)
#                              String ')---('
#                              Addition operator (+)
#                              Lexical variable '$mx'
#                              Addition operator (+)
#                              String ', '
#                              Addition operator (+)
#                              Lexical variable '$my'
#                              Addition operator (+)
#                              String ')---('
#                              Addition operator (+)
#                              Lexical variable '$ptx'
#                              Addition operator (+)
#                              String ', '
#                              Addition operator (+)
#                              Lexical variable '$pty'
#                              Addition operator (+)
#                              String ')| Length = '
#                              Addition operator (+)
#                              Instance variable '@length'
#                              Addition operator (+)
#                              String ' )'
#          Method 'description'
#              Function body
#                  Instruction
#                      Return
#                          Instance variable '@pretty'
#          Computed property 'midpoint'
#              Function body
#                  Instruction
#                      Return
#                          Call
#                              Property 'midpoint'
#                                  Set [2 items]
#                                      Item 0
#                                          Instance variable '@pt1'
#                                      Item 1
#                                          Instance variable '@pt2'
#                              Argument list [0 items]
#          Computed property 'length'
#              Function body
#                  Instruction
#                      Return
#                          Call
#                              Property 'distanceTo'
#                                  Instance variable '@pt1'
#                              Argument list [1 item]
#                                  Item 0
#                                      Instance variable '@pt2'
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

my $pos = before_content( 'Line.frt', './std/Math/Line.frt' );

use Ferret::Core::Operations qw(add str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'Math' );
    my $scope = $file_scope;
    load_core('Math');

    # Class 'Line'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Line', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def( $f, $scope, 'initializer__' );

        # Method event 'endpoints' definition
        my $func_1 = method_event_def( $f, $scope, 'endpoints' );

        # Method event 'pretty' definition
        my $func_2 = method_event_def( $f, $scope, 'pretty' );

        # Method event 'description' definition
        my $func_3 = method_event_def( $f, $scope, 'description' );

        # Method event 'midpoint' definition
        my $func_4 = method_event_def( $f, $scope, 'midpoint' );

        # Method event 'length' definition
        my $func_5 = method_event_def( $f, $scope, 'length' );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            endpoints => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_2->inside_scope(
            pretty => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_3->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_4->inside_scope(
            midpoint => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_5->inside_scope(
            length => $scope,
            $proto, $class, $ins, 1, undef
        );
    }
    load_namespaces( $context, qw(Point) );
};

after_content();
