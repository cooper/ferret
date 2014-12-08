# --- Tokens ---
#         PKG_DEC | {"name":"Math"}
#       CLASS_DEC | {"name":"Point"}
#          METHOD | {"name":"_init_","main":1}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "x"
#        OP_COMMA | 
#         VAR_LEX | "y"
#         OP_SEMI | 
#        VAR_THIS | "x"
#       OP_ASSIGN | 
#         VAR_LEX | "x"
#         OP_SEMI | 
#        VAR_THIS | "y"
#       OP_ASSIGN | 
#         VAR_LEX | "y"
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"oneToRight","main":null}
#       CLOSURE_S | 
#         VAR_LEX | "pt"
#       OP_ASSIGN | 
#        VAR_SPEC | "class"
#      PAREN_CALL | 
#        VAR_THIS | "x"
#          OP_ADD | 
#          NUMBER | "1"
#        OP_COMMA | 
#        VAR_THIS | "y"
#         PAREN_E | 
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#         VAR_LEX | "pt"
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"main":null,"name":"pretty"}
#       CLOSURE_S | 
#  KEYWORD_RETURN | 
#         PAREN_S | 
#          STRING | ["(",["VAR_THIS","x",102],", ",["VAR_THIS","y",102],")"]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"midpoint","main":"1"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "pt1"
#        OP_COMMA | 
#         VAR_LEX | "pt2"
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#        BAREWORD | "Point"
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
#  Document './hello7/Math/Point.frt'
#      Package 'Math'
#      Class 'Point'
#          Main method '_init_'
#              Instruction
#                  Need
#                      Lexical variable '$x'
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
#!/usr/bin/perl

use warnings;
use strict;
use 5.010;
use lib 'lib';
use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'Point.frt.pm'}++;

use Ferret::Core::Operations qw(add div);
{
    my @funcs;
    my $scope = my $context = $f->get_context('Math');
    Ferret::spaces( $context, qw(Math::Point) );

    # Class 'Point'
    {
        my @methods;
        my $class = my $self = Ferret::Class->new(
            $f,
            name    => 'Point',
            version => undef
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
    }
}
