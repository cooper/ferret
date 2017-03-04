# === Document Model ===
#  File './test/3-nested-functions.frt'
#      Package 'main'
#          Instruction
#              Call
#                  Bareword 'helloWorld'
#                  Named argument list [2 items]
#                      Item 0
#                          Pair 'name2'
#                              String 'USA'
#                      Item 1
#                          Pair 'name1'
#                              String 'World'
#          Instruction
#              Call
#                  Bareword 'helloWorld'
#                  Named argument list [2 items]
#                      Item 0
#                          Pair 'name1'
#                              String 'Earth'
#                      Item 1
#                          Pair 'name2'
#                              String 'Humans'
#          Instruction
#              Call
#                  Bareword 'helloWorld'
#                  Argument list [2 items]
#                      Item 0
#                          String 'Benjamin'
#                      Item 1
#                          String 'George'
#          Function 'helloWorld' { $name1 $name2 }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$name1'
#                  Instruction
#                      Need
#                          Lexical variable '$name2'
#                  Instruction
#                      Call
#                          Bareword 'hello1'
#                          Argument list [0 items]
#                  Instruction
#                      Call
#                          Bareword 'hello2'
#                          Argument list [0 items]
#                  Function 'hello1'
#                      Function body
#                          Instruction
#                              Assignment
#                                  Lexical variable '$hello'
#                                  String 'Hello'
#                          Instruction
#                              Assignment
#                                  Property 'name'
#                                      Lexical variable '$hello'
#                                  Lexical variable '$name1'
#                          Instruction
#                              Call
#                                  Bareword 'say'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Operation
#                                              Lexical variable '$hello'
#                                              Addition operator (+)
#                                              String ' '
#                                              Addition operator (+)
#                                              Property 'name'
#                                                  Lexical variable '$hello'
#                  Function 'hello2'
#                      Function body
#                          Instruction
#                              Call
#                                  Bareword 'say'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Operation
#                                              String 'Hello '
#                                              Addition operator (+)
#                                              Lexical variable '$name2'
#          Instruction
#              Assignment
#                  Lexical variable '$pi'
#                  Operation
#                      Number '3'
#                      Addition operator (+)
#                      Number '0.1'
#                      Addition operator (+)
#                      Number '0.04'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Argument list [1 item]
#                      Item 0
#                          Operation
#                              String 'Pi = '
#                              Addition operator (+)
#                              Lexical variable '$pi'
package FF;

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
use Ferret::Core::Operations qw(add num str);

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) =
  before_content( '3-nested-functions.frt', './test/3-nested-functions.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main', 1.05 );
    my $scope = $file_scope;
    load_core('main');

    # Function event 'hello1' definition
    my $func_0 = function_event_def(
        $f, $scope, 'hello1', undef, undef, undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            var(
                $scope,
                hello => str( $f, "Hello" ),
                $file_scope, $pos->(17.2)
            );
            $$scope->{'hello'}
              ->set_property( name => $$scope->{'name1'}, $pos->(18.3) );
            $$scope->{'say'}->(
                [
                    add(
                        $scope,
                        $pos->(19.2),
                        $$scope->{'hello'},
                        str( $f, " " ),
                        $$scope->{'hello'}->property_u( 'name', $pos->(19.4) )
                    )
                ],
                $scope, undef,
                $pos->(19.1)
            );
            return $ret;
        }
    );

    # Function event 'hello2' definition
    my $func_1 = function_event_def(
        $f, $scope, 'hello2', undef, undef, undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            $$scope->{'say'}->(
                [
                    add(
                        $scope, $pos->(23.4),
                        str( $f, "Hello " ), $$scope->{'name2'}
                    )
                ],
                $scope, undef,
                $pos->(23.2)
            );
            return $ret;
        }
    );

    # Function event 'helloWorld' definition
    my $func_2 = function_event_def(
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
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            $func_0->inside_scope(
                hello1 => $scope,
                $scope, undef, $ins, undef, undef
            );
            $func_1->inside_scope(
                hello2 => $scope,
                $scope, undef, $ins, undef, undef
            );
            need( $scope, $args, 'name1', 11.2 ) || return $ret_func->();
            need( $scope, $args, 'name2', 11.4 ) || return $ret_func->();
            $$scope->{'hello1'}->( [ undef, [] ], $scope, undef, $pos->(13.2) );
            $$scope->{'hello2'}->( [ undef, [] ], $scope, undef, $pos->(14.2) );
            return $ret;
        }
    );
    $func_2->inside_scope(
        helloWorld => $scope,
        $context, undef, $ins, undef, undef
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
    var(
        $scope,
        pi => add(
            $scope,
            $pos->(28.4),
            num( $f, "3" ),
            num( $f, "0.1" ),
            num( $f, "0.04" )
        ),
        undef,
        $pos->(28.2)
    );
    $$scope->{'say'}->(
        [ add( $scope, $pos->(29.4), str( $f, "Pi = " ), $$scope->{'pi'} ) ],
        $scope, undef, $pos->(29.2)
    );
};

after_content($file_name);
