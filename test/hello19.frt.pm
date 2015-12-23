# === Tokenization ===
#         VAR_LEX | "words"
#       OP_ASSIGN | 
#          STRING | ["how are you?"]
#        PROPERTY | "split"
#      PAREN_CALL | 
#          STRING | [" "]
#         PAREN_E | 
#         OP_SEMI | 
#     KEYWORD_FOR | 
#         VAR_LEX | "word"
#      KEYWORD_IN | 
#         VAR_LEX | "words"
#       CLOSURE_S | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["part: ",["VAR_LEX","word",5]]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
# === Document Model ===
#  Document './test/hello19.frt'
#      Instruction
#          Assignment (lexical variable '$words')
#              Call
#                  Property 'split'
#                      String 'how are you?'
#                  Argument list [1 items]
#                      Item 0
#                          String ' '
#      For
#          Expression ('for' parameter)
#              Lexical variable '$word'
#          Expression ('in' parameter)
#              Lexical variable '$words'
#          Body ('for' scope)
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Argument list [1 items]
#                          Item 0
#                              Operation
#                                  String 'part: '
#                                  Addition operator (+)
#                                  Lexical variable '$word'
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

FF::before_content('hello19.frt');

use Ferret::Core::Operations qw(add str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    $scope->set_property_ow(
        $context,
        words => str( $f, "how are you?" )->property_u('split')
          ->call_u( [ str( $f, " " ) ], $scope, undef, 1.625 ),
        1.25
    );
    FF::iterate(
        $f, $scope,
        $scope->property_u('words'),
        'word',
        sub {
            my $scope = shift;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "part: " ),
                        $scope->property_u('word')
                    )
                ],
                $scope, undef, 4.4
            );
        }
    );
};

FF::after_content();
