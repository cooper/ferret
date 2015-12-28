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
#                                  Bareword 'Str'
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
#                                  Bareword 'Str'
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
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('27-http.frt');

use Ferret::Core::Operations qw(add str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, $scope, undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            $scope->property_u('say')
              ->call_u( [ str( $f, "Connected!" ) ], $scope, undef, 4.2 );
            return $ret->return;
        }
    );

    # Anonymous function definition
    my $func_1 = FF::function_def(
        $f, $scope, undef,
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
            $ret->inc;
            FF::need( $scope, $args, 'location', 8.2 ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope,
                        str( $f, "Redirected to " ),
                        $scope->property_u('location')
                    )
                ],
                $scope, undef, 9.2
            );
            return $ret->return;
        }
    );

    # Anonymous function definition
    my $func_2 = FF::function_def(
        $f, $scope, undef,
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
            $ret->inc;
            FF::need( $scope, $args, 'content', 14.2 ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope,
                        str( $f, "Got content! Length " ),
                        $scope->property_u('content')->property_u('length')
                    )
                ],
                $scope, undef, 15.2
            );
            return $ret->return;
        }
    );

    # Anonymous function definition
    my $func_3 = FF::function_def(
        $f, $scope, undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            $scope->property_u('say')
              ->call_u( [ str( $f, "Got error!" ) ], $scope, undef, 20.2 );
            return $ret->return;
        }
    );
    FF::load_namespaces( $context, qw(HTTP Str) );

    # Inside
    FF::inside(
        $f, $scope,
        $scope->property_u('HTTP')->property_u('get')
          ->call_u( [ str( $f, "http://google.com" ) ], $scope, undef, 1.4 ),
        sub {
            my ( $scope, $ins ) = @_;
            FF::on(
                $ins,
                'connected',
                $self, $scope,
                $func_0->inside_scope(
                    (undef) => $scope,
                    $scope, undef, undef, undef
                ),
                {}
            );
            FF::on(
                $ins,
                'redirect',
                $self, $scope,
                $func_1->inside_scope(
                    (undef) => $scope,
                    $scope, undef, undef, undef
                ),
                {}
            );
            FF::on(
                $ins,
                'response',
                $self, $scope,
                $func_2->inside_scope(
                    (undef) => $scope,
                    $scope, undef, undef, undef
                ),
                {}
            );
            FF::on(
                $ins, 'error', $self, $scope,
                $func_3->inside_scope(
                    (undef) => $scope,
                    $scope, undef, undef, undef
                ),
                {}
            );
            $ins->property_u('connect')->call_u( {}, $scope, undef, 23.3 );
        }
    );
};

FF::after_content();
