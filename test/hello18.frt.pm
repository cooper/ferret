# === Tokenization ===
#         VAR_LEX |                         "list" | 1.14286
#       OP_ASSIGN |                                | 1.28571
#       BRACKET_S |                                | 1.42857
#          STRING |                         ["hi"] | 1.57143
#       BRACKET_E |                                | 1.71429
#         OP_SEMI |                                | 1.85714
#         VAR_LEX |                         "list" | 2.14286
#        PROPERTY |                         "push" | 2.28571
#      PAREN_CALL |                                | 2.42857
#          STRING |                      ["there"] | 2.57143
#         PAREN_E |                                | 2.71429
#         OP_SEMI |                                | 2.85714
#         VAR_LEX |                         "list" | 3.125
#     BRACKET_IDX |                                | 3.25
#          NUMBER |                            "4" | 3.375
#       BRACKET_E |                                | 3.5
#       OP_ASSIGN |                                | 3.625
#          STRING |                       ["yeah"] | 3.75
#         OP_SEMI |                                | 3.875
#        BAREWORD |                          "say" | 5.11111
#      PAREN_CALL |                                | 5.22222
#          STRING |                   ["Length: "] | 5.33333
#          OP_ADD |                                | 5.44444
#         VAR_LEX |                         "list" | 5.55556
#        PROPERTY |                       "length" | 5.66667
#         PAREN_E |                                | 5.77778
#         OP_SEMI |                                | 5.88889
#     KEYWORD_FOR |                                | 7.16667
#         VAR_LEX |                         "item" | 7.33333
#      KEYWORD_IN |                                | 7.5
#         VAR_LEX |                         "list" | 7.66667
#       CLOSURE_S |                                | 7.83333
#        BAREWORD |                          "say" | 8.16667
#      PAREN_CALL |                                | 8.33333
#          STRING | ["item: ",["VAR_LEX","item",8]] | 8.5
#         PAREN_E |                                | 8.66667
#         OP_SEMI |                                | 8.83333
#       CLOSURE_E |                                | 9.5
#         VAR_LEX |                         "hash" | 11.125
#       OP_ASSIGN |                                | 11.25
#       BRACKET_S |                                | 11.375
#      PROP_VALUE |                           "hi" | 11.5
#          STRING |                      ["there"] | 11.625
#       BRACKET_E |                                | 11.75
#         OP_SEMI |                                | 11.875
#         VAR_LEX |                         "hash" | 12.125
#     BRACKET_IDX |                                | 12.25
#          STRING |                      ["whats"] | 12.375
#       BRACKET_E |                                | 12.5
#       OP_ASSIGN |                                | 12.625
#          STRING |                         ["up"] | 12.75
#         OP_SEMI |                                | 12.875
#         VAR_LEX |                         "hash" | 13.125
#     BRACKET_IDX |                                | 13.25
#          STRING |                      ["thank"] | 13.375
#       BRACKET_E |                                | 13.5
#       OP_ASSIGN |                                | 13.625
#          STRING |                        ["you"] | 13.75
#         OP_SEMI |                                | 13.875
#        BAREWORD |                          "say" | 15.09091
#      PAREN_CALL |                                | 15.18182
#          STRING |                     ["whats "] | 15.27273
#          OP_ADD |                                | 15.36364
#         VAR_LEX |                         "hash" | 15.45455
#     BRACKET_IDX |                                | 15.54545
#          STRING |                      ["whats"] | 15.63636
#       BRACKET_E |                                | 15.72727
#         PAREN_E |                                | 15.81818
#         OP_SEMI |                                | 15.90909
#     KEYWORD_FOR |                                | 17.1
#         PAREN_S |                                | 17.2
#         VAR_LEX |                          "key" | 17.3
#        OP_COMMA |                                | 17.4
#         VAR_LEX |                          "val" | 17.5
#         PAREN_E |                                | 17.6
#      KEYWORD_IN |                                | 17.7
#         VAR_LEX |                         "hash" | 17.8
#       CLOSURE_S |                                | 17.9
#        BAREWORD |                          "say" | 18.16667
#      PAREN_CALL |                                | 18.33333
#          STRING | ["pair: key=",["VAR_LEX","key",18]," value=",["VAR_LEX","val",18]] | 18.5
#         PAREN_E |                                | 18.66667
#         OP_SEMI |                                | 18.83333
#       CLOSURE_E |                                | 19.5
# === Document Model ===
#  Document './test/hello18.frt'
#      Instruction
#          Assignment (lexical variable '$list')
#              Value list [1 items]
#                  Item 0
#                      String 'hi'
#      Instruction
#          Call
#              Property 'push'
#                  Lexical variable '$list'
#              Argument list [1 items]
#                  Item 0
#                      String 'there'
#      Instruction
#          Assignment (index)
#              String 'yeah'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Length: '
#                          Addition operator (+)
#                          Property 'length'
#                              Lexical variable '$list'
#      For
#          Expression ('for' parameter)
#              Lexical variable '$item'
#          Expression ('in' parameter)
#              Lexical variable '$list'
#          Body ('for' scope)
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Argument list [1 items]
#                          Item 0
#                              Operation
#                                  String 'item: '
#                                  Addition operator (+)
#                                  Lexical variable '$item'
#      Instruction
#          Assignment (lexical variable '$hash')
#              Hash [1 items]
#                  Item 0
#                      Pair 'hi'
#                          String 'there'
#      Instruction
#          Assignment (index)
#              String 'up'
#      Instruction
#          Assignment (index)
#              String 'you'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'whats '
#                          Addition operator (+)
#                          Index
#                              Lexical variable '$hash'
#                              Single value [1 items]
#                                  Item 0
#                                      String 'whats'
#      For
#          Expression ('for' parameter)
#              Set [2 items]
#                  Item 0
#                      Lexical variable '$key'
#                  Item 1
#                      Lexical variable '$val'
#          Expression ('in' parameter)
#              Lexical variable '$hash'
#          Body ('for' scope)
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Argument list [1 items]
#                          Item 0
#                              Operation
#                                  String 'pair: key='
#                                  Addition operator (+)
#                                  Lexical variable '$key'
#                                  Addition operator (+)
#                                  String ' value='
#                                  Addition operator (+)
#                                  Lexical variable '$val'
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

