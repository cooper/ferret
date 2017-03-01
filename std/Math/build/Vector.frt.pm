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
#          Method 'opAdd' { $ehs:Vector -> $result }
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
#                          Lexical variable '$items'
#                          Gather
#                              Gather body
#                                  For (values)
#                                      Expression ('for' parameter)
#                                          Lexical variable '$i'
#                                      Expression ('in' parameter)
#                                          Operation
#                                              Number '0'
#                                              Range operator (..)
#                                              Property 'lastIndex'
#                                                  Instance variable '@items'
#                                      For body
#                                          Instruction
#                                              Take
#                                                  Operation
#                                                      Index
#                                                          Special variable '*self'
#                                                          Index list [1 item]
#                                                              Item 0
#                                                                  Lexical variable '$i'
#                                                      Addition operator (+)
#                                                      Index
#                                                          Lexical variable '$ehs'
#                                                          Index list [1 item]
#                                                              Item 0
#                                                                  Lexical variable '$i'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Vector'
#                              Named argument list [1 item]
#                                  Item 0
#                                      Pair 'items'
#                                          Lexical variable '$items'
#          Method 'opSub' { $rhs:Vector -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$rhs'
#                          Argument type
#                              Bareword 'Vector'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Property 'dimension'
#                                  Lexical variable '$rhs'
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
#                                                      Lexical variable '$rhs'
#                                                  Addition operator (+)
#                                                  String ' != '
#                                                  Addition operator (+)
#                                                  Instance variable '@dimension'
#                  Instruction
#                      Assignment
#                          Lexical variable '$items'
#                          Gather
#                              Gather body
#                                  For (values)
#                                      Expression ('for' parameter)
#                                          Lexical variable '$i'
#                                      Expression ('in' parameter)
#                                          Operation
#                                              Number '0'
#                                              Range operator (..)
#                                              Property 'lastIndex'
#                                                  Instance variable '@items'
#                                      For body
#                                          Instruction
#                                              Take
#                                                  Operation
#                                                      Index
#                                                          Special variable '*self'
#                                                          Index list [1 item]
#                                                              Item 0
#                                                                  Lexical variable '$i'
#                                                      Subtraction operator (-)
#                                                      Index
#                                                          Lexical variable '$rhs'
#                                                          Index list [1 item]
#                                                              Item 0
#                                                                  Lexical variable '$i'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Vector'
#                              Named argument list [1 item]
#                                  Item 0
#                                      Pair 'items'
#                                          Lexical variable '$items'
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
#          Method 'opDiv' { $rhs:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$rhs'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Operation
#                              Special variable '*self'
#                              Multiplication operator (*)
#                              Single value [1 item]
#                                  Item 0
#                                      Operation
#                                          Number '1'
#                                          Division operator (/)
#                                          Lexical variable '$rhs'
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
    my $func_6 = function_def(
        $f, undef, undef,
        [ { name => '_' } ],
        undef,
        sub {
            my ( $scope, $self, $this, undef, $args, $ret ) = &args_v1;
            my $ins = $args->{_};
            return $ret_func->(
                mul( $scope, $pos->(44.55), $ins, $$scope->{'ehs'} ) );
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

        # Method event 'opAdd' definition
        my $func_4 = method_event_def(
            $f, $scope, 'opAdd',
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
                need( $scope, $args, 'ehs', 21.2 ) || return $ret_func->();
                if (
                    bool(
                        nequal(
                            $scope,
                            $pos->(22.4),
                            $$scope->{'ehs'}
                              ->property_u( 'dimension', $pos->(22.3) ),
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
                                        $pos->(23.35),
                                        str( $f, "Dimension mismatch " ),
                                        $$scope->{'ehs'}->property_u(
                                            'dimension', $pos->(23.45)
                                        ),
                                        str( $f, " != " ),
                                        $$self->{'dimension'}
                                    )
                                ],
                                $scope, undef,
                                $pos->(23.15)
                            ),
                            $pos->(23.05)
                        )
                    );
                }
                var(
                    $scope,
                    items => do {
                        my ( $gather_status, $gather_ret ) = gather(
                            $f, $scope,
                            sub {
                                my ( $scope, $take, $ret_func ) = @_;
                                {
                                    my ( $loop_status, $loop_ret ) = iterate(
                                        $f, $scope,
                                        range(
                                            $scope,
                                            $pos->(24.35),
                                            num( $f, "0" ),
                                            $$self->{'items'}->property_u(
                                                'lastIndex', $pos->(24.45)
                                            )
                                        ),
                                        'i',
                                        sub {
                                            my ( $scope, $ret_func ) = @_;
                                            $take->(
                                                add(
                                                    $scope,
                                                    $pos->(25.3),
                                                    ${ $scope->{special} }
                                                      ->{'self'}
                                                      ->get_index_value(
                                                        [ $$scope->{'i'} ],
                                                        $scope,
                                                        $pos->(25.15)
                                                      ),
                                                    $$scope->{'ehs'}
                                                      ->get_index_value(
                                                        [ $$scope->{'i'} ],
                                                        $scope,
                                                        $pos->(25.4)
                                                      )
                                                )
                                            );
                                        },
                                        $pos->(24.15)
                                    );
                                    return $ret_func->($loop_ret)
                                      if $loop_status eq 'return';
                                }
                            }
                        );
                        return $ret_func->($gather_ret)
                          if $gather_status eq 'return';
                        $gather_ret;
                    },
                    $file_scope,
                    $pos->(24.1)
                );
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [ undef, [ items => $$scope->{'items'} ] ],
                        $scope, undef, $pos->(27.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opSub' definition
        my $func_5 = method_event_def(
            $f, $scope, 'opSub',
            [
                {
                    name     => 'rhs',
                    type     => 'Vector',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'rhs', 32.2 ) || return $ret_func->();
                if (
                    bool(
                        nequal(
                            $scope,
                            $pos->(33.4),
                            $$scope->{'rhs'}
                              ->property_u( 'dimension', $pos->(33.3) ),
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
                                        $pos->(34.35),
                                        str( $f, "Dimension mismatch " ),
                                        $$scope->{'rhs'}->property_u(
                                            'dimension', $pos->(34.45)
                                        ),
                                        str( $f, " != " ),
                                        $$self->{'dimension'}
                                    )
                                ],
                                $scope, undef,
                                $pos->(34.15)
                            ),
                            $pos->(34.05)
                        )
                    );
                }
                var(
                    $scope,
                    items => do {
                        my ( $gather_status, $gather_ret ) = gather(
                            $f, $scope,
                            sub {
                                my ( $scope, $take, $ret_func ) = @_;
                                {
                                    my ( $loop_status, $loop_ret ) = iterate(
                                        $f, $scope,
                                        range(
                                            $scope,
                                            $pos->(35.35),
                                            num( $f, "0" ),
                                            $$self->{'items'}->property_u(
                                                'lastIndex', $pos->(35.45)
                                            )
                                        ),
                                        'i',
                                        sub {
                                            my ( $scope, $ret_func ) = @_;
                                            $take->(
                                                _sub(
                                                    $scope,
                                                    $pos->(36.3),
                                                    ${ $scope->{special} }
                                                      ->{'self'}
                                                      ->get_index_value(
                                                        [ $$scope->{'i'} ],
                                                        $scope,
                                                        $pos->(36.15)
                                                      ),
                                                    $$scope->{'rhs'}
                                                      ->get_index_value(
                                                        [ $$scope->{'i'} ],
                                                        $scope,
                                                        $pos->(36.4)
                                                      )
                                                )
                                            );
                                        },
                                        $pos->(35.15)
                                    );
                                    return $ret_func->($loop_ret)
                                      if $loop_status eq 'return';
                                }
                            }
                        );
                        return $ret_func->($gather_ret)
                          if $gather_status eq 'return';
                        $gather_ret;
                    },
                    $file_scope,
                    $pos->(35.1)
                );
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [ undef, [ items => $$scope->{'items'} ] ],
                        $scope, undef, $pos->(38.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opMul' definition
        my $func_7 = method_event_def(
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
                need( $scope, $args, 'ehs', 43.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [
                            undef,
                            [
                                items => $$self->{'items'}
                                  ->property_u( 'map', $pos->(44.3) )->(
                                    [
                                        $func_6->inside_scope(
                                            (undef) => $scope,
                                            undef, $class, $ins, undef, undef
                                        )
                                    ],
                                    $scope, undef,
                                    $pos->(44.35)
                                  )
                            ]
                        ],
                        $scope, undef,
                        $pos->(44.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opDiv' definition
        my $func_8 = method_event_def(
            $f, $scope, 'opDiv',
            [
                {
                    name     => 'rhs',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'rhs', 49.2 ) || return $ret_func->();
                return $ret_func->(
                    mul(
                        $scope,
                        $pos->(50.15),
                        ${ $scope->{special} }->{'self'},
                        div(
                            $scope, $pos->(50.3),
                            num( $f, "1" ), $$scope->{'rhs'}
                        )
                    )
                );
                return $ret;
            }
        );

        # Method event 'opMul' definition
        my $func_9 = method_event_def(
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
                need( $scope, $args, 'ehs', 55.2 ) || return $ret_func->();
                return $ret_func->( $$self->{'dot'}
                      ->( [ $$scope->{'ehs'} ], $scope, undef, $pos->(56.3) ) );
                return $ret;
            }
        );

        # Method event 'opEqual' definition
        my $func_10 = method_event_def(
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
                need( $scope, $args, 'ehs', 61.2 ) || return $ret_func->();
                if (
                    bool(
                        nequal(
                            $scope,
                            $pos->(62.4),
                            $$scope->{'ehs'}
                              ->property_u( 'dimension', $pos->(62.3) ),
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
                            $pos->(64.5),
                            num( $f, "0" ),
                            $$self->{'items'}
                              ->property_u( 'lastIndex', $pos->(64.7) )
                        ),
                        'i',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            if (
                                bool(
                                    equal(
                                        $scope,
                                        $pos->(65.3),
                                        ${ $scope->{special} }->{'self'}
                                          ->get_index_value(
                                            [ $$scope->{'i'} ], $scope,
                                            $pos->(65.15)
                                          ),
                                        $$scope->{'ehs'}->get_index_value(
                                            [ $$scope->{'i'} ], $scope,
                                            $pos->(65.4)
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
                        $pos->(64.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret_func->($true);
                return $ret;
            }
        );

        # Method event 'dot' definition
        my $func_11 = method_event_def(
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
                need( $scope, $args, 'ehs', 74.2 ) || return $ret_func->();
                if (
                    bool(
                        nequal(
                            $scope,
                            $pos->(75.4),
                            $$scope->{'ehs'}
                              ->property_u( 'dimension', $pos->(75.3) ),
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
                                        $pos->(76.35),
                                        str( $f, "Dimension mismatch " ),
                                        $$scope->{'ehs'}->property_u(
                                            'dimension', $pos->(76.45)
                                        ),
                                        str( $f, " != " ),
                                        $$self->{'dimension'}
                                    )
                                ],
                                $scope, undef,
                                $pos->(76.15)
                            ),
                            $pos->(76.05)
                        )
                    );
                }
                var( $scope, dot => num( $f, "0" ), $file_scope, $pos->(77.2) );
                {
                    my ( $loop_status, $loop_ret ) = iterate(
                        $f, $scope,
                        range(
                            $scope,
                            $pos->(78.5),
                            num( $f, "0" ),
                            $$self->{'items'}
                              ->property_u( 'lastIndex', $pos->(78.7) )
                        ),
                        'i',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            var(
                                $scope,
                                dot => add(
                                    $scope,
                                    $pos->(79.1),
                                    $$scope->{'dot'},
                                    mul(
                                        $scope,
                                        $pos->(79.35),
                                        ${ $scope->{special} }->{'self'}
                                          ->get_index_value(
                                            [ $$scope->{'i'} ], $scope,
                                            $pos->(79.2)
                                          ),
                                        $$scope->{'ehs'}->get_index_value(
                                            [ $$scope->{'i'} ], $scope,
                                            $pos->(79.45)
                                        )
                                    )
                                ),
                                $file_scope,
                                $pos->(79.1)
                            );
                        },
                        $pos->(78.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret_func->( $$scope->{'dot'} );
                return $ret;
            }
        );

        # Method event 'cross' definition
        my $func_12 = method_event_def(
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
                need( $scope, $args, 'ehs', 86.2 ) || return $ret_func->();
                if (
                    bool(
                        any_true(
                            $scope,
                            $pos->(87.2),
                            sub {
                                nequal(
                                    $scope,
                                    $pos->(87.2),
                                    $$scope->{'ehs'}->property_u(
                                        'dimension', $pos->(87.15)
                                    ),
                                    num( $f, "3" )
                                );
                            },
                            sub {
                                nequal( $scope, $pos->(87.2),
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
                                $pos->(88.3)
                            ),
                            $pos->(88.1)
                        )
                    );
                }
                $self->set_property(
                    a => _sub(
                        $scope,
                        $pos->(89.23333),
                        mul(
                            $scope,
                            $pos->(89.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "1" ) ], $scope,
                                $pos->(89.13333)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "2" ) ],
                                $scope, $pos->(89.3)
                            )
                        ),
                        mul(
                            $scope,
                            $pos->(89.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "2" ) ], $scope,
                                $pos->(89.46667)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "1" ) ], $scope,
                                $pos->(89.63333)
                            )
                        )
                    ),
                    $pos->(89.06667)
                );
                $self->set_property(
                    b => _sub(
                        $scope,
                        $pos->(90.23333),
                        mul(
                            $scope,
                            $pos->(90.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "2" ) ], $scope,
                                $pos->(90.13333)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "0" ) ],
                                $scope, $pos->(90.3)
                            )
                        ),
                        mul(
                            $scope,
                            $pos->(90.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "0" ) ], $scope,
                                $pos->(90.46667)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "2" ) ], $scope,
                                $pos->(90.63333)
                            )
                        )
                    ),
                    $pos->(90.06667)
                );
                $self->set_property(
                    c => _sub(
                        $scope,
                        $pos->(91.23333),
                        mul(
                            $scope,
                            $pos->(91.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "0" ) ], $scope,
                                $pos->(91.13333)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "1" ) ],
                                $scope, $pos->(91.3)
                            )
                        ),
                        mul(
                            $scope,
                            $pos->(91.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "1" ) ], $scope,
                                $pos->(91.46667)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "0" ) ], $scope,
                                $pos->(91.63333)
                            )
                        )
                    ),
                    $pos->(91.06667)
                );
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [ $$self->{'a'}, $$self->{'b'}, $$self->{'c'} ],
                        $scope, undef, $pos->(92.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'angleBetween' definition
        my $func_13 = method_event_def(
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
                need( $scope, $args, 'ehs', 98.2 ) || return $ret_func->();
                var(
                    $scope,
                    cosTheta => div(
                        $scope,
                        $pos->(100.35),
                        $$self->{'dot'}->(
                            [ $$scope->{'ehs'} ], $scope,
                            undef,                $pos->(100.2)
                        ),
                        mul(
                            $scope,
                            $pos->(100.5),
                            $$self->{'magnitude'},
                            $$scope->{'ehs'}
                              ->property_u( 'magnitude', $pos->(100.6) )
                        )
                    ),
                    $file_scope,
                    $pos->(100.1)
                );
                return $ret_func->(
                    $$scope->{'Math'}->property_u( 'acos', $pos->(101.3) )->(
                        [ $$scope->{'cosTheta'} ], $scope,
                        undef,                     $pos->(101.4)
                    )
                );
                return $ret;
            }
        );

        # Method event 'getValue' definition
        my $func_14 = method_event_def(
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
                need( $scope, $args, 'index', 107.2 ) || return $ret_func->();
                return $ret_func->(
                    $$self->{'items'}->get_index_value(
                        [ $$scope->{'index'} ],
                        $scope, $pos->(108.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'copy' definition
        my $func_15 = method_event_def(
            $f, $scope, 'copy', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [
                            undef,
                            [
                                items => $$self->{'items'}
                                  ->property_u( 'copy', $pos->(113.3) )->(
                                    [ undef, [] ], $scope,
                                    undef, $pos->(113.35)
                                  )
                            ]
                        ],
                        $scope, undef,
                        $pos->(113.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $func_16 = method_event_def(
            $f, $scope,
            'description',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    add(
                        $scope,
                        $pos->(117.15),
                        str( $f, "<" ),
                        $$self->{'items'}->property_u( 'join', $pos->(117.25) )
                          ->(
                            [ str( $f, ", " ) ], $scope,
                            undef, $pos->(117.3)
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
        $func_4->inside_scope(
            opAdd => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_5->inside_scope(
            opSub => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_7->inside_scope(
            opMul => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_8->inside_scope(
            opDiv => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_9->inside_scope(
            opMul => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_10->inside_scope(
            opEqual => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_11->inside_scope(
            dot => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_12->inside_scope(
            cross => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_13->inside_scope(
            angleBetween => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_14->inside_scope(
            getValue => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_15->inside_scope(
            copy => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_16->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Error Math Num Vector) );
};

after_content();
