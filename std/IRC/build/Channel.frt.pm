# === Document Model ===
#  Document './std/IRC/Channel.frt'
#      Package 'IRC'
#      Class 'Channel'
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
#          Method 'privmsg'
#              Body ('method' scope)
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

my $pos = FF::before_content( 'Channel.frt', './std/IRC/Channel.frt' );

use Ferret::Core::Operations qw();
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'IRC' );
    my $scope = $file_scope;
    FF::load_core('IRC');

    # Class 'Channel'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Channel', undef, undef );

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
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                FF::need( $self, $args, 'connection' ) or return;
                FF::need( $self, $args, 'name' )       or return;
                $self->weaken_property( 'connection', $pos->(7.1) );
                return $ret;
            }
        );

        # Method event 'privmsg' definition
        my $method_1 = FF::method_event_def(
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
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                FF::need( $scope, $args, 'message', 12.2 ) or return;
                ${ $$self->{'connection'} }->{'sendPrivmsg'}->(
                    [ $$self->{'name'}, $$scope->{'message'} ],
                    $scope, undef, $pos->(13.3)
                );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            privmsg => $scope,
            $proto, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Connection Str Str::Any) );
};

FF::after_content();
