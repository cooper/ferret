# === Document Model ===
#  Document './std/Extension/Number.frt'
#      Class 'Number'
#          Type definition ('Even')
#              Body ('type' scope)
#                  Instruction
#                      Isa
#                          Special variable '*class'
#                  Instruction
#                      Satisfies
#                          Property variable '.even'
#          Type definition ('Odd')
#              Body ('type' scope)
#                  Instruction
#                      Isa
#                          Special variable '*class'
#                  Instruction
#                      Satisfies
#                          Property variable '.odd'
#          Type definition ('Integer')
#              Body ('type' scope)
#                  Instruction
#                      Isa
#                          Special variable '*class'
#                  Instruction
#                      Transform
#                          Property variable '.round'
#          Instruction
#              Alias
#                  Assignment
#                      Bareword 'Int'
#                      Bareword 'Integer'
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
#          Computed property 'cbrt'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@root'
#                              Argument list [1 items]
#                                  Item 0
#                                      Number '3'
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
#                          Argument type
#                              Bareword 'Num'
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
#      Include (Int, Integer, Math, Num)
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
    my ( $scope, $context ) = FF::get_context( $f, 'main' );
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
                        undef,                                     21.4
                    )
                );
                return $ret->return;
            }
        );

        # Method event 'cbrt' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'cbrt',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                return $ret->return( $self->property_u('root')
                      ->call_u( [ num( $f, 3 ) ], $scope, undef, 25.3 ) );
                return $ret->return;
            }
        );

        # Method event 'square' definition
        my $method_2 = FF::method_event_def(
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
        my $method_3 = FF::method_event_def(
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
        my $method_4 = FF::method_event_def(
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
        my $method_5 = FF::method_event_def(
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
                FF::need( $scope, $args, 'root', 41.2 ) or return;
                return $ret->return(
                    $scope->property_u('Math')->property_u('root')->call_u(
                        [
                            $scope->property_u('root'),
                            $scope->{special}->property_u('self')
                        ],
                        $scope, undef, 42.2
                    )
                );
                return $ret->return;
            }
        );
        $method_0->inside_scope( sqrt   => $scope, $proto, $class, 1, undef );
        $method_1->inside_scope( cbrt   => $scope, $proto, $class, 1, undef );
        $method_2->inside_scope( square => $scope, $proto, $class, 1, undef );
        $method_3->inside_scope( even   => $scope, $proto, $class, 1, 1 );
        $method_4->inside_scope( odd    => $scope, $proto, $class, 1, 1 );
        $method_5->inside_scope( root => $scope, $proto, $class, undef, undef );
        FF::typedef(
            $scope, $class, 'Even',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                FF::typedef_check(
                    $scope, $scope, $ins,
                    conditions => [
                        $ins->instance_of_u(
                            $scope->{special}->property_u('class')
                        ),
                        $ins->property_u('even')
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            },
            undef
        );
        FF::typedef(
            $scope, $class, 'Odd',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                FF::typedef_check(
                    $scope, $scope, $ins,
                    conditions => [
                        $ins->instance_of_u(
                            $scope->{special}->property_u('class')
                        ),
                        $ins->property_u('odd')
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            },
            undef
        );
        FF::typedef(
            $scope, $class,
            'Integer',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                FF::typedef_check(
                    $scope, $scope, $ins,
                    conditions => [
                        $ins->instance_of_u(
                            $scope->{special}->property_u('class')
                        ),
                        do {
                            $ins =
                              $transform->( $ins->property_u('round'), $ins );
                          }
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            },
            undef
        );
        $class->set_property( Int => $scope->property_u('Integer'), 18.3 );
    }
    FF::load_namespaces( $context, qw(Int Integer Math Num) );
};

FF::after_content();
