# --- Tokens ---
#        FUNCTION | {"name":"makePoint"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "x"
#        OP_COMMA | 
#         VAR_LEX | "y"
#         OP_SEMI | 
#    KEYWORD_WANT | 
#         VAR_LEX | "z"
#         OP_SEMI | 
#         VAR_LEX | "point"
#       OP_ASSIGN | 
#       BRACKET_S | 
#      PROP_VALUE | "x"
#         VAR_LEX | "x"
#        OP_COMMA | 
#      PROP_VALUE | "y"
#         VAR_LEX | "y"
#       BRACKET_E | 
#         OP_SEMI | 
#        BAREWORD | "point"
#       OP_RETURN | 
#         VAR_LEX | "point"
#         OP_SEMI | 
#       CLOSURE_E | 
#         VAR_LEX | "pt"
#       OP_ASSIGN | 
#        BAREWORD | "makePoint"
#      PAREN_CALL | 
#          NUMBER | "5"
#        OP_COMMA | 
#          NUMBER | "3"
#         PAREN_E | 
#        PROPERTY | "point"
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Point("]
#          OP_ADD | 
#         VAR_LEX | "pt"
#        PROPERTY | "x"
#          OP_ADD | 
#          STRING | [","]
#          OP_ADD | 
#         VAR_LEX | "pt"
#        PROPERTY | "y"
#          OP_ADD | 
#          STRING | [")"]
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "numbers"
#       OP_ASSIGN | 
#       BRACKET_S | 
#          NUMBER | "1"
#        OP_COMMA | 
#          NUMBER | "2"
#        OP_COMMA | 
#          NUMBER | "3"
#        OP_COMMA | 
#          NUMBER | "4"
#        OP_COMMA | 
#          NUMBER | "4"
#          OP_ADD | 
#          NUMBER | "1"
#       BRACKET_E | 
#         OP_SEMI | 
#         VAR_LEX | "emptyArray"
#       OP_ASSIGN | 
#       BRACKET_S | 
#       BRACKET_E | 
#         OP_SEMI | 
#         VAR_LEX | "emptyHash"
#       OP_ASSIGN | 
#       BRACKET_S | 
#        OP_VALUE | 
#       BRACKET_E | 
#         OP_SEMI | 
# --- DOM ---
#  Document './hello4.frt'
#      Function 'makePoint'
#          Instruction
#              Need
#                  Lexical variable '$x'
#                  Lexical variable '$y'
#          Instruction
#              Want
#                  Lexical variable '$z'
#          Instruction
#              Assignment
#                  Lexical variable '$point'
#                  Hash [2 items]
#                      Item 0
#                          Pair 'x'
#                              Lexical variable '$x'
#                      Item 1
#                          Pair 'y'
#                              Lexical variable '$y'
#          Instruction
#              Return pair 'point'
#                  Lexical variable '$point'
#      Instruction
#          Assignment
#              Lexical variable '$pt'
#              Property 'point'
#                  Call
#                      Bareword 'makePoint'
#                      Structural list [2 items]
#                          Item 0
#                              Number '5'
#                          Item 1
#                              Number '3'
#      Instruction
#          Call
#              Bareword 'say'
#              Structural list [1 items]
#                  Item 0
#                      Mathematical operation
#                          String 'Point('
#                          Addition operator (+)
#                          Property 'x'
#                              Lexical variable '$pt'
#                          Addition operator (+)
#                          String ','
#                          Addition operator (+)
#                          Property 'y'
#                              Lexical variable '$pt'
#                          Addition operator (+)
#                          String ')'
#      Instruction
#          Assignment
#              Lexical variable '$numbers'
#              Value list [5 items]
#                  Item 0
#                      Number '1'
#                  Item 1
#                      Number '2'
#                  Item 2
#                      Number '3'
#                  Item 3
#                      Number '4'
#                  Item 4
#                      Mathematical operation
#                          Number '4'
#                          Addition operator (+)
#                          Number '1'
#      Instruction
#          Assignment
#              Lexical variable '$emptyArray'
#              Value list [0 items]
#      Instruction
#          Assignment
#              Lexical variable '$emptyHash'
#              Hash [0 items]
#!/usr/bin/perl

use warnings;
use strict;
use 5.010;
use lib 'lib';
use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello4.frt.pm'}++;

use Ferret::Core::Operations qw(add);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    Ferret::spaces( $context, qw() );

    # Function 'makePoint' definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, name => 'makePoint' );
        $func->add_argument( name => 'x' );
        $func->add_argument( name => 'y' );
        $func->add_argument( name => 'z', optional => 1 );
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
            $scope->set_property( z => $arguments->{z} );
            $scope->set_property(
                point => Ferret::Hash->new(
                    $f,
                    pairs => {
                        x => $scope->property('x'),
                        y => $scope->property('y')
                    }
                )
            );
            $return->set_property( point => $scope->property('point') );
            return $return;
        };
    }

    # Function 'makePoint'
    {
        $funcs[0]->{outer_scope} = $scope;
        $scope->set_property( makePoint => $funcs[0] );
    }
    $scope->set_property(
        pt => $scope->property('makePoint')->call(
            [
                Ferret::Number->new( $f, value => 5 ),
                Ferret::Number->new( $f, value => 3 )
            ],
            $scope
        )->property('point')
    );
    $scope->property('say')->call(
        [
            add(
                $scope,
                Ferret::String->new( $f, value => "Point(" ),
                $scope->property('pt')->property('x'),
                Ferret::String->new( $f, value => "," ),
                $scope->property('pt')->property('y'),
                Ferret::String->new( $f, value => ")" )
            )
        ],
        $scope
    );
    $scope->set_property(
        numbers => Ferret::List->new(
            $f,
            items => [
                Ferret::Number->new( $f, value => 1 ),
                Ferret::Number->new( $f, value => 2 ),
                Ferret::Number->new( $f, value => 3 ),
                Ferret::Number->new( $f, value => 4 ),
                add(
                    $scope,
                    Ferret::Number->new( $f, value => 4 ),
                    Ferret::Number->new( $f, value => 1 )
                )
            ]
        )
    );
    $scope->set_property( emptyArray => Ferret::List->new( $f, items => [] ) );
    $scope->set_property( emptyHash  => Ferret::Hash->new( $f, pairs => {} ) );
}
