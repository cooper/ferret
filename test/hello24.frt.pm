# === Tokenization ===
#        BAREWORD |                        "delay" | 3.1
#      PAREN_CALL |                                | 3.2
#          NUMBER |                            "5" | 3.3
#         PAREN_E |                                | 3.4
#       CLOSURE_S |                                | 3.5
#        BAREWORD |                          "say" | 4.1
#      PAREN_CALL |                                | 4.2
#          STRING |          ["been five seconds"] | 4.3
#         PAREN_E |                                | 4.4
#         OP_SEMI |                              1 | 4.5
#       CLOSURE_E |                                | 5.1
#        BAREWORD |                          "say" | 7.1
#      PAREN_CALL |                                | 7.2
#          STRING |                 ["waiting..."] | 7.3
#         PAREN_E |                                | 7.4
#         OP_SEMI |                              1 | 7.5
#        BAREWORD |                          "say" | 12.1
#      PAREN_CALL |                                | 12.2
#        BAREWORD |                    "something" | 12.3
#      PAREN_CALL |                                | 12.4
#         PAREN_E |                                | 12.5
#       CLOSURE_S |                                | 12.6
#  KEYWORD_RETURN |                                | 13.1
#          STRING |             ["any second now"] | 13.2
#         OP_SEMI |                              1 | 13.3
#       CLOSURE_E |                                | 14.1
#        PROPERTY |                      "message" | 14.2
#         PAREN_E |                                | 14.3
#         OP_SEMI |                              1 | 14.4
#        FUNCTION |           {"name":"something"} | 16.1
#       CLOSURE_S |                                | 16.2
#    KEYWORD_NEED |                                | 17.1
#         VAR_LEX |                         "code" | 17.2
#         OP_SEMI |                              1 | 17.3
#        BAREWORD |                      "message" | 18.1
#       OP_RETURN |                                | 18.2
#         VAR_LEX |                         "code" | 18.3
#      PAREN_CALL |                                | 18.4
#         PAREN_E |                                | 18.5
#         OP_SEMI |                              1 | 18.6
#       CLOSURE_E |                                | 19.1
# === Document Model ===
#  Document './test/hello24.frt'
#      Instruction
#          Call
#              Bareword 'delay'
#              Argument list [2 items]
#                  Item 0
#                      Number '5'
#                  Item 1
#                      Anonymous function
#                          Body ('function' scope)
#                              Instruction
#                                  Call
#                                      Bareword 'say'
#                                      Argument list [1 items]
#                                          Item 0
#                                              String 'been five ...'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      String 'waiting...'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Property 'message'
#                          Call
#                              Bareword 'something'
#                              Argument list [1 items]
#                                  Item 1
#                                      Anonymous function
#                                          Body ('function' scope)
#                                              Instruction
#                                                  Return
#                                                      String 'any second...'
#      Function 'something'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$code'
#              Instruction
#                  Return pair 'message'
#                      Call
#                          Lexical variable '$code'
#                          Argument list [0 items]
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

FF::before_content('hello24.frt');

use Ferret::Core::Operations qw(num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Function event 'something' definition
    my $func_0 = FF::function_event_def(
        $f, $scope,
        'something',
        [ { name => 'code', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'code', 17.2 ) or return;
            $return->set_property(
                message =>
                  $scope->property_u('code')->call_u( {}, $scope, undef, 18.4 ),
                18.2
            );
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
              ->call_u( [ str( $f, "been five seconds" ) ], $scope, undef,
                4.2 );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_2 = FF::function_def(
        $f, $scope, undef,
        [],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            return str( $f, "any second now" );
            return $return;
        }
    );
    $func_0->inside_scope( something => $scope, $scope, undef, undef, undef );
    $scope->property_u('delay')->call_u(
        [
            num( $f, 5 ),
            $func_1->inside_scope(
                (undef) => $scope,
                $scope, undef, undef, undef
            )
        ],
        $scope, undef, 3.2
    );
    $scope->property_u('say')
      ->call_u( [ str( $f, "waiting..." ) ], $scope, undef, 7.2 );
    $scope->property_u('say')->call_u(
        [
            $scope->property_u('something')->call_u(
                [
                    $func_2->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    )
                ],
                $scope, undef, 12.4
            )->property_u('message')
        ],
        $scope, undef, 12.2
    );
};

FF::after_content();
