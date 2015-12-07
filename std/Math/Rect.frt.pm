# === Document Model ===
#  Document './std/Math/Rect.frt'
#      Package 'Math'
#      Class 'Rect'
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$x'
#                          Bareword 'Num'
#                  Instruction
#                      Need
#                          Lexical variable '$y'
#                          Bareword 'Num'
#                  Instruction
#                      Need
#                          Instance variable '@width'
#                          Bareword 'Num'
#                  Instruction
#                      Need
#                          Instance variable '@height'
#                          Bareword 'Num'
#                  Instruction
#                      Assignment (instance variable '@origin')
#                          Call
#                              Bareword 'Point'
#                              Argument list [2 items]
#                                  Item 0
#                                      Lexical variable '$x'
#                                  Item 1
#                                      Lexical variable '$y'
#          Computed property 'vertices'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Value list [4 items]
#                              Item 0
#                                  Instance variable '@topLeft'
#                              Item 1
#                                  Instance variable '@topRight'
#                              Item 2
#                                  Instance variable '@bottomLeft'
#                              Item 3
#                                  Instance variable '@bottomRight'
#          Computed property 'bottomLeft'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Instance variable '@origin'
#          Computed property 'bottomRight'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Point'
#                              Argument list [2 items]
#                                  Item 0
#                                      Operation
#                                          Property 'x'
#                                              Instance variable '@origin'
#                                          Addition operator (+)
#                                          Instance variable '@width'
#                                  Item 1
#                                      Property 'y'
#                                          Instance variable '@origin'
#          Computed property 'topLeft'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Point'
#                              Argument list [2 items]
#                                  Item 0
#                                      Property 'x'
#                                          Instance variable '@origin'
#                                  Item 1
#                                      Operation
#                                          Property 'y'
#                                              Instance variable '@origin'
#                                          Addition operator (+)
#                                          Instance variable '@height'
#          Computed property 'topRight'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Point'
#                              Argument list [2 items]
#                                  Item 0
#                                      Operation
#                                          Property 'x'
#                                              Instance variable '@origin'
#                                          Addition operator (+)
#                                          Instance variable '@width'
#                                  Item 1
#                                      Operation
#                                          Property 'y'
#                                              Instance variable '@origin'
#                                          Addition operator (+)
#                                          Instance variable '@height'
#          Computed property 'bottomLine'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Line'
#                              Argument list [2 items]
#                                  Item 0
#                                      Instance variable '@bottomLeft'
#                                  Item 1
#                                      Instance variable '@bottomRight'
#          Computed property 'topLine'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Line'
#                              Argument list [2 items]
#                                  Item 0
#                                      Instance variable '@topLeft'
#                                  Item 1
#                                      Instance variable '@topRight'
#          Computed property 'center'
#              Body ('method' scope)
#                  Instruction
#                      Assignment (lexical variable '$x')
#                          Operation
#                              Property 'x'
#                                  Instance variable '@origin'
#                              Addition operator (+)
#                              Instance variable '@width'
#                              Multiplication operator (*)
#                              Number '0.5'
#                  Instruction
#                      Assignment (lexical variable '$y')
#                          Operation
#                              Property 'y'
#                                  Instance variable '@origin'
#                              Addition operator (+)
#                              Instance variable '@height'
#                              Multiplication operator (*)
#                              Number '0.5'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Point'
#                              Argument list [2 items]
#                                  Item 0
#                                      Lexical variable '$x'
#                                  Item 1
#                                      Lexical variable '$y'
#          Method 'description'
#              Body ('method' scope)
#                  Instruction
#                      Assignment (lexical variable '$o')
#                          Instance variable '@origin'
#                  Instruction
#                      Assignment (lexical variable '$c')
#                          Instance variable '@center'
#                  Instruction
#                      Return
#                          Operation
#                              String 'Rect( Origin('
#                              Addition operator (+)
#                              Property 'x'
#                                  Lexical variable '$o'
#                              Addition operator (+)
#                              String ', '
#                              Addition operator (+)
#                              Property 'y'
#                                  Lexical variable '$o'
#                              Addition operator (+)
#                              String '); Center('
#                              Addition operator (+)
#                              Property 'x'
#                                  Lexical variable '$c'
#                              Addition operator (+)
#                              String ', '
#                              Addition operator (+)
#                              Property 'y'
#                                  Lexical variable '$c'
#                              Addition operator (+)
#                              String '); Width = '
#                              Addition operator (+)
#                              Instance variable '@width'
#                              Addition operator (+)
#                              String '; Height = '
#                              Addition operator (+)
#                              Instance variable '@height'
#                              Addition operator (+)
#                              String ' )'
#      Include (Line, Num, Point)
use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die "config error";
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = FF::get_ferret();

