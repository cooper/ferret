# === Tokenization ===
#        FUNCTION |           {"name":"makePoint"} | 1.33333
#       CLOSURE_S |                                | 1.66667
#    KEYWORD_NEED |                                | 2.16667
#         VAR_LEX |                            "x" | 2.33333
#        OP_COMMA |                                | 2.5
#         VAR_LEX |                            "y" | 2.66667
#         OP_SEMI |                              1 | 2.83333
#    KEYWORD_WANT |                                | 3.25
#         VAR_LEX |                            "z" | 3.5
#         OP_SEMI |                              1 | 3.75
#         VAR_LEX |                        "point" | 4.25
#       OP_ASSIGN |                                | 4.5
#         PAREN_S |                                | 4.75
#      PROP_VALUE |                            "x" | 5.25
#         VAR_LEX |                            "x" | 5.5
#        OP_COMMA |                                | 5.75
#      PROP_VALUE |                            "y" | 6.25
#         VAR_LEX |                            "y" | 6.5
#         OP_SEMI |                              1 | 6.75
#         PAREN_E |                                | 7.33333
#         OP_SEMI |                              1 | 7.66667
#        BAREWORD |                        "point" | 8.2
#       OP_RETURN |                                | 8.4
#         VAR_LEX |                        "point" | 8.6
#         OP_SEMI |                              1 | 8.8
#       CLOSURE_E |                                | 9.5
#         VAR_LEX |                           "pt" | 11.09091
#       OP_ASSIGN |                                | 11.18182
#        BAREWORD |                    "makePoint" | 11.27273
#      PAREN_CALL |                                | 11.36364
#          NUMBER |                            "5" | 11.45455
#        OP_COMMA |                                | 11.54545
#          NUMBER |                            "3" | 11.63636
#         PAREN_E |                                | 11.72727
#        PROPERTY |                        "point" | 11.81818
#         OP_SEMI |                              1 | 11.90909
#        BAREWORD |                          "say" | 12.0625
#      PAREN_CALL |                                | 12.125
#          STRING |                     ["Point("] | 12.1875
#          OP_ADD |                                | 12.25
#         VAR_LEX |                           "pt" | 12.3125
#        PROPERTY |                            "x" | 12.375
#          OP_ADD |                                | 12.4375
#          STRING |                         [", "] | 12.5
#          OP_ADD |                                | 12.5625
#         VAR_LEX |                           "pt" | 12.625
#        PROPERTY |                            "y" | 12.6875
#          OP_ADD |                                | 12.75
#          STRING |                          [")"] | 12.8125
#         PAREN_E |                                | 12.875
#         OP_SEMI |                              1 | 12.9375
#         VAR_LEX |                      "numbers" | 14.05882
#       OP_ASSIGN |                                | 14.11765
#       BRACKET_S |                                | 14.17647
#          NUMBER |                            "1" | 14.23529
#        OP_COMMA |                                | 14.29412
#          NUMBER |                            "2" | 14.35294
#        OP_COMMA |                                | 14.41176
#          NUMBER |                            "3" | 14.47059
#        OP_COMMA |                                | 14.52941
#          NUMBER |                            "4" | 14.58824
#        OP_COMMA |                                | 14.64706
#          NUMBER |                            "4" | 14.70588
#          OP_ADD |                                | 14.76471
#          NUMBER |                            "1" | 14.82353
#       BRACKET_E |                                | 14.88235
#         OP_SEMI |                              1 | 14.94118
#         VAR_LEX |                   "emptyArray" | 16.16667
#       OP_ASSIGN |                                | 16.33333
#       BRACKET_S |                                | 16.5
#       BRACKET_E |                                | 16.66667
#         OP_SEMI |                              1 | 16.83333
#         VAR_LEX |                    "emptyHash" | 17.14286
#       OP_ASSIGN |                                | 17.28571
#       BRACKET_S |                                | 17.42857
#        OP_VALUE |                                | 17.57143
#       BRACKET_E |                                | 17.71429
#         OP_SEMI |                              1 | 17.85714
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
            FF::need( $scope, $arguments, 'x', 2.33333 ) or return;
            FF::need( $scope, $arguments, 'y', 2.66667 ) or return;
            FF::want( $scope, $arguments, 'z', 3.5 );
            $scope->set_property_ow(
                $context,
                point => FF::create_object(
                    $f,
                    {
                        x => $scope->property_u('x'),
                        y => $scope->property_u('y')
                    }
                ),
                4.5
            );
            $return->set_property( point => $scope->property_u('point'), 8.4 );
            return $return;
        }
    );
    $func_0->inside_scope( makePoint => $scope, $scope, undef, undef, undef );
    $scope->set_property_ow(
        $context,
        pt => $scope->property_u('makePoint')
          ->call_u( [ num( $f, 5 ), num( $f, 3 ) ], $scope, undef, 11.36364 )
          ->property_u('point'),
        11.18182
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
        $scope, undef, 12.125
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
        14.11765
    );
    $scope->set_property_ow(
        $context,
        emptyArray => FF::create_list( $f, [] ),
        16.33333
    );
    $scope->set_property_ow(
        $context,
        emptyHash => FF::create_hash( $f, {} ),
        17.28571
    );
};

FF::after_content();
