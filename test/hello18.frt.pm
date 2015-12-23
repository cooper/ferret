# === Tokenization ===
#         VAR_LEX |                         "list" | 1.1
#       OP_ASSIGN |                                | 1.2
#       BRACKET_S |                                | 1.3
#          STRING |                         ["hi"] | 1.4
#       BRACKET_E |                                | 1.5
#         OP_SEMI |                              1 | 1.6
#         VAR_LEX |                         "list" | 2.1
#        PROPERTY |                         "push" | 2.2
#      PAREN_CALL |                                | 2.3
#          STRING |                      ["there"] | 2.4
#         PAREN_E |                                | 2.5
#         OP_SEMI |                              1 | 2.6
#         VAR_LEX |                         "list" | 3.1
#     BRACKET_IDX |                                | 3.2
#          NUMBER |                            "4" | 3.3
#       BRACKET_E |                                | 3.4
#       OP_ASSIGN |                                | 3.5
#          STRING |                       ["yeah"] | 3.6
#         OP_SEMI |                              1 | 3.7
#        BAREWORD |                          "say" | 5.1
#      PAREN_CALL |                                | 5.2
#          STRING |                   ["Length: "] | 5.3
#          OP_ADD |                                | 5.4
#         VAR_LEX |                         "list" | 5.5
#        PROPERTY |                       "length" | 5.6
#         PAREN_E |                                | 5.7
#         OP_SEMI |                              1 | 5.8
#     KEYWORD_FOR |                                | 7.1
#         VAR_LEX |                         "item" | 7.2
#      KEYWORD_IN |                                | 7.3
#         VAR_LEX |                         "list" | 7.4
#       CLOSURE_S |                                | 7.5
#        BAREWORD |                          "say" | 8.1
#      PAREN_CALL |                                | 8.2
#          STRING | ["item: ",["VAR_LEX","item",8]] | 8.3
#         PAREN_E |                                | 8.4
#         OP_SEMI |                              1 | 8.5
#       CLOSURE_E |                                | 9.1
#         VAR_LEX |                         "hash" | 11.1
#       OP_ASSIGN |                                | 11.2
#       BRACKET_S |                                | 11.3
#      PROP_VALUE |                           "hi" | 11.4
#          STRING |                      ["there"] | 11.5
#       BRACKET_E |                                | 11.6
#         OP_SEMI |                              1 | 11.7
#         VAR_LEX |                         "hash" | 12.1
#     BRACKET_IDX |                                | 12.2
#          STRING |                      ["whats"] | 12.3
#       BRACKET_E |                                | 12.4
#       OP_ASSIGN |                                | 12.5
#          STRING |                         ["up"] | 12.6
#         OP_SEMI |                              1 | 12.7
#         VAR_LEX |                         "hash" | 13.1
#     BRACKET_IDX |                                | 13.2
#          STRING |                      ["thank"] | 13.3
#       BRACKET_E |                                | 13.4
#       OP_ASSIGN |                                | 13.5
#          STRING |                        ["you"] | 13.6
#         OP_SEMI |                              1 | 13.7
#        BAREWORD |                          "say" | 15.05
#      PAREN_CALL |                                | 15.1
#          STRING |                     ["whats "] | 15.15
#          OP_ADD |                                | 15.2
#         VAR_LEX |                         "hash" | 15.25
#     BRACKET_IDX |                                | 15.3
#          STRING |                      ["whats"] | 15.35
#       BRACKET_E |                                | 15.4
#         PAREN_E |                                | 15.45
#         OP_SEMI |                              1 | 15.5
#     KEYWORD_FOR |                                | 17.05
#         PAREN_S |                                | 17.1
#         VAR_LEX |                          "key" | 17.15
#        OP_COMMA |                                | 17.2
#         VAR_LEX |                          "val" | 17.25
#         PAREN_E |                                | 17.3
#      KEYWORD_IN |                                | 17.35
#         VAR_LEX |                         "hash" | 17.4
#       CLOSURE_S |                                | 17.45
#        BAREWORD |                          "say" | 18.1
#      PAREN_CALL |                                | 18.2
#          STRING | ["pair: key=",["VAR_LEX","key",18]," value=",["VAR_LEX","val",18]] | 18.3
#         PAREN_E |                                | 18.4
#         OP_SEMI |                              1 | 18.5
#       CLOSURE_E |                                | 19.1
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
        1.2
    );
    $scope->property_u('list')->property_u('push')
      ->call_u( [ str( $f, "there" ) ], $scope, undef, 2.3 );
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
        $scope, undef, 5.2
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
                $scope, undef, 8.2
            );
        }
    );
    $scope->set_property_ow(
        $context,
        hash => FF::create_hash( $f, { hi => str( $f, "there" ) } ),
        11.2
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
        $scope, undef, 15.1
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
                $scope, undef, 18.2
            );
        }
    );
};

FF::after_content();
