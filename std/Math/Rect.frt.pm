# === Document Model ===
#  Document './std/Math/Rect.frt'
#      Package 'Math'
#      Class 'Rect'
#          Main method '_init_'
#              Instruction
#                  Need
#                      Lexical variable '$x'
#              Instruction
#                  Need
#                      Lexical variable '$y'
#              Instruction
#                  Need
#                      Instance variable '@width'
#              Instruction
#                  Need
#                      Instance variable '@height'
#              Instruction
#                  Assignment (instance variable '@origin')
#                      Call
#                          Bareword 'Point'
#                          Structural list [2 items]
#                              Item 0
#                                  Lexical variable '$x'
#                              Item 1
#                                  Lexical variable '$y'
#          Method 'bottomLeft'
#              Instruction
#                  Return
#                      Instance variable '@origin'
#          Method 'bottomRight'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'Point'
#                          Structural list [2 items]
#                              Item 0
#                                  Operation
#                                      Property 'x'
#                                          Instance variable '@origin'
#                                      Addition operator (+)
#                                      Instance variable '@width'
#                              Item 1
#                                  Property 'y'
#                                      Instance variable '@origin'
#          Method 'topLeft'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'Point'
#                          Structural list [2 items]
#                              Item 0
#                                  Property 'x'
#                                      Instance variable '@origin'
#                              Item 1
#                                  Operation
#                                      Property 'y'
#                                          Instance variable '@origin'
#                                      Addition operator (+)
#                                      Instance variable '@height'
#          Method 'topRight'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'Point'
#                          Structural list [2 items]
#                              Item 0
#                                  Operation
#                                      Property 'x'
#                                          Instance variable '@origin'
#                                      Addition operator (+)
#                                      Instance variable '@width'
#                              Item 1
#                                  Operation
#                                      Property 'y'
#                                          Instance variable '@origin'
#                                      Addition operator (+)
#                                      Instance variable '@height'
#          Method 'bottomLine'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'Line'
#                          Structural list [2 items]
#                              Item 0
#                                  Call
#                                      Instance variable '@bottomLeft'
#                              Item 1
#                                  Call
#                                      Instance variable '@bottomRight'
#          Method 'topLine'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'Line'
#                          Structural list [2 items]
#                              Item 0
#                                  Call
#                                      Instance variable '@topLeft'
#                              Item 1
#                                  Call
#                                      Instance variable '@topRight'
#          Method 'center'
#              Instruction
#                  Assignment (lexical variable '$x')
#                      Operation
#                          Property 'x'
#                              Instance variable '@origin'
#                          Addition operator (+)
#                          Instance variable '@width'
#                          Multiplication operator (*)
#                          Number '0.5'
#              Instruction
#                  Assignment (lexical variable '$y')
#                      Operation
#                          Property 'y'
#                              Instance variable '@origin'
#                          Addition operator (+)
#                          Instance variable '@height'
#                          Multiplication operator (*)
#                          Number '0.5'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'Point'
#                          Structural list [2 items]
#                              Item 0
#                                  Lexical variable '$x'
#                              Item 1
#                                  Lexical variable '$y'
#      Include (Line, Point)
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die "config error";
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'Rect.frt.pm'}++;

