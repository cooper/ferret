# === Document Model ===
#  File './std/IRC/Server.frt'
#      Package 'IRC'
#          Class 'Server'
#              Class method 'initializer__' { $connection:Connection $name:Str }
#                  Function body
#                      Instruction
#                          Need
#                              Instance variable '@connection'
#                              Argument type
#                                  Bareword 'Connection'
#                      Instruction
#                          Need
#                              Instance variable '@name'
#                              Argument type
#                                  Bareword 'Str'
#                      Instruction
#                          Weaken modifier
#                              Instance variable '@connection'
#          Include (Connection, Str)
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

my $file_name = './std/IRC/Server.frt';
my $pos = before_content( 'Server.frt', $file_name );

use Ferret::Core::Operations qw();
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'IRC' );
    my $scope = $file_scope;
    load_core('IRC');

    # Class 'Server'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Server', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
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
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $self, $args, 'connection' ) || return $ret_func->();
                need( $self, $args, 'name' )       || return $ret_func->();

                $self->weaken_property_ow( 'connection', $pos->(7.1) );
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, $file_name, qw(Connection Str) );
};

after_content($file_name);
