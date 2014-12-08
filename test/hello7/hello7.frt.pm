# --- Tokens ---
#         VAR_LEX | "rect"
#       OP_ASSIGN | 
#        BAREWORD | "Math"
#         OP_PACK | 
#        BAREWORD | "Rect"
#      PAREN_CALL | 
#      PROP_VALUE | "x"
#          NUMBER | "5"
#        OP_COMMA | 
#      PROP_VALUE | "y"
#          NUMBER | "4"
#        OP_COMMA | 
#      PROP_VALUE | "width"
#          NUMBER | "12"
#        OP_COMMA | 
#      PROP_VALUE | "height"
#          NUMBER | "10"
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "center"
#       OP_ASSIGN | 
#         VAR_LEX | "rect"
#        PROPERTY | "center"
#         OP_CALL | 
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Center of rect: "]
#          OP_ADD | 
#         VAR_LEX | "center"
#        PROPERTY | "pretty"
#         OP_CALL | 
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "otherPt"
#       OP_ASSIGN | 
#        BAREWORD | "Math"
#         OP_PACK | 
#        BAREWORD | "Point"
#      PAREN_CALL | 
#          NUMBER | "9"
#        OP_COMMA | 
#          NUMBER | "2"
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "midpoint"
#       OP_ASSIGN | 
#        BAREWORD | "Math"
#         OP_PACK | 
#        BAREWORD | "Point"
#        PROPERTY | "midpoint"
#      PAREN_CALL | 
#         VAR_LEX | "center"
#        OP_COMMA | 
#         VAR_LEX | "otherPt"
#         PAREN_E | 
#        PROPERTY | "pretty"
#         OP_CALL | 
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Midpoint: ",["VAR_LEX","midpoint",86]]
#         PAREN_E | 
#         OP_SEMI | 
# --- DOM ---
#  Document './hello7/hello7.frt'
#      Instruction
#          Assignment
#              Lexical variable '$rect'
#              Call
#                  Bareword 'Math::Rect'
#                  Hash [4 items]
#                      Item 0
#                          Pair 'x'
#                              Number '5'
#                      Item 1
#                          Pair 'y'
#                              Number '4'
#                      Item 2
#                          Pair 'width'
#                              Number '12'
#                      Item 3
#                          Pair 'height'
#                              Number '10'
#      Instruction
#          Assignment
#              Lexical variable '$center'
#              Call
#                  Property 'center'
#                      Lexical variable '$rect'
#      Instruction
#          Call
#              Bareword 'say'
#              Structural list [1 items]
#                  Item 0
#                      Mathematical operation
#                          String 'Center of ...'
#                          Addition operator (+)
#                          Call
#                              Property 'pretty'
#                                  Lexical variable '$center'
#      Instruction
#          Assignment
#              Lexical variable '$otherPt'
#              Call
#                  Bareword 'Math::Point'
#                  Structural list [2 items]
#                      Item 0
#                          Number '9'
#                      Item 1
#                          Number '2'
#      Instruction
#          Assignment
#              Lexical variable '$midpoint'
#              Call
#                  Property 'pretty'
#                      Call
#                          Property 'midpoint'
#                              Bareword 'Math::Point'
#                          Structural list [2 items]
#                              Item 0
#                                  Lexical variable '$center'
#                              Item 1
#                                  Lexical variable '$otherPt'
#      Instruction
#          Call
#              Bareword 'say'
#              Structural list [1 items]
#                  Item 0
#                      Mathematical operation
#                          String 'Midpoint: '
#                          Addition operator (+)
#                          Lexical variable '$midpoint'
#!/usr/bin/perl

use warnings;
use strict;
use 5.010;
use lib 'lib';
use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello7.frt.pm'}++;

use Ferret::Core::Operations qw(add);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    Ferret::spaces( $context, qw(Math::Rect Math::Point) );

    $scope->set_property(
        rect => $scope->property('Math::Rect')->call(
            {
                x      => Ferret::Number->new( $f, value => 5 ),
                y      => Ferret::Number->new( $f, value => 4 ),
                width  => Ferret::Number->new( $f, value => 12 ),
                height => Ferret::Number->new( $f, value => 10 )
            },
            $scope
        )
    );
    $scope->set_property( center =>
          $scope->property('rect')->property('center')->call( [], $scope ) );
    $scope->property('say')->call(
        [
            add(
                $scope,
                Ferret::String->new( $f, value => "Center of rect: " ),
                $scope->property('center')->property('pretty')
                  ->call( [], $scope )
            )
        ],
        $scope
    );
    $scope->set_property(
        otherPt => $scope->property('Math::Point')->call(
            [
                Ferret::Number->new( $f, value => 9 ),
                Ferret::Number->new( $f, value => 2 )
            ],
            $scope
        )
    );
    $scope->set_property(
        midpoint => $scope->property('Math::Point')->property('midpoint')
          ->call( [ $scope->property('center'), $scope->property('otherPt') ],
            $scope )->property('pretty')->call( [], $scope )
    );
    $scope->property('say')->call(
        [
            add(
                $scope,
                Ferret::String->new( $f, value => "Midpoint: " ),
                $scope->property('midpoint')
            )
        ],
        $scope
    );
}
