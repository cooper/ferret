# === Document Model ===
#  File './test/2-call-expression.frt'
#      Package 'main'
#          Instruction
#              Single value [1 item]
#                  Item 0
#                      Call
#                          Single value [1 item]
#                              Item 0
#                                  Bareword 'say'
#                          Argument list [1 item]
#                              Item 0
#                                  String 'Hello World!'
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

my $file_name = './test/2-call-expression.frt';
my $pos = before_content( '2-call-expression.frt', $file_name );
my $result;

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    $$scope->{'say'}
      ->( [ str( $f, "Hello World!" ) ], $scope, undef, $pos->(1.25) );
};

after_content($file_name);
