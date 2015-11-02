# === Document Model ===
#  Document './std/Math/Line.frt'
#      Package 'Math'
#      Class 'Line'
#          Main method '_init_'
#              Instruction
#                  Need
#                      Instance variable '@pt1'
#                      Bareword 'Point'
#              Instruction
#                  Need
#                      Instance variable '@pt2'
#                      Bareword 'Point'
#          Method 'endpoints'
#              Instruction
#                  Return
#                      Value list [2 items]
#                          Item 0
#                              Instance variable '@pt1'
#                          Item 1
#                              Instance variable '@pt2'
#          Method 'pretty'
#              Instruction
#                  Assignment (lexical variable '$mp')
#                      Instance variable '@midpoint'
#              Instruction
#                  Assignment (lexical variable '$pox')
#                      Property 'x'
#                          Instance variable '@pt1'
#              Instruction
#                  Assignment (lexical variable '$poy')
#                      Property 'y'
#                          Instance variable '@pt1'
#              Instruction
#                  Assignment (lexical variable '$ptx')
#                      Property 'x'
#                          Instance variable '@pt2'
#              Instruction
#                  Assignment (lexical variable '$pty')
#                      Property 'y'
#                          Instance variable '@pt2'
#              Instruction
#                  Assignment (lexical variable '$mx')
#                      Property 'x'
#                          Lexical variable '$mp'
#              Instruction
#                  Assignment (lexical variable '$my')
#                      Property 'y'
#                          Lexical variable '$mp'
#              Instruction
#                  Return
#                      Operation
#                          String 'Segment( |('
#                          Addition operator (+)
#                          Lexical variable '$pox'
#                          Addition operator (+)
#                          String ', '
#                          Addition operator (+)
#                          Lexical variable '$poy'
#                          Addition operator (+)
#                          String ')---('
#                          Addition operator (+)
#                          Lexical variable '$mx'
#                          Addition operator (+)
#                          String ', '
#                          Addition operator (+)
#                          Lexical variable '$my'
#                          Addition operator (+)
#                          String ')---('
#                          Addition operator (+)
#                          Lexical variable '$ptx'
#                          Addition operator (+)
#                          String ', '
#                          Addition operator (+)
#                          Lexical variable '$pty'
#                          Addition operator (+)
#                          String ')|; Length = '
#                          Addition operator (+)
#                          Instance variable '@length'
#                          Addition operator (+)
#                          String ' )'
#          Method 'description'
#              Instruction
#                  Return
#                      Instance variable '@pretty'
#          Method 'midpoint'
#              Instruction
#                  Return
#                      Call
#                          Property 'midpoint'
#                              Set [2 items]
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
#                          Single value [1 items]
#                              Item 0
#                                  Instance variable '@pt2'
#      Include (Point)
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
$Ferret::tried_files{'Line.frt.pm'}++;

use Ferret::Core::Operations qw(add str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('Math');
    do 'CORE.frt.pm' or die "Core error: $@" unless 'Math' eq 'CORE';
    undef;

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

        # Method event 'endpoints' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return Ferret::List->new( $f,
                    items =>
                      [ $self->property_u('pt1'), $self->property_u('pt2') ] );
                return $return;
            };
            $methods[1] = Ferret::Event->new(
                $f,
                name         => 'endpoints',
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
                $scope->set_property_ow( $context,
                    mp => $self->property_u('midpoint') );
                $scope->set_property_ow( $context,
                    pox => $self->property_u('pt1')->property_u('x') );
                $scope->set_property_ow( $context,
                    poy => $self->property_u('pt1')->property_u('y') );
                $scope->set_property_ow( $context,
                    ptx => $self->property_u('pt2')->property_u('x') );
                $scope->set_property_ow( $context,
                    pty => $self->property_u('pt2')->property_u('y') );
                $scope->set_property_ow( $context,
                    mx => $scope->property_u('mp')->property_u('x') );
                $scope->set_property_ow( $context,
                    my => $scope->property_u('mp')->property_u('y') );
                return add(
                    $scope,                      str( $f, "Segment( |(" ),
                    $scope->property_u('pox'),   str( $f, ", " ),
                    $scope->property_u('poy'),   str( $f, ")---(" ),
                    $scope->property_u('mx'),    str( $f, ", " ),
                    $scope->property_u('my'),    str( $f, ")---(" ),
                    $scope->property_u('ptx'),   str( $f, ", " ),
                    $scope->property_u('pty'),   str( $f, ")|; Length = " ),
                    $self->property_u('length'), str( $f, " )" )
                );
                return $return;
            };
            $methods[2] = Ferret::Event->new(
                $f,
                name         => 'pretty',
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
                return $self->property_u('pretty');
                return $return;
            };
            $methods[3] = Ferret::Event->new(
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

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return $self->property_u('pt1')
                  ->create_set( $scope, $self->property_u('pt2') )
                  ->property_u('midpoint')->call_u( {}, $scope );
                return $return;
            };
            $methods[4] = Ferret::Event->new(
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
                return $self->property_u('pt1')->property_u('distanceTo')
                  ->call_u( [ $self->property_u('pt2') ], $scope );
                return $return;
            };
            $methods[5] = Ferret::Event->new(
                $f,
                name         => 'length',
                default_func => [ undef, $func ]
            );
        }
        $methods[0]->inside_scope( _init_    => $scope, $class, $class, undef );
        $methods[1]->inside_scope( endpoints => $scope, $proto, $class, 1 );
        $methods[2]->inside_scope( pretty    => $scope, $proto, $class, 1 );
        $methods[3]
          ->inside_scope( description => $scope, $proto, $class, undef );
        $methods[4]->inside_scope( midpoint => $scope, $proto, $class, 1 );
        $methods[5]->inside_scope( length   => $scope, $proto, $class, 1 );
    }
    Ferret::space( $context, $_ ) for qw(Math::Point Point);
};

Ferret::runtime();
