# === Tokenization ===
#         PKG_DEC |                {"name":"Math"} | 1.1
#       CLASS_DEC |                {"name":"Rect"} | 2.1
#          METHOD |     {"name":"_init_","main":1} | 4.1
#       CLOSURE_S |                                | 4.2
#    KEYWORD_NEED |                                | 5.05
#         VAR_LEX |                            "x" | 5.1
#        OP_VALUE |                                | 5.15
#        BAREWORD |                          "Num" | 5.2
#        OP_COMMA |                                | 5.25
#         VAR_LEX |                            "y" | 5.3
#        OP_VALUE |                                | 5.35
#        BAREWORD |                          "Num" | 5.4
#        OP_COMMA |                                | 5.45
#        VAR_THIS |                        "width" | 5.5
#        OP_VALUE |                                | 5.55
#        BAREWORD |                          "Num" | 5.6
#        OP_COMMA |                                | 5.65
#        VAR_THIS |                       "height" | 5.7
#        OP_VALUE |                                | 5.75
#        BAREWORD |                          "Num" | 5.8
#         OP_SEMI |                              1 | 5.85
#        VAR_THIS |                       "origin" | 6.05
#       OP_ASSIGN |                                | 6.1
#        BAREWORD |                        "Point" | 6.15
#      PAREN_CALL |                                | 6.2
#         VAR_LEX |                            "x" | 6.25
#        OP_COMMA |                                | 6.3
#         VAR_LEX |                            "y" | 6.35
#         PAREN_E |                                | 6.4
#         OP_SEMI |                              1 | 6.45
#       CLOSURE_E |                                | 7.1
#          METHOD | {"p_set":null,"is_prop":1,"name":"vertices"} | 9.1
#       CLOSURE_S |                                | 9.2
#  KEYWORD_RETURN |                                | 10.1
#       BRACKET_S |                                | 10.2
#        VAR_THIS |                      "topLeft" | 11.1
#        OP_COMMA |                                | 11.2
#        VAR_THIS |                     "topRight" | 12.1
#        OP_COMMA |                                | 12.2
#        VAR_THIS |                   "bottomLeft" | 13.1
#        OP_COMMA |                                | 13.2
#        VAR_THIS |                  "bottomRight" | 14.1
#         OP_SEMI |                              1 | 14.2
#       BRACKET_E |                                | 15.1
#         OP_SEMI |                              1 | 15.2
#       CLOSURE_E |                                | 16.1
#          METHOD | {"is_prop":1,"name":"bottomLeft","p_set":null} | 18.1
#       CLOSURE_S |                                | 18.2
#  KEYWORD_RETURN |                                | 19.1
#        VAR_THIS |                       "origin" | 19.2
#         OP_SEMI |                              1 | 19.3
#       CLOSURE_E |                                | 20.1
#          METHOD | {"is_prop":1,"name":"bottomRight","p_set":null} | 22.1
#       CLOSURE_S |                                | 22.2
#  KEYWORD_RETURN |                                | 23.05
#        BAREWORD |                        "Point" | 23.1
#      PAREN_CALL |                                | 23.15
#        VAR_THIS |                       "origin" | 23.2
#        PROPERTY |                            "x" | 23.25
#          OP_ADD |                                | 23.3
#        VAR_THIS |                        "width" | 23.35
#        OP_COMMA |                                | 23.4
#        VAR_THIS |                       "origin" | 23.45
#        PROPERTY |                            "y" | 23.5
#         PAREN_E |                                | 23.55
#         OP_SEMI |                              1 | 23.6
#       CLOSURE_E |                                | 24.1
#          METHOD | {"is_prop":1,"name":"topLeft","p_set":null} | 26.1
#       CLOSURE_S |                                | 26.2
#  KEYWORD_RETURN |                                | 27.05
#        BAREWORD |                        "Point" | 27.1
#      PAREN_CALL |                                | 27.15
#        VAR_THIS |                       "origin" | 27.2
#        PROPERTY |                            "x" | 27.25
#        OP_COMMA |                                | 27.3
#        VAR_THIS |                       "origin" | 27.35
#        PROPERTY |                            "y" | 27.4
#          OP_ADD |                                | 27.45
#        VAR_THIS |                       "height" | 27.5
#         PAREN_E |                                | 27.55
#         OP_SEMI |                              1 | 27.6
#       CLOSURE_E |                                | 28.1
#          METHOD | {"p_set":null,"is_prop":1,"name":"topRight"} | 30.1
#       CLOSURE_S |                                | 30.2
#  KEYWORD_RETURN |                                | 31.05
#        BAREWORD |                        "Point" | 31.1
#      PAREN_CALL |                                | 31.15
#        VAR_THIS |                       "origin" | 31.2
#        PROPERTY |                            "x" | 31.25
#          OP_ADD |                                | 31.3
#        VAR_THIS |                        "width" | 31.35
#        OP_COMMA |                                | 31.4
#        VAR_THIS |                       "origin" | 31.45
#        PROPERTY |                            "y" | 31.5
#          OP_ADD |                                | 31.55
#        VAR_THIS |                       "height" | 31.6
#         PAREN_E |                                | 31.65
#         OP_SEMI |                              1 | 31.7
#       CLOSURE_E |                                | 32.1
#          METHOD | {"is_prop":1,"name":"bottomLine","p_set":null} | 34.1
#       CLOSURE_S |                                | 34.2
#  KEYWORD_RETURN |                                | 35.1
#        BAREWORD |                         "Line" | 35.2
#      PAREN_CALL |                                | 35.3
#        VAR_THIS |                   "bottomLeft" | 35.4
#        OP_COMMA |                                | 35.5
#        VAR_THIS |                  "bottomRight" | 35.6
#         PAREN_E |                                | 35.7
#         OP_SEMI |                              1 | 35.8
#       CLOSURE_E |                                | 36.1
#          METHOD | {"is_prop":1,"name":"topLine","p_set":null} | 38.1
#       CLOSURE_S |                                | 38.2
#  KEYWORD_RETURN |                                | 39.1
#        BAREWORD |                         "Line" | 39.2
#      PAREN_CALL |                                | 39.3
#        VAR_THIS |                      "topLeft" | 39.4
#        OP_COMMA |                                | 39.5
#        VAR_THIS |                     "topRight" | 39.6
#         PAREN_E |                                | 39.7
#         OP_SEMI |                              1 | 39.8
#       CLOSURE_E |                                | 40.1
#          METHOD | {"is_prop":1,"name":"center","p_set":null} | 42.1
#       CLOSURE_S |                                | 42.2
#         VAR_LEX |                            "x" | 43.05
#       OP_ASSIGN |                                | 43.1
#        VAR_THIS |                       "origin" | 43.15
#        PROPERTY |                            "x" | 43.2
#          OP_ADD |                                | 43.25
#        VAR_THIS |                        "width" | 43.3
#          OP_MUL |                                | 43.35
#          NUMBER |                          "0.5" | 43.4
#         OP_SEMI |                              1 | 43.45
#         VAR_LEX |                            "y" | 44.05
#       OP_ASSIGN |                                | 44.1
#        VAR_THIS |                       "origin" | 44.15
#        PROPERTY |                            "y" | 44.2
#          OP_ADD |                                | 44.25
#        VAR_THIS |                       "height" | 44.3
#          OP_MUL |                                | 44.35
#          NUMBER |                          "0.5" | 44.4
#         OP_SEMI |                              1 | 44.45
#  KEYWORD_RETURN |                                | 45.1
#        BAREWORD |                        "Point" | 45.2
#      PAREN_CALL |                                | 45.3
#         VAR_LEX |                            "x" | 45.4
#        OP_COMMA |                                | 45.5
#         VAR_LEX |                            "y" | 45.6
#         PAREN_E |                                | 45.7
#         OP_SEMI |                              1 | 45.8
#       CLOSURE_E |                                | 46.1
#          METHOD |         {"name":"description"} | 48.1
#       CLOSURE_S |                                | 48.2
#         VAR_LEX |                            "o" | 49.1
#       OP_ASSIGN |                                | 49.2
#        VAR_THIS |                       "origin" | 49.3
#         OP_SEMI |                              1 | 49.4
#         VAR_LEX |                            "c" | 50.1
#       OP_ASSIGN |                                | 50.2
#        VAR_THIS |                       "center" | 50.3
#         OP_SEMI |                              1 | 50.4
#  KEYWORD_RETURN |                                | 51.1
#          STRING | ["Rect( Origin(",["VAR_LEX","o",51],["PROPERTY","x",51],", ",["VAR_LEX","o",51],["PROPERTY","y",51],") Center(",["VAR_LEX","c",51],["PROPERTY","x",51],", ",["VAR_LEX","c",51],["PROPERTY","y",51],") Width = ",["VAR_THIS","width",51]," Height = ",["VAR_THIS","height",51]," )"] | 51.2
#         OP_SEMI |                              1 | 51.3
#       CLOSURE_E |                                | 52.1
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
#                              String ') Center('
#                              Addition operator (+)
#                              Property 'x'
#                                  Lexical variable '$c'
#                              Addition operator (+)
#                              String ', '
#                              Addition operator (+)
#                              Property 'y'
#                                  Lexical variable '$c'
#                              Addition operator (+)
#                              String ') Width = '
#                              Addition operator (+)
#                              Instance variable '@width'
#                              Addition operator (+)
#                              String ' Height = '
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
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('Rect.frt');

