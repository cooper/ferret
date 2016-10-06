# === Document Model ===
#  Document './test/3-nested-functions.frt'
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
#                          Assignment
#                              Lexical variable '$hello'
#                              String 'Hello'
#                      Instruction
#                          Assignment
#                              Property 'name'
#                                  Lexical variable '$hello'
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
#          Assignment
#              Lexical variable '$pi'
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
    my $config = $ENV{FERRET_CONFIG} || '/etc/ferret.conf';
    do $config or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined, $ret_func ) = FF::get_constant_objects($f);

my $pos = FF::before_content( '3-nested-functions.frt',
    './test/3-nested-functions.frt' );

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Function event 'hello1' definition
    my $func_0 = FF::function_event_def(
        $f, $scope, 'hello1', undef,
        [],
        sub {
            my ( $scope, $_self, $this, $args, $ret ) = &FF::args_v1;
            my $self = $_self || $self;
            FF::lex_assign(
                $scope,
                hello => str( $f, "Hello" ),
                $file_scope, $pos->(17.2)
            );
            $$scope->{'hello'}
              ->set_property( name => $$scope->{'name1'}, $pos->(18.3) );
            $$scope->{'say'}->(
                [
                    add(
                        $scope, $$scope->{'hello'},
                        str( $f, " " ), ${ $$scope->{'hello'} }->{'name'}
                    )
                ],
                $scope, undef,
                $pos->(19.1)
            );
            return $ret;
        }
    );

    # Function event 'hello2' definition
    my $func_1 = FF::function_event_def(
        $f, $scope, 'hello2', undef,
        [],
        sub {
            my ( $scope, $_self, $this, $args, $ret ) = &FF::args_v1;
            my $self = $_self || $self;
            $$scope->{'say'}->(
                [ add( $scope, str( $f, "Hello " ), $$scope->{'name2'} ) ],
                $scope, undef, $pos->(23.2)
            );
            return $ret;
        }
    );

    # Function event 'helloWorld' definition
    my $func_2 = FF::function_event_def(
        $f, $context,
        'helloWorld',
        undef,
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
            my ( $scope, $_self, $this, $args, $ret ) = &FF::args_v1;
            my $self = $_self || $self;
            $func_0->inside_scope(
                hello1 => $scope,
                $scope, undef, undef, undef
            );
            $func_1->inside_scope(
                hello2 => $scope,
                $scope, undef, undef, undef
            );
            FF::need( $scope, $args, 'name1', 11.2 ) or return;
            FF::need( $scope, $args, 'name2', 11.4 ) or return;
            $$scope->{'hello1'}->( [ undef, [] ], $scope, undef, $pos->(13.2) );
            $$scope->{'hello2'}->( [ undef, [] ], $scope, undef, $pos->(14.2) );
            return $ret;
        }
    );
    $func_2->inside_scope(
        helloWorld => $scope,
        $context, undef, undef, undef
    );
    $$scope->{'helloWorld'}->(
        [ undef, [ name2 => str( $f, "USA" ), name1 => str( $f, "World" ) ] ],
        $scope, undef, $pos->(1.1)
    );
    $$scope->{'helloWorld'}->(
        [
            undef, [ name1 => str( $f, "Earth" ), name2 => str( $f, "Humans" ) ]
        ],
        $scope, undef,
        $pos->(3.2)
    );
    $$scope->{'helloWorld'}->(
        [ str( $f, "Benjamin" ), str( $f, "George" ) ],
        $scope, undef, $pos->(8.2)
    );
    FF::lex_assign(
        $scope,
        pi =>
          add( $scope, num( $f, "3" ), num( $f, "0.1" ), num( $f, "0.04" ) ),
        undef, $pos->(28.2)
    );
    $$scope->{'say'}->(
        [ add( $scope, str( $f, "Pi = " ), $$scope->{'pi'} ) ],
        $scope, undef, $pos->(29.2)
    );
};

FF::after_content();
