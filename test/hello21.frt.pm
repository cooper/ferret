# === Tokenization ===
#         VAR_LEX |                        "parts" | 1.11111
#       OP_ASSIGN |                                | 1.22222
#          STRING |                    ["s p a m"] | 1.33333
#        PROPERTY |                        "split" | 1.44444
#      PAREN_CALL |                                | 1.55556
#          STRING |                          [" "] | 1.66667
#         PAREN_E |                                | 1.77778
#         OP_SEMI |                                | 1.88889
#     KEYWORD_FOR |                                | 3.1
#         PAREN_S |                                | 3.2
#         VAR_LEX |                            "i" | 3.3
#        OP_COMMA |                                | 3.4
#         VAR_LEX |                         "part" | 3.5
#         PAREN_E |                                | 3.6
#      KEYWORD_IN |                                | 3.7
#         VAR_LEX |                        "parts" | 3.8
#       CLOSURE_S |                                | 3.9
#      KEYWORD_ON |                                | 4.09091
#        BAREWORD |                        "Timer" | 4.18182
#      PAREN_CALL |                                | 4.27273
#         VAR_LEX |                            "i" | 4.36364
#         PAREN_E |                                | 4.45455
#        PROPERTY |                         "once" | 4.54545
#      PAREN_CALL |                                | 4.63636
#         PAREN_E |                                | 4.72727
#        PROPERTY |                       "expire" | 4.81818
#       CLOSURE_S |                                | 4.90909
#        BAREWORD |                          "say" | 5.16667
#      PAREN_CALL |                                | 5.33333
#          STRING | ["(",["VAR_LEX","i",5],") ",["VAR_LEX","part",5]] | 5.5
#         PAREN_E |                                | 5.66667
#         OP_SEMI |                                | 5.83333
#       CLOSURE_E |                                | 6.5
#       CLOSURE_E |                                | 7.5
#     KEYWORD_FOR |                                | 9.08333
#         VAR_LEX |                         "part" | 9.16667
#      KEYWORD_IN |                                | 9.25
#       BRACKET_S |                                | 9.33333
#          NUMBER |                            "1" | 9.41667
#        OP_COMMA |                                | 9.5
#          NUMBER |                            "2" | 9.58333
#        OP_COMMA |                                | 9.66667
#          NUMBER |                            "3" | 9.75
#       BRACKET_E |                                | 9.83333
#       CLOSURE_S |                                | 9.91667
#        BAREWORD |                          "say" | 10.16667
#      PAREN_CALL |                                | 10.33333
#         VAR_LEX |                         "part" | 10.5
#         PAREN_E |                                | 10.66667
#         OP_SEMI |                                | 10.83333
#       CLOSURE_E |                                | 11.5
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
                $scope, undef, 5.33333
            );
            return $return;
        }
    );
    FF::load_namespaces( $context, qw(Timer) );
    $scope->set_property_ow(
        $context,
        parts => str( $f, "s p a m" )->property_u('split')
          ->call_u( [ str( $f, " " ) ], $scope, undef, 1.55556 ),
        1.22222
    );
    FF::iterate_pair(
        $f, $scope,
        $scope->property_u('parts'),
        'i', 'part',
        sub {
            my $scope = shift;
            FF::on(
                $scope->property_u('Timer')
                  ->call_u( [ $scope->property_u('i') ],
                    $scope, undef, 4.27273 )->property_u('once')
                  ->call_u( {}, $scope, undef, 4.63636 ),
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
            $scope->property_u('say')->call_u( [ $scope->property_u('part') ],
                $scope, undef, 10.33333 );
        }
    );
};

FF::after_content();
