# --- DOM ---
#  Document './hello3.frt'
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
#                      Pair 'name2'
#                          String 'Humans'
#                  Item 1
#                      Pair 'name1'
#                          String 'Earth'
#      Function 'helloWorld'
#          Instruction
#              Need
#                  Lexical variable '$name1'
#                  Token OP_COMMA
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
use warnings;
use strict;
use utf8;
use 5.010;
use lib 'lib';
use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello3.frt.pm'}++;

use Ferret::Core::Operations qw(add num str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    Ferret::space( $context, $_ ) for qw();

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
      ->call( { name2 => str( $f, "Humans" ), name1 => str( $f, "Earth" ) },
        $scope );
    $scope->set_property(
        pi => add( $scope, num( $f, 3 ), num( $f, 0.1 ), num( $f, 0.04 ) ) );
    $scope->property('say')
      ->call( [ add( $scope, str( $f, "Pi = " ), $scope->property('pi') ) ],
        $scope );
}
