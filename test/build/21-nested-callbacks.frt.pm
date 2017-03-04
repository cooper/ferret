# === Document Model ===
#  File './test/21-nested-callbacks.frt'
#      Package 'main'
#          Instruction
#              Assignment
#                  Lexical variable '$parts'
#                  Call
#                      Property 'split'
#                          String 's p a m'
#                      Argument list [1 item]
#                          Item 0
#                              String ' '
#          For (pairs)
#              Expression ('for' parameter)
#                  Set [2 items]
#                      Item 0
#                          Lexical variable '$i'
#                      Item 1
#                          Lexical variable '$part'
#              Expression ('in' parameter)
#                  Lexical variable '$parts'
#              For body
#                  On
#                      Expression ('on' parameter)
#                          Property 'expire'
#                              Call
#                                  Property 'once'
#                                      Call
#                                          Bareword 'Timer'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  Lexical variable '$i'
#                                  Argument list [0 items]
#                      Anonymous function
#                          Function body
#                              Instruction
#                                  Call
#                                      Bareword 'say'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Operation
#                                                  String '('
#                                                  Addition operator (+)
#                                                  Lexical variable '$i'
#                                                  Addition operator (+)
#                                                  String ') '
#                                                  Addition operator (+)
#                                                  Lexical variable '$part'
#          For (values)
#              Expression ('for' parameter)
#                  Lexical variable '$part'
#              Expression ('in' parameter)
#                  Value list [3 items]
#                      Item 0
#                          Number '1'
#                      Item 1
#                          Number '2'
#                      Item 2
#                          Number '3'
#              For body
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 item]
#                              Item 0
#                                  Lexical variable '$part'
#          Include (Timer)
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
  before_content( '21-nested-callbacks.frt', './test/21-nested-callbacks.frt' );

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
                        $scope, $pos->(5.2),
                        str( $f, "(" ),  $$scope->{'i'},
                        str( $f, ") " ), $$scope->{'part'}
                    )
                ],
                $scope, undef,
                $pos->(5.1)
            );
            return $ret;
        }
    );
    provides_namespaces( $context, $file_name, qw() );
    load_namespaces( $context, $file_name, qw(Timer) );
    var(
        $scope,
        parts => str( $f, "s p a m" )->property_u( 'split', $pos->(1.4) )
          ->( [ str( $f, " " ) ], $scope, undef, $pos->(1.5) ),
        undef, $pos->(1.2)
    );
    {
        my ( $loop_status, $loop_ret ) = iterate_pair(
            $f, $scope,
            $$scope->{'parts'},
            'i', 'part',
            sub {
                my ( $scope, $ret_func ) = @_;
                on(
                    $$scope->{'Timer'}
                      ->( [ $$scope->{'i'} ], $scope, undef, $pos->(4.15) )
                      ->property_u( 'once', $pos->(4.3) )
                      ->( [ undef, [] ], $scope, undef, $pos->(4.35) ),
                    'expire', $self, $scope,
                    $func_0->inside_scope(
                        (undef) => $scope,
                        undef, undef, $ins, undef, undef
                    ),
                    {}
                );
            },
            $pos->(3.05)
        );
        return $ret_func->($loop_ret) if $loop_status eq 'return';
    }
    {
        my ( $loop_status, $loop_ret ) = iterate(
            $f, $scope,
            create_list(
                $f, [ num( $f, "1" ), num( $f, "2" ), num( $f, "3" ) ]
            ),
            'part',
            sub {
                my ( $scope, $ret_func ) = @_;
                $$scope->{'say'}
                  ->( [ $$scope->{'part'} ], $scope, undef, $pos->(10.2) );
            },
            $pos->(9.05)
        );
        return $ret_func->($loop_ret) if $loop_status eq 'return';
    }
};

after_content($file_name);
