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
#        BAREWORD | "dump"
#      PAREN_CALL | 
#        BAREWORD | "say"
#         PAREN_E | 
#         OP_SEMI | 
#      KEYWORD_ON | 
#        BAREWORD | "say"
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "twice"
#        OP_COMMA | 
#         VAR_LEX | "message"
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | [["VAR_LEX","message",102]," again"]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#      PROP_VALUE | "message"
#          STRING | ["test"]
#        OP_COMMA | 
#      PROP_VALUE | "twice"
#          NUMBER | "1"
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["okay"]
#        OP_COMMA | 
#          NUMBER | "1"
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
#      Instruction
#          Call
#              Bareword 'dump'
#              Structural list [1 items]
#                  Item 0
#                      Bareword 'say'
#      On
#          Expression ('on' parameter)
#              Bareword 'say'
#          Function 'callback'
#              Instruction
#                  Need
#                      Lexical variable '$twice'
#                      Comma (,)
#                      Lexical variable '$message'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Structural list [1 items]
#                          Item 0
#                              Mathematical operation
#                                  Lexical variable '$message'
#                                  Addition operator (+)
#                                  String ' again'
#      Instruction
#          Call
#              Bareword 'say'
#              Hash [2 items]
#                  Item 0
#                      Pair 'message'
#                          String 'test'
#                  Item 1
#                      Pair 'twice'
#                          Number '1'
#      Instruction
#          Call
#              Bareword 'say'
#              Structural list [2 items]
#                  Item 0
#                      String 'okay'
#                  Item 1
#                      Number '1'
#      Include (Math, Math::Point)
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

    # Function '+undef' definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, name => '+undef' );
        $func->add_argument( name => 'twice' );
        $func->add_argument( name => 'message' );
        $func->{code} = sub {
            my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
            do {
                return if not defined $arguments->{twice};
                $scope->set_property( twice => $arguments->{twice} );
            };
            do {
                return if not defined $arguments->{message};
                $scope->set_property( message => $arguments->{message} );
            };
            $scope->property('say')->call(
                [
                    add(
                        $scope, $scope->property('message'),
                        str( $f, " again" )
                    )
                ],
                $scope
            );
            return $return;
        };
    }
    Ferret::space( $context, $_ ) for qw(Math Math::Point);
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
    $scope->property('dump')->call( [ $scope->property('say') ], $scope );

    # On
    {
        my $on_func = do {
            $funcs[0]->inside_scope( +undef => $scope, $scope );
        };

        $scope->property('say')->add_function($on_func);
    }
    $scope->property('say')
      ->call( { message => str( $f, "test" ), twice => num( $f, 1 ) }, $scope );
    $scope->property('say')
      ->call( [ str( $f, "okay" ), num( $f, 1 ) ], $scope );
}
