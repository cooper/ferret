# === Document Model ===
#  Document './std/Math/Rect.frt'
#      Package 'Math'
#      Class 'Rect'
#          Class method 'initializer__'
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$x'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Need
#                          Lexical variable '$y'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Need
#                          Instance variable '@width'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Need
#                          Instance variable '@height'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Assignment
#                          Instance variable '@origin'
#                          Call
#                              Bareword 'Point'
#                              Argument list [2 items]
#                                  Item 0
#                                      Lexical variable '$x'
#                                  Item 1
#                                      Lexical variable '$y'
#          Computed property 'vertices'
#              Body ('function' scope)
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
#              Body ('function' scope)
#                  Instruction
#                      Return
#                          Instance variable '@origin'
#          Computed property 'bottomRight'
#              Body ('function' scope)
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
#              Body ('function' scope)
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
#              Body ('function' scope)
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
#              Body ('function' scope)
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
#              Body ('function' scope)
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
#              Body ('function' scope)
#                  Instruction
#                      Assignment
#                          Lexical variable '$x'
#                          Operation
#                              Property 'x'
#                                  Instance variable '@origin'
#                              Addition operator (+)
#                              Instance variable '@width'
#                              Multiplication operator (*)
#                              Number '0.5'
#                  Instruction
#                      Assignment
#                          Lexical variable '$y'
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
#              Body ('function' scope)
#                  Instruction
#                      Assignment
#                          Lexical variable '$o'
#                          Instance variable '@origin'
#                  Instruction
#                      Assignment
#                          Lexical variable '$c'
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
package FF;

use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    my $config = $ENV{FERRET_CONFIG} || '/etc/ferret.conf';
    do $config or die "config error: " . ( $@ || $! );
}

use Ferret;

my ( $self, $ins );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $pos = before_content( 'Rect.frt', './std/Math/Rect.frt' );

use Ferret::Core::Operations qw(add mul num str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'Math' );
    my $scope = $file_scope;
    load_core('Math');

    # Class 'Rect'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Rect', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
            $f, $scope,
            'initializer__',
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
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'x', 5.1 ) || return;
                need( $scope, $args, 'y', 5.3 ) || return;
                need( $self, $args, 'width' )  or return;
                need( $self, $args, 'height' ) or return;
                $self->set_property(
                    origin => $$scope->{'Point'}->(
                        [ $$scope->{'x'}, $$scope->{'y'} ], $scope,
                        undef, $pos->(6.2)
                    ),
                    $pos->(6.1)
                );
                return $ret;
            }
        );

        # Method event 'vertices' definition
        my $func_1 = method_event_def(
            $f, $scope,
            'vertices',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    create_list(
                        $f,
                        [
                            $$self->{'topLeft'},    $$self->{'topRight'},
                            $$self->{'bottomLeft'}, $$self->{'bottomRight'}
                        ]
                    )
                );
                return $ret;
            }
        );

        # Method event 'bottomLeft' definition
        my $func_2 = method_event_def(
            $f, $scope,
            'bottomLeft',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->( $$self->{'origin'} );
                return $ret;
            }
        );

        # Method event 'bottomRight' definition
        my $func_3 = method_event_def(
            $f, $scope,
            'bottomRight',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$scope->{'Point'}->(
                        [
                            add(
                                $scope,
                                $$self->{'origin'}
                                  ->property_u( 'x', $pos->(23.25) ),
                                $$self->{'width'}
                            ),
                            $$self->{'origin'}->property_u( 'y', $pos->(23.5) )
                        ],
                        $scope, undef,
                        $pos->(23.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'topLeft' definition
        my $func_4 = method_event_def(
            $f, $scope,
            'topLeft',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$scope->{'Point'}->(
                        [
                            $$self->{'origin'}
                              ->property_u( 'x', $pos->(27.25) ),
                            add(
                                $scope,
                                $$self->{'origin'}
                                  ->property_u( 'y', $pos->(27.4) ),
                                $$self->{'height'}
                            )
                        ],
                        $scope, undef,
                        $pos->(27.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'topRight' definition
        my $func_5 = method_event_def(
            $f, $scope,
            'topRight',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$scope->{'Point'}->(
                        [
                            add(
                                $scope,
                                $$self->{'origin'}
                                  ->property_u( 'x', $pos->(31.25) ),
                                $$self->{'width'}
                            ),
                            add(
                                $scope,
                                $$self->{'origin'}
                                  ->property_u( 'y', $pos->(31.5) ),
                                $$self->{'height'}
                            )
                        ],
                        $scope, undef,
                        $pos->(31.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'bottomLine' definition
        my $func_6 = method_event_def(
            $f, $scope,
            'bottomLine',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$scope->{'Line'}->(
                        [ $$self->{'bottomLeft'}, $$self->{'bottomRight'} ],
                        $scope, undef, $pos->(35.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'topLine' definition
        my $func_7 = method_event_def(
            $f, $scope,
            'topLine',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$scope->{'Line'}->(
                        [ $$self->{'topLeft'}, $$self->{'topRight'} ],
                        $scope, undef, $pos->(39.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'center' definition
        my $func_8 = method_event_def(
            $f, $scope, 'center', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var(
                    $scope,
                    x => add(
                        $scope,
                        $$self->{'origin'}->property_u( 'x', $pos->(43.2) ),
                        mul( $scope, $$self->{'width'}, num( $f, "0.5" ) )
                    ),
                    $file_scope,
                    $pos->(43.1)
                );
                var(
                    $scope,
                    y => add(
                        $scope,
                        $$self->{'origin'}->property_u( 'y', $pos->(44.2) ),
                        mul( $scope, $$self->{'height'}, num( $f, "0.5" ) )
                    ),
                    $file_scope,
                    $pos->(44.1)
                );
                return $ret_func->(
                    $$scope->{'Point'}->(
                        [ $$scope->{'x'}, $$scope->{'y'} ], $scope,
                        undef, $pos->(45.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $func_9 = method_event_def(
            $f, $scope,
            'description',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var(
                    $scope,
                    o => $$self->{'origin'},
                    $file_scope, $pos->(49.2)
                );
                var(
                    $scope,
                    c => $$self->{'center'},
                    $file_scope, $pos->(50.2)
                );
                return $ret_func->(
                    add(
                        $scope,
                        str( $f, "Rect( Origin(" ),
                        $$scope->{'o'}->property_u( 'x', $pos->(51.125) ),
                        str( $f, ", " ),
                        $$scope->{'o'}->property_u( 'y', $pos->(51.25) ),
                        str( $f, ") Center(" ),
                        $$scope->{'c'}->property_u( 'x', $pos->(51.375) ),
                        str( $f, ", " ),
                        $$scope->{'c'}->property_u( 'y', $pos->(51.5) ),
                        str( $f, ") Width = " ),
                        $$self->{'width'},
                        str( $f, " Height = " ),
                        $$self->{'height'},
                        str( $f, " )" )
                    )
                );
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            vertices => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_2->inside_scope(
            bottomLeft => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_3->inside_scope(
            bottomRight => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_4->inside_scope(
            topLeft => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_5->inside_scope(
            topRight => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_6->inside_scope(
            bottomLine => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_7->inside_scope(
            topLine => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_8->inside_scope(
            center => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_9->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Line Num Point) );
};

after_content();
