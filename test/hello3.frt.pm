# === Tokenization ===
#        BAREWORD | "helloWorld"
#      PAREN_CALL | 
#      PROP_VALUE | "name2"
#          STRING | ["USA"]
#        OP_COMMA | 
#      PROP_VALUE | "name1"
#          STRING | ["World"]
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "helloWorld"
#      PAREN_CALL | 
#      PROP_VALUE | "name1"
#          STRING | ["Earth"]
#        OP_COMMA | 
#      PROP_VALUE | "name2"
#          STRING | ["Humans"]
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "helloWorld"
#      PAREN_CALL | 
#          STRING | ["Benjamin"]
#        OP_COMMA | 
#          STRING | ["George"]
#         PAREN_E | 
#         OP_SEMI | 
#        FUNCTION | {"name":"helloWorld"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "name1"
#        OP_COMMA | 
#         VAR_LEX | "name2"
#         OP_SEMI | 
#        BAREWORD | "hello1"
#      PAREN_CALL | 
#         PAREN_E | 
#         OP_SEMI | 
#        BAREWORD | "hello2"
#      PAREN_CALL | 
#         PAREN_E | 
#         OP_SEMI | 
#        FUNCTION | {"name":"hello1"}
#       CLOSURE_S | 
#         VAR_LEX | "hello"
#       OP_ASSIGN | 
#          STRING | ["Hello"]
#         OP_SEMI | 
#         VAR_LEX | "hello"
#        PROPERTY | "name"
#       OP_ASSIGN | 
#         VAR_LEX | "name1"
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#         VAR_LEX | "hello"
#          OP_ADD | 
#          STRING | [" "]
#          OP_ADD | 
#         VAR_LEX | "hello"
#        PROPERTY | "name"
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#        FUNCTION | {"name":"hello2"}
#       CLOSURE_S | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Hello "]
#          OP_ADD | 
#         VAR_LEX | "name2"
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#       CLOSURE_E | 
#         VAR_LEX | "pi"
#       OP_ASSIGN | 
#          NUMBER | "3"
#          OP_ADD | 
#          NUMBER | "0.1"
#          OP_ADD | 
#          NUMBER | "0.04"
#         OP_SEMI | 
#        BAREWORD | "say"
#      PAREN_CALL | 
#          STRING | ["Pi = ",["VAR_LEX","pi",30]]
#         PAREN_E | 
#         OP_SEMI | 
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
                17.5
            );
            $scope->property_u('hello')
              ->set_property( name => $scope->property_u('name1'), 18.6 );
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope,
                        $scope->property_u('hello'),
                        str( $f, " " ),
                        $scope->property_u('hello')->property_u('name')
                    )
                ],
                $scope, undef, 19.2
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
                $scope, undef, 23.28571
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
            FF::need( $scope, $arguments, 'name1', 11.4 ) or return;
            FF::need( $scope, $arguments, 'name2', 11.8 ) or return;
            $scope->property_u('hello1')->call_u( {}, $scope, undef, 13.5 );
            $scope->property_u('hello2')->call_u( {}, $scope, undef, 14.5 );
            return $return;
        }
    );
    $func_2->inside_scope( helloWorld => $scope, $scope, undef, undef, undef );
    $scope->property_u('helloWorld')
      ->call_u( { name2 => str( $f, "USA" ), name1 => str( $f, "World" ) },
        $scope, undef, 1.22222 );
    $scope->property_u('helloWorld')
      ->call_u( { name1 => str( $f, "Earth" ), name2 => str( $f, "Humans" ) },
        $scope, undef, 4 );
    $scope->property_u('helloWorld')
      ->call_u( [ str( $f, "Benjamin" ), str( $f, "George" ) ],
        $scope, undef, 8.28571 );
    $scope->set_property_ow(
        $context,
        pi => add( $scope, num( $f, 3 ), num( $f, 0.1 ), num( $f, 0.04 ) ),
        28.25
    );
    $scope->property_u('say')
      ->call_u( [ add( $scope, str( $f, "Pi = " ), $scope->property_u('pi') ) ],
        $scope, undef, 29.4 );
};

FF::after_content();
