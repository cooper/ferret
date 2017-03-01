# === Document Model ===
#  Document './std/Math/Vector.frt'
#      Package 'Math'
#      Class 'Vector'
#          Class method 'initializer__' { ?$items:Num... }
#              Function body
#                  Instruction
#                      Want (...)
#                          Instance variable '@items'
#                          Argument type
#                              Bareword 'Num'
#          Computed property 'dimension' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Property 'length'
#                              Instance variable '@items'
#          Computed property 'magnitude' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Property 'sqrt'
#                              Property 'sum'
#                                  Call
#                                      Property 'map'
#                                          Instance variable '@items'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Anonymous function { -> $result }
#                                                  Function body
#                                                      Instruction
#                                                          Return
#                                                              Operation
#                                                                  Topic variable '$_'
#                                                                  Exponent operator (^)
#                                                                  Number '2'
#          Method 'opMul' { $ehs:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Vector'
#                              Named argument list [1 item]
#                                  Item 0
#                                      Pair 'items'
#                                          Call
#                                              Property 'map'
#                                                  Instance variable '@items'
#                                              Argument list [1 item]
#                                                  Item 0
#                                                      Anonymous function { -> $result }
#                                                          Function body
#                                                              Instruction
#                                                                  Return
#                                                                      Operation
#                                                                          Topic variable '$_'
#                                                                          Multiplication operator (*)
#                                                                          Lexical variable '$ehs'
#          Method 'opMul' { $ehs:Vector -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Vector'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@dot'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$ehs'
#          Method 'opEqual' { $ehs:Vector -> $result $result $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Vector'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Property 'dimension'
#                                  Lexical variable '$ehs'
#                              Negated equality operator (!=)
#                              Instance variable '@dimension'
#                      If body
#                          Instruction
#                              Return
#                                  Boolean false
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$i'
#                      Expression ('in' parameter)
#                          Operation
#                              Number '0'
#                              Range operator (..)
#                              Property 'lastIndex'
#                                  Instance variable '@items'
#                      For body
#                          If
#                              Expression ('if' parameter)
#                                  Operation
#                                      Index
#                                          Special variable '*self'
#                                          Index list [1 item]
#                                              Item 0
#                                                  Lexical variable '$i'
#                                      Equality operator (==)
#                                      Index
#                                          Lexical variable '$ehs'
#                                          Index list [1 item]
#                                              Item 0
#                                                  Lexical variable '$i'
#                              If body
#                                  Instruction
#                                      Next
#                          Instruction
#                              Return
#                                  Boolean false
#                  Instruction
#                      Return
#                          Boolean true
#          Method 'dot' { $ehs:Vector -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Vector'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Property 'dimension'
#                                  Lexical variable '$ehs'
#                              Negated equality operator (!=)
#                              Instance variable '@dimension'
#                      If body
#                          Instruction
#                              Throw (fatal exception)
#                                  Call
#                                      Bareword 'Error'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Symbol :DimensionError
#                                          Item 1
#                                              Operation
#                                                  String 'Dimension ...'
#                                                  Addition operator (+)
#                                                  Property 'dimension'
#                                                      Lexical variable '$ehs'
#                                                  Addition operator (+)
#                                                  String ' != '
#                                                  Addition operator (+)
#                                                  Instance variable '@dimension'
#                  Instruction
#                      Assignment
#                          Lexical variable '$dot'
#                          Number '0'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$i'
#                      Expression ('in' parameter)
#                          Operation
#                              Number '0'
#                              Range operator (..)
#                              Property 'lastIndex'
#                                  Instance variable '@items'
#                      For body
#                          Instruction
#                              Addition assignment
#                                  Lexical variable '$dot'
#                                  Operation
#                                      Index
#                                          Special variable '*self'
#                                          Index list [1 item]
#                                              Item 0
#                                                  Lexical variable '$i'
#                                      Multiplication operator (*)
#                                      Index
#                                          Lexical variable '$ehs'
#                                          Index list [1 item]
#                                              Item 0
#                                                  Lexical variable '$i'
#                  Instruction
#                      Return
#                          Lexical variable '$dot'
#          Method 'cross' { $ehs:Vector -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Vector'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Property 'dimension'
#                                  Lexical variable '$ehs'
#                              Negated equality operator (!=)
#                              Number '3'
#                              Logical or operator (||)
#                              Instance variable '@dimension'
#                              Negated equality operator (!=)
#                              Number '3'
#                      If body
#                          Instruction
#                              Throw (fatal exception)
#                                  Call
#                                      Bareword 'Error'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Symbol :DimensionError
#                                          Item 1
#                                              String 'Cross prod...'
#                  Instruction
#                      Assignment
#                          Instance variable '@a'
#                          Operation
#                              Index
#                                  Special variable '*self'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '1'
#                              Multiplication operator (*)
#                              Index
#                                  Lexical variable '$ehs'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '2'
#                              Subtraction operator (-)
#                              Index
#                                  Special variable '*self'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '2'
#                              Multiplication operator (*)
#                              Index
#                                  Lexical variable '$ehs'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '1'
#                  Instruction
#                      Assignment
#                          Instance variable '@b'
#                          Operation
#                              Index
#                                  Special variable '*self'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '2'
#                              Multiplication operator (*)
#                              Index
#                                  Lexical variable '$ehs'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '0'
#                              Subtraction operator (-)
#                              Index
#                                  Special variable '*self'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '0'
#                              Multiplication operator (*)
#                              Index
#                                  Lexical variable '$ehs'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '2'
#                  Instruction
#                      Assignment
#                          Instance variable '@c'
#                          Operation
#                              Index
#                                  Special variable '*self'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '0'
#                              Multiplication operator (*)
#                              Index
#                                  Lexical variable '$ehs'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '1'
#                              Subtraction operator (-)
#                              Index
#                                  Special variable '*self'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '1'
#                              Multiplication operator (*)
#                              Index
#                                  Lexical variable '$ehs'
#                                  Index list [1 item]
#                                      Item 0
#                                          Number '0'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Vector'
#                              Argument list [3 items]
#                                  Item 0
#                                      Instance variable '@a'
#                                  Item 1
#                                      Instance variable '@b'
#                                  Item 2
#                                      Instance variable '@c'
#          Method 'angleBetween' { $ehs:Vector -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Vector'
#                  Instruction
#                      Assignment
#                          Lexical variable '$cosTheta'
#                          Operation
#                              Call
#                                  Instance variable '@dot'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$ehs'
#                              Division operator (/)
#                              Single value [1 item]
#                                  Item 0
#                                      Operation
#                                          Instance variable '@magnitude'
#                                          Multiplication operator (*)
#                                          Property 'magnitude'
#                                              Lexical variable '$ehs'
#                  Instruction
#                      Return
#                          Call
#                              Property 'acos'
#                                  Bareword 'Math'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$cosTheta'
#          Method 'getValue' { $index:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$index'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Index
#                              Instance variable '@items'
#                              Index list [1 item]
#                                  Item 0
#                                      Lexical variable '$index'
#          Method 'copy' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Vector'
#                              Named argument list [1 item]
#                                  Item 0
#                                      Pair 'items'
#                                          Call
#                                              Property 'copy'
#                                                  Instance variable '@items'
#          Method 'description' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Operation
#                              String '<'
#                              Addition operator (+)
#                              Call
#                                  Property 'join'
#                                      Instance variable '@items'
#                                  Argument list [1 item]
#                                      Item 0
#                                          String ', '
#                              Addition operator (+)
#                              String '>'
#      Include (Error, Math, Num, Vector)
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

