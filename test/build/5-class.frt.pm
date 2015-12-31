# === Document Model ===
#  Document './test/5-class.frt'
#      Class 'Point' version 1.0
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$x'
#                  Instruction
#                      Need
#                          Lexical variable '$y'
#                  Instruction
#                      Assignment
#                          Instance variable '@x'
#                          Lexical variable '$x'
#                  Instruction
#                      Assignment
#                          Instance variable '@y'
#                          Lexical variable '$y'
#          Method 'oneToRight'
#              Body ('method' scope)
#                  Instruction
#                      Assignment
#                          Lexical variable '$pt'
#                          Call
#                              Special variable '*class'
#                              Argument list [2 items]
#                                  Item 0
#                                      Operation
#                                          Instance variable '@x'
#                                          Addition operator (+)
#                                          Number '1'
#                                  Item 1
#                                      Instance variable '@y'
#                  Instruction
#                      Return
#                          Lexical variable '$pt'
#          Method 'pretty'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Single value [1 items]
#                              Item 0
#                                  Operation
#                                      String '('
#                                      Addition operator (+)
#                                      Instance variable '@x'
#                                      Addition operator (+)
#                                      String ', '
#                                      Addition operator (+)
#                                      Instance variable '@y'
#                                      Addition operator (+)
#                                      String ')'
#          Method 'toString'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@pretty'
#                              Argument list [0 items]
#          Class method 'midpoint'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$pt1'
#                  Instruction
#                      Need
#                          Lexical variable '$pt2'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Point'
#                              Named argument list [2 items]
#                                  Item 0
#                                      Pair 'x'
#                                          Operation
#                                              Single value [1 items]
#                                                  Item 0
#                                                      Operation
#                                                          Property 'x'
#                                                              Lexical variable '$pt1'
#                                                          Addition operator (+)
#                                                          Property 'x'
#                                                              Lexical variable '$pt2'
#                                              Division operator (/)
#                                              Number '2'
#                                  Item 1
#                                      Pair 'y'
#                                          Operation
#                                              Single value [1 items]
#                                                  Item 0
#                                                      Operation
#                                                          Property 'y'
#                                                              Lexical variable '$pt1'
#                                                          Addition operator (+)
#                                                          Property 'y'
#                                                              Lexical variable '$pt2'
#                                              Division operator (/)
#                                              Number '2'
#      Instruction
#          Assignment
#              Lexical variable '$pt'
#              Call
#                  Bareword 'Point'
#                  Argument list [2 items]
#                      Item 0
#                          Number '5'
#                      Item 1
#                          Number '3'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Point'
#                          Addition operator (+)
#                          Lexical variable '$pt'
#      Instruction
#          Assignment
#              Lexical variable '$rpt'
#              Call
#                  Property 'oneToRight'
#                      Lexical variable '$pt'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Right'
#                          Addition operator (+)
#                          Lexical variable '$rpt'
#      Instruction
#          Assignment
#              Lexical variable '$mdpt'
#              Call
#                  Property 'midpoint'
#                      Bareword 'Point'
#                  Argument list [2 items]
#                      Item 0
#                          Lexical variable '$pt'
#                      Item 1
#                          Lexical variable '$rpt'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Midpoint'
#                          Addition operator (+)
#                          Lexical variable '$mdpt'
#      Instruction
#          Assignment
#              Lexical variable '$nineteen'
#              Operation
#                  Number '4'
#                  Addition operator (+)
#                  Number '45'
#                  Division operator (/)
#                  Number '3'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Operation
#                          String 'Nineteen: '
#                          Addition operator (+)
#                          Lexical variable '$nineteen'
#      Include (Point)
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

FF::before_content('5-class.frt');

