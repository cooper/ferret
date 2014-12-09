use warnings;
use strict;
use utf8;
use 5.010;
use lib 'lib';
use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello5.frt.pm'}++;

use Ferret::Core::Operations qw(add div);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    Ferret::space( $context, $_ ) for qw(Point);

    # Class 'Point'
    {
        my @methods;
        my $class = my $self = Ferret::Class->new(
            $f,
            name    => 'Point',
            version => 1.0
        );
        my $proto = $class->prototype;
        $context->set_property( Point => $class );

        # Method '_init_' definition
        {
            my $func = $methods[0] = Ferret::Function->new(
                $f,
                name      => '_init_',
                is_method => 1
            );
            $func->add_argument( name => 'x' );
            $func->add_argument( name => 'y' );
            $func->{code} = sub {
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                do {
                    return if not defined $arguments->{x};
                    $scope->set_property( x => $arguments->{x} );
                };
                do {
                    return if not defined $arguments->{y};
                    $scope->set_property( y => $arguments->{y} );
                };
                $self->set_property( x => $scope->property('x') );
                $self->set_property( y => $scope->property('y') );
                return $return;
            };
        }

        # Method 'oneToRight' definition
        {
            my $func = $methods[1] = Ferret::Function->new(
                $f,
                name      => 'oneToRight',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                $scope->set_property(
                    pt => $scope->{special}->property('class')->call(
                        [
                            add(
                                $scope,
                                $self->property('x'),
                                Ferret::Number->new( $f, value => 1 )
                            ),
                            $self->property('y')
                        ],
                        $scope
                    )
                );
                return $scope->property('pt');
                return $return;
            };
        }

        # Method 'pretty' definition
        {
            my $func = $methods[2] = Ferret::Function->new(
                $f,
                name      => 'pretty',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                return add(
                    $scope,
                    Ferret::String->new( $f, value => "(" ),
                    $self->property('x'),
                    Ferret::String->new( $f, value => ", " ),
                    $self->property('y'),
                    Ferret::String->new( $f, value => ")" )
                );
                return $return;
            };
        }

        # Method 'midpoint' definition
        {
            my $func = $methods[3] = Ferret::Function->new(
                $f,
                name      => 'midpoint',
                is_method => 1
            );
            $func->add_argument( name => 'pt1' );
            $func->add_argument( name => 'pt2' );
            $func->{code} = sub {
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                do {
                    return if not defined $arguments->{pt1};
                    $scope->set_property( pt1 => $arguments->{pt1} );
                };
                do {
                    return if not defined $arguments->{pt2};
                    $scope->set_property( pt2 => $arguments->{pt2} );
                };
                return $scope->property('Point')->call(
                    {
                        x => div(
                            $scope,
                            add(
                                $scope,
                                $scope->property('pt1')->property('x'),
                                $scope->property('pt2')->property('x')
                            ),
                            Ferret::Number->new( $f, value => 2 )
                        ),
                        y => div(
                            $scope,
                            add(
                                $scope,
                                $scope->property('pt1')->property('y'),
                                $scope->property('pt2')->property('y')
                            ),
                            Ferret::Number->new( $f, value => 2 )
                        )
                    },
                    $scope
                );
                return $return;
            };
        }

        # Method '_init_'
        {
            my $method = $methods[0];
            $method->{class}       = $class;
            $method->{outer_scope} = $scope;
            $class->set_property( _init_ => $method );
        }

        # Method 'oneToRight'
        {
            my $method = $methods[1];
            $method->{class}       = $class;
            $method->{outer_scope} = $scope;
            $proto->set_property( oneToRight => $method );
        }

        # Method 'pretty'
        {
            my $method = $methods[2];
            $method->{class}       = $class;
            $method->{outer_scope} = $scope;
            $proto->set_property( pretty => $method );
        }

        # Method 'midpoint'
        {
            my $method = $methods[3];
            $method->{class}       = $class;
            $method->{outer_scope} = $scope;
            $class->set_property( midpoint => $method );
        }
        $scope->set_property(
            pt => $scope->property('Point')->call(
                [
                    Ferret::Number->new( $f, value => 5 ),
                    Ferret::Number->new( $f, value => 3 )
                ],
                $scope
            )
        );
        $scope->property('say')->call(
            [
                add(
                    $scope,
                    Ferret::String->new( $f, value => "Point" ),
                    $scope->property('pt')->property('pretty')
                      ->call( [], $scope )
                )
            ],
            $scope
        );
        $scope->set_property( rpt =>
              $scope->property('pt')->property('oneToRight')->call( [], $scope )
        );
        $scope->property('say')->call(
            [
                add(
                    $scope,
                    Ferret::String->new( $f, value => "Right" ),
                    $scope->property('rpt')->property('pretty')
                      ->call( [], $scope )
                )
            ],
            $scope
        );
        $scope->set_property(
            mdpt => $scope->property('Point')->property('midpoint')->call(
                [ $scope->property('pt'), $scope->property('rpt') ], $scope
            )
        );
        $scope->property('say')->call(
            [
                add(
                    $scope,
                    Ferret::String->new( $f, value => "Midpoint" ),
                    $scope->property('mdpt')->property('pretty')
                      ->call( [], $scope )
                )
            ],
            $scope
        );
        $scope->set_property(
            nineteen => add(
                $scope,
                Ferret::Number->new( $f, value => 4 ),
                div(
                    $scope,
                    Ferret::Number->new( $f, value => 45 ),
                    Ferret::Number->new( $f, value => 3 )
                )
            )
        );
        $scope->property('say')->call(
            [
                add(
                    $scope,
                    Ferret::String->new( $f, value => "Nineteen: " ),
                    $scope->property('nineteen')
                )
            ],
            $scope
        );
    }
}
