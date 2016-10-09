# === Document Model ===
#  Document './std/HTTP/Request.frt'
#      Package 'HTTP'
#      Class 'Request'
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$client'
#                          Argument type
#                              Bareword 'Client'
#                  Instruction
#                      Assignment
#                          Instance variable '@client'
#                          Lexical variable '$client'
#                  Instruction
#                      Weaken modifier
#                          Instance variable '@client'
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
#              Body ('method' scope)
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
#              Body ('method' scope)
#          Method 'redirect'
#              Body ('method' scope)
#          Method 'error'
#              Body ('method' scope)
#          Method 'response'
#              Body ('method' scope)
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
        my $method_0 = method_event_def(
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
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'client', 9.2 ) or return;
                $self->set_property(
                    client => $$scope->{'client'},
                    $pos->(10.2)
                );
                $self->weaken_property( 'client', $pos->(11.1) );
                need( $self, $args, 'url' )        or return;
                need( $self, $args, 'httpMethod' ) or return;
                return $ret;
            }
        );

        # Method event 'connect' definition
        my $method_1 = method_event_def(
            $f, $scope,
            'connect',
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                $$scope->{'NATIVE::HTTPClient'}
                  ->property_u( 'connect', $pos->(26.2) )->(
                    [ $$self->{'client'}, ${ $scope->{special} }->{'self'} ],
                    $scope, undef, $pos->(26.25)
                  );
                return $ret;
            }
        );

        # Method event 'connected' definition
        my $method_2 = method_event_def(
            $f, $scope,
            'connected',
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;

                return $ret;
            }
        );

        # Method event 'redirect' definition
        my $method_3 = method_event_def(
            $f, $scope,
            'redirect',
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;

                return $ret;
            }
        );

        # Method event 'error' definition
        my $method_4 = method_event_def(
            $f, $scope, 'error',
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;

                return $ret;
            }
        );

        # Method event 'response' definition
        my $method_5 = method_event_def(
            $f, $scope,
            'response',
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;

                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $method_1->inside_scope(
            connect => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_2->inside_scope(
            connected => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_3->inside_scope(
            redirect => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_4->inside_scope(
            error => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_5->inside_scope(
            response => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context,
        qw(Client HTTPMethod NATIVE NATIVE::HTTPClient Str) );
};

after_content();