use Ferret::Core::Operations qw(add div num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Class 'Point'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Point', 1.0 );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
            [
                {
                    name     => 'x',
                    type     => undef,
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'y',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                FF::need( $scope, $args, 'x', 4.2 ) or return;
                FF::need( $scope, $args, 'y', 4.4 ) or return;
                $self->set_property( x => $scope->property_u('x'), 5.2 );
                $self->set_property( y => $scope->property_u('y'), 6.2 );
                return $ret->return;
            }
        );

        # Method event 'oneToRight' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'oneToRight',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                $scope->set_property_ow(
                    $context,
                    pt => $scope->{special}->property_u('class')->call_u(
                        [
                            add( $scope, $self->property_u('x'), num( $f, 1 ) ),
                            $self->property_u('y')
                        ],
                        $scope, undef, 10.2
                    ),
                    10.1
                );
                return $ret->return( $scope->property_u('pt') );
                return $ret->return;
            }
        );

        # Method event 'pretty' definition
        my $method_2 = FF::method_event_def(
            $f, $scope, 'pretty',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                return $ret->return(
                    add(
                        $scope,                 str( $f, "(" ),
                        $self->property_u('x'), str( $f, ", " ),
                        $self->property_u('y'), str( $f, ")" )
                    )
                );
                return $ret->return;
            }
        );

        # Method event 'toString' definition
        my $method_3 = FF::method_event_def(
            $f, $scope,
            'toString',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                return $ret->return( $self->property_u('pretty')
                      ->call_u( {}, $scope, undef, 19.3 ) );
                return $ret->return;
            }
        );

        # Method event 'midpoint' definition
        my $method_4 = FF::method_event_def(
            $f, $scope,
            'midpoint',
            [
                {
                    name     => 'pt1',
                    type     => undef,
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'pt2',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                FF::need( $scope, $args, 'pt1', 23.2 ) or return;
                FF::need( $scope, $args, 'pt2', 23.4 ) or return;
                return $ret->return(
                    $scope->property_u('Point')->call_u(
                        {
                            x => div(
                                $scope,
                                add(
                                    $scope,
                                    $scope->property_u('pt1')->property_u('x'),
                                    $scope->property_u('pt2')->property_u('x')
                                ),
                                num( $f, 2 )
                            ),
                            y => div(
                                $scope,
                                add(
                                    $scope,
                                    $scope->property_u('pt1')->property_u('y'),
                                    $scope->property_u('pt2')->property_u('y')
                                ),
                                num( $f, 2 )
                            )
                        },
                        $scope, undef, 24.3
                    )
                );
                return $ret->return;
            }
        );
        $method_0->inside_scope(
            _init_ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            oneToRight => $scope,
            $proto, $class, undef, undef
        );
        $method_2->inside_scope(
            pretty => $scope,
            $proto, $class, undef, undef
        );
        $method_3->inside_scope(
            toString => $scope,
            $proto, $class, undef, undef
        );
        $method_4->inside_scope(
            midpoint => $scope,
            $class, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Point) );
    $scope->set_property_ow(
        $context,
        pt => $scope->property_u('Point')
          ->call_u( [ num( $f, 5 ), num( $f, 3 ) ], $scope, undef, 32.2 ),
        32.1
    );
    $scope->property_u('say')
      ->call_u( [ add( $scope, str( $f, "Point" ), $scope->property_u('pt') ) ],
        $scope, undef, 33.2 );
    $scope->set_property_ow(
        $context,
        rpt => $scope->property_u('pt')->property_u('oneToRight')
          ->call_u( {}, $scope, undef, 35.5 ),
        35.2
    );
    $scope->property_u('say')
      ->call_u(
        [ add( $scope, str( $f, "Right" ), $scope->property_u('rpt') ) ],
        $scope, undef, 36.2 );
    $scope->set_property_ow(
        $context,
        mdpt => $scope->property_u('Point')->property_u('midpoint')->call_u(
            [ $scope->property_u('pt'), $scope->property_u('rpt') ], $scope,
            undef, 38.25
        ),
        38.1
    );
    $scope->property_u('say')
      ->call_u(
        [ add( $scope, str( $f, "Midpoint" ), $scope->property_u('mdpt') ) ],
        $scope, undef, 39.2 );
    $scope->set_property_ow(
        $context,
        nineteen => add(
            $scope,
            num( $f, 4 ),
            div( $scope, num( $f, 45 ), num( $f, 3 ) )
        ),
        41.2
    );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope, str( $f, "Nineteen: " ),
                $scope->property_u('nineteen')
            )
        ],
        $scope, undef, 42.2
    );
};

FF::after_content();
