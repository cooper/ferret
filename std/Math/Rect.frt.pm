# === Tokenization ===
#         PKG_DEC |                {"name":"Math"} | 1.5
#       CLASS_DEC |                {"name":"Rect"} | 2.5
#          METHOD |     {"main":1,"name":"_init_"} | 4.33333
#       CLOSURE_S |                                | 4.66667
#    KEYWORD_NEED |                                | 5.05556
#         VAR_LEX |                            "x" | 5.11111
#        OP_VALUE |                                | 5.16667
#        BAREWORD |                          "Num" | 5.22222
#        OP_COMMA |                                | 5.27778
#         VAR_LEX |                            "y" | 5.33333
#        OP_VALUE |                                | 5.38889
#        BAREWORD |                          "Num" | 5.44444
#        OP_COMMA |                                | 5.5
#        VAR_THIS |                        "width" | 5.55556
#        OP_VALUE |                                | 5.61111
#        BAREWORD |                          "Num" | 5.66667
#        OP_COMMA |                                | 5.72222
#        VAR_THIS |                       "height" | 5.77778
#        OP_VALUE |                                | 5.83333
#        BAREWORD |                          "Num" | 5.88889
#         OP_SEMI |                              1 | 5.94444
#        VAR_THIS |                       "origin" | 6.1
#       OP_ASSIGN |                                | 6.2
#        BAREWORD |                        "Point" | 6.3
#      PAREN_CALL |                                | 6.4
#         VAR_LEX |                            "x" | 6.5
#        OP_COMMA |                                | 6.6
#         VAR_LEX |                            "y" | 6.7
#         PAREN_E |                                | 6.8
#         OP_SEMI |                              1 | 6.9
#       CLOSURE_E |                                | 7.5
#          METHOD | {"p_set":null,"is_prop":1,"name":"vertices"} | 9.33333
#       CLOSURE_S |                                | 9.66667
#  KEYWORD_RETURN |                                | 10.33333
#       BRACKET_S |                                | 10.66667
#        VAR_THIS |                      "topLeft" | 11.33333
#        OP_COMMA |                                | 11.66667
#        VAR_THIS |                     "topRight" | 12.33333
#        OP_COMMA |                                | 12.66667
#        VAR_THIS |                   "bottomLeft" | 13.33333
#        OP_COMMA |                                | 13.66667
#        VAR_THIS |                  "bottomRight" | 14.33333
#         OP_SEMI |                              1 | 14.66667
#       BRACKET_E |                                | 15.33333
#         OP_SEMI |                              1 | 15.66667
#       CLOSURE_E |                                | 16.5
#          METHOD | {"p_set":null,"is_prop":1,"name":"bottomLeft"} | 18.33333
#       CLOSURE_S |                                | 18.66667
#  KEYWORD_RETURN |                                | 19.25
#        VAR_THIS |                       "origin" | 19.5
#         OP_SEMI |                              1 | 19.75
#       CLOSURE_E |                                | 20.5
#          METHOD | {"is_prop":1,"name":"bottomRight","p_set":null} | 22.33333
#       CLOSURE_S |                                | 22.66667
#  KEYWORD_RETURN |                                | 23.07692
#        BAREWORD |                        "Point" | 23.15385
#      PAREN_CALL |                                | 23.23077
#        VAR_THIS |                       "origin" | 23.30769
#        PROPERTY |                            "x" | 23.38462
#          OP_ADD |                                | 23.46154
#        VAR_THIS |                        "width" | 23.53846
#        OP_COMMA |                                | 23.61538
#        VAR_THIS |                       "origin" | 23.69231
#        PROPERTY |                            "y" | 23.76923
#         PAREN_E |                                | 23.84615
#         OP_SEMI |                              1 | 23.92308
#       CLOSURE_E |                                | 24.5
#          METHOD | {"p_set":null,"is_prop":1,"name":"topLeft"} | 26.33333
#       CLOSURE_S |                                | 26.66667
#  KEYWORD_RETURN |                                | 27.07692
#        BAREWORD |                        "Point" | 27.15385
#      PAREN_CALL |                                | 27.23077
#        VAR_THIS |                       "origin" | 27.30769
#        PROPERTY |                            "x" | 27.38462
#        OP_COMMA |                                | 27.46154
#        VAR_THIS |                       "origin" | 27.53846
#        PROPERTY |                            "y" | 27.61538
#          OP_ADD |                                | 27.69231
#        VAR_THIS |                       "height" | 27.76923
#         PAREN_E |                                | 27.84615
#         OP_SEMI |                              1 | 27.92308
#       CLOSURE_E |                                | 28.5
#          METHOD | {"name":"topRight","is_prop":1,"p_set":null} | 30.33333
#       CLOSURE_S |                                | 30.66667
#  KEYWORD_RETURN |                                | 31.06667
#        BAREWORD |                        "Point" | 31.13333
#      PAREN_CALL |                                | 31.2
#        VAR_THIS |                       "origin" | 31.26667
#        PROPERTY |                            "x" | 31.33333
#          OP_ADD |                                | 31.4
#        VAR_THIS |                        "width" | 31.46667
#        OP_COMMA |                                | 31.53333
#        VAR_THIS |                       "origin" | 31.6
#        PROPERTY |                            "y" | 31.66667
#          OP_ADD |                                | 31.73333
#        VAR_THIS |                       "height" | 31.8
#         PAREN_E |                                | 31.86667
#         OP_SEMI |                              1 | 31.93333
#       CLOSURE_E |                                | 32.5
#          METHOD | {"is_prop":1,"name":"bottomLine","p_set":null} | 34.33333
#       CLOSURE_S |                                | 34.66667
#  KEYWORD_RETURN |                                | 35.11111
#        BAREWORD |                         "Line" | 35.22222
#      PAREN_CALL |                                | 35.33333
#        VAR_THIS |                   "bottomLeft" | 35.44444
#        OP_COMMA |                                | 35.55556
#        VAR_THIS |                  "bottomRight" | 35.66667
#         PAREN_E |                                | 35.77778
#         OP_SEMI |                              1 | 35.88889
#       CLOSURE_E |                                | 36.5
#          METHOD | {"name":"topLine","is_prop":1,"p_set":null} | 38.33333
#       CLOSURE_S |                                | 38.66667
#  KEYWORD_RETURN |                                | 39.11111
#        BAREWORD |                         "Line" | 39.22222
#      PAREN_CALL |                                | 39.33333
#        VAR_THIS |                      "topLeft" | 39.44444
#        OP_COMMA |                                | 39.55556
#        VAR_THIS |                     "topRight" | 39.66667
#         PAREN_E |                                | 39.77778
#         OP_SEMI |                              1 | 39.88889
#       CLOSURE_E |                                | 40.5
#          METHOD | {"name":"center","is_prop":1,"p_set":null} | 42.33333
#       CLOSURE_S |                                | 42.66667
#         VAR_LEX |                            "x" | 43.1
#       OP_ASSIGN |                                | 43.2
#        VAR_THIS |                       "origin" | 43.3
#        PROPERTY |                            "x" | 43.4
#          OP_ADD |                                | 43.5
#        VAR_THIS |                        "width" | 43.6
#          OP_MUL |                                | 43.7
#          NUMBER |                          "0.5" | 43.8
#         OP_SEMI |                              1 | 43.9
#         VAR_LEX |                            "y" | 44.1
#       OP_ASSIGN |                                | 44.2
#        VAR_THIS |                       "origin" | 44.3
#        PROPERTY |                            "y" | 44.4
#          OP_ADD |                                | 44.5
#        VAR_THIS |                       "height" | 44.6
#          OP_MUL |                                | 44.7
#          NUMBER |                          "0.5" | 44.8
#         OP_SEMI |                              1 | 44.9
#  KEYWORD_RETURN |                                | 45.11111
#        BAREWORD |                        "Point" | 45.22222
#      PAREN_CALL |                                | 45.33333
#         VAR_LEX |                            "x" | 45.44444
#        OP_COMMA |                                | 45.55556
#         VAR_LEX |                            "y" | 45.66667
#         PAREN_E |                                | 45.77778
#         OP_SEMI |                              1 | 45.88889
#       CLOSURE_E |                                | 46.5
#          METHOD |         {"name":"description"} | 48.33333
#       CLOSURE_S |                                | 48.66667
#         VAR_LEX |                            "o" | 49.2
#       OP_ASSIGN |                                | 49.4
#        VAR_THIS |                       "origin" | 49.6
#         OP_SEMI |                              1 | 49.8
#         VAR_LEX |                            "c" | 50.2
#       OP_ASSIGN |                                | 50.4
#        VAR_THIS |                       "center" | 50.6
#         OP_SEMI |                              1 | 50.8
#  KEYWORD_RETURN |                                | 51.25
#          STRING | ["Rect( Origin(",["VAR_LEX","o",51],["PROPERTY","x",51],", ",["VAR_LEX","o",51],["PROPERTY","y",51],") Center(",["VAR_LEX","c",51],["PROPERTY","x",51],", ",["VAR_LEX","c",51],["PROPERTY","y",51],") Width = ",["VAR_THIS","width",51]," Height = ",["VAR_THIS","height",51]," )"] | 51.5
#         OP_SEMI |                              1 | 51.75
#       CLOSURE_E |                                | 52.5
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
                FF::need( $scope, $arguments, 'x', 5.11111 ) or return;
                FF::need( $scope, $arguments, 'y', 5.33333 ) or return;
                FF::need( $self, $arguments, 'width' )  or return;
                FF::need( $self, $arguments, 'height' ) or return;
                $self->set_property(
                    origin => $scope->property_u('Point')->call_u(
                        [ $scope->property_u('x'), $scope->property_u('y') ],
                        $scope, undef, 6.4
                    ),
                    6.2
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
                    $scope, undef, 23.23077
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
                    $scope, undef, 27.23077
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
                    $scope, undef, 31.2
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
                    $scope, undef, 35.33333
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
                    $scope, undef, 39.33333
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
                    43.2
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
                    44.2
                );
                return $scope->property_u('Point')
                  ->call_u(
                    [ $scope->property_u('x'), $scope->property_u('y') ],
                    $scope, undef, 45.33333 );
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
                    49.4
                );
                $scope->set_property_ow(
                    $context,
                    c => $self->property_u('center'),
                    50.4
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
