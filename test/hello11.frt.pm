# --- Tokens ---
#         VAR_LEX | "point"
#       OP_ASSIGN | 
#        BAREWORD | "Math"
#         OP_PACK | 
#        BAREWORD | "Point"
#      PAREN_CALL | 
#          NUMBER | "0"
#        OP_COMMA | 
#          NUMBER | "0"
#         PAREN_E | 
#         OP_SEMI | 
#      KEYWORD_IF | 
#         VAR_LEX | "point"
#       CLOSURE_S | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["It exists!"]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#  KEYWORD_INSIDE | 
#         VAR_LEX | "point"
#       CLOSURE_S | 
#         VAR_LEX | "x"
#       OP_ASSIGN | 
#          NUMBER | "5"
#         OP_SEMI | 
#         VAR_LEX | "y"
#       OP_ASSIGN | 
#          NUMBER | "10"
#         OP_SEMI | 
#       CLOSURE_E | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Point: "]
#          OP_ADD | 
#         VAR_LEX | "point"
#        PROPERTY | "pretty"
#         OP_CALL | 
#         PAREN_E | 
#         OP_SEMI | 
# --- DOM ---
#  Document './test/hello11.frt'
#      Instruction
#          Assignment
#              Lexical variable '$point'
#              Call
#                  Bareword 'Math::Point'
#                  Structural list [2 items]
#                      Item 0
#                          Number '0'
#                      Item 1
#                          Number '0'
#      If
#          Expression ('if' parameter)
#              Lexical variable '$point'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Structural list [1 items]
#                      Item 0
#                          String 'It exists!'
#      Inside
#          Expression ('inside' parameter)
#              Lexical variable '$point'
#          Instruction
#              Assignment
#                  Lexical variable '$x'
#                  Number '5'
#          Instruction
#              Assignment
#                  Lexical variable '$y'
#                  Number '10'
#      Instruction
#          Call
#              Bareword 'say'
#              Structural list [1 items]
#                  Item 0
#                      Mathematical operation
#                          String 'Point: '
#                          Addition operator (+)
#                          Call
#                              Property 'pretty'
#                                  Lexical variable '$point'
#      Include (Math::Point, Math)
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
$Ferret::tried_files{'hello11.frt.pm'}++;

use Ferret::Core::Operations qw(add bool num str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    Ferret::space( $context, $_ ) for qw(Math::Point Math);
    $scope->set_property( point => $scope->property('Math::Point')
          ->call( [ num( $f, 0 ), num( $f, 0 ) ], $scope ) );
    if ( bool( $scope->property('point') ) ) {
        my $scope = Ferret::Scope->new( $f, parent => $scope );

        $scope->property('say')->call( [ str( $f, "It exists!" ) ], $scope );
    }

    # Inside
    {
        my $outer_scope = $scope;
        my $scope       = $scope->property('point');
        $scope->add_parent($outer_scope);

        $scope->set_property( x => num( $f, 5 ) );
        $scope->set_property( y => num( $f, 10 ) );

        $scope->remove_parent($outer_scope);
    }
    $scope->property('say')->call(
        [
            add(
                $scope,
                str( $f, "Point: " ),
                $scope->property('point')->property('pretty')
                  ->call( [], $scope )
            )
        ],
        $scope
    );
}
