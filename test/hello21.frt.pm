# === Tokenization ===
#         VAR_LEX |                        "parts" | 1.1
#       OP_ASSIGN |                                | 1.2
#          STRING |                    ["s p a m"] | 1.3
#        PROPERTY |                        "split" | 1.4
#      PAREN_CALL |                                | 1.5
#          STRING |                          [" "] | 1.6
#         PAREN_E |                                | 1.7
#         OP_SEMI |                              1 | 1.8
#     KEYWORD_FOR |                                | 3.05
#         PAREN_S |                                | 3.1
#         VAR_LEX |                            "i" | 3.15
#        OP_COMMA |                                | 3.2
#         VAR_LEX |                         "part" | 3.25
#         PAREN_E |                                | 3.3
#      KEYWORD_IN |                                | 3.35
#         VAR_LEX |                        "parts" | 3.4
#       CLOSURE_S |                                | 3.45
#      KEYWORD_ON |                                | 4.05
#        BAREWORD |                        "Timer" | 4.1
#      PAREN_CALL |                                | 4.15
#         VAR_LEX |                            "i" | 4.2
#         PAREN_E |                                | 4.25
#        PROPERTY |                         "once" | 4.3
#      PAREN_CALL |                                | 4.35
#         PAREN_E |                                | 4.4
#        PROPERTY |                       "expire" | 4.45
#       CLOSURE_S |                                | 4.5
#        BAREWORD |                          "say" | 5.1
#      PAREN_CALL |                                | 5.2
#          STRING | ["(",["VAR_LEX","i",5],") ",["VAR_LEX","part",5]] | 5.3
#         PAREN_E |                                | 5.4
#         OP_SEMI |                              1 | 5.5
#       CLOSURE_E |                                | 6.1
#       CLOSURE_E |                                | 7.1
#     KEYWORD_FOR |                                | 9.05
#         VAR_LEX |                         "part" | 9.1
#      KEYWORD_IN |                                | 9.15
#       BRACKET_S |                                | 9.2
#          NUMBER |                            "1" | 9.25
#        OP_COMMA |                                | 9.3
#          NUMBER |                            "2" | 9.35
#        OP_COMMA |                                | 9.4
#          NUMBER |                            "3" | 9.45
#       BRACKET_E |                                | 9.5
#       CLOSURE_S |                                | 9.55
#        BAREWORD |                          "say" | 10.1
#      PAREN_CALL |                                | 10.2
#         VAR_LEX |                         "part" | 10.3
#         PAREN_E |                                | 10.4
#         OP_SEMI |                              1 | 10.5
#       CLOSURE_E |                                | 11.1
# === Document Model ===
#  Document './test/hello21.frt'
#      Instruction
#          Assignment (lexical variable '$parts')
#              Call
#                  Property 'split'
#                      String 's p a m'
#                  Argument list [1 items]
#                      Item 0
#                          String ' '
#      For
#          Expression ('for' parameter)
#              Set [2 items]
#                  Item 0
#                      Lexical variable '$i'
#                  Item 1
#                      Lexical variable '$part'
#          Expression ('in' parameter)
#              Lexical variable '$parts'
#          Body ('for' scope)
#              On
#                  Expression ('on' parameter)
#                      Property 'expire'
#                          Call
#                              Property 'once'
#                                  Call
#                                      Bareword 'Timer'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Lexical variable '$i'
#                              Argument list [0 items]
#                  Anonymous function
#                      Body ('function' scope)
#                          Instruction
#                              Call
#                                  Bareword 'say'
#                                  Argument list [1 items]
#                                      Item 0
#                                          Operation
#                                              String '('
#                                              Addition operator (+)
#                                              Lexical variable '$i'
#                                              Addition operator (+)
#                                              String ') '
#                                              Addition operator (+)
#                                              Lexical variable '$part'
#      For
#          Expression ('for' parameter)
#              Lexical variable '$part'
#          Expression ('in' parameter)
#              Value list [3 items]
#                  Item 0
#                      Number '1'
#                  Item 1
#                      Number '2'
#                  Item 2
#                      Number '3'
#          Body ('for' scope)
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Argument list [1 items]
#                          Item 0
#                              Lexical variable '$part'
#      Include (Timer)
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

FF::before_content('hello21.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, $scope, undef,
        [],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope,                  str( $f, "(" ),
                        $scope->property_u('i'), str( $f, ") " ),
                        $scope->property_u('part')
                    )
                ],
                $scope, undef, 5.2
            );
            return $return;
        }
    );
    FF::load_namespaces( $context, qw(Timer) );
    $scope->set_property_ow(
        $context,
        parts => str( $f, "s p a m" )->property_u('split')
          ->call_u( [ str( $f, " " ) ], $scope, undef, 1.5 ),
        1.2
    );
    FF::iterate_pair(
        $f, $scope,
        $scope->property_u('parts'),
        'i', 'part',
        sub {
            my $scope = shift;
            FF::on(
                $scope->property_u('Timer')
                  ->call_u( [ $scope->property_u('i') ], $scope, undef, 4.15 )
                  ->property_u('once')->call_u( {}, $scope, undef, 4.35 ),
                'expire', $self, $scope,
                $func_0->inside_scope(
                    (undef) => $scope,
                    $scope, undef, undef, undef
                ),
                {}
            );
        }
    );
    FF::iterate(
        $f, $scope,
        FF::create_list( $f, [ num( $f, 1 ), num( $f, 2 ), num( $f, 3 ) ] ),
        'part',
        sub {
            my $scope = shift;
            $scope->property_u('say')
              ->call_u( [ $scope->property_u('part') ], $scope, undef, 10.2 );
        }
    );
};

FF::after_content();
