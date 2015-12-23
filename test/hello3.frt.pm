# === Tokenization ===
#        BAREWORD |                   "helloWorld" | 1.1
#      PAREN_CALL |                                | 1.2
#      PROP_VALUE |                        "name2" | 1.3
#          STRING |                        ["USA"] | 1.4
#        OP_COMMA |                                | 1.5
#      PROP_VALUE |                        "name1" | 1.6
#          STRING |                      ["World"] | 1.7
#         PAREN_E |                                | 1.8
#         OP_SEMI |                              1 | 1.9
#        BAREWORD |                   "helloWorld" | 3.33333
#      PAREN_CALL |                                | 3.66667
#      PROP_VALUE |                        "name1" | 4.25
#          STRING |                      ["Earth"] | 4.5
#        OP_COMMA |                                | 4.75
#      PROP_VALUE |                        "name2" | 5.25
#          STRING |                     ["Humans"] | 5.5
#         OP_SEMI |                              1 | 5.75
#         PAREN_E |                                | 6.33333
#         OP_SEMI |                              1 | 6.66667
#        BAREWORD |                   "helloWorld" | 8.125
#      PAREN_CALL |                                | 8.25
#          STRING |                   ["Benjamin"] | 8.375
#        OP_COMMA |                                | 8.5
#          STRING |                     ["George"] | 8.625
#         PAREN_E |                                | 8.75
#         OP_SEMI |                              1 | 8.875
#        FUNCTION |          {"name":"helloWorld"} | 10.33333
#       CLOSURE_S |                                | 10.66667
#    KEYWORD_NEED |                                | 11.16667
#         VAR_LEX |                        "name1" | 11.33333
#        OP_COMMA |                                | 11.5
#         VAR_LEX |                        "name2" | 11.66667
#         OP_SEMI |                              1 | 11.83333
#        BAREWORD |                       "hello1" | 13.2
#      PAREN_CALL |                                | 13.4
#         PAREN_E |                                | 13.6
#         OP_SEMI |                              1 | 13.8
#        BAREWORD |                       "hello2" | 14.2
#      PAREN_CALL |                                | 14.4
#         PAREN_E |                                | 14.6
#         OP_SEMI |                              1 | 14.8
#        FUNCTION |              {"name":"hello1"} | 16.33333
#       CLOSURE_S |                                | 16.66667
#         VAR_LEX |                        "hello" | 17.2
#       OP_ASSIGN |                                | 17.4
#          STRING |                      ["Hello"] | 17.6
#         OP_SEMI |                              1 | 17.8
#         VAR_LEX |                        "hello" | 18.16667
#        PROPERTY |                         "name" | 18.33333
#       OP_ASSIGN |                                | 18.5
#         VAR_LEX |                        "name1" | 18.66667
#         OP_SEMI |                              1 | 18.83333
#        BAREWORD |                          "say" | 19.09091
#      PAREN_CALL |                                | 19.18182
#         VAR_LEX |                        "hello" | 19.27273
#          OP_ADD |                                | 19.36364
#          STRING |                          [" "] | 19.45455
#          OP_ADD |                                | 19.54545
#         VAR_LEX |                        "hello" | 19.63636
#        PROPERTY |                         "name" | 19.72727
#         PAREN_E |                                | 19.81818
#         OP_SEMI |                              1 | 19.90909
#       CLOSURE_E |                                | 20.5
#        FUNCTION |              {"name":"hello2"} | 22.33333
#       CLOSURE_S |                                | 22.66667
#        BAREWORD |                          "say" | 23.125
#      PAREN_CALL |                                | 23.25
#          STRING |                     ["Hello "] | 23.375
#          OP_ADD |                                | 23.5
#         VAR_LEX |                        "name2" | 23.625
#         PAREN_E |                                | 23.75
#         OP_SEMI |                              1 | 23.875
#       CLOSURE_E |                                | 24.5
#       CLOSURE_E |                                | 26.5
#         VAR_LEX |                           "pi" | 28.11111
#       OP_ASSIGN |                                | 28.22222
#          NUMBER |                            "3" | 28.33333
#          OP_ADD |                                | 28.44444
#          NUMBER |                          "0.1" | 28.55556
#          OP_ADD |                                | 28.66667
#          NUMBER |                         "0.04" | 28.77778
#         OP_SEMI |                              1 | 28.88889
#        BAREWORD |                          "say" | 29.16667
#      PAREN_CALL |                                | 29.33333
#          STRING |  ["Pi = ",["VAR_LEX","pi",29]] | 29.5
#         PAREN_E |                                | 29.66667
#         OP_SEMI |                              1 | 29.83333
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
                17.4
            );
            $scope->property_u('hello')
              ->set_property( name => $scope->property_u('name1'), 18.5 );
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope,
                        $scope->property_u('hello'),
                        str( $f, " " ),
                        $scope->property_u('hello')->property_u('name')
                    )
                ],
                $scope, undef, 19.18182
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
                $scope, undef, 23.25
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
            FF::need( $scope, $arguments, 'name1', 11.33333 ) or return;
            FF::need( $scope, $arguments, 'name2', 11.66667 ) or return;
            $scope->property_u('hello1')->call_u( {}, $scope, undef, 13.4 );
            $scope->property_u('hello2')->call_u( {}, $scope, undef, 14.4 );
            return $return;
        }
    );
    $func_2->inside_scope( helloWorld => $scope, $scope, undef, undef, undef );
    $scope->property_u('helloWorld')
      ->call_u( { name2 => str( $f, "USA" ), name1 => str( $f, "World" ) },
        $scope, undef, 1.2 );
    $scope->property_u('helloWorld')
      ->call_u( { name1 => str( $f, "Earth" ), name2 => str( $f, "Humans" ) },
        $scope, undef, 3.66667 );
    $scope->property_u('helloWorld')
      ->call_u( [ str( $f, "Benjamin" ), str( $f, "George" ) ],
        $scope, undef, 8.25 );
    $scope->set_property_ow(
        $context,
        pi => add( $scope, num( $f, 3 ), num( $f, 0.1 ), num( $f, 0.04 ) ),
        28.22222
    );
    $scope->property_u('say')
      ->call_u( [ add( $scope, str( $f, "Pi = " ), $scope->property_u('pi') ) ],
        $scope, undef, 29.33333 );
};

FF::after_content();
