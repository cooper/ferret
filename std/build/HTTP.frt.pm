# === Document Model ===
#  Document './std/HTTP.frt'
#      Package 'HTTP'
#      Instruction
#          Lazy assignment (lexical variable '$client')
#              Call
#                  Bareword 'HTTP::Client'
#                  Argument list [0 items]
#      Function 'get'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$url'
#                      Bareword 'Str'
#              Instruction
#                  Return
#                      Call
#                          Property 'get'
#                              Lexical variable '$client'
#                          Named argument list [1 items]
#                              Item 0
#                                  Pair 'url'
#                                      Lexical variable '$url'
#      Function 'post'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$url'
#                      Bareword 'Str'
#              Instruction
#                  Return
#                      Call
#                          Property 'post'
#                              Lexical variable '$client'
#                          Named argument list [1 items]
#                              Item 0
#                                  Pair 'url'
#                                      Lexical variable '$url'
#      Include (HTTP, HTTP::Client, Str)
use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('HTTP.frt');

use Ferret::Core::Operations qw();
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'HTTP' );
    FF::load_core('HTTP');

    # Function event 'get' definition
    my $func_0 = FF::function_event_def(
        $f, $scope, 'get',
        [ { name => 'url', type => 'Str', optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'url', 7.2 ) or return;
            return $scope->property_u('client')->property_u('get')
              ->call_u( { url => $scope->property_u('url') },
                $scope, undef, 8.4 );
            return $return;
        }
    );

    # Function event 'post' definition
    my $func_1 = FF::function_event_def(
        $f, $scope, 'post',
        [ { name => 'url', type => 'Str', optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'url', 12.2 ) or return;
            return $scope->property_u('client')->property_u('post')
              ->call_u( { url => $scope->property_u('url') },
                $scope, undef, 13.4 );
            return $return;
        }
    );
    $func_0->inside_scope( get  => $scope, $scope, undef, undef, undef );
    $func_1->inside_scope( post => $scope, $scope, undef, undef, undef );
    FF::load_namespaces( $context, qw(HTTP HTTP::Client Str) );

    $scope->set_property_ow(
        $context,
        client => [
            sub {
                $scope->property_u('HTTP::Client')
                  ->call_u( {}, $scope, undef, 4.6 );
            }
        ],
        4.2
    );
};

FF::after_content();
