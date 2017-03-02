# === Document Model ===
#  File './std/Math/Rect.frt'
#      Package 'Math'
#          Class 'Rect'
#              Class method 'initializer__' { $x:Num $y:Num $width:Num $height:Num }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$x'
#                              Argument type
#                                  Bareword 'Num'
#                      Instruction
#                          Need
#                              Lexical variable '$y'
#                              Argument type
#                                  Bareword 'Num'
#                      Instruction
#                          Need
#                              Instance variable '@width'
#                              Argument type
#                                  Bareword 'Num'
#                      Instruction
#                          Need
#                              Instance variable '@height'
#                              Argument type
#                                  Bareword 'Num'
#                      Instruction
#                          Assignment
#                              Instance variable '@origin'
#                              Call
#                                  Bareword 'Point'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Lexical variable '$x'
#                                      Item 1
#                                          Lexical variable '$y'
#              Computed property 'vertices' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Value list [4 items]
#                                  Item 0
#                                      Instance variable '@topLeft'
#                                  Item 1
#                                      Instance variable '@topRight'
#                                  Item 2
#                                      Instance variable '@bottomLeft'
#                                  Item 3
#                                      Instance variable '@bottomRight'
#              Computed property 'bottomLeft' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Instance variable '@origin'
#              Computed property 'bottomRight' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'Point'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Operation
#                                              Property 'x'
#                                                  Instance variable '@origin'
#                                              Addition operator (+)
#                                              Instance variable '@width'
#                                      Item 1
#                                          Property 'y'
#                                              Instance variable '@origin'
#              Computed property 'topLeft' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'Point'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Property 'x'
#                                              Instance variable '@origin'
#                                      Item 1
#                                          Operation
#                                              Property 'y'
#                                                  Instance variable '@origin'
#                                              Addition operator (+)
#                                              Instance variable '@height'
#              Computed property 'topRight' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'Point'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Operation
#                                              Property 'x'
#                                                  Instance variable '@origin'
#                                              Addition operator (+)
#                                              Instance variable '@width'
#                                      Item 1
#                                          Operation
#                                              Property 'y'
#                                                  Instance variable '@origin'
#                                              Addition operator (+)
#                                              Instance variable '@height'
#              Computed property 'bottomLine' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'Line'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Instance variable '@bottomLeft'
#                                      Item 1
#                                          Instance variable '@bottomRight'
#              Computed property 'topLine' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'Line'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Instance variable '@topLeft'
#                                      Item 1
#                                          Instance variable '@topRight'
#              Computed property 'center' { -> $result }
#                  Function body
#                      Instruction
#                          Assignment
#                              Lexical variable '$x'
#                              Operation
#                                  Property 'x'
#                                      Instance variable '@origin'
#                                  Addition operator (+)
#                                  Instance variable '@width'
#                                  Division operator (/)
#                                  Number '2'
#                      Instruction
#                          Assignment
#                              Lexical variable '$y'
#                              Operation
#                                  Property 'y'
#                                      Instance variable '@origin'
#                                  Addition operator (+)
#                                  Instance variable '@height'
#                                  Division operator (/)
#                                  Number '2'
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'Point'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Lexical variable '$x'
#                                      Item 1
#                                          Lexical variable '$y'
#              Method 'description' { -> $result }
#                  Function body
#                      Instruction
#                          Assignment
#                              Lexical variable '$o'
#                              Instance variable '@origin'
#                      Instruction
#                          Assignment
#                              Lexical variable '$c'
#                              Instance variable '@center'
#                      Instruction
#                          Return
#                              Operation
#                                  String 'Rect( Origin('
#                                  Addition operator (+)
#                                  Property 'x'
#                                      Lexical variable '$o'
#                                  Addition operator (+)
#                                  String ', '
#                                  Addition operator (+)
#                                  Property 'y'
#                                      Lexical variable '$o'
#                                  Addition operator (+)
#                                  String ') Center('
#                                  Addition operator (+)
#                                  Property 'x'
#                                      Lexical variable '$c'
#                                  Addition operator (+)
#                                  String ', '
#                                  Addition operator (+)
#                                  Property 'y'
#                                      Lexical variable '$c'
#                                  Addition operator (+)
#                                  String ') Width = '
#                                  Addition operator (+)
#                                  Instance variable '@width'
#                                  Addition operator (+)
#                                  String ' Height = '
#                                  Addition operator (+)
#                                  Instance variable '@height'
#                                  Addition operator (+)
#                                  String ' )'
#          Include (Line, Num, Point)
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
use Ferret::Core::Operations qw(add div num str);

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) = before_content( 'Rect.frt', './std/Math/Rect.frt' );

