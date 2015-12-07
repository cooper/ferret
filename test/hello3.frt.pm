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
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die "config error";
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = FF::get_ferret();

FF::before_content('hello3.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Function event 'hello1' callback definition
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
            $scope->property_u('hello')->set_property(
                name => $scope->property_u('name1'),
                18.5581395348837
            );
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope,
                        $scope->property_u('hello'),
                        str( $f, " " ),
                        $scope->property_u('hello')->property_u('name')
                    )
                ],
                $scope, undef,
                19.6046511627907
            );
            return $return;
        }
    );

    # Function event 'hello2' callback definition
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
                $scope, undef,
                23.7558139534884
            );
            return $return;
        }
    );

    # Function event 'helloWorld' callback definition
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
            FF::need( $scope, $arguments, 'name1' ) or return;
            FF::need( $scope, $arguments, 'name2' ) or return;
            $scope->property_u('hello1')
              ->call_u( {}, $scope, undef, 13.3837209302326 );
            $scope->property_u('hello2')
              ->call_u( {}, $scope, undef, 14.4302325581395 );
            return $return;
        }
    );
    $func_2->inside_scope( helloWorld => $scope, $scope, undef, undef, undef );
    $scope->property_u('helloWorld')
      ->call_u( { name2 => str( $f, "USA" ), name1 => str( $f, "World" ) },
        $scope, undef, 1.01162790697674 );
    $scope->property_u('helloWorld')
      ->call_u( { name1 => str( $f, "Earth" ), name2 => str( $f, "Humans" ) },
        $scope, undef, 3.11627906976744 );
    $scope->property_u('helloWorld')
      ->call_u( [ str( $f, "Benjamin" ), str( $f, "George" ) ],
        $scope, undef, 8.22093023255814 );
    $scope->set_property_ow(
        $context,
        pi => add( $scope, num( $f, 3 ), num( $f, 0.1 ), num( $f, 0.04 ) ),
        28.8604651162791
    );
    $scope->property_u('say')
      ->call_u( [ add( $scope, str( $f, "Pi = " ), $scope->property_u('pi') ) ],
        $scope, undef, 29.953488372093 );
};

FF::after_content();
