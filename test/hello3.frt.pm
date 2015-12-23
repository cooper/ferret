# === Tokenization ===
#        BAREWORD |                   "helloWorld" | 1.05
#      PAREN_CALL |                                | 1.1
#      PROP_VALUE |                        "name2" | 1.15
#          STRING |                        ["USA"] | 1.2
#        OP_COMMA |                                | 1.25
#      PROP_VALUE |                        "name1" | 1.3
#          STRING |                      ["World"] | 1.35
#         PAREN_E |                                | 1.4
#         OP_SEMI |                              1 | 1.45
#        BAREWORD |                   "helloWorld" | 3.1
#      PAREN_CALL |                                | 3.2
#      PROP_VALUE |                        "name1" | 4.1
#          STRING |                      ["Earth"] | 4.2
#        OP_COMMA |                                | 4.3
#      PROP_VALUE |                        "name2" | 5.1
#          STRING |                     ["Humans"] | 5.2
#         OP_SEMI |                              1 | 5.3
#         PAREN_E |                                | 6.1
#         OP_SEMI |                              1 | 6.2
#        BAREWORD |                   "helloWorld" | 8.1
#      PAREN_CALL |                                | 8.2
#          STRING |                   ["Benjamin"] | 8.3
#        OP_COMMA |                                | 8.4
#          STRING |                     ["George"] | 8.5
#         PAREN_E |                                | 8.6
#         OP_SEMI |                              1 | 8.7
#        FUNCTION |          {"name":"helloWorld"} | 10.1
#       CLOSURE_S |                                | 10.2
#    KEYWORD_NEED |                                | 11.1
#         VAR_LEX |                        "name1" | 11.2
#        OP_COMMA |                                | 11.3
#         VAR_LEX |                        "name2" | 11.4
#         OP_SEMI |                              1 | 11.5
#        BAREWORD |                       "hello1" | 13.1
#      PAREN_CALL |                                | 13.2
#         PAREN_E |                                | 13.3
#         OP_SEMI |                              1 | 13.4
#        BAREWORD |                       "hello2" | 14.1
#      PAREN_CALL |                                | 14.2
#         PAREN_E |                                | 14.3
#         OP_SEMI |                              1 | 14.4
#        FUNCTION |              {"name":"hello1"} | 16.1
#       CLOSURE_S |                                | 16.2
#         VAR_LEX |                        "hello" | 17.1
#       OP_ASSIGN |                                | 17.2
#          STRING |                      ["Hello"] | 17.3
#         OP_SEMI |                              1 | 17.4
#         VAR_LEX |                        "hello" | 18.1
#        PROPERTY |                         "name" | 18.2
#       OP_ASSIGN |                                | 18.3
#         VAR_LEX |                        "name1" | 18.4
#         OP_SEMI |                              1 | 18.5
#        BAREWORD |                          "say" | 19.05
#      PAREN_CALL |                                | 19.1
#         VAR_LEX |                        "hello" | 19.15
#          OP_ADD |                                | 19.2
#          STRING |                          [" "] | 19.25
#          OP_ADD |                                | 19.3
#         VAR_LEX |                        "hello" | 19.35
#        PROPERTY |                         "name" | 19.4
#         PAREN_E |                                | 19.45
#         OP_SEMI |                              1 | 19.5
#       CLOSURE_E |                                | 20.1
#        FUNCTION |              {"name":"hello2"} | 22.1
#       CLOSURE_S |                                | 22.2
#        BAREWORD |                          "say" | 23.1
#      PAREN_CALL |                                | 23.2
#          STRING |                     ["Hello "] | 23.3
#          OP_ADD |                                | 23.4
#         VAR_LEX |                        "name2" | 23.5
#         PAREN_E |                                | 23.6
#         OP_SEMI |                              1 | 23.7
#       CLOSURE_E |                                | 24.1
#       CLOSURE_E |                                | 26.1
#         VAR_LEX |                           "pi" | 28.1
#       OP_ASSIGN |                                | 28.2
#          NUMBER |                            "3" | 28.3
#          OP_ADD |                                | 28.4
#          NUMBER |                          "0.1" | 28.5
#          OP_ADD |                                | 28.6
#          NUMBER |                         "0.04" | 28.7
#         OP_SEMI |                              1 | 28.8
#        BAREWORD |                          "say" | 29.1
#      PAREN_CALL |                                | 29.2
#          STRING |  ["Pi = ",["VAR_LEX","pi",29]] | 29.3
#         PAREN_E |                                | 29.4
#         OP_SEMI |                              1 | 29.5
# === Document Model ===
#  Document './test/hello3.frt'
#      Instruction
#          Call
#              Bareword 'helloWorld'
#              Named argument list [2 items]
#                  Item 0
#                      Pair 'name2'
#                          String 'USA'
#                  Item 1
#                      Pair 'name1'
#                          String 'World'
#      Instruction
#          Call
#              Bareword 'helloWorld'
#              Named argument list [2 items]
#                  Item 0
#                      Pair 'name1'
#                          String 'Earth'
#                  Item 1
#                      Pair 'name2'
#                          String 'Humans'
#      Instruction
#          Call
#              Bareword 'helloWorld'
#              Argument list [2 items]
#                  Item 0
#                      String 'Benjamin'
#                  Item 1
#                      String 'George'
#      Function 'helloWorld'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$name1'
#              Instruction
#                  Need
#                      Lexical variable '$name2'
#              Instruction
#                  Call
#                      Bareword 'hello1'
#                      Argument list [0 items]
#              Instruction
#                  Call
#                      Bareword 'hello2'
#                      Argument list [0 items]
#              Function 'hello1'
#                  Body ('function' scope)
#                      Instruction
#                          Assignment (lexical variable '$hello')
#                              String 'Hello'
#                      Instruction
#                          Assignment (property 'name')
#                              Lexical variable '$name1'
#                      Instruction
#                          Call
#                              Bareword 'say'
#                              Argument list [1 items]
#                                  Item 0
#                                      Operation
#                                          Lexical variable '$hello'
#                                          Addition operator (+)
#                                          String ' '
#                                          Addition operator (+)
#                                          Property 'name'
#                                              Lexical variable '$hello'
#              Function 'hello2'
#                  Body ('function' scope)
#                      Instruction
#                          Call
#                              Bareword 'say'
#                              Argument list [1 items]
#                                  Item 0
#                                      Operation
#                                          String 'Hello '
#                                          Addition operator (+)
#                                          Lexical variable '$name2'
#      Instruction
#          Assignment (lexical variable '$pi')
#              Operation
#                  Number '3'
#                  Addition operator (+)
#                  Number '0.1'
#                  Addition operator (+)
#                  Number '0.04'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Pi = '
#                          Addition operator (+)
#                          Lexical variable '$pi'
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