use Ferret::Core::Operations qw(U add mul num);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('Math');
    undef;

    # Class 'Rect'
    {
        my @methods;
        my ( $class, $self );
        if ( not $class = $f->get_class( $context, 'Rect' ) ) {
            $class = $self = Ferret::Class->new(
                $f,
                name    => 'Rect',
                version => undef
            );
            $context->set_property( Rect => $class );
        }
        my $proto = $class->prototype;

        # Method event '_init_' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'x' );
            $func->add_argument( name => 'y' );
            $func->add_argument( name => 'width' );
            $func->add_argument( name => 'height' );
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
                do {
                    return unless defined $arguments->{width};
                    $self->set_property( width => $arguments->{width} );
                };
                do {
                    return unless defined $arguments->{height};
                    $self->set_property( height => $arguments->{height} );
                };
                $self->set_property(
                    origin => U(
                        $scope->property_u('Point')->call(
                            [
                                $scope->property_u('x'), $scope->property_u('y')
                            ],
                            $scope
                        )
                    )
                );
                return $return;
            };
            $methods[0] = Ferret::Event->new(
                $f,
                name         => '_init_',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'bottomLeft' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return $self->property_u('origin');
                return $return;
            };
            $methods[1] = Ferret::Event->new(
                $f,
                name         => 'bottomLeft',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'bottomRight' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return U(
                    $scope->property_u('Point')->call(
                        [
                            add(
                                $scope,
                                $self->property_u('origin')->property_u('x'),
                                $self->property_u('width')
                            ),
                            $self->property_u('origin')->property_u('y')
                        ],
                        $scope
                    )
                );
                return $return;
            };
            $methods[2] = Ferret::Event->new(
                $f,
                name         => 'bottomRight',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'topLeft' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return U(
                    $scope->property_u('Point')->call(
                        [
                            $self->property_u('origin')->property_u('x'),
                            add(
                                $scope,
                                $self->property_u('origin')->property_u('y'),
                                $self->property_u('height')
                            )
                        ],
                        $scope
                    )
                );
                return $return;
            };
            $methods[3] = Ferret::Event->new(
                $f,
                name         => 'topLeft',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'topRight' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return U(
                    $scope->property_u('Point')->call(
                        [
                            add(
                                $scope,
                                $self->property_u('origin')->property_u('x'),
                                $self->property_u('width')
                            ),
                            add(
                                $scope,
                                $self->property_u('origin')->property_u('y'),
                                $self->property_u('height')
                            )
                        ],
                        $scope
                    )
                );
                return $return;
            };
            $methods[4] = Ferret::Event->new(
                $f,
                name         => 'topRight',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'bottomLine' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return U(
                    $scope->property_u('Line')->call(
                        [
                            U(
                                $self->property_u('bottomLeft')
                                  ->call( {}, $scope )
                            ),
                            U(
                                $self->property_u('bottomRight')
                                  ->call( {}, $scope )
                            )
                        ],
                        $scope
                    )
                );
                return $return;
            };
            $methods[5] = Ferret::Event->new(
                $f,
                name         => 'bottomLine',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'topLine' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return U(
                    $scope->property_u('Line')->call(
                        [
                            U(
                                $self->property_u('topLeft')->call( {}, $scope )
                            ),
                            U(
                                $self->property_u('topRight')
                                  ->call( {}, $scope )
                            )
                        ],
                        $scope
                    )
                );
                return $return;
            };
            $methods[6] = Ferret::Event->new(
                $f,
                name         => 'topLine',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'center' definition
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
                    x => add(
                        $scope,
                        $self->property_u('origin')->property_u('x'),
                        mul(
                            $scope, $self->property_u('width'),
                            num( $f, 0.5 )
                        )
                    )
                );
                $scope->set_property_ow(
                    $context,
                    y => add(
                        $scope,
                        $self->property_u('origin')->property_u('y'),
                        mul(
                            $scope, $self->property_u('height'),
                            num( $f, 0.5 )
                        )
                    )
                );
                return U(
                    $scope->property_u('Point')->call(
                        [ $scope->property_u('x'), $scope->property_u('y') ],
                        $scope
                    )
                );
                return $return;
            };
            $methods[7] = Ferret::Event->new(
                $f,
                name         => 'center',
                default_func => [ undef, $func ]
            );
        }
        $methods[0]->inside_scope( _init_      => $scope, $class, $class );
        $methods[1]->inside_scope( bottomLeft  => $scope, $proto, $class );
        $methods[2]->inside_scope( bottomRight => $scope, $proto, $class );
        $methods[3]->inside_scope( topLeft     => $scope, $proto, $class );
        $methods[4]->inside_scope( topRight    => $scope, $proto, $class );
        $methods[5]->inside_scope( bottomLine  => $scope, $proto, $class );
        $methods[6]->inside_scope( topLine     => $scope, $proto, $class );
        $methods[7]->inside_scope( center      => $scope, $proto, $class );
    }
    Ferret::space( $context, $_ ) for qw(Line Point);
};

Ferret::runtime();
