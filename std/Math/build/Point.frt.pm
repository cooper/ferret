# === Document Model ===
#  Document './std/Math/Point.frt'
#      Package 'Math'
#      Class 'Point'
#          Class method 'initializer__'
#              Function body
#                  Instruction
#                      Need
#                          Instance variable '@x'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Need
#                          Instance variable '@y'
#                          Argument type
#                              Bareword 'Num'
#          Method 'distanceTo'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$pt2'
#                          Argument type
#                              Bareword 'Point'
#                  Instruction
#                      Assignment
#                          Lexical variable '$dx'
#                          Operation
#                              Instance variable '@x'
#                              Subtraction operator (-)
#                              Property 'x'
#                                  Lexical variable '$pt2'
#                  Instruction
#                      Assignment
#                          Lexical variable '$dy'
#                          Operation
#                              Instance variable '@y'
#                              Subtraction operator (-)
#                              Property 'y'
#                                  Lexical variable '$pt2'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'sqrt'
#                              Argument list [1 item]
#                                  Item 0
#                                      Operation
#                                          Lexical variable '$dx'
#                                          Exponent operator (^)
#                                          Number '2'
#                                          Addition operator (+)
#                                          Lexical variable '$dy'
#                                          Exponent operator (^)
#                                          Number '2'
#          Computed property 'distanceFromOrigin'
#              Function body
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@distanceTo'
#                              Argument list [1 item]
#                                  Item 0
#                                      Call
#                                          Special variable '*class'
#                                          Argument list [2 items]
#                                              Item 0
#                                                  Number '0'
#                                              Item 1
#                                                  Number '0'
#          Computed property 'pretty'
#              Function body
#                  Instruction
#                      Return
#                          Operation
#                              String '('
#                              Addition operator (+)
#                              Instance variable '@x'
#                              Addition operator (+)
#                              String ', '
#                              Addition operator (+)
#                              Instance variable '@y'
#                              Addition operator (+)
#                              String ')'
#          Method 'toString'
#              Function body
#                  Instruction
#                      Return
#                          Instance variable '@pretty'
#          Method 'description'
#              Function body
#                  Instruction
#                      Return
#                          Operation
#                              String 'Point'
#                              Addition operator (+)
#                              Instance variable '@pretty'
#          Class method 'midpoint'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$pt1'
#                          Argument type
#                              Bareword 'Point'
#                  Instruction
#                      Need
#                          Lexical variable '$pt2'
#                          Argument type
#                              Bareword 'Point'
#                  Instruction
#                      Return
#                          Call
#                              Special variable '*class'
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
#          Class method 'distanceBetween'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$pt1'
#                          Argument type
#                              Bareword 'Point'
#                  Instruction
#                      Need
#                          Lexical variable '$pt2'
#                          Argument type
#                              Bareword 'Point'
#                  Instruction
#                      Return
#                          Call
#                              Property 'distanceTo'
#                                  Lexical variable '$pt1'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$pt2'
#      Include (Num, Point)
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

my $pos = before_content( 'Point.frt', './std/Math/Point.frt' );

use Ferret::Core::Operations qw(_sub add div num pow str);
my $result = do {
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
                need( $scope, $args, 'pt2', 9.2 ) || return $ret_func->();
                var(
                    $scope,
                    dx => _sub(
                        $scope, $$self->{'x'},
                        $$scope->{'pt2'}->property_u( 'x', $pos->(10.6) )
                    ),
                    $file_scope,
                    $pos->(10.2)
                );
                var(
                    $scope,
                    dy => _sub(
                        $scope, $$self->{'y'},
                        $$scope->{'pt2'}->property_u( 'y', $pos->(11.6) )
                    ),
                    $file_scope,
                    $pos->(11.2)
                );
                return $ret_func->(
                    $$scope->{'sqrt'}->(
                        [
                            add(
                                $scope,
                                pow( $scope, $$scope->{'dx'}, num( $f, "2" ) ),
                                pow( $scope, $$scope->{'dy'}, num( $f, "2" ) )
                            )
                        ],
                        $scope, undef,
                        $pos->(12.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'distanceFromOrigin' definition
        my $func_2 = method_event_def(
            $f, $scope,
            'distanceFromOrigin',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$self->{'distanceTo'}->(
                        [
                            ${ $scope->{special} }->{'class'}->(
                                [ num( $f, "0" ), num( $f, "0" ) ],
                                $scope, undef, $pos->(16.25)
                            )
                        ],
                        $scope, undef,
                        $pos->(16.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'pretty' definition
        my $func_3 = method_event_def(
            $f, $scope, 'pretty', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    add(
                        $scope,        str( $f, "(" ),
                        $$self->{'x'}, str( $f, ", " ),
                        $$self->{'y'}, str( $f, ")" )
                    )
                );
                return $ret;
            }
        );

        # Method event 'toString' definition
        my $func_4 = method_event_def(
            $f, $scope,
            'toString',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->( $$self->{'pretty'} );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $func_5 = method_event_def(
            $f, $scope,
            'description',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    add( $scope, str( $f, "Point" ), $$self->{'pretty'} ) );
                return $ret;
            }
        );

        # Method event 'midpoint' definition
        my $func_6 = method_event_def(
            $f, $scope,
            'midpoint',
            [
                {
                    name     => 'pt1',
                    type     => 'Point',
                    optional => undef,
                    more     => undef
                },
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
                need( $scope, $args, 'pt1', 32.1 ) || return $ret_func->();
                need( $scope, $args, 'pt2', 32.3 ) || return $ret_func->();
                return $ret_func->(
                    ${ $scope->{special} }->{'class'}->(
                        [
                            undef,
                            [
                                x => div(
                                    $scope,
                                    add(
                                        $scope,
                                        $$scope->{'pt1'}
                                          ->property_u( 'x', $pos->(34.2) ),
                                        $$scope->{'pt2'}
                                          ->property_u( 'x', $pos->(34.35) )
                                    ),
                                    num( $f, "2" )
                                ),
                                y => div(
                                    $scope,
                                    add(
                                        $scope,
                                        $$scope->{'pt1'}
                                          ->property_u( 'y', $pos->(35.2) ),
                                        $$scope->{'pt2'}
                                          ->property_u( 'y', $pos->(35.35) )
                                    ),
                                    num( $f, "2" )
                                )
                            ]
                        ],
                        $scope, undef,
                        $pos->(33.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'distanceBetween' definition
        my $func_7 = method_event_def(
            $f, $scope,
            'distanceBetween',
            [
                {
                    name     => 'pt1',
                    type     => 'Point',
                    optional => undef,
                    more     => undef
                },
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
                need( $scope, $args, 'pt1', 40.1 ) || return $ret_func->();
                need( $scope, $args, 'pt2', 40.3 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'pt1'}->property_u( 'distanceTo', $pos->(41.3) )
                      ->( [ $$scope->{'pt2'} ], $scope, undef, $pos->(41.4) ) );
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
            distanceFromOrigin => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_3->inside_scope(
            pretty => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_4->inside_scope(
            toString => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_5->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_6->inside_scope(
            midpoint => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_7->inside_scope(
            distanceBetween => $scope,
            $class, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Num Point) );
};

after_content();
