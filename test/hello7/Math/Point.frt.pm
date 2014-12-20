# --- DOM ---
#  Document './hello7/Math/Point.frt'
#      Package 'Math'
#      Class 'Point'
#          Main method '_init_'
#              Instruction
#                  Need
#                      Lexical variable '$x'
#                      Comma (,)
#                      Lexical variable '$y'
#              Instruction
#                  Assignment
#                      Instance variable '@x'
#                      Lexical variable '$x'
#              Instruction
#                  Assignment
#                      Instance variable '@y'
#                      Lexical variable '$y'
#          Method 'oneToRight'
#              Instruction
#                  Assignment
#                      Lexical variable '$pt'
#                      Call
#                          Special variable '*class'
#                          Structural list [2 items]
#                              Item 0
#                                  Mathematical operation
#                                      Instance variable '@x'
#                                      Addition operator (+)
#                                      Number '1'
#                              Item 1
#                                  Instance variable '@y'
#              Instruction
#                  Return
#                      Lexical variable '$pt'
#          Method 'pretty'
#              Instruction
#                  Return
#                      Structural list [1 items]
#                          Item 0
#                              Mathematical operation
#                                  String '('
#                                  Addition operator (+)
#                                  Instance variable '@x'
#                                  Addition operator (+)
#                                  String ', '
#                                  Addition operator (+)
#                                  Instance variable '@y'
#                                  Addition operator (+)
#                                  String ')'
#          Main method 'midpoint'
#              Instruction
#                  Need
#                      Lexical variable '$pt1'
#                      Comma (,)
#                      Lexical variable '$pt2'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'Point'
#                          Hash [2 items]
#                              Item 0
#                                  Pair 'x'
#                                      Mathematical operation
#                                          Structural list [1 items]
#                                              Item 0
#                                                  Mathematical operation
#                                                      Property 'x'
#                                                          Lexical variable '$pt1'
#                                                      Addition operator (+)
#                                                      Property 'x'
#                                                          Lexical variable '$pt2'
#                                          Division operator (/)
#                                          Number '2'
#                              Item 1
#                                  Pair 'y'
#                                      Mathematical operation
#                                          Structural list [1 items]
#                                              Item 0
#                                                  Mathematical operation
#                                                      Property 'y'
#                                                          Lexical variable '$pt1'
#                                                      Addition operator (+)
#                                                      Property 'y'
#                                                          Lexical variable '$pt2'
#                                          Division operator (/)
#                                          Number '2'
use warnings;
use strict;
use utf8;
use 5.010;
use lib 'lib';
use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'Point.frt.pm'}++;

use Ferret::Core::Operations qw(add div num str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('Math');
    Ferret::space( $context, $_ ) for qw(Math::Point);

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
                version => undef
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
    }
}
