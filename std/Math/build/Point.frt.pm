# === Document Model ===
#  File './std/Math/Point.frt'
#      Package 'Math'
#          Class 'Point'
#              Instruction
#                  Shared variable declaration
#                      Lazy assignment
#                          Lexical variable '$origin'
#                          Call
#                              Bareword 'Point'
#                              Argument list [2 items]
#                                  Item 0
#                                      Number '0'
#                                  Item 1
#                                      Number '0'
#              Class method 'initializer__' { $x:Num $y:Num }
#                  Function body
#                      Instruction
#                          Need
#                              Instance variable '@x'
#                              Argument type
#                                  Bareword 'Num'
#                      Instruction
#                          Need
#                              Instance variable '@y'
#                              Argument type
#                                  Bareword 'Num'
#              Method 'distanceTo' { $pt2:Point -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$pt2'
#                              Argument type
#                                  Bareword 'Point'
#                      Instruction
#                          Assignment
#                              Lexical variable '$dx'
#                              Operation
#                                  Instance variable '@x'
#                                  Subtraction operator (-)
#                                  Property 'x'
#                                      Lexical variable '$pt2'
#                      Instruction
#                          Assignment
#                              Lexical variable '$dy'
#                              Operation
#                                  Instance variable '@y'
#                                  Subtraction operator (-)
#                                  Property 'y'
#                                      Lexical variable '$pt2'
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'sqrt'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Operation
#                                              Lexical variable '$dx'
#                                              Exponent operator (^)
#                                              Number '2'
#                                              Addition operator (+)
#                                              Lexical variable '$dy'
#                                              Exponent operator (^)
#                                              Number '2'
#              Method 'midpoint' { $pt2:Point -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$pt2'
#                              Argument type
#                                  Bareword 'Point'
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'Point'
#                                  Named argument list [2 items]
#                                      Item 0
#                                          Pair 'x'
#                                              Operation
#                                                  Single value [1 item]
#                                                      Item 0
#                                                          Operation
#                                                              Instance variable '@x'
#                                                              Addition operator (+)
#                                                              Property 'x'
#                                                                  Lexical variable '$pt2'
#                                                  Division operator (/)
#                                                  Number '2'
#                                      Item 1
#                                          Pair 'y'
#                                              Operation
#                                                  Single value [1 item]
#                                                      Item 0
#                                                          Operation
#                                                              Instance variable '@y'
#                                                              Addition operator (+)
#                                                              Property 'y'
#                                                                  Lexical variable '$pt2'
#                                                  Division operator (/)
#                                                  Number '2'
#              Computed property 'distanceFromOrigin' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Call
#                                  Instance variable '@distanceTo'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$origin'
#              Method 'description' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Operation
#                                  String '('
#                                  Addition operator (+)
#                                  Instance variable '@x'
#                                  Addition operator (+)
#                                  String ', '
#                                  Addition operator (+)
#                                  Instance variable '@y'
#                                  Addition operator (+)
#                                  String ')'
#          Include (Num, Point)
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
use Ferret::Core::Operations qw(_sub add div num pow str);

my ( $self, $ins );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $file_name = './std/Math/Point.frt';
my $pos = before_content( 'Point.frt', $file_name );
my $result;

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'Math' );
    my $scope = $file_scope;
    load_core('Math');

    # Class 'Point'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Point', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'x',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'y',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $self, $args, 'x' ) || return $ret_func->();
                need( $self, $args, 'y' ) || return $ret_func->();
                return $ret;
            }
        );

        # Method event 'distanceTo' definition
        my $func_1 = method_event_def(
            $f, $scope,
            'distanceTo',
            [
                {
                    name     => 'pt2',
                    type     => 'Point',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'pt2', 16.2 ) || return $ret_func->();
                var(
                    $scope,
                    dx => _sub(
                        $scope, $pos->(17.4), $$self->{'x'},
                        $$scope->{'pt2'}->property_u( 'x', $pos->(17.6) )
                    ),
                    $file_scope,
                    $pos->(17.2)
                );
                var(
                    $scope,
                    dy => _sub(
                        $scope, $pos->(18.4), $$self->{'y'},
                        $$scope->{'pt2'}->property_u( 'y', $pos->(18.6) )
                    ),
                    $file_scope,
                    $pos->(18.2)
                );
                return $ret_func->(
                    $$scope->{'sqrt'}->(
                        [
                            add(
                                $scope,
                                $pos->(19.25),
                                pow(
                                    $scope, $pos->(19.25),
                                    $$scope->{'dx'}, num( $f, "2" )
                                ),
                                pow(
                                    $scope, $pos->(19.25),
                                    $$scope->{'dy'}, num( $f, "2" )
                                )
                            )
                        ],
                        $scope, undef,
                        $pos->(19.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'midpoint' definition
        my $func_2 = method_event_def(
            $f, $scope,
            'midpoint',
            [
                {
                    name     => 'pt2',
                    type     => 'Point',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'pt2', 24.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Point'}->(
                        [
                            undef,
                            [
                                x => div(
                                    $scope,
                                    $pos->(26.4),
                                    add(
                                        $scope,
                                        $pos->(26.2),
                                        $$self->{'x'},
                                        $$scope->{'pt2'}
                                          ->property_u( 'x', $pos->(26.3) )
                                    ),
                                    num( $f, "2" )
                                ),
                                y => div(
                                    $scope,
                                    $pos->(27.4),
                                    add(
                                        $scope,
                                        $pos->(27.2),
                                        $$self->{'y'},
                                        $$scope->{'pt2'}
                                          ->property_u( 'y', $pos->(27.3) )
                                    ),
                                    num( $f, "2" )
                                )
                            ]
                        ],
                        $scope, undef,
                        $pos->(25.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'distanceFromOrigin' definition
        my $func_3 = method_event_def(
            $f, $scope,
            'distanceFromOrigin',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$self->{'distanceTo'}->(
                        [ $$scope->{'origin'} ], $scope, undef, $pos->(33.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $func_4 = method_event_def(
            $f, $scope,
            'description',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    add(
                        $scope, $pos->(37.15),
                        str( $f, "(" ),  $$self->{'x'},
                        str( $f, ", " ), $$self->{'y'},
                        str( $f, ")" )
                    )
                );
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            distanceTo => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_2->inside_scope(
            midpoint => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            distanceFromOrigin => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_4->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
        var(
            $class,
            origin => [
                sub {
                    $$scope->{'Point'}->(
                        [ num( $f, "0" ), num( $f, "0" ) ],
                        $scope, undef, $pos->(6.25)
                    );
                }
            ],
            undef,
            $pos->(6.15)
        );
    }
    load_namespaces( $context, $file_name, qw(Num Point) );
};

after_content($file_name);
