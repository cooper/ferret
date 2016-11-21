# === Document Model ===
#  Document './std/HTTP/Request.frt'
#      Package 'HTTP'
#      Class 'Request'
#          Class method 'initializer__'
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$client'
#                          Argument type
#                              Bareword 'Client'
#                  Instruction
#                      Weaken modifier
#                          Assignment
#                              Instance variable '@client'
#                              Lexical variable '$client'
#                  Instruction
#                      Need
#                          Instance variable '@url'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Need
#                          Instance variable '@httpMethod'
#                          Argument type
#                              Bareword 'HTTPMethod'
#          Method 'connect'
#              Body ('function' scope)
#                  Instruction
#                      Call
#                          Property 'connect'
#                              Bareword 'NATIVE::HTTPClient'
#                          Argument list [2 items]
#                              Item 0
#                                  Instance variable '@client'
#                              Item 1
#                                  Special variable '*self'
#          Method 'connected'
#              Body ('function' scope)
#          Method 'redirect'
#              Body ('function' scope)
#          Method 'error'
#              Body ('function' scope)
#          Method 'response'
#              Body ('function' scope)
#      Include (Client, HTTPMethod, NATIVE, NATIVE::HTTPClient, Str)
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

my $pos = before_content( 'Request.frt', './std/HTTP/Request.frt' );

use Ferret::Core::Operations qw();
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'HTTP' );
    my $scope = $file_scope;
    load_core('HTTP');

    # Class 'Request'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Request', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'client',
                    type     => 'Client',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'url',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'httpMethod',
                    type     => 'HTTPMethod',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'client', 9.2 ) || return;
                $self->set_property(
                    client => $$scope->{'client'},
                    $pos->(10.3)
                );
                $self->weaken_property_ow( 'client', $pos->(10.1) );
                need( $self, $args, 'url' )        || return;
                need( $self, $args, 'httpMethod' ) || return;
                return $ret;
            }
        );

        # Method event 'connect' definition
        my $func_1 = method_event_def(
            $f, $scope,
            'connect',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                $$scope->{'NATIVE::HTTPClient'}
                  ->property_u( 'connect', $pos->(25.2) )->(
                    [ $$self->{'client'}, ${ $scope->{special} }->{'self'} ],
                    $scope, undef, $pos->(25.25)
                  );
                return $ret;
            }
        );

        # Method event 'connected' definition
        my $func_2 = method_event_def(
            $f, $scope,
            'connected',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;

                return $ret;
            }
        );

        # Method event 'redirect' definition
        my $func_3 = method_event_def(
            $f, $scope,
            'redirect',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;

                return $ret;
            }
        );

        # Method event 'error' definition
        my $func_4 = method_event_def(
            $f, $scope, 'error', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;

                return $ret;
            }
        );

        # Method event 'response' definition
        my $func_5 = method_event_def(
            $f, $scope,
            'response',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;

                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            connect => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_2->inside_scope(
            connected => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            redirect => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_4->inside_scope(
            error => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_5->inside_scope(
            response => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context,
        qw(Client HTTPMethod NATIVE NATIVE::HTTPClient Str) );
};

after_content();
