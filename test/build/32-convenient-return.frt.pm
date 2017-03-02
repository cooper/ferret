# === Document Model ===
#  File './test/32-convenient-return.frt'
#      Package 'main'
#          Function 'A' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          String 'return value'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Argument list [1 item]
#                      Item 0
#                          Call
#                              Bareword 'A'
#          Include (A)
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
use Ferret::Core::Operations qw(str);

my ( $self, $ins );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $file_name = './test/32-convenient-return.frt';
my $pos = before_content( '32-convenient-return.frt', $file_name );
my $result;

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Function event 'A' definition
    my $func_0 = function_event_def(
        $f, $context, 'A', undef, undef, undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            return $ret_func->( str( $f, "return value" ) );
            return $ret;
        }
    );
    $func_0->inside_scope( A => $scope, $context, undef, $ins, undef, undef );
    load_namespaces( $context, $file_name, qw(A) );
    $$scope->{'say'}->(
        [ $$scope->{'A'}->( [ undef, [] ], $scope, undef, $pos->(5.4) ) ],
        $scope, undef, $pos->(5.2)
    );
};

after_content($file_name);
