# === Document Model ===
#  Document './test/27-http.frt'
#      Inside
#          Expression ('inside' parameter)
#              Call
#                  Property 'get'
#                      Bareword 'HTTP'
#                  Argument list [1 items]
#                      Item 0
#                          String 'http://goo...'
#          Body ('inside' scope)
#              On
#                  Expression ('on' parameter)
#                      Property variable '.connected'
#                  Anonymous function
#                      Body ('function' scope)
#                          Instruction
#                              Call
#                                  Bareword 'say'
#                                  Argument list [1 items]
#                                      Item 0
#                                          String 'Connected!'
#              On
#                  Expression ('on' parameter)
#                      Property variable '.redirect'
#                  Anonymous function
#                      Body ('function' scope)
#                          Instruction
#                              Need
#                                  Lexical variable '$location'
#                                  Argument type
#                                      Bareword 'Str'
#                          Instruction
#                              Call
#                                  Bareword 'say'
#                                  Argument list [1 items]
#                                      Item 0
#                                          Operation
#                                              String 'Redirected...'
#                                              Addition operator (+)
#                                              Lexical variable '$location'
#              On
#                  Expression ('on' parameter)
#                      Property variable '.response'
#                  Anonymous function
#                      Body ('function' scope)
#                          Instruction
#                              Need
#                                  Lexical variable '$content'
#                                  Argument type
#                                      Bareword 'Str'
#                          Instruction
#                              Call
#                                  Bareword 'say'
#                                  Argument list [1 items]
#                                      Item 0
#                                          Operation
#                                              String 'Got conten...'
#                                              Addition operator (+)
#                                              Property 'length'
#                                                  Lexical variable '$content'
#              On
#                  Expression ('on' parameter)
#                      Property variable '.error'
#                  Anonymous function
#                      Body ('function' scope)
#                          Instruction
#                              Call
#                                  Bareword 'say'
#                                  Argument list [1 items]
#                                      Item 0
#                                          String 'Got error!'
#              Instruction
#                  Call
#                      Property variable '.connect'
#                      Argument list [0 items]
#      Include (HTTP, Str)
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
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('27-http.frt');

use Ferret::Core::Operations qw(add str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, undef, undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $$scope->{'say'}
              ->( [ str( $f, "Connected!" ) ], $scope, undef, 4.2 );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_1 = FF::function_def(
        $f, undef, undef,
        [
            {
                name     => 'location',
                type     => 'Str',
                optional => undef,
                more     => undef
            }
        ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'location', 8.2 ) or return;
            $$scope->{'say'}->(
                [
                    add(
                        $scope, str( $f, "Redirected to " ),
                        $$scope->{'location'}
                    )
                ],
                $scope, undef, 9.2
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_2 = FF::function_def(
        $f, undef, undef,
        [
            {
                name     => 'content',
                type     => 'Str',
                optional => undef,
                more     => undef
            }
        ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'content', 14.2 ) or return;
            $$scope->{'say'}->(
                [
                    add(
                        $scope,
                        str( $f, "Got content! Length " ),
                        ${ $$scope->{'content'} }->{'length'}
                    )
                ],
                $scope, undef, 15.2
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_3 = FF::function_def(
        $f, undef, undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $$scope->{'say'}
              ->( [ str( $f, "Got error!" ) ], $scope, undef, 20.2 );
            return $ret;
        }
    );
    FF::load_namespaces( $context, qw(HTTP Str) );

    # Inside
    FF::inside(
        $f, $scope,
        ${ $$scope->{'HTTP'} }->{'get'}
          ->( [ str( $f, "http://google.com" ) ], $scope, undef, 1.4 ),
        sub {
            my ( $scope, $ins ) = @_;
            FF::on(
                $ins,
                'connected',
                $self, $scope,
                $func_0->inside_scope(
                    (undef) => $scope,
                    undef, undef, undef, undef
                ),
                {}
            );
            FF::on(
                $ins,
                'redirect',
                $self, $scope,
                $func_1->inside_scope(
                    (undef) => $scope,
                    undef, undef, undef, undef
                ),
                {}
            );
            FF::on(
                $ins,
                'response',
                $self, $scope,
                $func_2->inside_scope(
                    (undef) => $scope,
                    undef, undef, undef, undef
                ),
                {}
            );
            FF::on(
                $ins, 'error', $self, $scope,
                $func_3->inside_scope(
                    (undef) => $scope,
                    undef, undef, undef, undef
                ),
                {}
            );
            $$ins->{'connect'}->( {}, $scope, undef, 23.3 );
        }
    );
};

FF::after_content();
