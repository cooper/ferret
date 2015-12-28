# === Document Model ===
#  Document './std/Extension/Number.frt'
#      Class 'Number'
#          Computed property 'sqrt'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Property 'sqrt'
#                                  Bareword 'Math'
#                              Argument list [1 items]
#                                  Item 0
#                                      Special variable '*self'
#          Computed property 'square'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Operation
#                              Special variable '*self'
#                              Exponent operator (^)
#                              Number '2'
#          Computed property 'even' (lazy)
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Operation
#                              Special variable '*self'
#                              Modulus operator (%)
#                              Number '2'
#                              Equality operator (==)
#                              Number '0'
#          Computed property 'odd' (lazy)
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Operation
#                              Special variable '*self'
#                              Modulus operator (%)
#                              Number '2'
#                              Negated equality operator (!=)
#                              Number '0'
#          Method 'root'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$root'
#                          Bareword 'Num'
#                  Instruction
#                      Return
#                          Call
#                              Property 'root'
#                                  Bareword 'Math'
#                              Argument list [2 items]
#                                  Item 0
#                                      Lexical variable '$root'
#                                  Item 1
#                                      Special variable '*self'
#      Include (Math, Num)
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

FF::before_content('Number.frt');

use Ferret::Core::Operations qw(equal mod nequal num pow);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Class 'Number'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Number', undef );

        # Method event 'sqrt' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, 'sqrt',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                return $ret->return(
                    $scope->property_u('Math')->property_u('sqrt')->call_u(
                        [ $scope->{special}->property_u('self') ], $scope,
                        undef,                                     4.4
                    )
                );
                return $ret->return;
            }
        );

        # Method event 'square' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'square',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                return $ret->return(
                    pow(
                        $scope, $scope->{special}->property_u('self'),
                        num( $f, 2 )
                    )
                );
                return $ret->return;
            }
        );

        # Method event 'even' definition
        my $method_2 = FF::method_event_def(
            $f, $scope, 'even',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                return $ret->return(
                    equal(
                        $scope,
                        mod(
                            $scope,
                            $scope->{special}->property_u('self'),
                            num( $f, 2 )
                        ),
                        num( $f, 0 )
                    )
                );
                return $ret->return;
            }
        );

        # Method event 'odd' definition
        my $method_3 = FF::method_event_def(
            $f, $scope, 'odd',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                return $ret->return(
                    nequal(
                        $scope,
                        mod(
                            $scope,
                            $scope->{special}->property_u('self'),
                            num( $f, 2 )
                        ),
                        num( $f, 0 )
                    )
                );
                return $ret->return;
            }
        );

        # Method event 'root' definition
        my $method_4 = FF::method_event_def(
            $f, $scope, 'root',
            [
                {
                    name     => 'root',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                FF::need( $scope, $args, 'root', 20.2 ) or return;
                return $ret->return(
                    $scope->property_u('Math')->property_u('root')->call_u(
                        [
                            $scope->property_u('root'),
                            $scope->{special}->property_u('self')
                        ],
                        $scope, undef, 21.2
                    )
                );
                return $ret->return;
            }
        );
        $method_0->inside_scope( sqrt   => $scope, $proto, $class, 1, undef );
        $method_1->inside_scope( square => $scope, $proto, $class, 1, undef );
        $method_2->inside_scope( even   => $scope, $proto, $class, 1, 1 );
        $method_3->inside_scope( odd    => $scope, $proto, $class, 1, 1 );
        $method_4->inside_scope( root => $scope, $proto, $class, undef, undef );
    }
    FF::load_namespaces( $context, qw(Math Num) );
};

FF::after_content();
