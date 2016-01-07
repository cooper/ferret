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
#                          Named argument list [1 items]
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
    my ( $file_scope, $context ) = FF::get_context( $f, 'HTTP' );
    my $scope = $file_scope;
    FF::load_core('HTTP');

    # Function event 'get' definition
    my $func_0 = FF::function_event_def(
        $f, $context, 'get',
        [ { name => 'url', type => 'Str', optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'url', 12.2 ) or return;
            return ${ $$scope->{'client'} }->{'get'}
              ->( { url => $$scope->{'url'} }, $scope, undef, 13.4 );
            return $ret;
        }
    );

    # Function event 'post' definition
    my $func_1 = FF::function_event_def(
        $f, $context, 'post',
        [ { name => 'url', type => 'Str', optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'url', 17.2 ) or return;
            return ${ $$scope->{'client'} }->{'post'}
              ->( { url => $$scope->{'url'} }, $scope, undef, 18.4 );
            return $ret;
        }
    );
    $func_0->inside_scope( get  => $scope, $context, undef, undef, undef );
    $func_1->inside_scope( post => $scope, $context, undef, undef, undef );
    FF::load_namespaces( $context, qw(HTTP HTTP::Client Str) );

    FF::typedef(
        $scope, $context,
        'HTTPMethod',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            FF::typedef_check(
                $scope, $scope, $ins,
                conditions => undef,
                equal_to =>
                  [ FF::get_symbol( $f, 'GET' ), FF::get_symbol( $f, 'POST' ) ]
            ) ? $ins : undef;
        },
        undef
    );
    FF::lex_assign(
        $scope,
        client =>
          [ sub { $$scope->{'HTTP::Client'}->( {}, $scope, undef, 9.6 ) } ],
        undef, 9.2
    );
};

FF::after_content();
