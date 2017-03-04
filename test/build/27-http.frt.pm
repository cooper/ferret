# === Document Model ===
#  File './test/27-http.frt'
#      Package 'main'
#          Inside
#              Expression ('inside' parameter)
#                  Call
#                      Property 'get'
#                          Bareword 'HTTP'
#                      Argument list [1 item]
#                          Item 0
#                              String 'http://goo...'
#              Inside body
#                  On
#                      Expression ('on' parameter)
#                          Property variable '.connected'
#                      Anonymous function
#                          Function body
#                              Instruction
#                                  Call
#                                      Bareword 'say'
#                                      Argument list [1 item]
#                                          Item 0
#                                              String 'Connected!'
#                  On
#                      Expression ('on' parameter)
#                          Property variable '.redirect'
#                      Anonymous function { $location:Str }
#                          Function body
#                              Instruction
#                                  Need
#                                      Lexical variable '$location'
#                                      Argument type
#                                          Bareword 'Str'
#                              Instruction
#                                  Call
#                                      Bareword 'say'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Operation
#                                                  String 'Redirected...'
#                                                  Addition operator (+)
#                                                  Lexical variable '$location'
#                  On
#                      Expression ('on' parameter)
#                          Property variable '.response'
#                      Anonymous function { $content:Str }
#                          Function body
#                              Instruction
#                                  Need
#                                      Lexical variable '$content'
#                                      Argument type
#                                          Bareword 'Str'
#                              Instruction
#                                  Call
#                                      Bareword 'say'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Operation
#                                                  String 'Got conten...'
#                                                  Addition operator (+)
#                                                  Property 'length'
#                                                      Lexical variable '$content'
#                  On
#                      Expression ('on' parameter)
#                          Property variable '.error'
#                      Anonymous function
#                          Function body
#                              Instruction
#                                  Call
#                                      Bareword 'say'
#                                      Argument list [1 item]
#                                          Item 0
#                                              String 'Got error!'
#                  Instruction
#                      Call
#                          Property variable '.connect'
#                          Argument list [0 items]
#          Include (HTTP, Str)
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
use Ferret::Core::Operations qw(add str);

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) = before_content( '27-http.frt', './test/27-http.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main', 1.1 );
    my $scope = $file_scope;
    load_core('main');

    # Anonymous function definition
    my $func_0 = function_def(
        $f, undef, undef, undef, undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            $$scope->{'say'}
              ->( [ str( $f, "Connected!" ) ], $scope, undef, $pos->(4.2) );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_1 = function_def(
        $f, undef, undef,
        [
            {
                name     => 'location',
                type     => 'Str',
                optional => undef,
                more     => undef
            }
        ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'location', 8.2 ) || return $ret_func->();
            $$scope->{'say'}->(
                [
                    add(
                        $scope, $pos->(9.4),
                        str( $f, "Redirected to " ), $$scope->{'location'}
                    )
                ],
                $scope, undef,
                $pos->(9.2)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_2 = function_def(
        $f, undef, undef,
        [
            {
                name     => 'content',
                type     => 'Str',
                optional => undef,
                more     => undef
            }
        ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'content', 14.2 ) || return $ret_func->();
            $$scope->{'say'}->(
                [
                    add(
                        $scope,
                        $pos->(15.4),
                        str( $f, "Got content! Length " ),
                        $$scope->{'content'}
                          ->property_u( 'length', $pos->(15.6) )
                    )
                ],
                $scope, undef,
                $pos->(15.2)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_3 = function_def(
        $f, undef, undef, undef, undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            $$scope->{'say'}
              ->( [ str( $f, "Got error!" ) ], $scope, undef, $pos->(21.2) );
            return $ret;
        }
    );
    provides_namespaces( $context, $file_name, $pos->(25.1), qw() );
    load_namespaces( $context, $file_name, $pos->(25.1), qw(HTTP Str) );

    # Inside
    {
        my ( $inside_status, $inside_return ) = inside(
            $f, $scope,
            $$scope->{'HTTP'}->property_u( 'get', $pos->(1.3) )->(
                [ str( $f, "http://google.com" ) ], $scope,
                undef, $pos->(1.4)
            ),
            sub {
                my ( $scope, $ins, $ret_func ) = @_;
                on(
                    $ins,
                    'connected',
                    $self, $scope,
                    $func_0->inside_scope(
                        (undef) => $scope,
                        undef, undef, $ins, undef, undef
                    ),
                    {}
                );
                on(
                    $ins,
                    'redirect',
                    $self, $scope,
                    $func_1->inside_scope(
                        (undef) => $scope,
                        undef, undef, $ins, undef, undef
                    ),
                    {}
                );
                on(
                    $ins,
                    'response',
                    $self, $scope,
                    $func_2->inside_scope(
                        (undef) => $scope,
                        undef, undef, $ins, undef, undef
                    ),
                    {}
                );
                on(
                    $ins, 'error', $self, $scope,
                    $func_3->inside_scope(
                        (undef) => $scope,
                        undef, undef, $ins, undef, undef
                    ),
                    {}
                );
                $$ins->{'connect'}
                  ->( [ undef, [] ], $scope, undef, $pos->(24.2) );
            }
        );
        return $ret_func->($inside_return) if $inside_status eq 'return';
    }
};

after_content($file_name);
