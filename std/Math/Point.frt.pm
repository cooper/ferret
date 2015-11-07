# === Document Model ===
#  Document './std/Math/Point.frt'
#      Package 'Math'
#      Class 'Point'
#          Main method '_init_'
#              Instruction
#                  Need
#                      Instance variable '@x'
#                      Bareword 'Num'
#              Instruction
#                  Need
#                      Instance variable '@y'
#                      Bareword 'Num'
#          Method 'distanceTo'
#              Instruction
#                  Need
#                      Lexical variable '$pt2'
#                      Bareword 'Point'
#              Instruction
#                  Assignment (lexical variable '$dx')
#                      Operation
#                          Instance variable '@x'
#                          Subtraction operator (-)
#                          Property 'x'
#                              Lexical variable '$pt2'
#              Instruction
#                  Assignment (lexical variable '$dy')
#                      Operation
#                          Instance variable '@y'
#                          Subtraction operator (-)
#                          Property 'y'
#                              Lexical variable '$pt2'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'sqrt'
#                          Single value [1 items]
#                              Item 0
#                                  Operation
#                                      Lexical variable '$dx'
#                                      Exponent operator (^)
#                                      Number '2'
#                                      Addition operator (+)
#                                      Lexical variable '$dy'
#                                      Exponent operator (^)
#                                      Number '2'
#          Computed property 'distanceFromOrigin'
#              Instruction
#                  Return
#                      Call
#                          Instance variable '@distanceTo'
#                          Single value [1 items]
#                              Item 0
#                                  Call
#                                      Special variable '*class'
#                                      Set [2 items]
#                                          Item 0
#                                              Number '0'
#                                          Item 1
#                                              Number '0'
#          Computed property 'pretty'
#              Instruction
#                  Return
#                      Operation
#                          String '('
#                          Addition operator (+)
#                          Instance variable '@x'
#                          Addition operator (+)
#                          String ', '
#                          Addition operator (+)
#                          Instance variable '@y'
#                          Addition operator (+)
#                          String ')'
#          Method 'toString'
#              Instruction
#                  Return
#                      Instance variable '@pretty'
#          Method 'description'
#              Instruction
#                  Return
#                      Operation
#                          String 'Point'
#                          Addition operator (+)
#                          Instance variable '@pretty'
#          Main method 'midpoint'
#              Instruction
#                  Need
#                      Lexical variable '$pt1'
#                      Bareword 'Point'
#              Instruction
#                  Need
#                      Lexical variable '$pt2'
#                      Bareword 'Point'
#              Instruction
#                  Return
#                      Call
#                          Special variable '*class'
#                          Hash [2 items]
#                              Item 0
#                                  Pair 'x'
#                                      Operation
#                                          Single value [1 items]
#                                              Item 0
#                                                  Operation
#                                                      Property 'x'
#                                                          Lexical variable '$pt1'
#                                                      Addition operator (+)
#                                                      Property 'x'
#                                                          Lexical variable '$pt2'
#                                          Division operator (/)
#                                          Number '2'
#                              Item 1
#                                  Pair 'y'
#                                      Operation
#                                          Single value [1 items]
#                                              Item 0
#                                                  Operation
#                                                      Property 'y'
#                                                          Lexical variable '$pt1'
#                                                      Addition operator (+)
#                                                      Property 'y'
#                                                          Lexical variable '$pt2'
#                                          Division operator (/)
#                                          Number '2'
#          Main method 'distanceBetween'
#              Instruction
#                  Need
#                      Lexical variable '$pt1'
#                      Bareword 'Point'
#              Instruction
#                  Need
#                      Lexical variable '$pt2'
#                      Bareword 'Point'
#              Instruction
#                  Return
#                      Call
#                          Property 'distanceTo'
#                              Lexical variable '$pt1'
#                          Single value [1 items]
#                              Item 0
#                                  Lexical variable '$pt2'
#      Include (Num, Point)
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die 'config error';
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = FF::get_ferret();

FF::before_content('Point.frt');

