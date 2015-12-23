# === Tokenization ===
#         VAR_LEX |                          "obj" | 2.2
#       OP_ASSIGN |                                | 2.4
#          STRING |                         ["hi"] | 2.6
#         OP_SEMI |                              1 | 2.8
#        BAREWORD |                         "Math" | 9.07143
#         OP_PACK |                                | 9.14286
#        BAREWORD |                        "Point" | 9.21429
#        PROPERTY |                         "init" | 9.28571
#      PAREN_CALL |                                | 9.35714
#         VAR_LEX |                          "obj" | 9.42857
#         PAREN_E |                                | 9.5
#      PAREN_CALL |                                | 9.57143
#          NUMBER |                            "1" | 9.64286
#        OP_COMMA |                                | 9.71429
#          NUMBER |                            "1" | 9.78571
#         PAREN_E |                                | 9.85714
#         OP_SEMI |                              1 | 9.92857
#        BAREWORD |                          "say" | 11.125
#      PAREN_CALL |                                | 11.25
#         VAR_LEX |                          "obj" | 11.375
#        PROPERTY |                       "pretty" | 11.5
#         OP_CALL |                                | 11.625
#         PAREN_E |                                | 11.75
#         OP_SEMI |                              1 | 11.875
# === Document Model ===
#  Document './test/hello16.frt'
#      Instruction
#          Assignment (lexical variable '$obj')
#              String 'hi'
#      Instruction
#          Call
#              Call
#                  Property 'init'
#                      Bareword 'Math::Point'
#                  Argument list [1 items]
#                      Item 0
#                          Lexical variable '$obj'
#              Argument list [2 items]
#                  Item 0
#                      Number '1'
#                  Item 1
#                      Number '1'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Call
#                          Property 'pretty'
#                              Lexical variable '$obj'
#      Include (Math, Math::Point)
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

FF::before_content('hello16.frt');

use Ferret::Core::Operations qw(num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    FF::load_namespaces( $context, qw(Math Math::Point) );
    $scope->set_property_ow( $context, obj => str( $f, "hi" ), 2.4 );
    $scope->property_u('Math::Point')->property_u('init')
      ->call_u( [ $scope->property_u('obj') ], $scope, undef, 9.35714 )
      ->call_u( [ num( $f, 1 ), num( $f, 1 ) ], $scope, undef, 9.57143 );
    $scope->property_u('say')->call_u(
        [
            $scope->property_u('obj')->property_u('pretty')
              ->call_u( {}, $scope, undef, 11.625 )
        ],
        $scope, undef, 11.25
    );
};

FF::after_content();
