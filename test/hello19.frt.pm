# === Tokenization ===
#         VAR_LEX |                        "words" | 1.11111
#       OP_ASSIGN |                                | 1.22222
#          STRING |               ["how are you?"] | 1.33333
#        PROPERTY |                        "split" | 1.44444
#      PAREN_CALL |                                | 1.55556
#          STRING |                          [" "] | 1.66667
#         PAREN_E |                                | 1.77778
#         OP_SEMI |                                | 1.88889
#     KEYWORD_FOR |                                | 3.16667
#         VAR_LEX |                         "word" | 3.33333
#      KEYWORD_IN |                                | 3.5
#         VAR_LEX |                        "words" | 3.66667
#       CLOSURE_S |                                | 3.83333
#        BAREWORD |                          "say" | 4.16667
#      PAREN_CALL |                                | 4.33333
#          STRING | ["part: ",["VAR_LEX","word",4]] | 4.5
#         PAREN_E |                                | 4.66667
#         OP_SEMI |                                | 4.83333
#       CLOSURE_E |                                | 5.5
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
          ->call_u( [ str( $f, " " ) ], $scope, undef, 1.55556 ),
        1.22222
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
                $scope, undef, 4.33333
            );
        }
    );
};

FF::after_content();