use Ferret::Core::Operations qw(_sub add div num pow str);
my $result = do {
    my @funcs;
    my $scope = my $context = FF::get_context( $f, 'Math' );
    FF::load_core('Math');

    # Class 'Point'
    {
        my @methods;
        my ( $class, $self );
        if ( not $class = $f->get_class( $context, 'Point' ) ) {
            $class = $self = Ferret::Class->new(
                $f,
                name    => 'Point',
                version => undef
            );
            $context->set_property( Point => $class );
        }
        my $proto = $class->prototype;

        # Method event '_init_' definition
        $methods[0] = FF::method_event_def(
            $f, $scope, '_init_',
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
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $self, $arguments, 'x' ) or return;
                FF::need( $self, $arguments, 'y' ) or return;
                return $return;
            }
        );

        # Method event 'distanceTo' definition
        $methods[1] = FF::method_event_def(
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
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'pt2' ) or return;
                $scope->set_property_ow(
                    $context,
                    dx => _sub(
                        $scope,
                        $self->property_u('x'),
                        $scope->property_u('pt2')->property_u('x')
                    )
                );
                $scope->set_property_ow(
                    $context,
                    dy => _sub(
                        $scope,
                        $self->property_u('y'),
                        $scope->property_u('pt2')->property_u('y')
                    )
                );
                return $scope->property_u('sqrt')->call_u(
                    [
                        add(
                            $scope,
                            pow(
                                $scope, $scope->property_u('dx'),
                                num( $f, 2 )
                            ),
                            pow(
                                $scope, $scope->property_u('dy'),
                                num( $f, 2 )
                            )
                        )
                    ],
                    $scope
                );
                return $return;
            }
        );

        # Method event 'distanceFromOrigin' definition
        $methods[2] = FF::method_event_def(
            $f, $scope,
            'distanceFromOrigin',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return $self->property_u('distanceTo')->call_u(
                    [
                        $scope->{special}->property_u('class')
                          ->call_u( [ num( $f, 0 ), num( $f, 0 ) ], $scope )
                    ],
                    $scope
                );
                return $return;
            }
        );

        # Method event 'pretty' definition
        $methods[3] = FF::method_event_def(
            $f, $scope, 'pretty',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return add(
                    $scope,                 str( $f, "(" ),
                    $self->property_u('x'), str( $f, ", " ),
                    $self->property_u('y'), str( $f, ")" )
                );
                return $return;
            }
        );

        # Method event 'toString' definition
        $methods[4] = FF::method_event_def(
            $f, $scope,
            'toString',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return $self->property_u('pretty');
                return $return;
            }
        );

        # Method event 'description' definition
        $methods[5] = FF::method_event_def(
            $f, $scope,
            'description',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return add( $scope, str( $f, "Point" ),
                    $self->property_u('pretty') );
                return $return;
            }
        );

        # Method event 'midpoint' definition
        $methods[6] = FF::method_event_def(
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
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'pt1' ) or return;
                FF::need( $scope, $arguments, 'pt2' ) or return;
                return $scope->{special}->property_u('class')->call_u(
                    {
                        x => div(
                            $scope,
                            add(
                                $scope,
                                $scope->property_u('pt1')->property_u('x'),
                                $scope->property_u('pt2')->property_u('x')
                            ),
                            num( $f, 2 )
                        ),
                        y => div(
                            $scope,
                            add(
                                $scope,
                                $scope->property_u('pt1')->property_u('y'),
                                $scope->property_u('pt2')->property_u('y')
                            ),
                            num( $f, 2 )
                        )
                    },
                    $scope
                );
                return $return;
            }
        );

        # Method event 'distanceBetween' definition
        $methods[7] = FF::method_event_def(
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
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'pt1' ) or return;
                FF::need( $scope, $arguments, 'pt2' ) or return;
                return $scope->property_u('pt1')->property_u('distanceTo')
                  ->call_u( [ $scope->property_u('pt2') ], $scope );
                return $return;
            }
        );
        $methods[0]
          ->inside_scope( _init_ => $scope, $class, $class, undef, undef );
        $methods[1]
          ->inside_scope( distanceTo => $scope, $proto, $class, undef, undef );
        $methods[2]->inside_scope(
            distanceFromOrigin => $scope,
            $proto, $class, 1, undef
        );
        $methods[3]->inside_scope( pretty => $scope, $proto, $class, 1, undef );
        $methods[4]
          ->inside_scope( toString => $scope, $proto, $class, undef, undef );
        $methods[5]
          ->inside_scope( description => $scope, $proto, $class, undef, undef );
        $methods[6]
          ->inside_scope( midpoint => $scope, $class, $class, undef, undef );
        $methods[7]->inside_scope(
            distanceBetween => $scope,
            $class, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Math::Num Math::Point Num Point) );
};

FF::after_content();
