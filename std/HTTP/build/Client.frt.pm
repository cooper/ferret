# === Document Model ===
#  Document './std/HTTP/Client.frt'
#      Package 'HTTP'
#      Class 'Client' version 1.0
#          Instruction
#              Assignment
#                  Lexical variable '$defaultUA'
#                  Operation
#                      String 'ferret-http/'
#                      Addition operator (+)
#                      Property 'version'
#                          Special variable '*class'
#          Instruction
#              Assignment
#                  Lexical variable '$defaultLength'
#                  Operation
#                      Number '64'
#                      Multiplication operator (*)
#                      Number '1024'
#          Class method 'initializer__'
#              Function body
#                  Instruction
#                      Want
#                          Instance variable '@userAgent'
#                          Argument type
#                              Bareword 'Str'
#                          Argument value
#                              Lexical variable '$defaultUA'
#                  Instruction
#                      Want
#                          Instance variable '@timeout'
#                          Argument type
#                              Bareword 'Num'
#                          Argument value
#                              Number '10'
#                  Instruction
#                      Want
#                          Instance variable '@maxContentLength'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Want
#                          Instance variable '@readLength'
#                          Argument type
#                              Bareword 'Num'
#                          Argument value
#                              Lexical variable '$defaultLength'
#                  Instruction
#                      Want
#                          Instance variable '@writeLength'
#                          Argument type
#                              Bareword 'Num'
#                          Argument value
#                              Lexical variable '$defaultLength'
#                  Instruction
#                      Call
#                          Property 'initialize'
#                              Bareword 'NATIVE::HTTPClient'
#                          Argument list [1 item]
#                              Item 0
#                                  Special variable '*self'
#          Method 'get'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$url'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@request'
#                              Named argument list [2 items]
#                                  Item 0
#                                      Pair 'httpMethod'
#                                          Symbol :GET
#                                  Item 1
#                                      Pair 'url'
#                                          Lexical variable '$url'
#          Method 'post'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$url'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@request'
#                              Named argument list [2 items]
#                                  Item 0
#                                      Pair 'httpMethod'
#                                          Symbol :POST
#                                  Item 1
#                                      Pair 'url'
#                                          Lexical variable '$url'
#          Method 'request'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$httpMethod'
#                          Argument type
#                              Bareword 'HTTPMethod'
#                  Instruction
#                      Need
#                          Lexical variable '$url'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'HTTP::Request'
#                              Named argument list [3 items]
#                                  Item 0
#                                      Pair 'client'
#                                          Special variable '*self'
#                                  Item 1
#                                      Pair 'httpMethod'
#                                          Lexical variable '$httpMethod'
#                                  Item 2
#                                      Pair 'url'
#                                          Lexical variable '$url'
#      Include (HTTP, HTTP::Request, HTTPMethod, NATIVE, NATIVE::HTTPClient, Num, Str)
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

my $pos = before_content( 'Client.frt', './std/HTTP/Client.frt' );

use Ferret::Core::Operations qw(add mul num str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'HTTP' );
    my $scope = $file_scope;
    load_core('HTTP');

    # Class 'Client'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Client', 1.0, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def( $f, $scope, 'initializer__' );

        # Method event 'get' definition
        my $func_1 = method_event_def( $f, $scope, 'get' );

        # Method event 'post' definition
        my $func_2 = method_event_def( $f, $scope, 'post' );

        # Method event 'request' definition
        my $func_3 = method_event_def( $f, $scope, 'request' );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            get => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_2->inside_scope(
            post => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            request => $scope,
            $proto, $class, $ins, undef, undef
        );
        var(
            $scope,
            defaultUA => add(
                $scope,
                str( $f, "ferret-http/" ),
                ${ $scope->{special} }->{'class'}
                  ->property_u( 'version', $pos->(5.6) )
            ),
            undef,
            $pos->(5.2)
        );
        var(
            $scope,
            defaultLength => mul( $scope, num( $f, "64" ), num( $f, "1024" ) ),
            undef, $pos->(6.2)
        );
    }
    load_namespaces( $context,
        qw(HTTP HTTP::Request HTTPMethod NATIVE NATIVE::HTTPClient Num Str) );
};

after_content();
