# === Document Model ===
#  Document './std/Math/Rect.frt'
#      Package 'Math'
#      Class 'Rect'
#          Main method '_init_'
#              Instruction
#                  Need
#                      Lexical variable '$x'
#                      Bareword 'Num'
#              Instruction
#                  Need
#                      Lexical variable '$y'
#                      Bareword 'Num'
#              Instruction
#                  Need
#                      Instance variable '@width'
#                      Bareword 'Num'
#              Instruction
#                  Need
#                      Instance variable '@height'
#                      Bareword 'Num'
#              Instruction
#                  Assignment (instance variable '@origin')
#                      Call
#                          Bareword 'Point'
#                          Set [2 items]
#                              Item 0
#                                  Lexical variable '$x'
#                              Item 1
#                                  Lexical variable '$y'
#          Computed property 'vertices'
#              Instruction
#                  Return
#                      Value list [4 items]
#                          Item 0
#                              Instance variable '@topLeft'
#                          Item 1
#                              Instance variable '@topRight'
#                          Item 2
#                              Instance variable '@bottomLeft'
#                          Item 3
#                              Instance variable '@bottomRight'
#          Computed property 'bottomLeft'
#              Instruction
#                  Return
#                      Instance variable '@origin'
#          Computed property 'bottomRight'
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
#          Computed property 'topLeft'
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
#          Computed property 'topRight'
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
#          Computed property 'bottomLine'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'Line'
#                          Set [2 items]
#                              Item 0
#                                  Instance variable '@bottomLeft'
#                              Item 1
#                                  Instance variable '@bottomRight'
#          Computed property 'topLine'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'Line'
#                          Set [2 items]
#                              Item 0
#                                  Instance variable '@topLeft'
#                              Item 1
#                                  Instance variable '@topRight'
#          Computed property 'center'
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
#                  Assignment (lexical variable '$o')
#                      Instance variable '@origin'
#              Instruction
#                  Assignment (lexical variable '$c')
#                      Instance variable '@center'
#              Instruction
#                  Return
#                      Operation
#                          String 'Rect( Origin('
#                          Addition operator (+)
#                          Property 'x'
#                              Lexical variable '$o'
#                          Addition operator (+)
#                          String ', '
#                          Addition operator (+)
#                          Property 'y'
#                              Lexical variable '$o'
#                          Addition operator (+)
#                          String '); Center('
#                          Addition operator (+)
#                          Property 'x'
#                              Lexical variable '$c'
#                          Addition operator (+)
#                          String ', '
#                          Addition operator (+)
#                          Property 'y'
#                              Lexical variable '$c'
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
#      Include (Line, Num, Point)
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
my $f = FF::get_ferret();

FF::before_content('Rect.frt');

use Ferret::Core::Operations qw(add mul num str);
my $result = do {
    my @funcs;
    my $scope = my $context = FF::get_context( $f, 'Math' );
    FF::load_core('Math');

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
            $func->add_argument( name => 'x', type => 'Num', more => undef );
            $func->add_argument( name => 'y', type => 'Num', more => undef );
            $func->add_argument(
                name => 'width',
                type => 'Num',
                more => undef
            );
            $func->add_argument(
                name => 'height',
                type => 'Num',
                more => undef
            );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'x' )      or return;
                FF::need( $scope, $arguments, 'y' )      or return;
                FF::need( $self,  $arguments, 'width' )  or return;
                FF::need( $self,  $arguments, 'height' ) or return;
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

        # Method event 'vertices' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return FF::create_list(
                    $f,
                    [
                        $self->property_u('topLeft'),
                        $self->property_u('topRight'),
                        $self->property_u('bottomLeft'),
                        $self->property_u('bottomRight')
                    ]
                );
                return $return;
            };
            $methods[1] = Ferret::Event->new(
                $f,
                name         => 'vertices',
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
            $methods[2] = Ferret::Event->new(
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
            $methods[3] = Ferret::Event->new(
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
            $methods[4] = Ferret::Event->new(
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
            $methods[5] = Ferret::Event->new(
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
                        $self->property_u('bottomLeft'),
                        $self->property_u('bottomRight')
                    ],
                    $scope
                );
                return $return;
            };
            $methods[6] = Ferret::Event->new(
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
                        $self->property_u('topLeft'),
                        $self->property_u('topRight')
                    ],
                    $scope
                );
                return $return;
            };
            $methods[7] = Ferret::Event->new(
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
            $methods[8] = Ferret::Event->new(
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
                    o => $self->property_u('origin') );
                $scope->set_property_ow( $context,
                    c => $self->property_u('center') );
                return add(
                    $scope,
                    str( $f, "Rect( Origin(" ),
                    $scope->property_u('o')->property_u('x'),
                    str( $f, ", " ),
                    $scope->property_u('o')->property_u('y'),
                    str( $f, "); Center(" ),
                    $scope->property_u('c')->property_u('x'),
                    str( $f, ", " ),
                    $scope->property_u('c')->property_u('y'),
                    str( $f, "); Width = " ),
                    $self->property_u('width'),
                    str( $f, "; Height = " ),
                    $self->property_u('height'),
                    str( $f, " )" )
                );
                return $return;
            };
            $methods[9] = Ferret::Event->new(
                $f,
                name         => 'description',
                default_func => [ undef, $func ]
            );
        }
        $methods[0]
          ->inside_scope( _init_ => $scope, $class, $class, undef, undef );
        $methods[1]
          ->inside_scope( vertices => $scope, $proto, $class, 1, undef );
        $methods[2]
          ->inside_scope( bottomLeft => $scope, $proto, $class, 1, undef );
        $methods[3]
          ->inside_scope( bottomRight => $scope, $proto, $class, 1, undef );
        $methods[4]
          ->inside_scope( topLeft => $scope, $proto, $class, 1, undef );
        $methods[5]
          ->inside_scope( topRight => $scope, $proto, $class, 1, undef );
        $methods[6]
          ->inside_scope( bottomLine => $scope, $proto, $class, 1, undef );
        $methods[7]
          ->inside_scope( topLine => $scope, $proto, $class, 1, undef );
        $methods[8]->inside_scope( center => $scope, $proto, $class, 1, undef );
        $methods[9]
          ->inside_scope( description => $scope, $proto, $class, undef, undef );
    }
    FF::load_namespaces( $context,
        qw(Math::Line Math::Num Math::Point Line Num Point) );
};

FF::after_content();
