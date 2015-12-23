# === Tokenization ===
#        FUNCTION |            {"name":"sayHello"} | 1.1
#       CLOSURE_S |                                | 1.2
#    KEYWORD_NEED |                                | 2.1
#         VAR_LEX |                          "who" | 2.2
#        OP_VALUE |                                | 2.3
#        BAREWORD |                          "Str" | 2.4
#         OP_SEMI |                              1 | 2.5
#        BAREWORD |                          "say" | 3.1
#      PAREN_CALL |                                | 3.2
#          STRING | ["Hello ",["VAR_LEX","who",3],"!"] | 3.3
#         PAREN_E |                                | 3.4
#         OP_SEMI |                              1 | 3.5
#       CLOSURE_E |                                | 4.1
#        BAREWORD |                     "sayHello" | 6.1
#        OP_MAYBE |                                | 6.2
#      PAREN_CALL |                                | 6.3
#          STRING |                      ["World"] | 6.4
#         PAREN_E |                                | 6.5
#         OP_SEMI |                              1 | 6.6
#        BAREWORD |                   "sayGoodbye" | 7.1
#        OP_MAYBE |                                | 7.2
#      PAREN_CALL |                                | 7.3
#          STRING |                      ["World"] | 7.4
#         PAREN_E |                                | 7.5
#         OP_SEMI |                              1 | 7.6
# === Document Model ===
#  Document './test/hello9.frt'
#      Function 'sayHello'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$who'
#                      Bareword 'Str'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Argument list [1 items]
#                          Item 0
#                              Operation
#                                  String 'Hello '
#                                  Addition operator (+)
#                                  Lexical variable '$who'
#                                  Addition operator (+)
#                                  String '!'
#      Instruction
#          Call
#              Maybe
#                  Bareword 'sayHello'
#              Argument list [1 items]
#                  Item 0
#                      String 'World'
#      Instruction
#          Call
#              Maybe
#                  Bareword 'sayGoodbye'
#              Argument list [1 items]
#                  Item 0
#                      String 'World'
#      Include (Str)
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

FF::before_content('hello9.frt');

use Ferret::Core::Operations qw(add bool str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Function event 'sayHello' definition
    my $func_0 = FF::function_event_def(
        $f, $scope,
        'sayHello',
        [ { name => 'who', type => 'Str', optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'who', 2.2 ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope,                    str( $f, "Hello " ),
                        $scope->property_u('who'), str( $f, "!" )
                    )
                ],
                $scope, undef, 3.2
            );
            return $return;
        }
    );
    $func_0->inside_scope( sayHello => $scope, $scope, undef, undef, undef );
    FF::load_namespaces( $context, qw(Str) );
    {
        my $maybe_0 = $scope->property_u('sayHello');
        if ( bool($maybe_0) ) {
            $maybe_0->call_u( [ str( $f, "World" ) ], $scope, undef, 6.3 );
        }
    }
    {
        my $maybe_0 = $scope->property_u('sayGoodbye');
        if ( bool($maybe_0) ) {
            $maybe_0->call_u( [ str( $f, "World" ) ], $scope, undef, 7.3 );
        }
    }
};

FF::after_content();