FF::before_content('hello3.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Function event 'hello1' definition
    my $func_0 = FF::function_event_def(
        $f, $scope, 'hello1',
        [],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->set_property_ow(
                $context,
                hello => str( $f, "Hello" ),
                17.2
            );
            $scope->property_u('hello')
              ->set_property( name => $scope->property_u('name1'), 18.3 );
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope,
                        $scope->property_u('hello'),
                        str( $f, " " ),
                        $scope->property_u('hello')->property_u('name')
                    )
                ],
                $scope, undef, 19.1
            );
            return $return;
        }
    );

    # Function event 'hello2' definition
    my $func_1 = FF::function_event_def(
        $f, $scope, 'hello2',
        [],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "Hello " ),
                        $scope->property_u('name2')
                    )
                ],
                $scope, undef, 23.2
            );
            return $return;
        }
    );

    # Function event 'helloWorld' definition
    my $func_2 = FF::function_event_def(
        $f, $scope,
        'helloWorld',
        [
            {
                name     => 'name1',
                type     => undef,
                optional => undef,
                more     => undef
            },
            {
                name     => 'name2',
                type     => undef,
                optional => undef,
                more     => undef
            }
        ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $func_0->inside_scope(
                hello1 => $scope,
                $scope, undef, undef, undef
            );
            $func_1->inside_scope(
                hello2 => $scope,
                $scope, undef, undef, undef
            );
            FF::need( $scope, $arguments, 'name1', 11.2 ) or return;
            FF::need( $scope, $arguments, 'name2', 11.4 ) or return;
            $scope->property_u('hello1')->call_u( {}, $scope, undef, 13.2 );
            $scope->property_u('hello2')->call_u( {}, $scope, undef, 14.2 );
            return $return;
        }
    );
    $func_2->inside_scope( helloWorld => $scope, $scope, undef, undef, undef );
    $scope->property_u('helloWorld')
      ->call_u( { name2 => str( $f, "USA" ), name1 => str( $f, "World" ) },
        $scope, undef, 1.1 );
    $scope->property_u('helloWorld')
      ->call_u( { name1 => str( $f, "Earth" ), name2 => str( $f, "Humans" ) },
        $scope, undef, 3.2 );
    $scope->property_u('helloWorld')
      ->call_u( [ str( $f, "Benjamin" ), str( $f, "George" ) ],
        $scope, undef, 8.2 );
    $scope->set_property_ow(
        $context,
        pi => add( $scope, num( $f, 3 ), num( $f, 0.1 ), num( $f, 0.04 ) ),
        28.2
    );
    $scope->property_u('say')
      ->call_u( [ add( $scope, str( $f, "Pi = " ), $scope->property_u('pi') ) ],
        $scope, undef, 29.2 );
};

FF::after_content();