my $pos = before_content( 'Vector.frt', './std/Math/Vector.frt' );

use Ferret::Core::Operations
  qw(_sub add any_true bool div equal mul nequal num pow range str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'Math' );
    my $scope = $file_scope;
    load_core('Math');

    # Anonymous function definition with topicalizer
    my $func_2 = function_def(
        $f, undef, undef,
        [ { name => '_' } ],
        undef,
        sub {
            my ( $scope, $self, $this, undef, $args, $ret ) = &args_v1;
            my $ins = $args->{_};
            return $ret_func->(
                pow( $scope, $pos->(16.4), $ins, num( $f, "2" ) ) );
            return $ret;
        }
    );

    # Anonymous function definition with topicalizer
    my $func_4 = function_def(
        $f, undef, undef,
        [ { name => '_' } ],
        undef,
        sub {
            my ( $scope, $self, $this, undef, $args, $ret ) = &args_v1;
            my $ins = $args->{_};
            return $ret_func->(
                mul( $scope, $pos->(22.55), $ins, $$scope->{'ehs'} ) );
            return $ret;
        }
    );

    # Class 'Vector'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Vector', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [ { name => 'items', type => 'Num', optional => 1, more => 1 } ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                want( $self, $args, 'items', 6.2 );
                return $ret;
            }
        );

        # Method event 'dimension' definition
        my $func_1 = method_event_def(
            $f, $scope,
            'dimension',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$self->{'items'}->property_u( 'length', $pos->(11.3) ) );
                return $ret;
            }
        );

        # Method event 'magnitude' definition
        my $func_3 = method_event_def(
            $f, $scope,
            'magnitude',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$self->{'items'}->property_u( 'map', $pos->(16.15) )->(
                        [
                            $func_2->inside_scope(
                                (undef) => $scope,
                                undef, $class, $ins, undef, undef
                            )
                        ],
                        $scope, undef,
                        $pos->(16.2)
                      )->property_u( 'sum', $pos->(16.55) )
                      ->property_u( 'sqrt', $pos->(16.6) )
                );
                return $ret;
            }
        );

        # Method event 'opMul' definition
        my $func_5 = method_event_def(
            $f, $scope, 'opMul',
            [
                {
                    name     => 'ehs',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'ehs', 21.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [
                            undef,
                            [
                                items => $$self->{'items'}
                                  ->property_u( 'map', $pos->(22.3) )->(
                                    [
                                        $func_4->inside_scope(
                                            (undef) => $scope,
                                            undef, $class, $ins, undef, undef
                                        )
                                    ],
                                    $scope, undef,
                                    $pos->(22.35)
                                  )
                            ]
                        ],
                        $scope, undef,
                        $pos->(22.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opMul' definition
        my $func_6 = method_event_def(
            $f, $scope, 'opMul',
            [
                {
                    name     => 'ehs',
                    type     => 'Vector',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'ehs', 27.2 ) || return $ret_func->();
                return $ret_func->( $$self->{'dot'}
                      ->( [ $$scope->{'ehs'} ], $scope, undef, $pos->(28.3) ) );
                return $ret;
            }
        );

        # Method event 'opEqual' definition
        my $func_7 = method_event_def(
            $f, $scope,
            'opEqual',
            [
                {
                    name     => 'ehs',
                    type     => 'Vector',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'ehs', 33.2 ) || return $ret_func->();
                if (
                    bool(
                        nequal(
                            $scope,
                            $pos->(34.4),
                            $$scope->{'ehs'}
                              ->property_u( 'dimension', $pos->(34.3) ),
                            $$self->{'dimension'}
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->($false);
                }
                {
                    my ( $loop_status, $loop_ret ) = iterate(
                        $f, $scope,
                        range(
                            $scope,
                            $pos->(36.5),
                            num( $f, "0" ),
                            $$self->{'items'}
                              ->property_u( 'lastIndex', $pos->(36.7) )
                        ),
                        'i',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            if (
                                bool(
                                    equal(
                                        $scope,
                                        $pos->(37.3),
                                        ${ $scope->{special} }->{'self'}
                                          ->get_index_value(
                                            [ $$scope->{'i'} ], $scope,
                                            $pos->(37.15)
                                          ),
                                        $$scope->{'ehs'}->get_index_value(
                                            [ $$scope->{'i'} ], $scope,
                                            $pos->(37.4)
                                        )
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                return 'next';
                            }
                            return $ret_func->($false);
                        },
                        $pos->(36.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret_func->($true);
                return $ret;
            }
        );

        # Method event 'dot' definition
        my $func_8 = method_event_def(
            $f, $scope, 'dot',
            [
                {
                    name     => 'ehs',
                    type     => 'Vector',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'ehs', 46.2 ) || return $ret_func->();
                if (
                    bool(
                        nequal(
                            $scope,
                            $pos->(47.4),
                            $$scope->{'ehs'}
                              ->property_u( 'dimension', $pos->(47.3) ),
                            $$self->{'dimension'}
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $ret->throw(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'DimensionError' ),
                                    add(
                                        $scope,
                                        $pos->(48.35),
                                        str( $f, "Dimension mismatch " ),
                                        $$scope->{'ehs'}->property_u(
                                            'dimension', $pos->(48.45)
                                        ),
                                        str( $f, " != " ),
                                        $$self->{'dimension'}
                                    )
                                ],
                                $scope, undef,
                                $pos->(48.15)
                            ),
                            $pos->(48.05)
                        )
                    );
                }
                var( $scope, dot => num( $f, "0" ), $file_scope, $pos->(49.2) );
                {
                    my ( $loop_status, $loop_ret ) = iterate(
                        $f, $scope,
                        range(
                            $scope,
                            $pos->(50.5),
                            num( $f, "0" ),
                            $$self->{'items'}
                              ->property_u( 'lastIndex', $pos->(50.7) )
                        ),
                        'i',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            var(
                                $scope,
                                dot => add(
                                    $scope,
                                    $pos->(51.1),
                                    $$scope->{'dot'},
                                    mul(
                                        $scope,
                                        $pos->(51.35),
                                        ${ $scope->{special} }->{'self'}
                                          ->get_index_value(
                                            [ $$scope->{'i'} ], $scope,
                                            $pos->(51.2)
                                          ),
                                        $$scope->{'ehs'}->get_index_value(
                                            [ $$scope->{'i'} ], $scope,
                                            $pos->(51.45)
                                        )
                                    )
                                ),
                                $file_scope,
                                $pos->(51.1)
                            );
                        },
                        $pos->(50.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret_func->( $$scope->{'dot'} );
                return $ret;
            }
        );

        # Method event 'cross' definition
        my $func_9 = method_event_def(
            $f, $scope, 'cross',
            [
                {
                    name     => 'ehs',
                    type     => 'Vector',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'ehs', 58.2 ) || return $ret_func->();
                if (
                    bool(
                        any_true(
                            $scope,
                            $pos->(59.2),
                            sub {
                                nequal(
                                    $scope,
                                    $pos->(59.2),
                                    $$scope->{'ehs'}->property_u(
                                        'dimension', $pos->(59.15)
                                    ),
                                    num( $f, "3" )
                                );
                            },
                            sub {
                                nequal( $scope, $pos->(59.2),
                                    $$self->{'dimension'}, num( $f, "3" ) );
                            }
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $ret->throw(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'DimensionError' ),
                                    str(
                                        $f, "Cross product only exists in 3D"
                                    )
                                ],
                                $scope, undef,
                                $pos->(60.3)
                            ),
                            $pos->(60.1)
                        )
                    );
                }
                $self->set_property(
                    a => _sub(
                        $scope,
                        $pos->(61.23333),
                        mul(
                            $scope,
                            $pos->(61.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "1" ) ], $scope,
                                $pos->(61.13333)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "2" ) ],
                                $scope, $pos->(61.3)
                            )
                        ),
                        mul(
                            $scope,
                            $pos->(61.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "2" ) ], $scope,
                                $pos->(61.46667)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "1" ) ], $scope,
                                $pos->(61.63333)
                            )
                        )
                    ),
                    $pos->(61.06667)
                );
                $self->set_property(
                    b => _sub(
                        $scope,
                        $pos->(62.23333),
                        mul(
                            $scope,
                            $pos->(62.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "2" ) ], $scope,
                                $pos->(62.13333)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "0" ) ],
                                $scope, $pos->(62.3)
                            )
                        ),
                        mul(
                            $scope,
                            $pos->(62.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "0" ) ], $scope,
                                $pos->(62.46667)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "2" ) ], $scope,
                                $pos->(62.63333)
                            )
                        )
                    ),
                    $pos->(62.06667)
                );
                $self->set_property(
                    c => _sub(
                        $scope,
                        $pos->(63.23333),
                        mul(
                            $scope,
                            $pos->(63.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "0" ) ], $scope,
                                $pos->(63.13333)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "1" ) ],
                                $scope, $pos->(63.3)
                            )
                        ),
                        mul(
                            $scope,
                            $pos->(63.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "1" ) ], $scope,
                                $pos->(63.46667)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "0" ) ], $scope,
                                $pos->(63.63333)
                            )
                        )
                    ),
                    $pos->(63.06667)
                );
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [ $$self->{'a'}, $$self->{'b'}, $$self->{'c'} ],
                        $scope, undef, $pos->(64.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'angleBetween' definition
        my $func_10 = method_event_def(
            $f, $scope,
            'angleBetween',
            [
                {
                    name     => 'ehs',
                    type     => 'Vector',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'ehs', 69.2 ) || return $ret_func->();
                var(
                    $scope,
                    cosTheta => div(
                        $scope,
                        $pos->(71.35),
                        $$self->{'dot'}->(
                            [ $$scope->{'ehs'} ], $scope,
                            undef,                $pos->(71.2)
                        ),
                        mul(
                            $scope,
                            $pos->(71.5),
                            $$self->{'magnitude'},
                            $$scope->{'ehs'}
                              ->property_u( 'magnitude', $pos->(71.6) )
                        )
                    ),
                    $file_scope,
                    $pos->(71.1)
                );
                return $ret_func->(
                    $$scope->{'Math'}->property_u( 'acos', $pos->(72.3) )->(
                        [ $$scope->{'cosTheta'} ], $scope,
                        undef,                     $pos->(72.4)
                    )
                );
                return $ret;
            }
        );

        # Method event 'getValue' definition
        my $func_11 = method_event_def(
            $f, $scope,
            'getValue',
            [
                {
                    name     => 'index',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'index', 78.2 ) || return $ret_func->();
                return $ret_func->(
                    $$self->{'items'}->get_index_value(
                        [ $$scope->{'index'} ],
                        $scope, $pos->(79.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'copy' definition
        my $func_12 = method_event_def(
            $f, $scope, 'copy', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [
                            undef,
                            [
                                items => $$self->{'items'}
                                  ->property_u( 'copy', $pos->(84.3) )->(
                                    [ undef, [] ], $scope,
                                    undef, $pos->(84.35)
                                  )
                            ]
                        ],
                        $scope, undef,
                        $pos->(84.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $func_13 = method_event_def(
            $f, $scope,
            'description',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    add(
                        $scope,
                        $pos->(88.15),
                        str( $f, "<" ),
                        $$self->{'items'}->property_u( 'join', $pos->(88.25) )
                          ->(
                            [ str( $f, ", " ) ], $scope, undef, $pos->(88.3)
                          ),
                        str( $f, ">" )
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
            dimension => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_3->inside_scope(
            magnitude => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_5->inside_scope(
            opMul => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_6->inside_scope(
            opMul => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_7->inside_scope(
            opEqual => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_8->inside_scope(
            dot => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_9->inside_scope(
            cross => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_10->inside_scope(
            angleBetween => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_11->inside_scope(
            getValue => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_12->inside_scope(
            copy => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_13->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Error Math Num Vector) );
};

after_content();
