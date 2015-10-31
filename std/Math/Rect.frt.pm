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
#                          Set [2 items]
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
#                          Set [2 items]
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
#                          Set [2 items]
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
#                          Set [2 items]
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
#                          Set [2 items]
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
#                          Set [2 items]
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
#                          Set [2 items]
#                              Item 0
#                                  Lexical variable '$x'
#                              Item 1
#                                  Lexical variable '$y'
#          Method 'description'
#              Instruction
#                  Assignment (lexical variable '$ox')
#                      Property 'x'
#                          Instance variable '@origin'
#              Instruction
#                  Assignment (lexical variable '$oy')
#                      Property 'y'
#                          Instance variable '@origin'
#              Instruction
#                  Assignment (lexical variable '$c')
#                      Call
#                          Instance variable '@center'
#                          Structural list [0 items]
#              Instruction
#                  Assignment (lexical variable '$cx')
#                      Property 'x'
#                          Lexical variable '$c'
#              Instruction
#                  Assignment (lexical variable '$cy')
#                      Property 'y'
#                          Lexical variable '$c'
#              Instruction
#                  Return
#                      Operation
#                          String 'Rect( Origin('
#                          Addition operator (+)
#                          Lexical variable '$ox'
#                          Addition operator (+)
#                          String ', '
#                          Addition operator (+)
#                          Lexical variable '$oy'
#                          Addition operator (+)
#                          String '); Center('
#                          Addition operator (+)
#                          Lexical variable '$cx'
#                          Addition operator (+)
#                          String ', '
#                          Addition operator (+)
#                          Lexical variable '$cy'
#                          Addition operator (+)
#                          String '); Width = '
#                          Addition operator (+)
#                          Instance variable '@width'
#                          Addition operator (+)
#                          String '; Height = '
#                          Addition operator (+)
#                          Instance variable '@height'
#                          Addition operator (+)
#                          String ' )'
#      Include (Line, Point)
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
$Ferret::tried_files{'Rect.frt.pm'}++;

use Ferret::Core::Operations qw(add mul num str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('Math');
    undef;
    Ferret::space( $context, 'CORE' ) or die 'CORE error';

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
            $func->add_argument( name => 'x',      type => '' );
            $func->add_argument( name => 'y',      type => '' );
            $func->add_argument( name => 'width',  type => '' );
            $func->add_argument( name => 'height', type => '' );
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
                    origin => $scope->property_u('Point')->call_u(
                        [ $scope->property_u('x'), $scope->property_u('y') ],
                        $scope
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
                return $scope->property_u('Point')->call_u(
                    [
                        add(
                            $scope,
                            $self->property_u('origin')->property_u('x'),
                            $self->property_u('width')
                        ),
                        $self->property_u('origin')->property_u('y')
                    ],
                    $scope
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
                return $scope->property_u('Point')->call_u(
                    [
                        $self->property_u('origin')->property_u('x'),
                        add(
                            $scope,
                            $self->property_u('origin')->property_u('y'),
                            $self->property_u('height')
                        )
                    ],
                    $scope
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
                return $scope->property_u('Point')->call_u(
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
                return $scope->property_u('Line')->call_u(
                    [
                        $self->property_u('bottomLeft')->call_u( {}, $scope ),
                        $self->property_u('bottomRight')->call_u( {}, $scope )
                    ],
                    $scope
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
                return $scope->property_u('Line')->call_u(
                    [
                        $self->property_u('topLeft')->call_u( {}, $scope ),
                        $self->property_u('topRight')->call_u( {}, $scope )
                    ],
                    $scope
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
                return $scope->property_u('Point')
                  ->call_u(
                    [ $scope->property_u('x'), $scope->property_u('y') ],
                    $scope );
                return $return;
            };
            $methods[7] = Ferret::Event->new(
                $f,
                name         => 'center',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'description' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property_ow( $context,
                    ox => $self->property_u('origin')->property_u('x') );
                $scope->set_property_ow( $context,
                    oy => $self->property_u('origin')->property_u('y') );
                $scope->set_property_ow( $context,
                    c => $self->property_u('center')->call_u( {}, $scope ) );
                $scope->set_property_ow( $context,
                    cx => $scope->property_u('c')->property_u('x') );
                $scope->set_property_ow( $context,
                    cy => $scope->property_u('c')->property_u('y') );
                return add(
                    $scope,                      str( $f, "Rect( Origin(" ),
                    $scope->property_u('ox'),    str( $f, ", " ),
                    $scope->property_u('oy'),    str( $f, "); Center(" ),
                    $scope->property_u('cx'),    str( $f, ", " ),
                    $scope->property_u('cy'),    str( $f, "); Width = " ),
                    $self->property_u('width'),  str( $f, "; Height = " ),
                    $self->property_u('height'), str( $f, " )" )
                );
                return $return;
            };
            $methods[8] = Ferret::Event->new(
                $f,
                name         => 'description',
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
        $methods[8]->inside_scope( description => $scope, $proto, $class );
    }
    Ferret::space( $context, $_ ) for qw(Math::Line Math::Point Line Point);
};

Ferret::runtime();
