# === Tokenization ===
#         PKG_DEC | {"name":"Math"}
#       CLASS_DEC | {"name":"Rect"}
#          METHOD | {"main":1,"name":"_init_"}
#       CLOSURE_S | 
#    KEYWORD_NEED | 
#         VAR_LEX | "x"
#        OP_VALUE | 
#        BAREWORD | "Num"
#        OP_COMMA | 
#         VAR_LEX | "y"
#        OP_VALUE | 
#        BAREWORD | "Num"
#        OP_COMMA | 
#        VAR_THIS | "width"
#        OP_VALUE | 
#        BAREWORD | "Num"
#        OP_COMMA | 
#        VAR_THIS | "height"
#        OP_VALUE | 
#        BAREWORD | "Num"
#         OP_SEMI | 
#        VAR_THIS | "origin"
#       OP_ASSIGN | 
#        BAREWORD | "Point"
#      PAREN_CALL | 
#         VAR_LEX | "x"
#        OP_COMMA | 
#         VAR_LEX | "y"
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"p_set":null,"name":"vertices","is_prop":1}
#       CLOSURE_S | 
#  KEYWORD_RETURN | 
#       BRACKET_S | 
#        VAR_THIS | "topLeft"
#        OP_COMMA | 
#        VAR_THIS | "topRight"
#        OP_COMMA | 
#        VAR_THIS | "bottomLeft"
#        OP_COMMA | 
#        VAR_THIS | "bottomRight"
#       BRACKET_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"is_prop":1,"name":"bottomLeft","p_set":null}
#       CLOSURE_S | 
#  KEYWORD_RETURN | 
#        VAR_THIS | "origin"
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"is_prop":1,"p_set":null,"name":"bottomRight"}
#       CLOSURE_S | 
#  KEYWORD_RETURN | 
#        BAREWORD | "Point"
#      PAREN_CALL | 
#        VAR_THIS | "origin"
#        PROPERTY | "x"
#          OP_ADD | 
#        VAR_THIS | "width"
#        OP_COMMA | 
#        VAR_THIS | "origin"
#        PROPERTY | "y"
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"is_prop":1,"p_set":null,"name":"topLeft"}
#       CLOSURE_S | 
#  KEYWORD_RETURN | 
#        BAREWORD | "Point"
#      PAREN_CALL | 
#        VAR_THIS | "origin"
#        PROPERTY | "x"
#        OP_COMMA | 
#        VAR_THIS | "origin"
#        PROPERTY | "y"
#          OP_ADD | 
#        VAR_THIS | "height"
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"topRight","p_set":null,"is_prop":1}
#       CLOSURE_S | 
#  KEYWORD_RETURN | 
#        BAREWORD | "Point"
#      PAREN_CALL | 
#        VAR_THIS | "origin"
#        PROPERTY | "x"
#          OP_ADD | 
#        VAR_THIS | "width"
#        OP_COMMA | 
#        VAR_THIS | "origin"
#        PROPERTY | "y"
#          OP_ADD | 
#        VAR_THIS | "height"
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"is_prop":1,"name":"bottomLine","p_set":null}
#       CLOSURE_S | 
#  KEYWORD_RETURN | 
#        BAREWORD | "Line"
#      PAREN_CALL | 
#        VAR_THIS | "bottomLeft"
#        OP_COMMA | 
#        VAR_THIS | "bottomRight"
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"topLine","p_set":null,"is_prop":1}
#       CLOSURE_S | 
#  KEYWORD_RETURN | 
#        BAREWORD | "Line"
#      PAREN_CALL | 
#        VAR_THIS | "topLeft"
#        OP_COMMA | 
#        VAR_THIS | "topRight"
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"is_prop":1,"p_set":null,"name":"center"}
#       CLOSURE_S | 
#         VAR_LEX | "x"
#       OP_ASSIGN | 
#        VAR_THIS | "origin"
#        PROPERTY | "x"
#          OP_ADD | 
#        VAR_THIS | "width"
#          OP_MUL | 
#          NUMBER | "0.5"
#         OP_SEMI | 
#         VAR_LEX | "y"
#       OP_ASSIGN | 
#        VAR_THIS | "origin"
#        PROPERTY | "y"
#          OP_ADD | 
#        VAR_THIS | "height"
#          OP_MUL | 
#          NUMBER | "0.5"
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#        BAREWORD | "Point"
#      PAREN_CALL | 
#         VAR_LEX | "x"
#        OP_COMMA | 
#         VAR_LEX | "y"
#         PAREN_E | 
#         OP_SEMI | 
#       CLOSURE_E | 
#          METHOD | {"name":"description"}
#       CLOSURE_S | 
#         VAR_LEX | "o"
#       OP_ASSIGN | 
#        VAR_THIS | "origin"
#         OP_SEMI | 
#         VAR_LEX | "c"
#       OP_ASSIGN | 
#        VAR_THIS | "center"
#         OP_SEMI | 
#  KEYWORD_RETURN | 
#          STRING | ["Rect( Origin(",["VAR_LEX","o",52],["PROPERTY","x",52],", ",["VAR_LEX","o",52],["PROPERTY","y",52],"); Center(",["VAR_LEX","c",52],["PROPERTY","x",52],", ",["VAR_LEX","c",52],["PROPERTY","y",52],"); Width = ",["VAR_THIS","width",52],"; Height = ",["VAR_THIS","height",52]," )"]
#         OP_SEMI | 
#       CLOSURE_E | 
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
                FF::need( $scope, $arguments, 'x', 5.11765 ) or return;
                FF::need( $scope, $arguments, 'y', 5.35294 ) or return;
                FF::need( $self, $arguments, 'width' )  or return;
                FF::need( $self, $arguments, 'height' ) or return;
                $self->set_property(
                    origin => $scope->property_u('Point')->call_u(
                        [ $scope->property_u('x'), $scope->property_u('y') ],
                        $scope, undef, 6.44444
                    ),
                    6.22222
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
                    $scope, undef, 23.25
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
                    $scope, undef, 27.25
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
                    $scope, undef, 31.21429
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
                    $scope, undef, 35.375
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
                    $scope, undef, 39.375
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
                    43.22222
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
                    44.22222
                );
                return $scope->property_u('Point')
                  ->call_u(
                    [ $scope->property_u('x'), $scope->property_u('y') ],
                    $scope, undef, 45.375 );
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
                    49.5
                );
                $scope->set_property_ow(
                    $context,
                    c => $self->property_u('center'),
                    50.5
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
    FF::load_namespaces( $context, qw(Line Num Point) );
};

FF::after_content();
