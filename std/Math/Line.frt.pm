# === Document Model ===
#  Document './std/Math/Line.frt'
#      Package 'Math'
#      Class 'Line'
#          Main method '_init_'
#              Instruction
#                  Need
#                      Instance variable '@pt1'
#              Instruction
#                  Need
#                      Instance variable '@pt2'
#          Method 'midpoint'
#              Instruction
#                  Return
#                      Call
#                          Property 'midpoint'
#                              Structural list [2 items]
#                                  Item 0
#                                      Instance variable '@pt1'
#                                  Item 1
#                                      Instance variable '@pt2'
#                          Structural list [0 items]
#          Method 'length'
#              Instruction
#                  Return
#                      Call
#                          Property 'distanceTo'
#                              Instance variable '@pt1'
#                          Structural list [1 items]
#                              Item 0
#                                  Instance variable '@pt2'
#      Include
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die "config error";
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'Line.frt.pm'}++;

use Ferret::Core::Operations qw();
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('Math');

    # Class 'Line'
    {
        my @methods;
        my ( $class, $self );
        if ( not $class = $f->get_class( $context, 'Line' ) ) {
            $class = $self = Ferret::Class->new(
                $f,
                name    => 'Line',
                version => undef
            );
            $context->set_property( Line => $class );
        }
        my $proto = $class->prototype;

        # Method event '_init_' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'pt1' );
            $func->add_argument( name => 'pt2' );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{pt1};
                    $self->set_property( pt1 => $arguments->{pt1} );
                };
                do {
                    return unless defined $arguments->{pt2};
                    $self->set_property( pt2 => $arguments->{pt2} );
                };
                return $return;
            };
            $methods[0] = Ferret::Event->new(
                $f,
                name         => '_init_',
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

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return $self->property('pt1')
                  ->create_set( $scope, $self->property('pt2') )
                  ->property('midpoint')->call( {}, $scope );
                return $return;
            };
            $methods[1] = Ferret::Event->new(
                $f,
                name         => 'midpoint',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'length' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return $self->property('pt1')->property('distanceTo')
                  ->call( [ $self->property('pt2') ], $scope );
                return $return;
            };
            $methods[2] = Ferret::Event->new(
                $f,
                name         => 'length',
                default_func => [ undef, $func ]
            );
        }
        $methods[0]->inside_scope( _init_   => $scope, $class, $class );
        $methods[1]->inside_scope( midpoint => $scope, $proto, $class );
        $methods[2]->inside_scope( length   => $scope, $proto, $class );
    }
};

Ferret::runtime();
