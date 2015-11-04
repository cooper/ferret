# === Document Model ===
#  Document './test/hello5.frt'
#      Class 'Point' version 1.0
#          Main method '_init_'
#              Instruction
#                  Need
#                      Lexical variable '$x'
#              Instruction
#                  Need
#                      Lexical variable '$y'
#              Instruction
#                  Assignment (instance variable '@x')
#                      Lexical variable '$x'
#              Instruction
#                  Assignment (instance variable '@y')
#                      Lexical variable '$y'
#          Method 'oneToRight'
#              Instruction
#                  Assignment (lexical variable '$pt')
#                      Call
#                          Special variable '*class'
#                          Set [2 items]
#                              Item 0
#                                  Operation
#                                      Instance variable '@x'
#                                      Addition operator (+)
#                                      Number '1'
#                              Item 1
#                                  Instance variable '@y'
#              Instruction
#                  Return
#                      Lexical variable '$pt'
#          Method 'pretty'
#              Instruction
#                  Return
#                      Single value [1 items]
#                          Item 0
#                              Operation
#                                  String '('
#                                  Addition operator (+)
#                                  Instance variable '@x'
#                                  Addition operator (+)
#                                  String ', '
#                                  Addition operator (+)
#                                  Instance variable '@y'
#                                  Addition operator (+)
#                                  String ')'
#          Method 'toString'
#              Instruction
#                  Return
#                      Call
#                          Instance variable '@pretty'
#                          Structural list [0 items]
#          Main method 'midpoint'
#              Instruction
#                  Need
#                      Lexical variable '$pt1'
#              Instruction
#                  Need
#                      Lexical variable '$pt2'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'Point'
#                          Hash [2 items]
#                              Item 0
#                                  Pair 'x'
#                                      Operation
#                                          Single value [1 items]
#                                              Item 0
#                                                  Operation
#                                                      Property 'x'
#                                                          Lexical variable '$pt1'
#                                                      Addition operator (+)
#                                                      Property 'x'
#                                                          Lexical variable '$pt2'
#                                          Division operator (/)
#                                          Number '2'
#                              Item 1
#                                  Pair 'y'
#                                      Operation
#                                          Single value [1 items]
#                                              Item 0
#                                                  Operation
#                                                      Property 'y'
#                                                          Lexical variable '$pt1'
#                                                      Addition operator (+)
#                                                      Property 'y'
#                                                          Lexical variable '$pt2'
#                                          Division operator (/)
#                                          Number '2'
#      Instruction
#          Assignment (lexical variable '$pt')
#              Call
#                  Bareword 'Point'
#                  Set [2 items]
#                      Item 0
#                          Number '5'
#                      Item 1
#                          Number '3'
#      Instruction
#          Call
#              Bareword 'say'
#              Single value [1 items]
#                  Item 0
#                      Operation
#                          String 'Point'
#                          Addition operator (+)
#                          Lexical variable '$pt'
#      Instruction
#          Assignment (lexical variable '$rpt')
#              Call
#                  Property 'oneToRight'
#                      Lexical variable '$pt'
#      Instruction
#          Call
#              Bareword 'say'
#              Single value [1 items]
#                  Item 0
#                      Operation
#                          String 'Right'
#                          Addition operator (+)
#                          Lexical variable '$rpt'
#      Instruction
#          Assignment (lexical variable '$mdpt')
#              Call
#                  Property 'midpoint'
#                      Bareword 'Point'
#                  Set [2 items]
#                      Item 0
#                          Lexical variable '$pt'
#                      Item 1
#                          Lexical variable '$rpt'
#      Instruction
#          Call
#              Bareword 'say'
#              Single value [1 items]
#                  Item 0
#                      Operation
#                          String 'Midpoint'
#                          Addition operator (+)
#                          Lexical variable '$mdpt'
#      Instruction
#          Assignment (lexical variable '$nineteen')
#              Operation
#                  Number '4'
#                  Addition operator (+)
#                  Number '45'
#                  Division operator (/)
#                  Number '3'
#      Instruction
#          Call
#              Bareword 'say'
#              Single value [1 items]
#                  Item 0
#                      Operation
#                          String 'Nineteen: '
#                          Addition operator (+)
#                          Lexical variable '$nineteen'
#      Include (Point)
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die 'config error';
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello5.frt.pm'}++;

