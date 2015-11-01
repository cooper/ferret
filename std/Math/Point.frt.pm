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
#          Method 'distanceFromOrigin'
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
#          Method 'pretty'
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
#                      Call
#                          Instance variable '@pretty'
#                          Structural list [0 items]
#          Method 'description'
#              Instruction
#                  Return
#                      Operation
#                          String 'Point'
#                          Addition operator (+)
#                          Call
#                              Instance variable '@pretty'
#                              Structural list [0 items]
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
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'Point.frt.pm'}++;

use Ferret::Core::Operations qw(_sub add div num pow str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('Math');
    do 'CORE.frt.pm' or die "Core error: $@" unless 'Math' eq 'CORE';
    undef;

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
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'x', type => 'Num', more => undef );
            $func->add_argument( name => 'y', type => 'Num', more => undef );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{x};
                    $self->set_property( x => $arguments->{x} );
                };
                do {
                    return unless defined $arguments->{y};
                    $self->set_property( y => $arguments->{y} );
                };
                return $return;
            };
            $methods[0] = Ferret::Event->new(
                $f,
                name         => '_init_',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'distanceTo' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument(
                name => 'pt2',
                type => 'Point',
                more => undef
            );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{pt2};
                    $scope->set_property( pt2 => $arguments->{pt2} );
                };
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
            };
            $methods[1] = Ferret::Event->new(
                $f,
                name         => 'distanceTo',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'distanceFromOrigin' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return $self->property_u('distanceTo')->call_u(
                    [
                        $scope->{special}->property_u('class')
                          ->call_u( [ num( $f, 0 ), num( $f, 0 ) ], $scope )
                    ],
                    $scope
                );
                return $return;
            };
            $methods[2] = Ferret::Event->new(
                $f,
                name         => 'distanceFromOrigin',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'pretty' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return add(
                    $scope,                 str( $f, "(" ),
                    $self->property_u('x'), str( $f, ", " ),
                    $self->property_u('y'), str( $f, ")" )
                );
                return $return;
            };
            $methods[3] = Ferret::Event->new(
                $f,
                name         => 'pretty',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'toString' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return $self->property_u('pretty')->call_u( {}, $scope );
                return $return;
            };
            $methods[4] = Ferret::Event->new(
                $f,
                name         => 'toString',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'description' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return add(
                    $scope,
                    str( $f, "Point" ),
                    $self->property_u('pretty')->call_u( {}, $scope )
                );
                return $return;
            };
            $methods[5] = Ferret::Event->new(
                $f,
                name         => 'description',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'midpoint' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument(
                name => 'pt1',
                type => 'Point',
                more => undef
            );
            $func->add_argument(
                name => 'pt2',
                type => 'Point',
                more => undef
            );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{pt1};
                    $scope->set_property( pt1 => $arguments->{pt1} );
                };
                do {
                    return unless defined $arguments->{pt2};
                    $scope->set_property( pt2 => $arguments->{pt2} );
                };
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
            };
            $methods[6] = Ferret::Event->new(
                $f,
                name         => 'midpoint',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'distanceBetween' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument(
                name => 'pt1',
                type => 'Point',
                more => undef
            );
            $func->add_argument(
                name => 'pt2',
                type => 'Point',
                more => undef
            );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{pt1};
                    $scope->set_property( pt1 => $arguments->{pt1} );
                };
                do {
                    return unless defined $arguments->{pt2};
                    $scope->set_property( pt2 => $arguments->{pt2} );
                };
                return $scope->property_u('pt1')->property_u('distanceTo')
                  ->call_u( [ $scope->property_u('pt2') ], $scope );
                return $return;
            };
            $methods[7] = Ferret::Event->new(
                $f,
                name         => 'distanceBetween',
                default_func => [ undef, $func ]
            );
        }
        $methods[0]->inside_scope( _init_     => $scope, $class, $class );
        $methods[1]->inside_scope( distanceTo => $scope, $proto, $class );
        $methods[2]
          ->inside_scope( distanceFromOrigin => $scope, $proto, $class );
        $methods[3]->inside_scope( pretty          => $scope, $proto, $class );
        $methods[4]->inside_scope( toString        => $scope, $proto, $class );
        $methods[5]->inside_scope( description     => $scope, $proto, $class );
        $methods[6]->inside_scope( midpoint        => $scope, $class, $class );
        $methods[7]->inside_scope( distanceBetween => $scope, $class, $class );
    }
    Ferret::space( $context, $_ ) for qw(Math::Num Math::Point Num Point);
};

Ferret::runtime();
