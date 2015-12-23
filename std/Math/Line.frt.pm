# === Tokenization ===
#         PKG_DEC |                {"name":"Math"} | 1.1
#       CLASS_DEC |                {"name":"Line"} | 2.1
#          METHOD |     {"main":1,"name":"_init_"} | 4.1
#       CLOSURE_S |                                | 4.2
#    KEYWORD_NEED |                                | 5.05
#        VAR_THIS |                          "pt1" | 5.1
#        OP_VALUE |                                | 5.15
#        BAREWORD |                        "Point" | 5.2
#        OP_COMMA |                                | 5.25
#        VAR_THIS |                          "pt2" | 5.3
#        OP_VALUE |                                | 5.35
#        BAREWORD |                        "Point" | 5.4
#         OP_SEMI |                              1 | 5.45
#       CLOSURE_E |                                | 6.1
#          METHOD | {"name":"endpoints","is_prop":1,"p_set":null} | 8.1
#       CLOSURE_S |                                | 8.2
#  KEYWORD_RETURN |                                | 9.1
#       BRACKET_S |                                | 9.2
#        VAR_THIS |                          "pt1" | 9.3
#        OP_COMMA |                                | 9.4
#        VAR_THIS |                          "pt2" | 9.5
#       BRACKET_E |                                | 9.6
#         OP_SEMI |                              1 | 9.7
#       CLOSURE_E |                                | 10.1
#          METHOD | {"p_set":null,"name":"pretty","is_prop":1} | 12.1
#       CLOSURE_S |                                | 12.2
#         VAR_LEX |                           "mp" | 13.1
#       OP_ASSIGN |                                | 13.2
#        VAR_THIS |                     "midpoint" | 13.3
#         OP_SEMI |                              1 | 13.4
#         VAR_LEX |                          "pox" | 14.05
#       OP_ASSIGN |                                | 14.1
#        VAR_THIS |                          "pt1" | 14.15
#        PROPERTY |                            "x" | 14.2
#         OP_SEMI |                                | 14.25
#         VAR_LEX |                          "poy" | 14.3
#       OP_ASSIGN |                                | 14.35
#        VAR_THIS |                          "pt1" | 14.4
#        PROPERTY |                            "y" | 14.45
#         OP_SEMI |                              1 | 14.5
#         VAR_LEX |                          "ptx" | 15.05
#       OP_ASSIGN |                                | 15.1
#        VAR_THIS |                          "pt2" | 15.15
#        PROPERTY |                            "x" | 15.2
#         OP_SEMI |                                | 15.25
#         VAR_LEX |                          "pty" | 15.3
#       OP_ASSIGN |                                | 15.35
#        VAR_THIS |                          "pt2" | 15.4
#        PROPERTY |                            "y" | 15.45
#         OP_SEMI |                              1 | 15.5
#         VAR_LEX |                           "mx" | 16.05
#       OP_ASSIGN |                                | 16.1
#         VAR_LEX |                           "mp" | 16.15
#        PROPERTY |                            "x" | 16.2
#         OP_SEMI |                                | 16.25
#         VAR_LEX |                           "my" | 16.3
#       OP_ASSIGN |                                | 16.35
#         VAR_LEX |                           "mp" | 16.4
#        PROPERTY |                            "y" | 16.45
#         OP_SEMI |                              1 | 16.5
#  KEYWORD_RETURN |                                | 17.1
#          STRING | ["Segment( |(",["VAR_LEX","pox",17],", ",["VAR_LEX","poy",17],")---(",["VAR_LEX","mx",17],", ",["VAR_LEX","my",17],")---(",["VAR_LEX","ptx",17],", ",["VAR_LEX","pty",17],")| Length = ",["VAR_THIS","length",17]," )"] | 17.2
#         OP_SEMI |                              1 | 17.3
#       CLOSURE_E |                                | 18.1
#          METHOD |         {"name":"description"} | 20.1
#       CLOSURE_S |                                | 20.2
#  KEYWORD_RETURN |                                | 21.1
#        VAR_THIS |                       "pretty" | 21.2
#         OP_SEMI |                              1 | 21.3
#       CLOSURE_E |                                | 22.1
#          METHOD | {"p_set":null,"is_prop":1,"name":"midpoint"} | 24.1
#       CLOSURE_S |                                | 24.2
#  KEYWORD_RETURN |                                | 25.05
#         PAREN_S |                                | 25.1
#        VAR_THIS |                          "pt1" | 25.15
#        OP_COMMA |                                | 25.2
#        VAR_THIS |                          "pt2" | 25.25
#         PAREN_E |                                | 25.3
#        PROPERTY |                     "midpoint" | 25.35
#      PAREN_CALL |                                | 25.4
#         PAREN_E |                                | 25.45
#         OP_SEMI |                              1 | 25.5
#       CLOSURE_E |                                | 26.1
#          METHOD | {"name":"length","is_prop":1,"p_set":null} | 28.1
#       CLOSURE_S |                                | 28.2
#  KEYWORD_RETURN |                                | 29.1
#        VAR_THIS |                          "pt1" | 29.2
#        PROPERTY |                   "distanceTo" | 29.3
#      PAREN_CALL |                                | 29.4
#        VAR_THIS |                          "pt2" | 29.5
#         PAREN_E |                                | 29.6
#         OP_SEMI |                              1 | 29.7
#       CLOSURE_E |                                | 30.1
# === Document Model ===
#  Document './std/Math/Line.frt'
#      Package 'Math'
#      Class 'Line'
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Instance variable '@pt1'
#                          Bareword 'Point'
#                  Instruction
#                      Need
#                          Instance variable '@pt2'
#                          Bareword 'Point'
#          Computed property 'endpoints'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Value list [2 items]
#                              Item 0
#                                  Instance variable '@pt1'
#                              Item 1
#                                  Instance variable '@pt2'
#          Computed property 'pretty'
#              Body ('method' scope)
#                  Instruction
#                      Assignment (lexical variable '$mp')
#                          Instance variable '@midpoint'
#                  Instruction
#                      Assignment (lexical variable '$pox')
#                          Property 'x'
#                              Instance variable '@pt1'
#                  Instruction
#                      Assignment (lexical variable '$poy')
#                          Property 'y'
#                              Instance variable '@pt1'
#                  Instruction
#                      Assignment (lexical variable '$ptx')
#                          Property 'x'
#                              Instance variable '@pt2'
#                  Instruction
#                      Assignment (lexical variable '$pty')
#                          Property 'y'
#                              Instance variable '@pt2'
#                  Instruction
#                      Assignment (lexical variable '$mx')
#                          Property 'x'
#                              Lexical variable '$mp'
#                  Instruction
#                      Assignment (lexical variable '$my')
#                          Property 'y'
#                              Lexical variable '$mp'
#                  Instruction
#                      Return
#                          Operation
#                              String 'Segment( |('
#                              Addition operator (+)
#                              Lexical variable '$pox'
#                              Addition operator (+)
#                              String ', '
#                              Addition operator (+)
#                              Lexical variable '$poy'
#                              Addition operator (+)
#                              String ')---('
#                              Addition operator (+)
#                              Lexical variable '$mx'
#                              Addition operator (+)
#                              String ', '
#                              Addition operator (+)
#                              Lexical variable '$my'
#                              Addition operator (+)
#                              String ')---('
#                              Addition operator (+)
#                              Lexical variable '$ptx'
#                              Addition operator (+)
#                              String ', '
#                              Addition operator (+)
#                              Lexical variable '$pty'
#                              Addition operator (+)
#                              String ')| Length = '
#                              Addition operator (+)
#                              Instance variable '@length'
#                              Addition operator (+)
#                              String ' )'
#          Method 'description'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Instance variable '@pretty'
#          Computed property 'midpoint'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Property 'midpoint'
#                                  Set [2 items]
#                                      Item 0
#                                          Instance variable '@pt1'
#                                      Item 1
#                                          Instance variable '@pt2'
#                              Argument list [0 items]
#          Computed property 'length'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Property 'distanceTo'
#                                  Instance variable '@pt1'
#                              Argument list [1 items]
#                                  Item 0
#                                      Instance variable '@pt2'
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