FF::before_content('Rect.frt');

use Ferret::Core::Operations qw(add mul num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'Math' );
    FF::load_core('Math');

    # Class 'Rect'
    {
        my ( $class, $self, $proto ) =
          FF::get_class( $f, $context, 'Rect', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
            [
                {
                    name     => 'x',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'y',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'width',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'height',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $scope, $arguments, 'x' )      or return;
                FF::need( $scope, $arguments, 'y' )      or return;
                FF::need( $self,  $arguments, 'width' )  or return;
                FF::need( $self,  $arguments, 'height' ) or return;
                $self->set_property(
                    origin => $scope->property_u('Point')->call_u(
                        [ $scope->property_u('x'), $scope->property_u('y') ],
                        $scope, undef, 6.14723926380368
                    ),
                    6.13496932515337
                );
                return $return;
            }
        );

        # Method event 'vertices' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'vertices',
            [],
            sub {
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
            }
        );

        # Method event 'bottomLeft' definition
        my $method_2 = FF::method_event_def(
            $f, $scope,
            'bottomLeft',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return $self->property_u('origin');
                return $return;
            }
        );

        # Method event 'bottomRight' definition
        my $method_3 = FF::method_event_def(
            $f, $scope,
            'bottomRight',
            [],
            sub {
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
                    $scope, undef,
                    23.3374233128834
                );
                return $return;
            }
        );

        # Method event 'topLeft' definition
        my $method_4 = FF::method_event_def(
            $f, $scope,
            'topLeft',
            [],
            sub {
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
                    $scope, undef,
                    27.4294478527607
                );
                return $return;
            }
        );

        # Method event 'topRight' definition
        my $method_5 = FF::method_event_def(
            $f, $scope,
            'topRight',
            [],
            sub {
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
                    $scope, undef,
                    31.521472392638
                );
                return $return;
            }
        );

        # Method event 'bottomLine' definition
        my $method_6 = FF::method_event_def(
            $f, $scope,
            'bottomLine',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return $scope->property_u('Line')->call_u(
                    [
                        $self->property_u('bottomLeft'),
                        $self->property_u('bottomRight')
                    ],
                    $scope, undef,
                    35.6257668711656
                );
                return $return;
            }
        );

        # Method event 'topLine' definition
        my $method_7 = FF::method_event_def(
            $f, $scope,
            'topLine',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return $scope->property_u('Line')->call_u(
                    [
                        $self->property_u('topLeft'),
                        $self->property_u('topRight')
                    ],
                    $scope, undef,
                    39.6932515337423
                );
                return $return;
            }
        );

        # Method event 'center' definition
        my $method_8 = FF::method_event_def(
            $f, $scope, 'center',
            [],
            sub {
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
                    ),
                    43.7546012269939
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
                    ),
                    44.8098159509202
                );
                return $scope->property_u('Point')
                  ->call_u(
                    [ $scope->property_u('x'), $scope->property_u('y') ],
                    $scope, undef, 45.8711656441718 );
                return $return;
            }
        );

        # Method event 'description' definition
        my $method_9 = FF::method_event_def(
            $f, $scope,
            'description',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property_ow(
                    $context,
                    o => $self->property_u('origin'),
                    49.9325153374233
                );
                $scope->set_property_ow(
                    $context,
                    c => $self->property_u('center'),
                    50.9570552147239
                );
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
            }
        );
        $method_0->inside_scope(
            _init_ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope( vertices => $scope, $proto, $class, 1, undef );
        $method_2->inside_scope(
            bottomLeft => $scope,
            $proto, $class, 1, undef
        );
        $method_3->inside_scope(
            bottomRight => $scope,
            $proto, $class, 1, undef
        );
        $method_4->inside_scope( topLeft  => $scope, $proto, $class, 1, undef );
        $method_5->inside_scope( topRight => $scope, $proto, $class, 1, undef );
        $method_6->inside_scope(
            bottomLine => $scope,
            $proto, $class, 1, undef
        );
        $method_7->inside_scope( topLine => $scope, $proto, $class, 1, undef );
        $method_8->inside_scope( center  => $scope, $proto, $class, 1, undef );
        $method_9->inside_scope(
            description => $scope,
            $proto, $class, undef, undef
        );
    }
    FF::load_namespaces( $context,
        qw(Math::Line Math::Num Math::Point Line Num Point) );
};

FF::after_content();
