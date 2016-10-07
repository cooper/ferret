# === Document Model ===
#  Document './std/Extension/Hash.frt'
#      Class 'Hash' <K, V>
#          Computed property 'empty'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Operation
#                              Instance variable '@length'
#                              Equality operator (==)
#                              Number '0'
#      Include (K, V)
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

my $pos = FF::before_content( 'Hash.frt', './std/Extension/Hash.frt' );

use Ferret::Core::Operations qw(equal num);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Class 'Hash'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Hash', undef,
            [ \'K', \'V' ] );

        # Method event 'empty' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, 'empty',
            [],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                return $ret_func->(
                    equal( $scope, $$self->{'length'}, num( $f, "0" ) ) );
                return $ret;
            }
        );
        $method_0->inside_scope( empty => $scope, $proto, $class, 1, undef );
    }
    FF::load_namespaces( $context, qw(K V) );
};

FF::after_content();