FF::before_content('Line.frt');

use Ferret::Core::Operations qw(add str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'Math' );
    FF::load_core('Math');

    # Class 'Line'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Line', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
            [
                {
                    name     => 'pt1',
                    type     => 'Point',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'pt2',
                    type     => 'Point',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                FF::need( $self, $arguments, 'pt1' ) or return;
                FF::need( $self, $arguments, 'pt2' ) or return;
                return $return;
            }
        );

        # Method event 'endpoints' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'endpoints',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return FF::create_list( $f,
                    [ $self->property_u('pt1'), $self->property_u('pt2') ] );
                return $return;
            }
        );

        # Method event 'pretty' definition
        my $method_2 = FF::method_event_def(
            $f, $scope, 'pretty',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property_ow(
                    $context,
                    mp => $self->property_u('midpoint'),
                    13.2
                );
                $scope->set_property_ow(
                    $context,
                    pox => $self->property_u('pt1')->property_u('x'),
                    14.1
                );
                $scope->set_property_ow(
                    $context,
                    poy => $self->property_u('pt1')->property_u('y'),
                    14.35
                );
                $scope->set_property_ow(
                    $context,
                    ptx => $self->property_u('pt2')->property_u('x'),
                    15.1
                );
                $scope->set_property_ow(
                    $context,
                    pty => $self->property_u('pt2')->property_u('y'),
                    15.35
                );
                $scope->set_property_ow(
                    $context,
                    mx => $scope->property_u('mp')->property_u('x'),
                    16.1
                );
                $scope->set_property_ow(
                    $context,
                    my => $scope->property_u('mp')->property_u('y'),
                    16.35
                );
                return add(
                    $scope,                      str( $f, "Segment( |(" ),
                    $scope->property_u('pox'),   str( $f, ", " ),
                    $scope->property_u('poy'),   str( $f, ")---(" ),
                    $scope->property_u('mx'),    str( $f, ", " ),
                    $scope->property_u('my'),    str( $f, ")---(" ),
                    $scope->property_u('ptx'),   str( $f, ", " ),
                    $scope->property_u('pty'),   str( $f, ")| Length = " ),
                    $self->property_u('length'), str( $f, " )" )
                );
                return $return;
            }
        );

        # Method event 'description' definition
        my $method_3 = FF::method_event_def(
            $f, $scope,
            'description',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return $self->property_u('pretty');
                return $return;
            }
        );

        # Method event 'midpoint' definition
        my $method_4 = FF::method_event_def(
            $f, $scope,
            'midpoint',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return FF::create_set(
                    $scope,
                    $self->property_u('pt1'),
                    $self->property_u('pt2')
                )->property_u('midpoint')->call_u( {}, $scope, undef, 25.4 );
                return $return;
            }
        );

        # Method event 'length' definition
        my $method_5 = FF::method_event_def(
            $f, $scope, 'length',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                return $self->property_u('pt1')->property_u('distanceTo')
                  ->call_u( [ $self->property_u('pt2') ], $scope, undef, 29.4 );
                return $return;
            }
        );
        $method_0->inside_scope(
            _init_ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            endpoints => $scope,
            $proto, $class, 1, undef
        );
        $method_2->inside_scope( pretty => $scope, $proto, $class, 1, undef );
        $method_3->inside_scope(
            description => $scope,
            $proto, $class, undef, undef
        );
        $method_4->inside_scope( midpoint => $scope, $proto, $class, 1, undef );
        $method_5->inside_scope( length   => $scope, $proto, $class, 1, undef );
    }
    FF::load_namespaces( $context, qw(Point) );
};

FF::after_content();
