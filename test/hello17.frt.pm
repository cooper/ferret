# === Tokenization ===
#         VAR_LEX |                          "obj" | 2.1
#       OP_ASSIGN |                                | 2.2
#         PAREN_S |                                | 2.3
#        OP_VALUE |                                | 2.4
#         PAREN_E |                                | 2.5
#         OP_SEMI |                              1 | 2.6
#        BAREWORD |                        "Timer" | 5.05
#        PROPERTY |                         "init" | 5.1
#      PAREN_CALL |                                | 5.15
#         VAR_LEX |                          "obj" | 5.2
#         PAREN_E |                                | 5.25
#      PAREN_CALL |                                | 5.3
#          NUMBER |                            "5" | 5.35
#         PAREN_E |                                | 5.4
#         OP_SEMI |                              1 | 5.45
#      KEYWORD_ON |                                | 7.1
#         VAR_LEX |                          "obj" | 7.2
#        PROPERTY |                         "once" | 7.3
#      PAREN_CALL |                                | 7.4
#         PAREN_E |                                | 7.5
#        PROPERTY |                       "expire" | 7.6
#       CLOSURE_S |                                | 7.7
#        BAREWORD |                          "say" | 8.1
#      PAREN_CALL |                                | 8.2
#          STRING |                  ["it works!"] | 8.3
#         PAREN_E |                                | 8.4
#         OP_SEMI |                              1 | 8.5
#       CLOSURE_E |                                | 9.1
# === Document Model ===
#  Document './test/hello17.frt'
#      Instruction
#          Assignment (lexical variable '$obj')
#              Object [0 items]
#      Instruction
#          Call
#              Call
#                  Property 'init'
#                      Bareword 'Timer'
#                  Argument list [1 items]
#                      Item 0
#                          Lexical variable '$obj'
#              Argument list [1 items]
#                  Item 0
#                      Number '5'
#      On
#          Expression ('on' parameter)
#              Property 'expire'
#                  Call
#                      Property 'once'
#                          Lexical variable '$obj'
#                      Argument list [0 items]
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  String 'it works!'
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

FF::before_content('hello17.frt');

use Ferret::Core::Operations qw(num str);
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
            $scope->property_u('say')
              ->call_u( [ str( $f, "it works!" ) ], $scope, undef, 8.2 );
            return $return;
        }
    );
    FF::load_namespaces( $context, qw(Timer) );
    $scope->set_property_ow(
        $context,
        obj => FF::create_object( $f, {} ),
        2.2
    );
    $scope->property_u('Timer')->property_u('init')
      ->call_u( [ $scope->property_u('obj') ], $scope, undef, 5.15 )
      ->call_u( [ num( $f, 5 ) ], $scope, undef, 5.3 );
    FF::on(
        $scope->property_u('obj')->property_u('once')
          ->call_u( {}, $scope, undef, 7.4 ),
        'expire',
        $self,
        $scope,
        $func_0->inside_scope( (undef) => $scope, $scope, undef, undef, undef ),
        {}
    );
};

FF::after_content();
