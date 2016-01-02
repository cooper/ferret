# === Document Model ===
#  Document './std/Math/Point.frt'
#      Package 'Math'
#      Class 'Point'
#          Class method 'initializer__'
#              Body ('method' scope)
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
#              Body ('method' scope)
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
#                              Argument list [1 items]
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
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@distanceTo'
#                              Argument list [1 items]
#                                  Item 0
#                                      Call
#                                          Special variable '*class'
#                                          Argument list [2 items]
#                                              Item 0
#                                                  Number '0'
#                                              Item 1
#                                                  Number '0'
#          Computed property 'pretty'
#              Body ('method' scope)
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
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Instance variable '@pretty'
#          Method 'description'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Operation
#                              String 'Point'
#                              Addition operator (+)
#                              Instance variable '@pretty'
#          Class method 'midpoint'
#              Body ('method' scope)
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
#                                              Single value [1 items]
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
#                                              Single value [1 items]
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
#              Body ('method' scope)
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
#                              Argument list [1 items]
#                                  Item 0
#                                      Lexical variable '$pt2'
#      Include (Num, Point)
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

FF::before_content('Point.frt');

use Ferret::Core::Operations qw(_sub add div num pow str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'Math' );
    my $scope = $file_scope;
    FF::load_core('Math');

    # Class 'Point'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Point', undef );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
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
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                FF::need( $self, $args, 'x' ) or return;
                FF::need( $self, $args, 'y' ) or return;
                return $ret->return;
            }
        );

        # Method event 'distanceTo' definition
        my $method_1 = FF::method_event_def(
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
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                FF::need( $scope, $args, 'pt2', 9.2 ) or return;
                my $lv_dx = FF::lex_assign(
                    $scope,
                    dx => _sub(
                        $scope, $$self->{'x'}, ${ $$scope->{'pt2'} }->{'x'}
                    ),
                    $file_scope,
                    10.2
                );
                my $lv_dy = FF::lex_assign(
                    $scope,
                    dy => _sub(
                        $scope, $$self->{'y'}, ${ $$scope->{'pt2'} }->{'y'}
                    ),
                    $file_scope,
                    11.2
                );
                return $ret->return(
                    $$scope->{'sqrt'}->(
                        [
                            add(
                                $scope,
                                pow( $scope, $$scope->{'dx'}, num( $f, 2 ) ),
                                pow( $scope, $$scope->{'dy'}, num( $f, 2 ) )
                            )
                        ],
                        $scope, undef, 12.15
                    )
                );
                return $ret->return;
            }
        );

        # Method event 'distanceFromOrigin' definition
        my $method_2 = FF::method_event_def(
            $f, $scope,
            'distanceFromOrigin',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                return $ret->return(
                    $$self->{'distanceTo'}->(
                        [
                            ${ $scope->{special} }->{'class'}->(
                                [ num( $f, 0 ), num( $f, 0 ) ], $scope,
                                undef, 16.25
                            )
                        ],
                        $scope, undef, 16.15
                    )
                );
                return $ret->return;
            }
        );

        # Method event 'pretty' definition
        my $method_3 = FF::method_event_def(
            $f, $scope, 'pretty',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                return $ret->return(
                    add(
                        $scope,        str( $f, "(" ),
                        $$self->{'x'}, str( $f, ", " ),
                        $$self->{'y'}, str( $f, ")" )
                    )
                );
                return $ret->return;
            }
        );

        # Method event 'toString' definition
        my $method_4 = FF::method_event_def(
            $f, $scope,
            'toString',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                return $ret->return( $$self->{'pretty'} );
                return $ret->return;
            }
        );

        # Method event 'description' definition
        my $method_5 = FF::method_event_def(
            $f, $scope,
            'description',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                return $ret->return(
                    add( $scope, str( $f, "Point" ), $$self->{'pretty'} ) );
                return $ret->return;
            }
        );

        # Method event 'midpoint' definition
        my $method_6 = FF::method_event_def(
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
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                FF::need( $scope, $args, 'pt1', 32.1 ) or return;
                FF::need( $scope, $args, 'pt2', 32.3 ) or return;
                return $ret->return(
                    ${ $scope->{special} }->{'class'}->(
                        {
                            x => div(
                                $scope,
                                add(
                                    $scope,
                                    ${ $$scope->{'pt1'} }->{'x'},
                                    ${ $$scope->{'pt2'} }->{'x'}
                                ),
                                num( $f, 2 )
                            ),
                            y => div(
                                $scope,
                                add(
                                    $scope,
                                    ${ $$scope->{'pt1'} }->{'y'},
                                    ${ $$scope->{'pt2'} }->{'y'}
                                ),
                                num( $f, 2 )
                            )
                        },
                        $scope, undef, 33.3
                    )
                );
                return $ret->return;
            }
        );

        # Method event 'distanceBetween' definition
        my $method_7 = FF::method_event_def(
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
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                FF::need( $scope, $args, 'pt1', 40.1 ) or return;
                FF::need( $scope, $args, 'pt2', 40.3 ) or return;
                return $ret->return( ${ $$scope->{'pt1'} }->{'distanceTo'}
                      ->( [ $$scope->{'pt2'} ], $scope, undef, 41.4 ) );
                return $ret->return;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            distanceTo => $scope,
            $proto, $class, undef, undef
        );
        $method_2->inside_scope(
            distanceFromOrigin => $scope,
            $proto, $class, 1, undef
        );
        $method_3->inside_scope( pretty => $scope, $proto, $class, 1, undef );
        $method_4->inside_scope(
            toString => $scope,
            $proto, $class, undef, undef
        );
        $method_5->inside_scope(
            description => $scope,
            $proto, $class, undef, undef
        );
        $method_6->inside_scope(
            midpoint => $scope,
            $class, $class, undef, undef
        );
        $method_7->inside_scope(
            distanceBetween => $scope,
            $class, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Num Point) );
};

FF::after_content();
