# === Tokenization ===
#        BAREWORD |                        "delay" | 3.16667
#      PAREN_CALL |                                | 3.33333
#          NUMBER |                            "5" | 3.5
#         PAREN_E |                                | 3.66667
#       CLOSURE_S |                                | 3.83333
#        BAREWORD |                          "say" | 4.16667
#      PAREN_CALL |                                | 4.33333
#          STRING |          ["been five seconds"] | 4.5
#         PAREN_E |                                | 4.66667
#         OP_SEMI |                              1 | 4.83333
#       CLOSURE_E |                                | 5.5
#        BAREWORD |                          "say" | 7.16667
#      PAREN_CALL |                                | 7.33333
#          STRING |                 ["waiting..."] | 7.5
#         PAREN_E |                                | 7.66667
#         OP_SEMI |                              1 | 7.83333
#        BAREWORD |                          "say" | 12.14286
#      PAREN_CALL |                                | 12.28571
#        BAREWORD |                    "something" | 12.42857
#      PAREN_CALL |                                | 12.57143
#         PAREN_E |                                | 12.71429
#       CLOSURE_S |                                | 12.85714
#  KEYWORD_RETURN |                                | 13.25
#          STRING |             ["any second now"] | 13.5
#         OP_SEMI |                              1 | 13.75
#       CLOSURE_E |                                | 14.2
#        PROPERTY |                      "message" | 14.4
#         PAREN_E |                                | 14.6
#         OP_SEMI |                              1 | 14.8
#        FUNCTION |           {"name":"something"} | 16.33333
#       CLOSURE_S |                                | 16.66667
#    KEYWORD_NEED |                                | 17.25
#         VAR_LEX |                         "code" | 17.5
#         OP_SEMI |                              1 | 17.75
#        BAREWORD |                      "message" | 18.14286
#       OP_RETURN |                                | 18.28571
#         VAR_LEX |                         "code" | 18.42857
#      PAREN_CALL |                                | 18.57143
#         PAREN_E |                                | 18.71429
#         OP_SEMI |                              1 | 18.85714
#       CLOSURE_E |                                | 19.5
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
            FF::need( $scope, $arguments, 'code', 17.5 ) or return;
            $return->set_property(
                message => $scope->property_u('code')
                  ->call_u( {}, $scope, undef, 18.57143 ),
                18.28571
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
              ->call_u( [ str( $f, "been five seconds" ) ],
                $scope, undef, 4.33333 );
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
        $scope, undef, 3.33333
    );
    $scope->property_u('say')
      ->call_u( [ str( $f, "waiting..." ) ], $scope, undef, 7.33333 );
    $scope->property_u('say')->call_u(
        [
            $scope->property_u('something')->call_u(
                [
                    $func_2->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    )
                ],
                $scope, undef, 12.57143
            )->property_u('message')
        ],
        $scope, undef, 12.28571
    );
};

FF::after_content();
