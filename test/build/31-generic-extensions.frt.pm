# === Document Model ===
#  Document './test/31-generic-extensions.frt'
#      Class 'A' <T>
#      Class 'A' <T, U>
#      Include (T, U)
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

my $self;
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $pos = before_content( '31-generic-extensions.frt',
    './test/31-generic-extensions.frt' );

use Ferret::Core::Operations qw();
my $result = do {
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
    load_namespaces( $context, qw(T U) );
};

after_content();
