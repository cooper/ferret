# === Tokenization ===
#         PKG_DEC |                {"name":"Math"} | 1.5
#       CLASS_DEC |                {"name":"Line"} | 2.5
#          METHOD |     {"main":1,"name":"_init_"} | 4.33333
#       CLOSURE_S |                                | 4.66667
#    KEYWORD_NEED |                                | 5.1
#        VAR_THIS |                          "pt1" | 5.2
#        OP_VALUE |                                | 5.3
#        BAREWORD |                        "Point" | 5.4
#        OP_COMMA |                                | 5.5
#        VAR_THIS |                          "pt2" | 5.6
#        OP_VALUE |                                | 5.7
#        BAREWORD |                        "Point" | 5.8
#         OP_SEMI |                                | 5.9
#       CLOSURE_E |                                | 6.5
#          METHOD | {"p_set":null,"name":"endpoints","is_prop":1} | 8.33333
#       CLOSURE_S |                                | 8.66667
#  KEYWORD_RETURN |                                | 9.125
#       BRACKET_S |                                | 9.25
#        VAR_THIS |                          "pt1" | 9.375
#        OP_COMMA |                                | 9.5
#        VAR_THIS |                          "pt2" | 9.625
#       BRACKET_E |                                | 9.75
#         OP_SEMI |                                | 9.875
#       CLOSURE_E |                                | 10.5
#          METHOD | {"name":"pretty","is_prop":1,"p_set":null} | 12.33333
#       CLOSURE_S |                                | 12.66667
#         VAR_LEX |                           "mp" | 13.2
#       OP_ASSIGN |                                | 13.4
#        VAR_THIS |                     "midpoint" | 13.6
#         OP_SEMI |                                | 13.8
#         VAR_LEX |                          "pox" | 14.09091
#       OP_ASSIGN |                                | 14.18182
#        VAR_THIS |                          "pt1" | 14.27273
#        PROPERTY |                            "x" | 14.36364
#         OP_SEMI |                                | 14.45455
#         VAR_LEX |                          "poy" | 14.54545
#       OP_ASSIGN |                                | 14.63636
#        VAR_THIS |                          "pt1" | 14.72727
#        PROPERTY |                            "y" | 14.81818
#         OP_SEMI |                                | 14.90909
#         VAR_LEX |                          "ptx" | 15.09091
#       OP_ASSIGN |                                | 15.18182
#        VAR_THIS |                          "pt2" | 15.27273
#        PROPERTY |                            "x" | 15.36364
#         OP_SEMI |                                | 15.45455
#         VAR_LEX |                          "pty" | 15.54545
#       OP_ASSIGN |                                | 15.63636
#        VAR_THIS |                          "pt2" | 15.72727
#        PROPERTY |                            "y" | 15.81818
#         OP_SEMI |                                | 15.90909
#         VAR_LEX |                           "mx" | 16.09091
#       OP_ASSIGN |                                | 16.18182
#         VAR_LEX |                           "mp" | 16.27273
#        PROPERTY |                            "x" | 16.36364
#         OP_SEMI |                                | 16.45455
#         VAR_LEX |                           "my" | 16.54545
#       OP_ASSIGN |                                | 16.63636
#         VAR_LEX |                           "mp" | 16.72727
#        PROPERTY |                            "y" | 16.81818
#         OP_SEMI |                                | 16.90909
#  KEYWORD_RETURN |                                | 17.25
#          STRING | ["Segment( |(",["VAR_LEX","pox",17],", ",["VAR_LEX","poy",17],")---(",["VAR_LEX","mx",17],", ",["VAR_LEX","my",17],")---(",["VAR_LEX","ptx",17],", ",["VAR_LEX","pty",17],")| Length = ",["VAR_THIS","length",17]," )"] | 17.5
#         OP_SEMI |                                | 17.75
#       CLOSURE_E |                                | 18.5
#          METHOD |         {"name":"description"} | 20.33333
#       CLOSURE_S |                                | 20.66667
#  KEYWORD_RETURN |                                | 21.25
#        VAR_THIS |                       "pretty" | 21.5
#         OP_SEMI |                                | 21.75
#       CLOSURE_E |                                | 22.5
#          METHOD | {"p_set":null,"is_prop":1,"name":"midpoint"} | 24.33333
#       CLOSURE_S |                                | 24.66667
#  KEYWORD_RETURN |                                | 25.09091
#         PAREN_S |                                | 25.18182
#        VAR_THIS |                          "pt1" | 25.27273
#        OP_COMMA |                                | 25.36364
#        VAR_THIS |                          "pt2" | 25.45455
#         PAREN_E |                                | 25.54545
#        PROPERTY |                     "midpoint" | 25.63636
#      PAREN_CALL |                                | 25.72727
#         PAREN_E |                                | 25.81818
#         OP_SEMI |                                | 25.90909
#       CLOSURE_E |                                | 26.5
#          METHOD | {"is_prop":1,"name":"length","p_set":null} | 28.33333
#       CLOSURE_S |                                | 28.66667
#  KEYWORD_RETURN |                                | 29.125
#        VAR_THIS |                          "pt1" | 29.25
#        PROPERTY |                   "distanceTo" | 29.375
#      PAREN_CALL |                                | 29.5
#        VAR_THIS |                          "pt2" | 29.625
#         PAREN_E |                                | 29.75
#         OP_SEMI |                                | 29.875
#       CLOSURE_E |                                | 30.5
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
                    13.4
                );
                $scope->set_property_ow(
                    $context,
                    pox => $self->property_u('pt1')->property_u('x'),
                    14.18182
                );
                $scope->set_property_ow(
                    $context,
                    poy => $self->property_u('pt1')->property_u('y'),
                    14.63636
                );
                $scope->set_property_ow(
                    $context,
                    ptx => $self->property_u('pt2')->property_u('x'),
                    15.18182
                );
                $scope->set_property_ow(
                    $context,
                    pty => $self->property_u('pt2')->property_u('y'),
                    15.63636
                );
                $scope->set_property_ow(
                    $context,
                    mx => $scope->property_u('mp')->property_u('x'),
                    16.18182
                );
                $scope->set_property_ow(
                    $context,
                    my => $scope->property_u('mp')->property_u('y'),
                    16.63636
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
                  )->property_u('midpoint')
                  ->call_u( {}, $scope, undef, 25.72727 );
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
                  ->call_u( [ $self->property_u('pt2') ], $scope, undef, 29.5 );
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
