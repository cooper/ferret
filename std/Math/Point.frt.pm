# --- Tokens ---
#         PKG_DEC | {"name":"Math"}
#       CLASS_DEC | {"name":"Point"}
#          METHOD | {"name":"_init_","main":1}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#        VAR_THIS | "x"
#        OP_COMMA | 
#        VAR_THIS | "y"
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"main":null,"name":"distanceTo"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "pt2"
#         OP_SEMI | 
#         VAR_LEX | "dx"
#       OP_ASSIGN | 
#        VAR_THIS | "x"
#          OP_SUB | 
#         VAR_LEX | "pt2"
#        PROPERTY | "x"
#         OP_SEMI | 
#         VAR_LEX | "dy"
#       OP_ASSIGN | 
#        VAR_THIS | "y"
#          OP_SUB | 
#         VAR_LEX | "pt2"
#        PROPERTY | "y"
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#        BAREWORD | "sqrt"
#      PAREN_CALL | 
#         VAR_LEX | "dx"
#          OP_POW | 
#          NUMBER | "2"
#          OP_ADD | 
#         VAR_LEX | "dy"
#          OP_POW | 
#          NUMBER | "2"
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"main":null,"name":"distanceFromOrigin"}
#       CLOSURE_S | 
#  KEYWORD_RETURN | 
#        VAR_THIS | "distanceTo"
#      PAREN_CALL | 
#        VAR_SPEC | "class"
#      PAREN_CALL | 
#          NUMBER | "0"
#        OP_COMMA | 
#          NUMBER | "0"
#         PAREN_E | 
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"main":null,"name":"pretty"}
#       CLOSURE_S | 
#  KEYWORD_RETURN | 
#          STRING | ["(",["VAR_THIS","x",33],", ",["VAR_THIS","y",33],")"]
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"main":"1","name":"midpoint"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "pt1"
#        OP_COMMA | 
#         VAR_LEX | "pt2"
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#        VAR_SPEC | "class"
#      PAREN_CALL | 
#      PROP_VALUE | "x"
#         PAREN_S | 
#         VAR_LEX | "pt1"
#        PROPERTY | "x"
#          OP_ADD | 
#         VAR_LEX | "pt2"
#        PROPERTY | "x"
#         PAREN_E | 
#          OP_DIV | 
#          NUMBER | "2"
#        OP_COMMA | 
#      PROP_VALUE | "y"
#         PAREN_S | 
#         VAR_LEX | "pt1"
#        PROPERTY | "y"
#          OP_ADD | 
#         VAR_LEX | "pt2"
#        PROPERTY | "y"
#         PAREN_E | 
#          OP_DIV | 
#          NUMBER | "2"
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
# --- DOM ---
#  Document './std/Math/Point.frt'
#      Package 'Math'
#      Class 'Point'
#          Main method '_init_'
#              Instruction
#                  Need
#                      Instance variable '@x'
#                      Comma (,)
#                      Instance variable '@y'
#          Method 'distanceTo'
#              Instruction
#                  Need
#                      Lexical variable '$pt2'
#              Instruction
#                  Assignment
#                      Lexical variable '$dx'
#                      Mathematical operation
#                          Instance variable '@x'
#                          Subtraction operator (-)
#                          Property 'x'
#                              Lexical variable '$pt2'
#              Instruction
#                  Assignment
#                      Lexical variable '$dy'
#                      Mathematical operation
#                          Instance variable '@y'
#                          Subtraction operator (-)
#                          Property 'y'
#                              Lexical variable '$pt2'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'sqrt'
#                          Structural list [1 items]
#                              Item 0
#                                  Mathematical operation
#                                      Lexical variable '$dx'
#                                      OP_POW
#                                      Number '2'
#                                      Addition operator (+)
#                                      Lexical variable '$dy'
#                                      OP_POW
#                                      Number '2'
#          Method 'distanceFromOrigin'
#              Instruction
#                  Return
#                      Call
#                          Instance variable '@distanceTo'
#                          Structural list [1 items]
#                              Item 0
#                                  Call
#                                      Special variable '*class'
#                                      Structural list [2 items]
#                                          Item 0
#                                              Number '0'
#                                          Item 1
#                                              Number '0'
#          Method 'pretty'
#              Instruction
#                  Return
#                      Mathematical operation
#                          String '('
#                          Addition operator (+)
#                          Instance variable '@x'
#                          Addition operator (+)
#                          String ', '
#                          Addition operator (+)
#                          Instance variable '@y'
#                          Addition operator (+)
#                          String ')'
#          Main method 'midpoint'
#              Instruction
#                  Need
#                      Lexical variable '$pt1'
#                      Comma (,)
#                      Lexical variable '$pt2'
#              Instruction
#                  Return
#                      Call
#                          Special variable '*class'
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
#      Include
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
$Ferret::tried_files{'Point.frt.pm'}++;

use Ferret::Core::Operations qw(_sub add div num pow str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('Math');

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
                    $self->set_property( x => $arguments->{x} );
                };
                do {
                    return if not defined $arguments->{y};
                    $self->set_property( y => $arguments->{y} );
                };
                return $return;
            };
        }

        # Method 'distanceTo' definition
        {
            my $func = $methods[1] = Ferret::Function->new(
                $f,
                name      => 'distanceTo',
                is_method => 1
            );
            $func->add_argument( name => 'pt2' );
            $func->{code} = sub {
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                do {
                    return if not defined $arguments->{pt2};
                    $scope->set_property( pt2 => $arguments->{pt2} );
                };
                $scope->set_property(
                    dx => _sub(
                        $scope,
                        $self->property('x'),
                        $scope->property('pt2')->property('x')
                    )
                );
                $scope->set_property(
                    dy => _sub(
                        $scope,
                        $self->property('y'),
                        $scope->property('pt2')->property('y')
                    )
                );
                return $scope->property('sqrt')->call(
                    [
                        add(
                            $scope,
                            pow( $scope, $scope->property('dx'), num( $f, 2 ) ),
                            pow( $scope, $scope->property('dy'), num( $f, 2 ) )
                        )
                    ],
                    $scope
                );
                return $return;
            };
        }

        # Method 'distanceFromOrigin' definition
        {
            my $func = $methods[2] = Ferret::Function->new(
                $f,
                name      => 'distanceFromOrigin',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
                return $self->property('distanceTo')->call(
                    [
                        $scope->{special}->property('class')
                          ->call( [ num( $f, 0 ), num( $f, 0 ) ], $scope )
                    ],
                    $scope
                );
                return $return;
            };
        }

        # Method 'pretty' definition
        {
            my $func = $methods[3] = Ferret::Function->new(
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
            my $func = $methods[4] = Ferret::Function->new(
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
                return $scope->{special}->property('class')->call(
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
        $methods[1]->inside_scope( distanceTo => $scope, $proto, $class );
        $methods[2]
          ->inside_scope( distanceFromOrigin => $scope, $proto, $class );
        $methods[3]->inside_scope( pretty   => $scope, $proto, $class );
        $methods[4]->inside_scope( midpoint => $scope, $class, $class );
    }
}
