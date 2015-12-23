# === Tokenization ===
#        FUNCTION |           {"name":"makePoint"} | 1.1
#       CLOSURE_S |                                | 1.2
#    KEYWORD_NEED |                                | 2.1
#         VAR_LEX |                            "x" | 2.2
#        OP_COMMA |                                | 2.3
#         VAR_LEX |                            "y" | 2.4
#         OP_SEMI |                              1 | 2.5
#    KEYWORD_WANT |                                | 3.1
#         VAR_LEX |                            "z" | 3.2
#         OP_SEMI |                              1 | 3.3
#         VAR_LEX |                        "point" | 4.1
#       OP_ASSIGN |                                | 4.2
#         PAREN_S |                                | 4.3
#      PROP_VALUE |                            "x" | 5.1
#         VAR_LEX |                            "x" | 5.2
#        OP_COMMA |                                | 5.3
#      PROP_VALUE |                            "y" | 6.1
#         VAR_LEX |                            "y" | 6.2
#         OP_SEMI |                              1 | 6.3
#         PAREN_E |                                | 7.1
#         OP_SEMI |                              1 | 7.2
#        BAREWORD |                        "point" | 8.1
#       OP_RETURN |                                | 8.2
#         VAR_LEX |                        "point" | 8.3
#         OP_SEMI |                              1 | 8.4
#       CLOSURE_E |                                | 9.1
#         VAR_LEX |                           "pt" | 11.05
#       OP_ASSIGN |                                | 11.1
#        BAREWORD |                    "makePoint" | 11.15
#      PAREN_CALL |                                | 11.2
#          NUMBER |                            "5" | 11.25
#        OP_COMMA |                                | 11.3
#          NUMBER |                            "3" | 11.35
#         PAREN_E |                                | 11.4
#        PROPERTY |                        "point" | 11.45
#         OP_SEMI |                              1 | 11.5
#        BAREWORD |                          "say" | 12.05
#      PAREN_CALL |                                | 12.1
#          STRING |                     ["Point("] | 12.15
#          OP_ADD |                                | 12.2
#         VAR_LEX |                           "pt" | 12.25
#        PROPERTY |                            "x" | 12.3
#          OP_ADD |                                | 12.35
#          STRING |                         [", "] | 12.4
#          OP_ADD |                                | 12.45
#         VAR_LEX |                           "pt" | 12.5
#        PROPERTY |                            "y" | 12.55
#          OP_ADD |                                | 12.6
#          STRING |                          [")"] | 12.65
#         PAREN_E |                                | 12.7
#         OP_SEMI |                              1 | 12.75
#         VAR_LEX |                      "numbers" | 14.05
#       OP_ASSIGN |                                | 14.1
#       BRACKET_S |                                | 14.15
#          NUMBER |                            "1" | 14.2
#        OP_COMMA |                                | 14.25
#          NUMBER |                            "2" | 14.3
#        OP_COMMA |                                | 14.35
#          NUMBER |                            "3" | 14.4
#        OP_COMMA |                                | 14.45
#          NUMBER |                            "4" | 14.5
#        OP_COMMA |                                | 14.55
#          NUMBER |                            "4" | 14.6
#          OP_ADD |                                | 14.65
#          NUMBER |                            "1" | 14.7
#       BRACKET_E |                                | 14.75
#         OP_SEMI |                              1 | 14.8
#         VAR_LEX |                   "emptyArray" | 16.1
#       OP_ASSIGN |                                | 16.2
#       BRACKET_S |                                | 16.3
#       BRACKET_E |                                | 16.4
#         OP_SEMI |                              1 | 16.5
#         VAR_LEX |                    "emptyHash" | 17.1
#       OP_ASSIGN |                                | 17.2
#       BRACKET_S |                                | 17.3
#        OP_VALUE |                                | 17.4
#       BRACKET_E |                                | 17.5
#         OP_SEMI |                              1 | 17.6
# === Document Model ===
#  Document './test/hello4.frt'
#      Function 'makePoint'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$x'
#              Instruction
#                  Need
#                      Lexical variable '$y'
#              Instruction
#                  Want
#                      Lexical variable '$z'
#              Instruction
#                  Assignment (lexical variable '$point')
#                      Object [2 items]
#                          Item 0
#                              Pair 'x'
#                                  Lexical variable '$x'
#                          Item 1
#                              Pair 'y'
#                                  Lexical variable '$y'
#              Instruction
#                  Return pair 'point'
#                      Lexical variable '$point'
#      Instruction
#          Assignment (lexical variable '$pt')
#              Property 'point'
#                  Call
#                      Bareword 'makePoint'
#                      Argument list [2 items]
#                          Item 0
#                              Number '5'
#                          Item 1
#                              Number '3'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Point('
#                          Addition operator (+)
#                          Property 'x'
#                              Lexical variable '$pt'
#                          Addition operator (+)
#                          String ', '
#                          Addition operator (+)
#                          Property 'y'
#                              Lexical variable '$pt'
#                          Addition operator (+)
#                          String ')'
#      Instruction
#          Assignment (lexical variable '$numbers')
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
#                      Operation
#                          Number '4'
#                          Addition operator (+)
#                          Number '1'
#      Instruction
#          Assignment (lexical variable '$emptyArray')
#              Value list [0 items]
#      Instruction
#          Assignment (lexical variable '$emptyHash')
#              Hash [0 items]
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

FF::before_content('hello4.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Function event 'makePoint' definition
    my $func_0 = FF::function_event_def(
        $f, $scope,
        'makePoint',
        [
            { name => 'x', type => undef, optional => undef, more => undef },
            { name => 'y', type => undef, optional => undef, more => undef },
            { name => 'z', type => undef, optional => 1,     more => undef }
        ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'x', 2.2 ) or return;
            FF::need( $scope, $arguments, 'y', 2.4 ) or return;
            FF::want( $scope, $arguments, 'z', 3.2 );
            $scope->set_property_ow(
                $context,
                point => FF::create_object(
                    $f,
                    {
                        x => $scope->property_u('x'),
                        y => $scope->property_u('y')
                    }
                ),
                4.2
            );
            $return->set_property( point => $scope->property_u('point'), 8.2 );
            return $return;
        }
    );
    $func_0->inside_scope( makePoint => $scope, $scope, undef, undef, undef );
    $scope->set_property_ow(
        $context,
        pt => $scope->property_u('makePoint')
          ->call_u( [ num( $f, 5 ), num( $f, 3 ) ], $scope, undef, 11.2 )
          ->property_u('point'),
        11.1
    );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope,
                str( $f, "Point(" ),
                $scope->property_u('pt')->property_u('x'),
                str( $f, ", " ),
                $scope->property_u('pt')->property_u('y'),
                str( $f, ")" )
            )
        ],
        $scope, undef, 12.1
    );
    $scope->set_property_ow(
        $context,
        numbers => FF::create_list(
            $f,
            [
                num( $f, 1 ),
                num( $f, 2 ),
                num( $f, 3 ),
                num( $f, 4 ),
                add( $scope, num( $f, 4 ), num( $f, 1 ) )
            ]
        ),
        14.1
    );
    $scope->set_property_ow(
        $context,
        emptyArray => FF::create_list( $f, [] ),
        16.2
    );
    $scope->set_property_ow(
        $context,
        emptyHash => FF::create_hash( $f, {} ),
        17.2
    );
};

FF::after_content();
