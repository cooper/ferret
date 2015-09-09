# --- Tokens ---
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
#         OP_CALL | 
#         OP_SEMI | 
#        BAREWORD | "hello2"
#         OP_CALL | 
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
#          STRING | ["Pi = ",["VAR_LEX","pi",126]]
#         PAREN_E | 
#         OP_SEMI | 
# --- DOM ---
#  Document './test/hello3.frt'
#      Instruction
#          Call
#              Bareword 'helloWorld'
#              Hash [2 items]
#                  Item 0
#                      Pair 'name2'
#                          String 'USA'
#                  Item 1
#                      Pair 'name1'
#                          String 'World'
#      Instruction
#          Call
#              Bareword 'helloWorld'
#              Hash [2 items]
#                  Item 0
#                      Pair 'name1'
#                          String 'Earth'
#                  Item 1
#                      Pair 'name2'
#                          String 'Humans'
#      Instruction
#          Call
#              Bareword 'helloWorld'
#              Structural list [2 items]
#                  Item 0
#                      String 'Benjamin'
#                  Item 1
#                      String 'George'
#      Function 'helloWorld'
#          Instruction
#              Need
#                  Lexical variable '$name1'
#                  Comma (,)
#                  Lexical variable '$name2'
#          Instruction
#              Call
#                  Bareword 'hello1'
#          Instruction
#              Call
#                  Bareword 'hello2'
#          Function 'hello1'
#              Instruction
#                  Assignment
#                      Lexical variable '$hello'
#                      String 'Hello'
#              Instruction
#                  Assignment
#                      Property 'name'
#                          Lexical variable '$hello'
#                      Lexical variable '$name1'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Structural list [1 items]
#                          Item 0
#                              Mathematical operation
#                                  Lexical variable '$hello'
#                                  Addition operator (+)
#                                  String ' '
#                                  Addition operator (+)
#                                  Property 'name'
#                                      Lexical variable '$hello'
#          Function 'hello2'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Structural list [1 items]
#                          Item 0
#                              Mathematical operation
#                                  String 'Hello '
#                                  Addition operator (+)
#                                  Lexical variable '$name2'
#      Instruction
#          Assignment
#              Lexical variable '$pi'
#              Mathematical operation
#                  Number '3'
#                  Addition operator (+)
#                  Number '0.1'
#                  Addition operator (+)
#                  Number '0.04'
#      Instruction
#          Call
#              Bareword 'say'
#              Structural list [1 items]
#                  Item 0
#                      Mathematical operation
#                          String 'Pi = '
#                          Addition operator (+)
#                          Lexical variable '$pi'
#      Include
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    my $libs = do '/etc/ferret.conf';
    ref $libs eq 'ARRAY' or die "config error";
    unshift @INC, @$libs;
}

use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello3.frt.pm'}++;

use Ferret::Core::Operations qw(add num str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    # Function 'hello1' definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, name => 'hello1' );

        $func->{code} = sub {
            my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
            $scope->set_property( hello => str( $f, "Hello" ) );
            $scope->property('hello')
              ->set_property( name => $scope->property('name1') );
            $scope->property('say')->call(
                [
                    add(
                        $scope,
                        $scope->property('hello'),
                        str( $f, " " ),
                        $scope->property('hello')->property('name')
                    )
                ],
                $scope
            );
            return $return;
        };
    }

    # Function 'hello2' definition
    {
        my $func = $funcs[1] = Ferret::Function->new( $f, name => 'hello2' );

        $func->{code} = sub {
            my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
            $scope->property('say')->call(
                [
                    add(
                        $scope, str( $f, "Hello " ),
                        $scope->property('name2')
                    )
                ],
                $scope
            );
            return $return;
        };
    }

    # Function 'helloWorld' definition
    {
        my $func = $funcs[2] =
          Ferret::Function->new( $f, name => 'helloWorld' );
        $func->add_argument( name => 'name1' );
        $func->add_argument( name => 'name2' );
        $func->{code} = sub {
            my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
            $funcs[0]->inside_scope( hello1 => $scope, $scope );
            $funcs[1]->inside_scope( hello2 => $scope, $scope );
            do {
                return if not defined $arguments->{name1};
                $scope->set_property( name1 => $arguments->{name1} );
            };
            do {
                return if not defined $arguments->{name2};
                $scope->set_property( name2 => $arguments->{name2} );
            };
            $scope->property('hello1')->call( [], $scope );
            $scope->property('hello2')->call( [], $scope );
            return $return;
        };
    }
    $funcs[2]->inside_scope( helloWorld => $scope, $scope );

    $scope->property('helloWorld')
      ->call( { name2 => str( $f, "USA" ), name1 => str( $f, "World" ) },
        $scope );
    $scope->property('helloWorld')
      ->call( { name1 => str( $f, "Earth" ), name2 => str( $f, "Humans" ) },
        $scope );
    $scope->property('helloWorld')
      ->call( [ str( $f, "Benjamin" ), str( $f, "George" ) ], $scope );
    $scope->set_property(
        pi => add( $scope, num( $f, 3 ), num( $f, 0.1 ), num( $f, 0.04 ) ) );
    $scope->property('say')
      ->call( [ add( $scope, str( $f, "Pi = " ), $scope->property('pi') ) ],
        $scope );
}
