# === Tokenization ===
#         VAR_LEX |                        "point" | 1.08333
#       OP_ASSIGN |                                | 1.16667
#        BAREWORD |                         "Math" | 1.25
#         OP_PACK |                                | 1.33333
#        BAREWORD |                        "Point" | 1.41667
#      PAREN_CALL |                                | 1.5
#          NUMBER |                            "0" | 1.58333
#        OP_COMMA |                                | 1.66667
#          NUMBER |                            "0" | 1.75
#         PAREN_E |                                | 1.83333
#         OP_SEMI |                                | 1.91667
#      KEYWORD_IF |                                | 3.25
#         VAR_LEX |                        "point" | 3.5
#       CLOSURE_S |                                | 3.75
#        BAREWORD |                          "say" | 4.16667
#      PAREN_CALL |                                | 4.33333
#          STRING |          ["The point exists!"] | 4.5
#         PAREN_E |                                | 4.66667
#         OP_SEMI |                                | 4.83333
#        BAREWORD |                      "inspect" | 5.16667
#      PAREN_CALL |                                | 5.33333
#         VAR_LEX |                        "point" | 5.5
#         PAREN_E |                                | 5.66667
#         OP_SEMI |                                | 5.83333
#       CLOSURE_E |                                | 6.5
#  KEYWORD_INSIDE |                                | 8.25
#         VAR_LEX |                        "point" | 8.5
#       CLOSURE_S |                                | 8.75
#         VAR_LEX |                            "x" | 9.2
#       OP_ASSIGN |                                | 9.4
#          NUMBER |                            "5" | 9.6
#         OP_SEMI |                                | 9.8
#         VAR_LEX |                            "y" | 10.2
#       OP_ASSIGN |                                | 10.4
#          NUMBER |                           "10" | 10.6
#         OP_SEMI |                                | 10.8
#       CLOSURE_E |                                | 11.5
#        BAREWORD |                          "say" | 13.16667
#      PAREN_CALL |                                | 13.33333
#          STRING | ["Point: ",["VAR_LEX","point",13]] | 13.5
#         PAREN_E |                                | 13.66667
#         OP_SEMI |                                | 13.83333
#      KEYWORD_ON |                                | 15.25
#        BAREWORD |                          "say" | 15.5
#       CLOSURE_S |                                | 15.75
#    KEYWORD_NEED |                                | 16.16667
#         VAR_LEX |                        "twice" | 16.33333
#        OP_COMMA |                                | 16.5
#         VAR_LEX |                      "message" | 16.66667
#         OP_SEMI |                                | 16.83333
#      KEYWORD_IF |                                | 17.25
#         VAR_LEX |                        "twice" | 17.5
#        OP_VALUE |                                | 17.75
#        BAREWORD |                          "say" | 18.16667
#      PAREN_CALL |                                | 18.33333
#          STRING | [["VAR_LEX","message",18]," again"] | 18.5
#         PAREN_E |                                | 18.66667
#         OP_SEMI |                                | 18.83333
#        BAREWORD |                     "didTwice" | 19.2
#       OP_RETURN |                                | 19.4
#         VAR_LEX |                        "twice" | 19.6
#         OP_SEMI |                                | 19.8
#       CLOSURE_E |                                | 20.5
#         VAR_LEX |                            "r" | 22.08333
#       OP_ASSIGN |                                | 22.16667
#        BAREWORD |                          "say" | 22.25
#      PAREN_CALL |                                | 22.33333
#      PROP_VALUE |                      "message" | 22.41667
#          STRING |                ["It was said"] | 22.5
#        OP_COMMA |                                | 22.58333
#      PROP_VALUE |                        "twice" | 22.66667
#    KEYWORD_TRUE |                                | 22.75
#         PAREN_E |                                | 22.83333
#         OP_SEMI |                                | 22.91667
#      KEYWORD_IF |                                | 24.2
#         VAR_LEX |                            "r" | 24.4
#        PROPERTY |                     "didTwice" | 24.6
#        OP_VALUE |                                | 24.8
#        BAREWORD |                          "say" | 25.16667
#      PAREN_CALL |                                | 25.33333
#          STRING |   ["Did the first one twice!"] | 25.5
#         PAREN_E |                                | 25.66667
#         OP_SEMI |                                | 25.83333
#        BAREWORD |                          "say" | 27.125
#      PAREN_CALL |                                | 27.25
#          STRING | ["this should ignore the second parameter"] | 27.375
#        OP_COMMA |                                | 27.5
#    KEYWORD_TRUE |                                | 27.625
#         PAREN_E |                                | 27.75
#         OP_SEMI |                                | 27.875
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
            FF::need( $scope, $arguments, 'twice',   16.33333 ) or return;
            FF::need( $scope, $arguments, 'message', 16.66667 ) or return;
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
                    $scope, undef, 18.33333
                );
            }
            $return->set_property(
                didTwice => $scope->property_u('twice'),
                19.4
            );
            return $return;
        }
    );
    FF::load_namespaces( $context, qw(Math Math::Point) );
    $scope->set_property_ow(
        $context,
        point => $scope->property_u('Math::Point')
          ->call_u( [ num( $f, 0 ), num( $f, 0 ) ], $scope, undef, 1.5 ),
        1.16667
    );
    if ( bool( $scope->property_u('point') ) ) {
        my $scope = Ferret::Scope->new( $f, parent => $scope );

        $scope->property_u('say')
          ->call_u( [ str( $f, "The point exists!" ) ], $scope, undef,
            4.33333 );
        $scope->property_u('inspect')
          ->call_u( [ $scope->property_u('point') ], $scope, undef, 5.33333 );
    }

    # Inside
    FF::inside(
        $f, $scope,
        $scope->property_u('point'),
        sub {
            my $scope = shift;
            $scope->set_property_ow( $context, x => num( $f, 5 ),  9.4 );
            $scope->set_property_ow( $context, y => num( $f, 10 ), 10.4 );
        }
    );
    $scope->property_u('say')
      ->call_u(
        [ add( $scope, str( $f, "Point: " ), $scope->property_u('point') ) ],
        $scope, undef, 13.33333 );
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
            undef, 22.33333
        ),
        22.16667
    );
    if ( bool( $scope->property_u('r')->property_u('didTwice') ) ) {
        my $scope = Ferret::Scope->new( $f, parent => $scope );

        $scope->property_u('say')
          ->call_u( [ str( $f, "Did the first one twice!" ) ],
            $scope, undef, 25.33333 );
    }
    $scope->property_u('say')
      ->call_u( [ str( $f, "this should ignore the second parameter" ), $true ],
        $scope, undef, 27.25 );
};

FF::after_content();
