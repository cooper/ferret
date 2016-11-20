# === Document Model ===
#  Document './std/IRC/Channel.frt'
#      Package 'IRC'
#      Class 'Channel'
#          Class method 'initializer__'
#              Body ('function' scope)
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
#          Method 'privmsg'
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$message'
#                          Argument type
#                              Bareword 'Str::Any'
#                  Instruction
#                      Call
#                          Property 'sendPrivmsg'
#                              Instance variable '@connection'
#                          Argument list [2 items]
#                              Item 0
#                                  Instance variable '@name'
#                              Item 1
#                                  Lexical variable '$message'
#      Include (Connection, Str, Str::Any)
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

my $pos = before_content( 'Channel.frt', './std/IRC/Channel.frt' );

use Ferret::Core::Operations qw();
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'IRC' );
    my $scope = $file_scope;
    load_core('IRC');

    # Class 'Channel'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Channel', undef, undef );

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
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $self, $args, 'connection' ) or return;
                need( $self, $args, 'name' )       or return;
                $self->weaken_property_ow( 'connection', $pos->(7.1) );
                return $ret;
            }
        );

        # Method event 'privmsg' definition
        my $func_1 = method_event_def(
            $f, $scope,
            'privmsg',
            [
                {
                    name     => 'message',
                    type     => 'Str::Any',
                    optional => undef,
                    more     => undef
                }
            ],
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'message', 12.2 ) or return;
                $$self->{'connection'}
                  ->property_u( 'sendPrivmsg', $pos->(13.2) )->(
                    [ $$self->{'name'}, $$scope->{'message'} ],
                    $scope, undef, $pos->(13.3)
                  );
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            privmsg => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Connection Str Str::Any) );
};

after_content();
