# --- Tokens ---
#       CLASS_DEC | {"name":"Point","version":"1.0"}
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
#          METHOD | {"name":"pretty","main":null}
#       CLOSURE_S | 
#  KEYWORD_RETURN | 
#         PAREN_S | 
#          STRING | ["(",["VAR_THIS","x",157],", ",["VAR_THIS","y",157],")"]
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
#         VAR_LEX | "pt"
#       OP_ASSIGN | 
#        BAREWORD | "Point"
#      PAREN_CALL | 
#          NUMBER | "5"
#        OP_COMMA | 
#          NUMBER | "3"
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Point"]
#          OP_ADD | 
#         VAR_LEX | "pt"
#        PROPERTY | "pretty"
#         OP_CALL | 
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "rpt"
#       OP_ASSIGN | 
#         VAR_LEX | "pt"
#        PROPERTY | "oneToRight"
#         OP_CALL | 
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Right"]
#          OP_ADD | 
#         VAR_LEX | "rpt"
#        PROPERTY | "pretty"
#         OP_CALL | 
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "mdpt"
#       OP_ASSIGN | 
#        BAREWORD | "Point"
#        PROPERTY | "midpoint"
#      PAREN_CALL | 
#         VAR_LEX | "pt"
#        OP_COMMA | 
#         VAR_LEX | "rpt"
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Midpoint"]
#          OP_ADD | 
#         VAR_LEX | "mdpt"
#        PROPERTY | "pretty"
#         OP_CALL | 
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "nineteen"
#       OP_ASSIGN | 
#          NUMBER | "4"
#          OP_ADD | 
#          NUMBER | "45"
#          OP_DIV | 
#          NUMBER | "3"
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Nineteen: ",["VAR_LEX","nineteen",178]]
#         PAREN_E | 
#         OP_SEMI | 
# --- DOM ---
#  Document './test/hello5.frt'
#      Class 'Point' version 1.0
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
#          Instruction
#              Assignment
#                  Lexical variable '$pt'
#                  Call
#                      Bareword 'Point'
#                      Structural list [2 items]
#                          Item 0
#                              Number '5'
#                          Item 1
#                              Number '3'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Structural list [1 items]
#                      Item 0
#                          Mathematical operation
#                              String 'Point'
#                              Addition operator (+)
#                              Call
#                                  Property 'pretty'
#                                      Lexical variable '$pt'
#          Instruction
#              Assignment
#                  Lexical variable '$rpt'
#                  Call
#                      Property 'oneToRight'
#                          Lexical variable '$pt'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Structural list [1 items]
#                      Item 0
#                          Mathematical operation
#                              String 'Right'
#                              Addition operator (+)
#                              Call
#                                  Property 'pretty'
#                                      Lexical variable '$rpt'
#          Instruction
#              Assignment
#                  Lexical variable '$mdpt'
#                  Call
#                      Property 'midpoint'
#                          Bareword 'Point'
#                      Structural list [2 items]
#                          Item 0
#                              Lexical variable '$pt'
#                          Item 1
#                              Lexical variable '$rpt'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Structural list [1 items]
#                      Item 0
#                          Mathematical operation
#                              String 'Midpoint'
#                              Addition operator (+)
#                              Call
#                                  Property 'pretty'
#                                      Lexical variable '$mdpt'
#          Instruction
#              Assignment
#                  Lexical variable '$nineteen'
#                  Mathematical operation
#                      Number '4'
#                      Addition operator (+)
#                      Number '45'
#                      Division operator (/)
#                      Number '3'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Structural list [1 items]
#                      Item 0
#                          Mathematical operation
#                              String 'Nineteen: '
#                              Addition operator (+)
#                              Lexical variable '$nineteen'
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
$Ferret::tried_files{'hello5.frt.pm'}++;

use Ferret::Core::Operations qw(add div num str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

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
    Ferret::space( $context, $_ ) for qw(Point);
}
