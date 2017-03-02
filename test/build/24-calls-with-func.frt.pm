# === Document Model ===
#  File './test/24-calls-with-func.frt'
#      Package 'main'
#          Instruction
#              Call
#                  Bareword 'delay'
#                  Argument list [2 items]
#                      Item 0
#                          Number '5'
#                      Item 1
#                          Anonymous function
#                              Function body
#                                  Instruction
#                                      Call
#                                          Bareword 'say'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  String 'been five ...'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Argument list [1 item]
#                      Item 0
#                          String 'waiting...'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Argument list [1 item]
#                      Item 0
#                          Property 'message'
#                              Call
#                                  Bareword 'something'
#                                  Argument list [1 item]
#                                      Item 1
#                                          Anonymous function { -> $result }
#                                              Function body
#                                                  Instruction
#                                                      Return
#                                                          String 'any second...'
#          Function 'something' { $code -> $message }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$code'
#                  Instruction
#                      Return pair 'message'
#                          Call
#                              Lexical variable '$code'
#                              Argument list [0 items]
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

my ( $self, $ins );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $file_name = './test/24-calls-with-func.frt';
my $pos = before_content( '24-calls-with-func.frt', $file_name );

use Ferret::Core::Operations qw(num str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Function event 'something' definition
    my $func_0 = function_event_def(
        $f, $context,
        'something',
        undef,
        [ { name => 'code', type => undef, optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'code', 17.2 ) || return $ret_func->();
            $ret->set_property(
                message => $$scope->{'code'}
                  ->( [ undef, [] ], $scope, undef, $pos->(18.4) ),
                $pos->(18.2)
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
                [ str( $f, "been five seconds" ) ],
                $scope, undef, $pos->(4.2)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_2 = function_def(
        $f, undef, undef, undef, undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            return $ret_func->( str( $f, "any second now" ) );
            return $ret;
        }
    );
    $func_0->inside_scope(
        something => $scope,
        $context, undef, $ins, undef, undef
    );
    $$scope->{'delay'}->(
        [
            num( $f, "5" ),
            $func_1->inside_scope(
                (undef) => $scope,
                undef, undef, $ins, undef, undef
            )
        ],
        $scope, undef,
        $pos->(3.2)
    );
    $$scope->{'say'}
      ->( [ str( $f, "waiting..." ) ], $scope, undef, $pos->(7.2) );
    $$scope->{'say'}->(
        [
            $$scope->{'something'}->(
                [
                    $func_2->inside_scope(
                        (undef) => $scope,
                        undef, undef, $ins, undef, undef
                    )
                ],
                $scope, undef,
                $pos->(12.4)
            )->property_u( 'message', $pos->(14.2) )
        ],
        $scope, undef,
        $pos->(12.2)
    );
};

after_content($file_name);
