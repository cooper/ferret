use warnings;
use strict;
use utf8;
use 5.010;
use lib 'lib';
use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello5.frt.pm'}++;

use Ferret::Core::Operations qw(add div num str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    Ferret::space( $context, $_ ) for qw(Point);

    # Class 'Point'
    {
        my @methods;
        my ( $class, $self );
        if ( $context->has_property('Point') ) {
            $class = $self = $context->property('Point');
        }
        else {
            $class = $self = Ferret::Class->new(
                $f,
                name    => 'Point',
                version => 1.0
            );
            $context->set_property( Point => $class );
        }
        my $proto = $class->prototype;

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
                            add( $scope, $self->property('x'), num( $f, 1 ) ),
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
                    $scope,               str( $f, "(" ),
                    $self->property('x'), str( $f, ", " ),
                    $self->property('y'), str( $f, ")" )
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
                            num( $f, 2 )
                        ),
                        y => div(
                            $scope,
                            add(
                                $scope,
                                $scope->property('pt1')->property('y'),
                                $scope->property('pt2')->property('y')
                            ),
                            num( $f, 2 )
                        )
                    },
                    $scope
                );
                return $return;
            };
        }
        $methods[0]->inside_scope( _init_     => $scope, $class, $class );
        $methods[1]->inside_scope( oneToRight => $scope, $proto, $class );
        $methods[2]->inside_scope( pretty     => $scope, $proto, $class );
        $methods[3]->inside_scope( midpoint   => $scope, $class, $class );
        $scope->set_property( pt => $scope->property('Point')
              ->call( [ num( $f, 5 ), num( $f, 3 ) ], $scope ) );
        $scope->property('say')->call(
            [
                add(
                    $scope,
                    str( $f, "Point" ),
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
                    str( $f, "Right" ),
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
                    str( $f, "Midpoint" ),
                    $scope->property('mdpt')->property('pretty')
                      ->call( [], $scope )
                )
            ],
            $scope
        );
        $scope->set_property(
            nineteen => add(
                $scope,
                num( $f, 4 ),
                div( $scope, num( $f, 45 ), num( $f, 3 ) )
            )
        );
        $scope->property('say')->call(
            [
                add(
                    $scope, str( $f, "Nineteen: " ),
                    $scope->property('nineteen')
                )
            ],
            $scope
        );
    }
}
