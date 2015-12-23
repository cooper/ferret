# === Tokenization ===
#         PKG_DEC |                {"name":"Math"} | 1.1
#        FUNCTION |                {"name":"sqrt"} | 3.1
#       CLOSURE_S |                                | 3.2
#    KEYWORD_NEED |                                | 4.1
#         VAR_LEX |                          "num" | 4.2
#        OP_VALUE |                                | 4.3
#        BAREWORD |                          "Num" | 4.4
#         OP_SEMI |                              1 | 4.5
#  KEYWORD_RETURN |                                | 5.05
#        BAREWORD |                       "NATIVE" | 5.1
#         OP_PACK |                                | 5.15
#        BAREWORD |                         "Math" | 5.2
#        PROPERTY |                         "sqrt" | 5.25
#      PAREN_CALL |                                | 5.3
#         VAR_LEX |                          "num" | 5.35
#         PAREN_E |                                | 5.4
#         OP_SEMI |                              1 | 5.45
#       CLOSURE_E |                                | 6.1
# === Document Model ===
#  Document './std/Math.frt'
#      Package 'Math'
#      Function 'sqrt'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$num'
#                      Bareword 'Num'
#              Instruction
#                  Return
#                      Call
#                          Property 'sqrt'
#                              Bareword 'NATIVE::Math'
#                          Argument list [1 items]
#                              Item 0
#                                  Lexical variable '$num'
#      Include (NATIVE, NATIVE::Math, Num)
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

FF::before_content('Math.frt');

use Ferret::Core::Operations qw();
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'Math' );
    FF::load_core('Math');

    # Function event 'sqrt' definition
    my $func_0 = FF::function_event_def(
        $f, $scope, 'sqrt',
        [ { name => 'num', type => 'Num', optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'num', 4.2 ) or return;
            return $scope->property_u('NATIVE::Math')->property_u('sqrt')
              ->call_u( [ $scope->property_u('num') ], $scope, undef, 5.3 );
            return $return;
        }
    );
    $func_0->inside_scope( sqrt => $scope, $scope, undef, undef, undef );
    FF::load_namespaces( $context, qw(NATIVE NATIVE::Math Num) );
};

FF::after_content();
