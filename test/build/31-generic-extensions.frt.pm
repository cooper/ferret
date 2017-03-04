# === Document Model ===
#  File './test/31-generic-extensions.frt'
#      Package 'main'
#          Class 'A' <T>
#          Class 'A' <T, U>
#          Include
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

my ( $pos, $file_name ) = before_content( '31-generic-extensions.frt',
    './test/31-generic-extensions.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'A'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'A', undef, ['T'] );

    }

    # Class 'A'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'A', undef, [ 'T', \'U' ] );

    }
    provides_namespaces( $context, $file_name, qw(A) );
    load_namespaces( $context, $file_name, qw() );
};

after_content($file_name);
