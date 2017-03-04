# === Document Model ===
#  File './test/37-autoload-failure.frt'
#      Package 'main'
#          Instruction
#              Assignment
#                  Lexical variable '$x'
#                  Call
#                      Property 'aFunc'
#                          Bareword 'Some::Nonexistent::Package'
#                      Argument list [0 items]
#          Include (Some::Nonexistent::Package)
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
use Ferret::Core::Operations qw();

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) =
  before_content( '37-autoload-failure.frt', './test/37-autoload-failure.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main', 1.05 );
    my $scope = $file_scope;
    load_core('main');

    provides_namespaces( $context, $file_name, $pos->(1.55), qw() );
    load_namespaces( $context, $file_name, $pos->(1.55),
        qw(Some::Nonexistent::Package) );
    var(
        $scope,
        x => $$scope->{'Some::Nonexistent::Package'}
          ->property_u( 'aFunc', $pos->(1.4) )
          ->( [ undef, [] ], $scope, undef, $pos->(1.45) ),
        undef, $pos->(1.1)
    );
};

after_content($file_name);
