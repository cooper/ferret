# === Document Model ===
#  Document './std/HTTP.frt'
#      Package 'HTTP'
#      Type definition ('HTTPMethod')
#          Body ('type' scope)
#              Instruction
#                  Symbol :GET
#              Instruction
#                  Symbol :POST
#      Instruction
#          Lazy assignment
#              Lexical variable '$client'
#              Call
#                  Bareword 'HTTP::Client'
#                  Argument list [0 items]
#      Function 'get'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$url'
#                      Argument type
#                          Bareword 'Str'
#              Instruction
#                  Return
#                      Call
#                          Property 'get'
#                              Lexical variable '$client'
#                          Named argument list [1 item]
#                              Item 0
#                                  Pair 'url'
#                                      Lexical variable '$url'
#      Function 'post'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$url'
#                      Argument type
#                          Bareword 'Str'
#              Instruction
#                  Return
#                      Call
#                          Property 'post'
#                              Lexical variable '$client'
#                          Named argument list [1 item]
#                              Item 0
#                                  Pair 'url'
#                                      Lexical variable '$url'
#      Include (HTTP, HTTP::Client, Str)
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

my $pos = before_content( 'HTTP.frt', './std/HTTP.frt' );

use Ferret::Core::Operations qw();
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'HTTP' );
    my $scope = $file_scope;
    load_core('HTTP');

    # Function event 'get' definition
    my $func_0 = function_event_def(
        $f, $context, 'get', undef,
        [ { name => 'url', type => 'Str', optional => undef, more => undef } ],
        [],
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'url', 14.2 ) or return;
            return $ret_func->(
                $$scope->{'client'}->property_u( 'get', $pos->(15.3) )->(
                    [ undef, [ url => $$scope->{'url'} ] ], $scope,
                    undef, $pos->(15.4)
                )
            );
            return $ret;
        }
    );

    # Function event 'post' definition
    my $func_1 = function_event_def(
        $f, $context, 'post', undef,
        [ { name => 'url', type => 'Str', optional => undef, more => undef } ],
        [],
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'url', 20.2 ) or return;
            return $ret_func->(
                $$scope->{'client'}->property_u( 'post', $pos->(21.3) )->(
                    [ undef, [ url => $$scope->{'url'} ] ], $scope,
                    undef, $pos->(21.4)
                )
            );
            return $ret;
        }
    );
    $func_0->inside_scope( get => $scope, $context, undef, $ins, undef, undef );
    $func_1->inside_scope(
        post => $scope,
        $context, undef, $ins, undef, undef
    );
    load_namespaces( $context, qw(HTTP HTTP::Client Str) );

    typedef(
        $scope, $context,
        'HTTPMethod',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            state $anchor = \0 + 0;
            typedef_check(
                $scope, $scope, $ins, $anchor,
                conditions => undef,
                equal_to =>
                  [ get_symbol( $f, 'GET' ), get_symbol( $f, 'POST' ) ]
            ) ? $ins : undef;
        },
        undef
    );
    var(
        $scope,
        client => [
            sub {
                $$scope->{'HTTP::Client'}
                  ->( [ undef, [] ], $scope, undef, $pos->(10.6) );
            }
        ],
        undef,
        $pos->(10.2)
    );
};

after_content();
