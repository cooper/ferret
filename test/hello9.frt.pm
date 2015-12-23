# === Tokenization ===
#        FUNCTION | {"name":"sayHello"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "who"
#        OP_VALUE | 
#        BAREWORD | "Str"
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Hello ",["VAR_LEX","who",4],"!"]
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#        BAREWORD | "sayHello"
#        OP_MAYBE | 
#      PAREN_CALL | 
#          STRING | ["World"]
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "sayGoodbye"
#        OP_MAYBE | 
#      PAREN_CALL | 
#          STRING | ["World"]
#         PAREN_E | 
#         OP_SEMI | 
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
            FF::need( $scope, $arguments, 'who', 2.4 ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope,                    str( $f, "Hello " ),
                        $scope->property_u('who'), str( $f, "!" )
                    )
                ],
                $scope, undef, 3.4
            );
            return $return;
        }
    );
    $func_0->inside_scope( sayHello => $scope, $scope, undef, undef, undef );
    FF::load_namespaces( $context, qw(Str) );
    {
        my $maybe_0 = $scope->property_u('sayHello');
        if ( bool($maybe_0) ) {
            $maybe_0->call_u( [ str( $f, "World" ) ], $scope, undef, 6.5 );
        }
    }
    {
        my $maybe_0 = $scope->property_u('sayGoodbye');
        if ( bool($maybe_0) ) {
            $maybe_0->call_u( [ str( $f, "World" ) ], $scope, undef, 7.5 );
        }
    }
};

FF::after_content();
