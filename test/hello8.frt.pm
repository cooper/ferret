# === Tokenization ===
#       CLASS_DEC |              {"name":"String"} | 1.1
#          METHOD |       {"name":"doubledLength"} | 3.1
#       CLOSURE_S |                                | 3.2
#  KEYWORD_RETURN |                                | 4.1
#        VAR_THIS |                       "length" | 4.2
#         OP_CALL |                                | 4.3
#          OP_MUL |                                | 4.4
#          NUMBER |                            "2" | 4.5
#         OP_SEMI |                              1 | 4.6
#       CLOSURE_E |                                | 5.1
#     KEYWORD_END |                                | 7.1
#        BAREWORD |                          "say" | 9.05
#      PAREN_CALL |                                | 9.1
#          STRING |         ["Length times two: "] | 9.15
#          OP_ADD |                                | 9.2
#          STRING |                   ["hi there"] | 9.25
#        PROPERTY |                "doubledLength" | 9.3
#         OP_CALL |                                | 9.35
#         PAREN_E |                                | 9.4
#         OP_SEMI |                              1 | 9.45
# === Document Model ===
#  Document './test/hello8.frt'
#      Class 'String'
#          Method 'doubledLength'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Operation
#                              Call
#                                  Instance variable '@length'
#                              Multiplication operator (*)
#                              Number '2'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Length tim...'
#                          Addition operator (+)
#                          Call
#                              Property 'doubledLength'
#                                  String 'hi there'
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

FF::before_content('hello8.frt');

use Ferret::Core::Operations qw(add mul num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Class 'String'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'String', undef );

        # Method event 'doubledLength' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'doubledLength',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return mul(
                    $scope,
                    $self->property_u('length')
                      ->call_u( {}, $scope, undef, 4.3 ),
                    num( $f, 2 )
                );
                return $return;
            }
        );
        $method_0->inside_scope(
            doubledLength => $scope,
            $proto, $class, undef, undef
        );
    }
    $scope->property_u('say')->call_u(
        [
            add(
                $scope,
                str( $f, "Length times two: " ),
                str( $f, "hi there" )->property_u('doubledLength')
                  ->call_u( {}, $scope, undef, 9.35 )
            )
        ],
        $scope, undef, 9.1
    );
};

FF::after_content();
