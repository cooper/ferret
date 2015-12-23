# === Tokenization ===
#         VAR_LEX | "list"
#       OP_ASSIGN | 
#       BRACKET_S | 
#          STRING | ["hi"]
#       BRACKET_E | 
#         OP_SEMI | 
#         VAR_LEX | "list"
#        PROPERTY | "push"
#      PAREN_CALL | 
#          STRING | ["there"]
#         PAREN_E | 
#         OP_SEMI | 
#         VAR_LEX | "list"
#     BRACKET_IDX | 
#          NUMBER | "4"
#       BRACKET_E | 
#       OP_ASSIGN | 
#          STRING | ["yeah"]
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Length: "]
#          OP_ADD | 
#         VAR_LEX | "list"
#        PROPERTY | "length"
#         PAREN_E | 
#         OP_SEMI | 
#     KEYWORD_FOR | 
#         VAR_LEX | "item"
#      KEYWORD_IN | 
#         VAR_LEX | "list"
#       CLOSURE_S | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["item: ",["VAR_LEX","item",9]]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#         VAR_LEX | "hash"
#       OP_ASSIGN | 
#       BRACKET_S | 
#      PROP_VALUE | "hi"
#          STRING | ["there"]
#       BRACKET_E | 
#         OP_SEMI | 
#         VAR_LEX | "hash"
#     BRACKET_IDX | 
#          STRING | ["whats"]
#       BRACKET_E | 
#       OP_ASSIGN | 
#          STRING | ["up"]
#         OP_SEMI | 
#         VAR_LEX | "hash"
#     BRACKET_IDX | 
#          STRING | ["thank"]
#       BRACKET_E | 
#       OP_ASSIGN | 
#          STRING | ["you"]
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["whats "]
#          OP_ADD | 
#         VAR_LEX | "hash"
#     BRACKET_IDX | 
#          STRING | ["whats"]
#       BRACKET_E | 
#         PAREN_E | 
#         OP_SEMI | 
#     KEYWORD_FOR | 
#         PAREN_S | 
#         VAR_LEX | "key"
#        OP_COMMA | 
#         VAR_LEX | "val"
#         PAREN_E | 
#      KEYWORD_IN | 
#         VAR_LEX | "hash"
#       CLOSURE_S | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["pair: key=",["VAR_LEX","key",19],"; value=",["VAR_LEX","val",19]]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
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
#                                  String '; value='
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
        1.33333
    );
    $scope->property_u('list')->property_u('push')
      ->call_u( [ str( $f, "there" ) ], $scope, undef, 2.5 );
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
        $scope, undef, 5.25
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
                $scope, undef, 8.4
            );
        }
    );
    $scope->set_property_ow(
        $context,
        hash => FF::create_hash( $f, { hi => str( $f, "there" ) } ),
        11.28571
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
        $scope, undef, 15.2
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
                        $scope->property_u('key'), str( $f, "; value=" ),
                        $scope->property_u('val')
                    )
                ],
                $scope, undef, 18.4
            );
        }
    );
};

FF::after_content();
