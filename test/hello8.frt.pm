# === Tokenization ===
#       CLASS_DEC |              {"name":"String"} | 1.5
#          METHOD |       {"name":"doubledLength"} | 3.33333
#       CLOSURE_S |                                | 3.66667
#  KEYWORD_RETURN |                                | 4.14286
#        VAR_THIS |                       "length" | 4.28571
#         OP_CALL |                                | 4.42857
#          OP_MUL |                                | 4.57143
#          NUMBER |                            "2" | 4.71429
#         OP_SEMI |                                | 4.85714
#       CLOSURE_E |                                | 5.5
#     KEYWORD_END |                                | 7.5
#        BAREWORD |                          "say" | 9.1
#      PAREN_CALL |                                | 9.2
#          STRING |         ["Length times two: "] | 9.3
#          OP_ADD |                                | 9.4
#          STRING |                   ["hi there"] | 9.5
#        PROPERTY |                "doubledLength" | 9.6
#         OP_CALL |                                | 9.7
#         PAREN_E |                                | 9.8
#         OP_SEMI |                                | 9.9
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
                      ->call_u( {}, $scope, undef, 4.42857 ),
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
                  ->call_u( {}, $scope, undef, 9.7 )
            )
        ],
        $scope, undef, 9.2
    );
};

FF::after_content();
