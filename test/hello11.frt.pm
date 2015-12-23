# === Tokenization ===
#         VAR_LEX |                        "point" | 1.05
#       OP_ASSIGN |                                | 1.1
#        BAREWORD |                         "Math" | 1.15
#         OP_PACK |                                | 1.2
#        BAREWORD |                        "Point" | 1.25
#      PAREN_CALL |                                | 1.3
#          NUMBER |                            "0" | 1.35
#        OP_COMMA |                                | 1.4
#          NUMBER |                            "0" | 1.45
#         PAREN_E |                                | 1.5
#         OP_SEMI |                              1 | 1.55
#      KEYWORD_IF |                                | 3.1
#         VAR_LEX |                        "point" | 3.2
#       CLOSURE_S |                                | 3.3
#        BAREWORD |                          "say" | 4.1
#      PAREN_CALL |                                | 4.2
#          STRING |          ["The point exists!"] | 4.3
#         PAREN_E |                                | 4.4
#         OP_SEMI |                              1 | 4.5
#        BAREWORD |                      "inspect" | 5.1
#      PAREN_CALL |                                | 5.2
#         VAR_LEX |                        "point" | 5.3
#         PAREN_E |                                | 5.4
#         OP_SEMI |                              1 | 5.5
#       CLOSURE_E |                                | 6.1
#  KEYWORD_INSIDE |                                | 8.1
#         VAR_LEX |                        "point" | 8.2
#       CLOSURE_S |                                | 8.3
#         VAR_LEX |                            "x" | 9.1
#       OP_ASSIGN |                                | 9.2
#          NUMBER |                            "5" | 9.3
#         OP_SEMI |                              1 | 9.4
#         VAR_LEX |                            "y" | 10.1
#       OP_ASSIGN |                                | 10.2
#          NUMBER |                           "10" | 10.3
#         OP_SEMI |                              1 | 10.4
#       CLOSURE_E |                                | 11.1
#        BAREWORD |                          "say" | 13.1
#      PAREN_CALL |                                | 13.2
#          STRING | ["Point: ",["VAR_LEX","point",13]] | 13.3
#         PAREN_E |                                | 13.4
#         OP_SEMI |                              1 | 13.5
#      KEYWORD_ON |                                | 15.1
#        BAREWORD |                          "say" | 15.2
#       CLOSURE_S |                                | 15.3
#    KEYWORD_NEED |                                | 16.1
#         VAR_LEX |                        "twice" | 16.2
#        OP_COMMA |                                | 16.3
#         VAR_LEX |                      "message" | 16.4
#         OP_SEMI |                              1 | 16.5
#      KEYWORD_IF |                                | 17.1
#         VAR_LEX |                        "twice" | 17.2
#        OP_VALUE |                                | 17.3
#        BAREWORD |                          "say" | 18.1
#      PAREN_CALL |                                | 18.2
#          STRING | [["VAR_LEX","message",18]," again"] | 18.3
#         PAREN_E |                                | 18.4
#         OP_SEMI |                              1 | 18.5
#        BAREWORD |                     "didTwice" | 19.1
#       OP_RETURN |                                | 19.2
#         VAR_LEX |                        "twice" | 19.3
#         OP_SEMI |                              1 | 19.4
#       CLOSURE_E |                                | 20.1
#         VAR_LEX |                            "r" | 22.05
#       OP_ASSIGN |                                | 22.1
#        BAREWORD |                          "say" | 22.15
#      PAREN_CALL |                                | 22.2
#      PROP_VALUE |                      "message" | 22.25
#          STRING |                ["It was said"] | 22.3
#        OP_COMMA |                                | 22.35
#      PROP_VALUE |                        "twice" | 22.4
#    KEYWORD_TRUE |                                | 22.45
#         PAREN_E |                                | 22.5
#         OP_SEMI |                              1 | 22.55
#      KEYWORD_IF |                                | 24.1
#         VAR_LEX |                            "r" | 24.2
#        PROPERTY |                     "didTwice" | 24.3
#        OP_VALUE |                                | 24.4
#        BAREWORD |                          "say" | 25.1
#      PAREN_CALL |                                | 25.2
#          STRING |   ["Did the first one twice!"] | 25.3
#         PAREN_E |                                | 25.4
#         OP_SEMI |                              1 | 25.5
#        BAREWORD |                          "say" | 27.1
#      PAREN_CALL |                                | 27.2
#          STRING | ["this should ignore the second parameter"] | 27.3
#        OP_COMMA |                                | 27.4
#    KEYWORD_TRUE |                                | 27.5
#         PAREN_E |                                | 27.6
#         OP_SEMI |                              1 | 27.7
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
            FF::need( $scope, $arguments, 'twice',   16.2 ) or return;
            FF::need( $scope, $arguments, 'message', 16.4 ) or return;
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
                    $scope, undef, 18.2
                );
            }
            $return->set_property(
                didTwice => $scope->property_u('twice'),
                19.2
            );
            return $return;
        }
    );
    FF::load_namespaces( $context, qw(Math Math::Point) );
    $scope->set_property_ow(
        $context,
        point => $scope->property_u('Math::Point')
          ->call_u( [ num( $f, 0 ), num( $f, 0 ) ], $scope, undef, 1.3 ),
        1.1
    );
    if ( bool( $scope->property_u('point') ) ) {
        my $scope = Ferret::Scope->new( $f, parent => $scope );

        $scope->property_u('say')
          ->call_u( [ str( $f, "The point exists!" ) ], $scope, undef, 4.2 );
        $scope->property_u('inspect')
          ->call_u( [ $scope->property_u('point') ], $scope, undef, 5.2 );
    }

    # Inside
    FF::inside(
        $f, $scope,
        $scope->property_u('point'),
        sub {
            my $scope = shift;
            $scope->set_property_ow( $context, x => num( $f, 5 ),  9.2 );
            $scope->set_property_ow( $context, y => num( $f, 10 ), 10.2 );
        }
    );
    $scope->property_u('say')
      ->call_u(
        [ add( $scope, str( $f, "Point: " ), $scope->property_u('point') ) ],
        $scope, undef, 13.2 );
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
            undef, 22.2
        ),
        22.1
    );
    if ( bool( $scope->property_u('r')->property_u('didTwice') ) ) {
        my $scope = Ferret::Scope->new( $f, parent => $scope );

        $scope->property_u('say')
          ->call_u( [ str( $f, "Did the first one twice!" ) ],
            $scope, undef, 25.2 );
    }
    $scope->property_u('say')
      ->call_u( [ str( $f, "this should ignore the second parameter" ), $true ],
        $scope, undef, 27.2 );
};

FF::after_content();