use Ferret::Core::Operations qw(add mul num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'Math' );
    FF::load_core('Math');

    # Class 'Rect'
    {
        my ( $class, $self, $proto, $scope ) =
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
                FF::need( $scope, $arguments, 'x', 5.1 ) or return;
                FF::need( $scope, $arguments, 'y', 5.3 ) or return;
                FF::need( $self, $arguments, 'width' )  or return;
                FF::need( $self, $arguments, 'height' ) or return;
                $self->set_property(
                    origin => $scope->property_u('Point')->call_u(
                        [ $scope->property_u('x'), $scope->property_u('y') ],
                        $scope, undef, 6.2
                    ),
                    6.1
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
                    $scope, undef, 23.15
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
                    $scope, undef, 27.15
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
                    $scope, undef, 31.15
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
                    $scope, undef, 35.3
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
                    $scope, undef, 39.3
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
                    43.1
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
                    44.1
                );
                return $scope->property_u('Point')
                  ->call_u(
                    [ $scope->property_u('x'), $scope->property_u('y') ],
                    $scope, undef, 45.3 );
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
                    49.2
                );
                $scope->set_property_ow(
                    $context,
                    c => $self->property_u('center'),
                    50.2
                );
                return add(
                    $scope,
                    str( $f, "Rect( Origin(" ),
                    $scope->property_u('o')->property_u('x'),
                    str( $f, ", " ),
                    $scope->property_u('o')->property_u('y'),
                    str( $f, ") Center(" ),
                    $scope->property_u('c')->property_u('x'),
                    str( $f, ", " ),
                    $scope->property_u('c')->property_u('y'),
                    str( $f, ") Width = " ),
                    $self->property_u('width'),
                    str( $f, " Height = " ),
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
    FF::load_namespaces( $context, qw(Line Num Point) );
};

FF::after_content();
