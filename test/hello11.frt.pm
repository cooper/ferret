# === Tokenization ===
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
#          STRING | ["The point exists!"]
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "inspect"
#      PAREN_CALL | 
#         VAR_LEX | "point"
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
#          STRING | ["Point: ",["VAR_LEX","point",14]]
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
#      KEYWORD_IF | 
#         VAR_LEX | "twice"
#        OP_VALUE | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | [["VAR_LEX","message",19]," again"]
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "didTwice"
#       OP_RETURN | 
#         VAR_LEX | "twice"
#         OP_SEMI | 
#       CLOSURE_E | 
#         VAR_LEX | "r"
#       OP_ASSIGN | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#      PROP_VALUE | "message"
#          STRING | ["It was said"]
#        OP_COMMA | 
#      PROP_VALUE | "twice"
#    KEYWORD_TRUE | 
#         PAREN_E | 
#         OP_SEMI | 
#      KEYWORD_IF | 
#         VAR_LEX | "r"
#        PROPERTY | "didTwice"
#        OP_VALUE | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Did the first one twice!"]
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["this should ignore the second parameter"]
#        OP_COMMA | 
#    KEYWORD_TRUE | 
#         PAREN_E | 
#         OP_SEMI | 
# === Document Model ===
#  Document './test/hello11.frt'
#      Instruction
#          Assignment (lexical variable '$point')
#              Call
#                  Bareword 'Math::Point'
#                  Argument list [2 items]
#                      Item 0
#                          Number '0'
#                      Item 1
#                          Number '0'
#      If
#          Expression ('if' parameter)
#              Lexical variable '$point'
#          Body ('if' scope)
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Argument list [1 items]
#                          Item 0
#                              String 'The point ...'
#              Instruction
#                  Call
#                      Bareword 'inspect'
#                      Argument list [1 items]
#                          Item 0
#                              Lexical variable '$point'
#      Inside
#          Expression ('inside' parameter)
#              Lexical variable '$point'
#          Body ('inside' scope)
#              Instruction
#                  Assignment (lexical variable '$x')
#                      Number '5'
#              Instruction
#                  Assignment (lexical variable '$y')
#                      Number '10'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Point: '
#                          Addition operator (+)
#                          Lexical variable '$point'
#      On
#          Expression ('on' parameter)
#              Bareword 'say'
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$twice'
#                  Instruction
#                      Need
#                          Lexical variable '$message'
#                  If
#                      Expression ('if' parameter)
#                          Lexical variable '$twice'
#                      Body ('if' scope)
#                          Instruction
#                              Call
#                                  Bareword 'say'
#                                  Argument list [1 items]
#                                      Item 0
#                                          Operation
#                                              Lexical variable '$message'
#                                              Addition operator (+)
#                                              String ' again'
#                  Instruction
#                      Return pair 'didTwice'
#                          Lexical variable '$twice'
#      Instruction
#          Assignment (lexical variable '$r')
#              Call
#                  Bareword 'say'
#                  Named argument list [2 items]
#                      Item 0
#                          Pair 'message'
#                              String 'It was said'
#                      Item 1
#                          Pair 'twice'
#                              Boolean true
#      If
#          Expression ('if' parameter)
#              Property 'didTwice'
#                  Lexical variable '$r'
#          Body ('if' scope)
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Argument list [1 items]
#                          Item 0
#                              String 'Did the fi...'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [2 items]
#                  Item 0
#                      String 'this shoul...'
#                  Item 1
#                      Boolean true
#      Include (Math, Math::Point)
use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('hello11.frt');

use Ferret::Core::Operations qw(add bool num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, $scope, undef,
        [
            {
                name     => 'twice',
                type     => undef,
                optional => undef,
                more     => undef
            },
            {
                name     => 'message',
                type     => undef,
                optional => undef,
                more     => undef
            }
        ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'twice',   16.4 ) or return;
            FF::need( $scope, $arguments, 'message', 16.8 ) or return;
            if ( bool( $scope->property_u('twice') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('say')->call_u(
                    [
                        add(
                            $scope,
                            $scope->property_u('message'),
                            str( $f, " again" )
                        )
                    ],
                    $scope, undef, 18.4
                );
            }
            $return->set_property(
                didTwice => $scope->property_u('twice'),
                19.5
            );
            return $return;
        }
    );
    FF::load_namespaces( $context, qw(Math Math::Point) );
    $scope->set_property_ow(
        $context,
        point => $scope->property_u('Math::Point')
          ->call_u( [ num( $f, 0 ), num( $f, 0 ) ], $scope, undef, 1.54545 ),
        1.18182
    );
    if ( bool( $scope->property_u('point') ) ) {
        my $scope = Ferret::Scope->new( $f, parent => $scope );

        $scope->property_u('say')
          ->call_u( [ str( $f, "The point exists!" ) ], $scope, undef, 4.4 );
        $scope->property_u('inspect')
          ->call_u( [ $scope->property_u('point') ], $scope, undef, 5.4 );
    }

    # Inside
    FF::inside(
        $f, $scope,
        $scope->property_u('point'),
        sub {
            my $scope = shift;
            $scope->set_property_ow( $context, x => num( $f, 5 ),  9.5 );
            $scope->set_property_ow( $context, y => num( $f, 10 ), 10.5 );
        }
    );
    $scope->property_u('say')
      ->call_u(
        [ add( $scope, str( $f, "Point: " ), $scope->property_u('point') ) ],
        $scope, undef, 13.4 );
    FF::on(
        $scope,
        'say',
        $self,
        $scope,
        $func_0->inside_scope( (undef) => $scope, $scope, undef, undef, undef ),
        {}
    );
    $scope->set_property_ow(
        $context,
        r => $scope->property_u('say')->call_u(
            { message => str( $f, "It was said" ), twice => $true }, $scope,
            undef, 22.36364
        ),
        22.18182
    );
    if ( bool( $scope->property_u('r')->property_u('didTwice') ) ) {
        my $scope = Ferret::Scope->new( $f, parent => $scope );

        $scope->property_u('say')
          ->call_u( [ str( $f, "Did the first one twice!" ) ],
            $scope, undef, 25.4 );
    }
    $scope->property_u('say')
      ->call_u( [ str( $f, "this should ignore the second parameter" ), $true ],
        $scope, undef, 27.28571 );
};

FF::after_content();
