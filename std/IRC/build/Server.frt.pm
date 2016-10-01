# === Document Model ===
#  Document './std/IRC/Server.frt'
#      Package 'IRC'
#      Class 'Server'
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Instance variable '@connection'
#                          Argument type
#                              Bareword 'Connection'
#                  Instruction
#                      Need
#                          Instance variable '@name'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Weaken modifier
#                          Instance variable '@connection'
#      Include (Connection, Str)
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

FF::before_content('Server.frt');

use Ferret::Core::Operations qw();
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'IRC' );
    my $scope = $file_scope;
    FF::load_core('IRC');

    # Class 'Server'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Server', undef, undef );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'connection',
                    type     => 'Connection',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'name',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $self, $args, 'connection' ) or return;
                FF::need( $self, $args, 'name' )       or return;
                $self->weaken_property( 'connection', 7.1 );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Connection Str) );
};

FF::after_content();