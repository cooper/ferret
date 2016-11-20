# === Document Model ===
#  Document './test/34-function-topic-var.frt'
#      Instruction
#          Assignment
#              Lexical variable '$doubles'
#              Call
#                  Property 'map'
#                      Value list [3 items]
#                          Item 0
#                              Number '4'
#                          Item 1
#                              Number '16'
#                          Item 2
#                              Number '25'
#                  Argument list [1 item]
#                      Item 0
#                          Anonymous function
#                              Body ('function' scope)
#                                  Instruction
#                                      Operation
#                                          Topic variable '$_'
#                                          Multiplication operator (*)
#                                          Number '2'
#      Instruction
#          Call
#              Bareword 'inspect'
#              Argument list [1 item]
#                  Item 0
#                      Lexical variable '$doubles'
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

my $pos = before_content( '34-function-topic-var.frt',
    './test/34-function-topic-var.frt' );

use Ferret::Core::Operations qw(mul num);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Anonymous function definition with topicalizer
    my $func_0 = function_def(
        $f, undef, undef,
        [ { name => '_' } ],
        undef,
        sub {
            my ( $scope, $self, $this, undef, $args, $ret ) = &args_v1;
            my $ins = $args->{_};
            mul( $scope, $ins, num( $f, "2" ) );
            return $ret;
        }
    );
    var(
        $scope,
        doubles => create_list( $f,
            [ num( $f, "4" ), num( $f, "16" ), num( $f, "25" ) ] )
          ->property_u( 'map', $pos->(1.5) )->(
            [
                $func_0->inside_scope(
                    (undef) => $scope,
                    undef, undef, $ins, undef, undef
                )
            ],
            $scope, undef,
            $pos->(1.55)
          ),
        undef,
        $pos->(1.1)
    );
    $$scope->{'inspect'}
      ->( [ $$scope->{'doubles'} ], $scope, undef, $pos->(2.2) );
};

after_content();
