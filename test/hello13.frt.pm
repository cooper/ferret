# === Tokenization ===
#        BAREWORD |                          "say" | 1.1
#      PAREN_CALL |                                | 1.2
#          STRING |                      ["hello"] | 1.3
#         PAREN_E |                                | 1.4
#         OP_SEMI |                              1 | 1.5
#      KEYWORD_ON |                                | 3.05
#        BAREWORD |                        "Timer" | 3.1
#      PAREN_CALL |                                | 3.15
#          NUMBER |                            "5" | 3.2
#         PAREN_E |                                | 3.25
#        PROPERTY |                         "once" | 3.3
#         OP_CALL |                                | 3.35
#        PROPERTY |                       "expire" | 3.4
#       CLOSURE_S |                                | 3.45
#        BAREWORD |                          "say" | 4.1
#      PAREN_CALL |                                | 4.2
#          STRING |            ["five seconds up"] | 4.3
#         PAREN_E |                                | 4.4
#         OP_SEMI |                              1 | 4.5
#       CLOSURE_E |                                | 5.1
#         VAR_LEX |                           "t2" | 7.1
#       OP_ASSIGN |                                | 7.2
#        BAREWORD |                        "Timer" | 7.3
#      PAREN_CALL |                                | 7.4
#          NUMBER |                            "2" | 7.5
#         PAREN_E |                                | 7.6
#         OP_SEMI |                              1 | 7.7
#      KEYWORD_ON |                                | 8.1
#         VAR_LEX |                           "t2" | 8.2
#        PROPERTY |                         "once" | 8.3
#         OP_CALL |                                | 8.4
#        PROPERTY |                       "expire" | 8.5
#       CLOSURE_S |                                | 8.6
#        BAREWORD |                          "say" | 9.1
#      PAREN_CALL |                                | 9.2
#          STRING |     ["this shouldn't be said"] | 9.3
#         PAREN_E |                                | 9.4
#         OP_SEMI |                              1 | 9.5
#       CLOSURE_E |                                | 10.1
#         VAR_LEX |                           "t2" | 12.1
#        PROPERTY |                       "cancel" | 12.2
#         OP_CALL |                                | 12.3
#         OP_SEMI |                              1 | 12.4
# === Document Model ===
#  Document './test/hello13.frt'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      String 'hello'
#      On
#          Expression ('on' parameter)
#              Property 'expire'
#                  Call
#                      Property 'once'
#                          Call
#                              Bareword 'Timer'
#                              Argument list [1 items]
#                                  Item 0
#                                      Number '5'
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  String 'five secon...'
#      Instruction
#          Assignment (lexical variable '$t2')
#              Call
#                  Bareword 'Timer'
#                  Argument list [1 items]
#                      Item 0
#                          Number '2'
#      On
#          Expression ('on' parameter)
#              Property 'expire'
#                  Call
#                      Property 'once'
#                          Lexical variable '$t2'
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  String 'this shoul...'
#      Instruction
#          Call
#              Property 'cancel'
#                  Lexical variable '$t2'
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

FF::before_content('hello13.frt');

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
              ->call_u( [ str( $f, "five seconds up" ) ], $scope, undef, 4.2 );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_1 = FF::function_def(
        $f, $scope, undef,
        [],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property_u('say')
              ->call_u( [ str( $f, "this shouldn't be said" ) ],
                $scope, undef, 9.2 );
            return $return;
        }
    );
    FF::load_namespaces( $context, qw(Timer) );
    $scope->property_u('say')
      ->call_u( [ str( $f, "hello" ) ], $scope, undef, 1.2 );
    FF::on(
        $scope->property_u('Timer')
          ->call_u( [ num( $f, 5 ) ], $scope, undef, 3.15 )->property_u('once')
          ->call_u( {}, $scope, undef, 3.35 ),
        'expire',
        $self,
        $scope,
        $func_0->inside_scope( (undef) => $scope, $scope, undef, undef, undef ),
        {}
    );
    $scope->set_property_ow(
        $context,
        t2 => $scope->property_u('Timer')
          ->call_u( [ num( $f, 2 ) ], $scope, undef, 7.4 ),
        7.2
    );
    FF::on(
        $scope->property_u('t2')->property_u('once')
          ->call_u( {}, $scope, undef, 8.4 ),
        'expire',
        $self,
        $scope,
        $func_1->inside_scope( (undef) => $scope, $scope, undef, undef, undef ),
        {}
    );
    $scope->property_u('t2')->property_u('cancel')
      ->call_u( {}, $scope, undef, 12.3 );
};

FF::after_content();
