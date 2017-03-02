# === Document Model ===
#  File './test/14-callbacks.frt'
#      Package 'main'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Argument list [1 item]
#                      Item 0
#                          String 'test'
#          Instruction
#              Assignment
#                  Lexical variable '$str'
#                  String 'hi'
#          On
#              Expression ('on' parameter)
#                  Property 'length'
#                      Lexical variable '$str'
#              Anonymous function
#                  Function body
#                      Instruction
#                          Call
#                              Bareword 'say'
#                              Argument list [1 item]
#                                  Item 0
#                                      Operation
#                                          String 'found ''
#                                          Addition operator (+)
#                                          Special variable '*this'
#                                          Addition operator (+)
#                                          String '' length t...'
#                                          Addition operator (+)
#                                          Property 'result'
#                                              Special variable '*return'
#          Instruction
#              Call
#                  Property 'length'
#                      Lexical variable '$str'
#                  Argument list [0 items]
#          Instruction
#              Call
#                  Property 'length'
#                      String 'hello'
#                  Argument list [0 items]
#          On
#              Expression ('on' parameter)
#                  Property 'length'
#                      Property 'proto'
#                          Bareword 'String'
#              Anonymous function
#                  Function body
#                      Instruction
#                          Call
#                              Bareword 'say'
#                              Argument list [1 item]
#                                  Item 0
#                                      Operation
#                                          String 'found ''
#                                          Addition operator (+)
#                                          Special variable '*this'
#                                          Addition operator (+)
#                                          String '' length t...'
#                                          Addition operator (+)
#                                          Property 'result'
#                                              Special variable '*return'
#          Instruction
#              Call
#                  Property 'length'
#                      String 'hello'
#                  Argument list [0 items]
#          Include (String)
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
use Ferret::Core::Operations qw(add str);

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) =
  before_content( '14-callbacks.frt', './test/14-callbacks.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Anonymous function definition
    my $func_0 = function_def(
        $f, undef, undef, undef, undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            $$scope->{'say'}->(
                [
                    add(
                        $scope,
                        $pos->(11.2),
                        str( $f, "found '" ),
                        ${ $scope->{special} }->{'this'},
                        str( $f, "' length to be " ),
                        ${ $scope->{special} }->{'return'}
                          ->property_u( 'result', $pos->(11.5) )
                    )
                ],
                $scope, undef,
                $pos->(11.1)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_1 = function_def(
        $f, undef, undef, undef, undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            $$scope->{'say'}->(
                [
                    add(
                        $scope,
                        $pos->(22.2),
                        str( $f, "found '" ),
                        ${ $scope->{special} }->{'this'},
                        str( $f, "' length to be " ),
                        ${ $scope->{special} }->{'return'}
                          ->property_u( 'result', $pos->(22.5) )
                    )
                ],
                $scope, undef,
                $pos->(22.1)
            );
            return $ret;
        }
    );
    load_namespaces( $context, $file_name, qw(String) );
    $$scope->{'say'}->( [ str( $f, "test" ) ], $scope, undef, $pos->(1.2) );
    var( $scope, str => str( $f, "hi" ), undef, $pos->(3.2) );
    on(
        $$scope->{'str'},
        'length', $self, $scope,
        $func_0->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    $$scope->{'str'}->property_u( 'length', $pos->(14.2) )
      ->( [ undef, [] ], $scope, undef, $pos->(14.3) );
    str( $f, "hello" )->property_u( 'length', $pos->(16.2) )
      ->( [ undef, [] ], $scope, undef, $pos->(16.3) );
    on(
        $$scope->{'String'}->property_u( 'proto', $pos->(21.3) ),
        'length', $self, $scope,
        $func_1->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    str( $f, "hello" )->property_u( 'length', $pos->(25.2) )
      ->( [ undef, [] ], $scope, undef, $pos->(25.3) );
};

after_content($file_name);