$result = do {
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
                need( $scope, $args, 'x', 7.2 ) || return $ret_func->();
                need( $scope, $args, 'y', 8.2 ) || return $ret_func->();
                need( $self, $args, 'width' )  || return $ret_func->();
                need( $self, $args, 'height' ) || return $ret_func->();
                $self->set_property(
                    origin => $$scope->{'Point'}->(
                        [ $$scope->{'x'}, $$scope->{'y'} ], $scope,
                        undef, $pos->(11.2)
                    ),
                    $pos->(11.1)
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
                                $pos->(31.3),
                                $$self->{'origin'}
                                  ->property_u( 'x', $pos->(31.25) ),
                                $$self->{'width'}
                            ),
                            $$self->{'origin'}->property_u( 'y', $pos->(31.5) )
                        ],
                        $scope, undef,
                        $pos->(31.15)
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
                              ->property_u( 'x', $pos->(36.25) ),
                            add(
                                $scope,
                                $pos->(36.45),
                                $$self->{'origin'}
                                  ->property_u( 'y', $pos->(36.4) ),
                                $$self->{'height'}
                            )
                        ],
                        $scope, undef,
                        $pos->(36.15)
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
                                $pos->(41.3),
                                $$self->{'origin'}
                                  ->property_u( 'x', $pos->(41.25) ),
                                $$self->{'width'}
                            ),
                            add(
                                $scope,
                                $pos->(41.55),
                                $$self->{'origin'}
                                  ->property_u( 'y', $pos->(41.5) ),
                                $$self->{'height'}
                            )
                        ],
                        $scope, undef,
                        $pos->(41.15)
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
                        $scope, undef, $pos->(46.3)
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
                        $scope, undef, $pos->(51.3)
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
                        $pos->(56.25),
                        $$self->{'origin'}->property_u( 'x', $pos->(56.2) ),
                        div(
                            $scope, $pos->(56.25),
                            $$self->{'width'}, num( $f, "2" )
                        )
                    ),
                    $file_scope,
                    $pos->(56.1)
                );
                var(
                    $scope,
                    y => add(
                        $scope,
                        $pos->(57.25),
                        $$self->{'origin'}->property_u( 'y', $pos->(57.2) ),
                        div(
                            $scope, $pos->(57.25),
                            $$self->{'height'}, num( $f, "2" )
                        )
                    ),
                    $file_scope,
                    $pos->(57.1)
                );
                return $ret_func->(
                    $$scope->{'Point'}->(
                        [ $$scope->{'x'}, $$scope->{'y'} ], $scope,
                        undef, $pos->(58.3)
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
                    $file_scope, $pos->(62.2)
                );
                var(
                    $scope,
                    c => $$self->{'center'},
                    $file_scope, $pos->(63.2)
                );
                return $ret_func->(
                    add(
                        $scope,
                        $pos->(64.075),
                        str( $f, "Rect( Origin(" ),
                        $$scope->{'o'}->property_u( 'x', $pos->(64.125) ),
                        str( $f, ", " ),
                        $$scope->{'o'}->property_u( 'y', $pos->(64.25) ),
                        str( $f, ") Center(" ),
                        $$scope->{'c'}->property_u( 'x', $pos->(64.375) ),
                        str( $f, ", " ),
                        $$scope->{'c'}->property_u( 'y', $pos->(64.5) ),
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
    load_namespaces( $context, $file_name, qw(Line Num Point) );
};

after_content($file_name);
