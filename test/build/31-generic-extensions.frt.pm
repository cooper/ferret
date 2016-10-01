# === Document Model ===
#  Document './test/31-generic-extensions.frt'
#      Class 'A' <T>
#      Class 'A' <T, U>
#      Include (T, U)
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
my $f = FF::get_ferret();
my ( $true, $false, $undefined, $ret_func ) = FF::get_constant_objects($f);

my $pos = FF::before_content( '31-generic-extensions.frt',
    './test/31-generic-extensions.frt' );

use Ferret::Core::Operations qw();
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Class 'A'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'A', undef, ['T'] );

    }

    # Class 'A'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'A', undef, [ 'T', \'U' ] );

    }
    FF::load_namespaces( $context, qw(T U) );
};

FF::after_content();
