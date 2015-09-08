# --- DOM ---
#  Document './std/Math/Line.frt'
#      Package 'Math'
#      Class 'Line'
#          Main method '_init_'
#              Instruction
#                  Need
#                      Instance variable '@pt1'
#                      Comma (,)
#                      Instance variable '@pt2'
#          Method 'midpoint'
#              Instruction
#                  Return
#                      Call
#                          Property 'midpoint'
#                              Bareword 'Point'
#                          Structural list [2 items]
#                              Item 0
#                                  Instance variable '@pt1'
#                              Item 1
#                                  Instance variable '@pt2'
#          Method 'length'
#              Instruction
#                  Return
#                      Call
#                          Property 'distanceTo'
#                              Instance variable '@pt1'
#                          Structural list [1 items]
#                              Item 0
#                                  Instance variable '@pt2'
#      Include (Point)
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
$Ferret::tried_files{'Line.frt.pm'}++;

use Ferret::Core::Operations qw();
{
    my @funcs;
    my $scope = my $context = $f->get_context('Math');

    # Class 'Line'
    {
        my @methods;
        my ( $class, $self );
        if ( $context->has_property('Line') ) {
            $class = $self = $context->property('Line');
        }
        else {
            $class = $self = Ferret::Class->new(
                $f,
                name    => 'Line',
                version => undef
            );
            $context->set_property( Line => $class );
        }
        my $proto = $class->prototype;

        # Method '_init_' definition
        {
            my $func = $methods[0] = Ferret::Function->new(
                $f,
                name      => '_init_',
                is_method => 1
            );
            $func->add_argument( name => 'pt1' );
            $func->add_argument( name => 'pt2' );
            $func->{code} = sub {
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                do {
                    return if not defined $arguments->{pt1};
                    $self->set_property( pt1 => $arguments->{pt1} );
                };
                do {
                    return if not defined $arguments->{pt2};
                    $self->set_property( pt2 => $arguments->{pt2} );
                };
                return $return;
            };
        }

        # Method 'midpoint' definition
        {
            my $func = $methods[1] = Ferret::Function->new(
                $f,
                name      => 'midpoint',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                return $scope->property('Point')->property('midpoint')
                  ->call( [ $self->property('pt1'), $self->property('pt2') ],
                    $scope );
                return $return;
            };
        }

        # Method 'length' definition
        {
            my $func = $methods[2] = Ferret::Function->new(
                $f,
                name      => 'length',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                return $self->property('pt1')->property('distanceTo')
                  ->call( [ $self->property('pt2') ], $scope );
                return $return;
            };
        }
        $methods[0]->inside_scope( _init_   => $scope, $class, $class );
        $methods[1]->inside_scope( midpoint => $scope, $proto, $class );
        $methods[2]->inside_scope( length   => $scope, $proto, $class );
    }
    Ferret::space( $context, $_ ) for qw(Point);
}
