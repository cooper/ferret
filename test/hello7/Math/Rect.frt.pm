# --- DOM ---
#  Document './hello7/Math/Rect.frt'
#      Package 'Math'
#      Class 'Rect'
#          Main method '_init_'
#              Instruction
#                  Need
#                      Lexical variable '$x'
#                      Token OP_COMMA
#                      Lexical variable '$y'
#                      Token OP_COMMA
#                      Lexical variable '$width'
#                      Token OP_COMMA
#                      Lexical variable '$height'
#              Instruction
#                  Assignment
#                      Instance variable '@width'
#                      Lexical variable '$width'
#              Instruction
#                  Assignment
#                      Instance variable '@height'
#                      Lexical variable '$height'
#              Instruction
#                  Assignment
#                      Instance variable '@origin'
#                      Call
#                          Bareword 'Point'
#                          Structural list [2 items]
#                              Item 0
#                                  Lexical variable '$x'
#                              Item 1
#                                  Lexical variable '$y'
#          Method 'bottomLeft'
#              Instruction
#                  Return
#                      Instance variable '@origin'
#          Method 'bottomRight'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'Point'
#                          Structural list [2 items]
#                              Item 0
#                                  Mathematical operation
#                                      Property 'x'
#                                          Instance variable '@origin'
#                                      Addition operator (+)
#                                      Instance variable '@width'
#                              Item 1
#                                  Property 'y'
#                                      Instance variable '@origin'
#          Method 'topLeft'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'Point'
#                          Structural list [2 items]
#                              Item 0
#                                  Property 'x'
#                                      Instance variable '@origin'
#                              Item 1
#                                  Mathematical operation
#                                      Property 'y'
#                                          Instance variable '@origin'
#                                      Addition operator (+)
#                                      Instance variable '@height'
#          Method 'topRight'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'Point'
#                          Structural list [2 items]
#                              Item 0
#                                  Mathematical operation
#                                      Property 'x'
#                                          Instance variable '@origin'
#                                      Addition operator (+)
#                                      Instance variable '@width'
#                              Item 1
#                                  Mathematical operation
#                                      Property 'y'
#                                          Instance variable '@origin'
#                                      Addition operator (+)
#                                      Instance variable '@height'
#          Method 'center'
#              Instruction
#                  Assignment
#                      Lexical variable '$x'
#                      Mathematical operation
#                          Property 'x'
#                              Instance variable '@origin'
#                          Addition operator (+)
#                          Instance variable '@width'
#                          Multiplication operator (*)
#                          Number '0.5'
#              Instruction
#                  Assignment
#                      Lexical variable '$y'
#                      Mathematical operation
#                          Property 'y'
#                              Instance variable '@origin'
#                          Addition operator (+)
#                          Instance variable '@height'
#                          Multiplication operator (*)
#                          Number '0.5'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'Point'
#                          Structural list [2 items]
#                              Item 0
#                                  Lexical variable '$x'
#                              Item 1
#                                  Lexical variable '$y'
use warnings;
use strict;
use utf8;
use 5.010;
use lib 'lib';
use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'Rect.frt.pm'}++;

use Ferret::Core::Operations qw(add mul num);
{
    my @funcs;
    my $scope = my $context = $f->get_context('Math');
    Ferret::space( $context, $_ ) for qw(Math::Point);

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
                    $scope->set_property( width => $arguments->{width} );
                };
                do {
                    return if not defined $arguments->{height};
                    $scope->set_property( height => $arguments->{height} );
                };
                $self->set_property( width  => $scope->property('width') );
                $self->set_property( height => $scope->property('height') );
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

        # Method 'center' definition
        {
            my $func = $methods[5] = Ferret::Function->new(
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
        $methods[5]->inside_scope( center      => $scope, $proto, $class );
    }
}