use Ferret::Core::Operations qw(add div num str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    do 'CORE.frt.pm' or die "Core error: $@" unless 'main' eq 'CORE';
    undef;

    # Class 'Point'
    {
        my @methods;
        my ( $class, $self );
        if ( not $class = $f->get_class( $context, 'Point' ) ) {
            $class = $self = Ferret::Class->new(
                $f,
                name    => 'Point',
                version => 1.0
            );
            $context->set_property( Point => $class );
        }
        my $proto = $class->prototype;

        # Method event '_init_' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'x', type => '', more => undef );
            $func->add_argument( name => 'y', type => '', more => undef );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{x};
                    $scope->set_property( x => $arguments->{x} );
                };
                do {
                    return unless defined $arguments->{y};
                    $scope->set_property( y => $arguments->{y} );
                };
                $self->set_property( x => $scope->property_u('x') );
                $self->set_property( y => $scope->property_u('y') );
                return $return;
            };
            $methods[0] = Ferret::Event->new(
                $f,
                name         => '_init_',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'oneToRight' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property_ow(
                    $context,
                    pt => $scope->{special}->property_u('class')->call_u(
                        [
                            add( $scope, $self->property_u('x'), num( $f, 1 ) ),
                            $self->property_u('y')
                        ],
                        $scope
                    )
                );
                return $scope->property_u('pt');
                return $return;
            };
            $methods[1] = Ferret::Event->new(
                $f,
                name         => 'oneToRight',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'pretty' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return add(
                    $scope,                 str( $f, "(" ),
                    $self->property_u('x'), str( $f, ", " ),
                    $self->property_u('y'), str( $f, ")" )
                );
                return $return;
            };
            $methods[2] = Ferret::Event->new(
                $f,
                name         => 'pretty',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'toString' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return $self->property_u('pretty')->call_u( {}, $scope );
                return $return;
            };
            $methods[3] = Ferret::Event->new(
                $f,
                name         => 'toString',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'midpoint' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'pt1', type => '', more => undef );
            $func->add_argument( name => 'pt2', type => '', more => undef );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    return unless defined $arguments->{pt1};
                    $scope->set_property( pt1 => $arguments->{pt1} );
                };
                do {
                    return unless defined $arguments->{pt2};
                    $scope->set_property( pt2 => $arguments->{pt2} );
                };
                return $scope->property_u('Point')->call_u(
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
                    $scope
                );
                return $return;
            };
            $methods[4] = Ferret::Event->new(
                $f,
                name         => 'midpoint',
                default_func => [ undef, $func ]
            );
        }
        $methods[0]
          ->inside_scope( _init_ => $scope, $class, $class, undef, undef );
        $methods[1]
          ->inside_scope( oneToRight => $scope, $proto, $class, undef, undef );
        $methods[2]
          ->inside_scope( pretty => $scope, $proto, $class, undef, undef );
        $methods[3]
          ->inside_scope( toString => $scope, $proto, $class, undef, undef );
        $methods[4]
          ->inside_scope( midpoint => $scope, $class, $class, undef, undef );
    }
    Ferret::space( $context, $_ ) for qw(Point);
    $scope->set_property_ow( $context,
        pt => $scope->property_u('Point')
          ->call_u( [ num( $f, 5 ), num( $f, 3 ) ], $scope ) );
    $scope->property_u('say')
      ->call_u( [ add( $scope, str( $f, "Point" ), $scope->property_u('pt') ) ],
        $scope );
    $scope->set_property_ow( $context,
        rpt => $scope->property_u('pt')->property_u('oneToRight')
          ->call_u( {}, $scope ) );
    $scope->property_u('say')
      ->call_u(
        [ add( $scope, str( $f, "Right" ), $scope->property_u('rpt') ) ],
        $scope );
    $scope->set_property_ow(
        $context,
        mdpt => $scope->property_u('Point')->property_u('midpoint')->call_u(
            [ $scope->property_u('pt'), $scope->property_u('rpt') ], $scope
        )
    );
    $scope->property_u('say')
      ->call_u(
        [ add( $scope, str( $f, "Midpoint" ), $scope->property_u('mdpt') ) ],
        $scope );
    $scope->set_property_ow(
        $context,
        nineteen => add(
            $scope,
            num( $f, 4 ),
            div( $scope, num( $f, 45 ), num( $f, 3 ) )
        )
    );
    $scope->property_u('say')->call_u(
        [
            add(
                $scope, str( $f, "Nineteen: " ),
                $scope->property_u('nineteen')
            )
        ],
        $scope
    );
};

Ferret::runtime();