FF::before_content('hello18.frt');

use Ferret::Core::Operations qw(add str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    $scope->set_property_ow(
        $context,
        list => FF::create_list( $f, [ str( $f, "hi" ) ] ),
        1.28571
    );
    $scope->property_u('list')->property_u('push')
      ->call_u( [ str( $f, "there" ) ], $scope, undef, 2.42857 );
    $scope->property_u('list')
      ->set_index_value( [ num( $f, 4 ) ], str( $f, "yeah" ), $scope );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope,
                str( $f, "Length: " ),
                $scope->property_u('list')->property_u('length')
            )
        ],
        $scope, undef, 5.22222
    );
    FF::iterate(
        $f, $scope,
        $scope->property_u('list'),
        'item',
        sub {
            my $scope = shift;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "item: " ),
                        $scope->property_u('item')
                    )
                ],
                $scope, undef, 8.33333
            );
        }
    );
    $scope->set_property_ow(
        $context,
        hash => FF::create_hash( $f, { hi => str( $f, "there" ) } ),
        11.25
    );
    $scope->property_u('hash')
      ->set_index_value( [ str( $f, "whats" ) ], str( $f, "up" ), $scope );
    $scope->property_u('hash')
      ->set_index_value( [ str( $f, "thank" ) ], str( $f, "you" ), $scope );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope,
                str( $f, "whats " ),
                $scope->property_u('hash')
                  ->get_index_value( [ str( $f, "whats" ) ], $scope )
            )
        ],
        $scope, undef, 15.18182
    );
    FF::iterate_pair(
        $f, $scope,
        $scope->property_u('hash'),
        'key', 'val',
        sub {
            my $scope = shift;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope,                    str( $f, "pair: key=" ),
                        $scope->property_u('key'), str( $f, " value=" ),
                        $scope->property_u('val')
                    )
                ],
                $scope, undef, 18.33333
            );
        }
    );
};

FF::after_content();
