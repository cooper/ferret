use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    my $libs = do '/etc/ferret.conf';
    ref $libs eq 'ARRAY' or die "config error";
    unshift @INC, @$libs;
}

use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'Rect.frt.pm'}++;

use Ferret::Core::Operations qw(add mul num);
{
    my @funcs;
    my $scope = my $context = $f->get_context('Math');

    # Class 'Rect'
    {
        my @methods;
        my ( $class, $self );
        if ( $context->has_property('Rect') ) {
            $class = $self = $context->property('Rect');
        }
        else {
            $class = $self = Ferret::Class->new(
                $f,
                name    => 'Rect',
                version => undef
            );
            $context->set_property( Rect => $class );
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
            $func->add_argument( name => 'width' );
            $func->add_argument( name => 'height' );
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
                do {
                    return if not defined $arguments->{width};
                    $self->set_property( width => $arguments->{width} );
                };
                do {
                    return if not defined $arguments->{height};
                    $self->set_property( height => $arguments->{height} );
                };
                $self->set_property(
                    origin => $scope->property('Point')->call(
                        [ $scope->property('x'), $scope->property('y') ],
                        $scope
                    )
                );
                return $return;
            };
        }

        # Method 'bottomLeft' definition
        {
            my $func = $methods[1] = Ferret::Function->new(
                $f,
                name      => 'bottomLeft',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                return $self->property('origin');
                return $return;
            };
        }

        # Method 'bottomRight' definition
        {
            my $func = $methods[2] = Ferret::Function->new(
                $f,
                name      => 'bottomRight',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                return $scope->property('Point')->call(
                    [
                        add(
                            $scope,
                            $self->property('origin')->property('x'),
                            $self->property('width')
                        ),
                        $self->property('origin')->property('y')
                    ],
                    $scope
                );
                return $return;
            };
        }

        # Method 'topLeft' definition
        {
            my $func = $methods[3] = Ferret::Function->new(
                $f,
                name      => 'topLeft',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                return $scope->property('Point')->call(
                    [
                        $self->property('origin')->property('x'),
                        add(
                            $scope,
                            $self->property('origin')->property('y'),
                            $self->property('height')
                        )
                    ],
                    $scope
                );
                return $return;
            };
        }

        # Method 'topRight' definition
        {
            my $func = $methods[4] = Ferret::Function->new(
                $f,
                name      => 'topRight',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                return $scope->property('Point')->call(
                    [
                        add(
                            $scope,
                            $self->property('origin')->property('x'),
                            $self->property('width')
                        ),
                        add(
                            $scope,
                            $self->property('origin')->property('y'),
                            $self->property('height')
                        )
                    ],
                    $scope
                );
                return $return;
            };
        }

        # Method 'bottomLine' definition
        {
            my $func = $methods[5] = Ferret::Function->new(
                $f,
                name      => 'bottomLine',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                return $scope->property('Line')->call(
                    [
                        $self->property('bottomLeft')->call( [], $scope ),
                        $self->property('bottomRight')->call( [], $scope )
                    ],
                    $scope
                );
                return $return;
            };
        }

        # Method 'topLine' definition
        {
            my $func = $methods[6] = Ferret::Function->new(
                $f,
                name      => 'topLine',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                return $scope->property('Line')->call(
                    [
                        $self->property('topLeft')->call( [], $scope ),
                        $self->property('topRight')->call( [], $scope )
                    ],
                    $scope
                );
                return $return;
            };
        }

        # Method 'center' definition
        {
            my $func = $methods[7] = Ferret::Function->new(
                $f,
                name      => 'center',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                $scope->set_property(
                    x => add(
                        $scope,
                        $self->property('origin')->property('x'),
                        mul( $scope, $self->property('width'), num( $f, 0.5 ) )
                    )
                );
                $scope->set_property(
                    y => add(
                        $scope,
                        $self->property('origin')->property('y'),
                        mul(
                            $scope, $self->property('height'), num( $f, 0.5 )
                        )
                    )
                );
                return $scope->property('Point')
                  ->call( [ $scope->property('x'), $scope->property('y') ],
                    $scope );
                return $return;
            };
        }
        $methods[0]->inside_scope( _init_      => $scope, $class, $class );
        $methods[1]->inside_scope( bottomLeft  => $scope, $proto, $class );
        $methods[2]->inside_scope( bottomRight => $scope, $proto, $class );
        $methods[3]->inside_scope( topLeft     => $scope, $proto, $class );
        $methods[4]->inside_scope( topRight    => $scope, $proto, $class );
        $methods[5]->inside_scope( bottomLine  => $scope, $proto, $class );
        $methods[6]->inside_scope( topLine     => $scope, $proto, $class );
        $methods[7]->inside_scope( center      => $scope, $proto, $class );
    }
    Ferret::space( $context, $_ ) for qw(Line Point);
}
