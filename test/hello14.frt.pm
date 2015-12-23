# === Tokenization ===
#        BAREWORD |                          "say" | 1.16667
#      PAREN_CALL |                                | 1.33333
#          STRING |                       ["test"] | 1.5
#         PAREN_E |                                | 1.66667
#         OP_SEMI |                                | 1.83333
#         VAR_LEX |                          "str" | 3.2
#       OP_ASSIGN |                                | 3.4
#          STRING |                         ["hi"] | 3.6
#         OP_SEMI |                                | 3.8
#      KEYWORD_ON |                                | 8.2
#         VAR_LEX |                          "str" | 8.4
#        PROPERTY |                       "length" | 8.6
#       CLOSURE_S |                                | 8.8
#        BAREWORD |                          "say" | 11.16667
#      PAREN_CALL |                                | 11.33333
#          STRING | ["found '",["VAR_SPEC","this",11],"' length to be ",["VAR_SPEC","return",11]] | 11.5
#         PAREN_E |                                | 11.66667
#         OP_SEMI |                                | 11.83333
#       CLOSURE_E |                                | 12.5
#         VAR_LEX |                          "str" | 14.16667
#        PROPERTY |                       "length" | 14.33333
#      PAREN_CALL |                                | 14.5
#         PAREN_E |                                | 14.66667
#         OP_SEMI |                                | 14.83333
#          STRING |                      ["hello"] | 16.16667
#        PROPERTY |                       "length" | 16.33333
#      PAREN_CALL |                                | 16.5
#         PAREN_E |                                | 16.66667
#         OP_SEMI |                                | 16.83333
#      KEYWORD_ON |                                | 21.16667
#        BAREWORD |                       "String" | 21.33333
#        PROPERTY |                        "proto" | 21.5
#        PROPERTY |                       "length" | 21.66667
#       CLOSURE_S |                                | 21.83333
#        BAREWORD |                          "say" | 22.16667
#      PAREN_CALL |                                | 22.33333
#          STRING | ["found '",["VAR_SPEC","this",22],"' length to be ",["VAR_SPEC","return",22]] | 22.5
#         PAREN_E |                                | 22.66667
#         OP_SEMI |                                | 22.83333
#       CLOSURE_E |                                | 23.5
#          STRING |                      ["hello"] | 25.16667
#        PROPERTY |                       "length" | 25.33333
#      PAREN_CALL |                                | 25.5
#         PAREN_E |                                | 25.66667
#         OP_SEMI |                                | 25.83333
# === Document Model ===
#  Document './test/hello14.frt'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      String 'test'
#      Instruction
#          Assignment (lexical variable '$str')
#              String 'hi'
#      On
#          Expression ('on' parameter)
#              Property 'length'
#                  Lexical variable '$str'
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      String 'found ''
#                                      Addition operator (+)
#                                      Special variable '*this'
#                                      Addition operator (+)
#                                      String '' length t...'
#                                      Addition operator (+)
#                                      Special variable '*return'
#      Instruction
#          Call
#              Property 'length'
#                  Lexical variable '$str'
#              Argument list [0 items]
#      Instruction
#          Call
#              Property 'length'
#                  String 'hello'
#              Argument list [0 items]
#      On
#          Expression ('on' parameter)
#              Property 'length'
#                  Property 'proto'
#                      Bareword 'String'
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      String 'found ''
#                                      Addition operator (+)
#                                      Special variable '*this'
#                                      Addition operator (+)
#                                      String '' length t...'
#                                      Addition operator (+)
#                                      Special variable '*return'
#      Instruction
#          Call
#              Property 'length'
#                  String 'hello'
#              Argument list [0 items]
#      Include (String)
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

FF::before_content('hello14.frt');

use Ferret::Core::Operations qw(add str);
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
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope,
                        str( $f, "found '" ),
                        $scope->{special}->property_u('this'),
                        str( $f, "' length to be " ),
                        $scope->{special}->property_u('return')
                    )
                ],
                $scope, undef, 11.33333
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
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope,
                        str( $f, "found '" ),
                        $scope->{special}->property_u('this'),
                        str( $f, "' length to be " ),
                        $scope->{special}->property_u('return')
                    )
                ],
                $scope, undef, 22.33333
            );
            return $return;
        }
    );
    FF::load_namespaces( $context, qw(String) );
    $scope->property_u('say')
      ->call_u( [ str( $f, "test" ) ], $scope, undef, 1.33333 );
    $scope->set_property_ow( $context, str => str( $f, "hi" ), 3.4 );
    FF::on(
        $scope->property_u('str'),
        'length',
        $self,
        $scope,
        $func_0->inside_scope( (undef) => $scope, $scope, undef, undef, undef ),
        {}
    );
    $scope->property_u('str')->property_u('length')
      ->call_u( {}, $scope, undef, 14.5 );
    str( $f, "hello" )->property_u('length')->call_u( {}, $scope, undef, 16.5 );
    FF::on(
        $scope->property_u('String')->property_u('proto'),
        'length',
        $self,
        $scope,
        $func_1->inside_scope( (undef) => $scope, $scope, undef, undef, undef ),
        {}
    );
    str( $f, "hello" )->property_u('length')->call_u( {}, $scope, undef, 25.5 );
};

FF::after_content();
