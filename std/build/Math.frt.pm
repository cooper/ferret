# === Document Model ===
#  Document './std/Math.frt'
#      Package 'Math'
#      Instruction
#          Shared variable declaration
#              Lazy assignment
#                  Lexical variable '$pi'
#                  Call
#                      Property 'pi'
#                          Bareword 'NATIVE::Math'
#      Function 'sqrt'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$num'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Return
#                      Call
#                          Property 'sqrt'
#                              Bareword 'NATIVE::Math'
#                          Argument list [1 item]
#                              Item 0
#                                  Lexical variable '$num'
#      Function 'root'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$root'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Need
#                      Lexical variable '$num'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Return
#                      Operation
#                          Lexical variable '$num'
#                          Exponent operator (^)
#                          Single value [1 item]
#                              Item 0
#                                  Operation
#                                      Number '1'
#                                      Division operator (/)
#                                      Lexical variable '$root'
#      Include (NATIVE, NATIVE::Math, Num)
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

my $pos = before_content( 'Math.frt', './std/Math.frt' );

use Ferret::Core::Operations qw(div num pow);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'Math' );
    my $scope = $file_scope;
    load_core('Math');

    # Function event 'sqrt' definition
    my $func_0 = function_event_def(
        $f, $context, 'sqrt', undef,
        [ { name => 'num', type => 'Num', optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'num', 6.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'NATIVE::Math'}->property_u( 'sqrt', $pos->(7.25) )
                  ->( [ $$scope->{'num'} ], $scope, undef, $pos->(7.3) ) );
            return $ret;
        }
    );

    # Function event 'root' definition
    my $func_1 = function_event_def(
        $f, $context, 'root', undef,
        [
            { name => 'root', type => 'Num', optional => undef, more => undef },
            { name => 'num',  type => 'Num', optional => undef, more => undef }
        ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'root', 11.1 ) || return $ret_func->();
            need( $scope, $args, 'num',  11.3 ) || return $ret_func->();
            return $ret_func->(
                pow(
                    $scope, $$scope->{'num'},
                    div( $scope, num( $f, "1" ), $$scope->{'root'} )
                )
            );
            return $ret;
        }
    );
    $func_0->inside_scope(
        sqrt => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_1->inside_scope(
        root => $scope,
        $context, undef, $ins, undef, undef
    );
    load_namespaces( $context, qw(NATIVE NATIVE::Math Num) );

    var(
        $context,
        pi => [
            sub {
                $$scope->{'NATIVE::Math'}->property_u( 'pi', $pos->(3.35) )
                  ->( [ undef, [] ], $scope, undef, $pos->(3.4) );
            }
        ],
        undef,
        $pos->(3.15)
    );
};

after_content();
