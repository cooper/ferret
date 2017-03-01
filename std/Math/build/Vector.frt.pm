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
#          Computed property 'unitVector' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Operation
#                              Special variable '*self'
#                              Division operator (/)
#                              Instance variable '@magnitude'
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
#          Method 'opSub' { $lhs:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$lhs'
#                          Argument type
#                              Bareword 'Num'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Lexical variable '$lhs'
#                              Negated equality operator (!=)
#                              Number '0'
#                      If body
#                          Instruction
#                              Throw (fatal exception)
#                                  Set [2 items]
#                                      Item 0
#                                          Symbol :InvalidOperation
#                                      Item 1
#                                          String 'Unsupporte...'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Vector'
#                              Named argument list [1 item]
#                                  Item 0
#                                      Pair 'items'
#                                          Gather
#                                              Gather body
#                                                  For (values)
#                                                      Expression ('for' parameter)
#                                                          Lexical variable '$x'
#                                                      Expression ('in' parameter)
#                                                          Instance variable '@items'
#                                                      For body
#                                                          Instruction
#                                                              Take
#                                                                  Operation
#                                                                      Constant zero
#                                                                      Negation operator (-)
#                                                                      Lexical variable '$x'
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
#                          Lexical variable '$cosθ'
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
#                                      Lexical variable '$cosθ'
#          Method 'orthogonalTo' { $ehs:Vector -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Vector'
#                  Instruction
#                      Return
#                          Operation
#                              Call
#                                  Instance variable '@dot'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$ehs'
#                              Equality operator (==)
#                              Number '0'
#          Method 'parallelTo' { $ehs:Vector -> $result $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Vector'
#                  Instruction
#                      Assignment
#                          Lexical variable '$u1'
#                          Instance variable '@unitVector'
#                  Instruction
#                      Assignment
#                          Lexical variable '$u2'
#                          Property 'unitVector'
#                              Lexical variable '$ehs'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Lexical variable '$u1'
#                              Equality operator (==)
#                              Lexical variable '$u2'
#                              Logical or operator (||)
#                              Constant zero
#                              Negation operator (-)
#                              Lexical variable '$u1'
#                              Equality operator (==)
#                              Lexical variable '$u2'
#                      If body
#                          Instruction
#                              Return
#                                  Boolean true
#                  Instruction
#                      Return
#                          Boolean false
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
    my $func_8 = function_def(
        $f, undef, undef,
        [ { name => '_' } ],
        undef,
        sub {
            my ( $scope, $self, $this, undef, $args, $ret ) = &args_v1;
            my $ins = $args->{_};
            return $ret_func->(
                mul( $scope, $pos->(59.55), $ins, $$scope->{'ehs'} ) );
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

        # Method event 'unitVector' definition
        my $func_4 = method_event_def(
            $f, $scope,
            'unitVector',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    div(
                        $scope, $pos->(21.3), ${ $scope->{special} }->{'self'},
                        $$self->{'magnitude'}
                    )
                );
                return $ret;
            }
        );

        # Method event 'opAdd' definition
        my $func_5 = method_event_def(
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
                need( $scope, $args, 'ehs', 26.2 ) || return $ret_func->();
                if (
                    bool(
                        nequal(
                            $scope,
                            $pos->(27.4),
                            $$scope->{'ehs'}
                              ->property_u( 'dimension', $pos->(27.3) ),
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
                                        $pos->(28.35),
                                        str( $f, "Dimension mismatch " ),
                                        $$scope->{'ehs'}->property_u(
                                            'dimension', $pos->(28.45)
                                        ),
                                        str( $f, " != " ),
                                        $$self->{'dimension'}
                                    )
                                ],
                                $scope, undef,
                                $pos->(28.15)
                            ),
                            $pos->(28.05)
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
                                            $pos->(29.35),
                                            num( $f, "0" ),
                                            $$self->{'items'}->property_u(
                                                'lastIndex', $pos->(29.45)
                                            )
                                        ),
                                        'i',
                                        sub {
                                            my ( $scope, $ret_func ) = @_;
                                            $take->(
                                                add(
                                                    $scope,
                                                    $pos->(30.3),
                                                    ${ $scope->{special} }
                                                      ->{'self'}
                                                      ->get_index_value(
                                                        [ $$scope->{'i'} ],
                                                        $scope,
                                                        $pos->(30.15)
                                                      ),
                                                    $$scope->{'ehs'}
                                                      ->get_index_value(
                                                        [ $$scope->{'i'} ],
                                                        $scope,
                                                        $pos->(30.4)
                                                      )
                                                )
                                            );
                                        },
                                        $pos->(29.15)
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
                    $pos->(29.1)
                );
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [ undef, [ items => $$scope->{'items'} ] ],
                        $scope, undef, $pos->(32.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opSub' definition
        my $func_6 = method_event_def(
            $f, $scope, 'opSub',
            [
                {
                    name     => 'lhs',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'lhs', 37.2 ) || return $ret_func->();
                if (
                    bool(
                        nequal(
                            $scope, $pos->(38.3),
                            $$scope->{'lhs'}, num( $f, "0" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $ret->throw(
                            create_set(
                                $scope,
                                get_symbol( $f, 'InvalidOperation' ),
                                str( $f, "Unsupported operation" )
                            ),
                            $pos->(39.1)
                        )
                    );
                }
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [
                            undef,
                            [
                                items => do {
                                    my ( $gather_status, $gather_ret ) =
                                      gather(
                                        $f, $scope,
                                        sub {
                                            my ( $scope, $take, $ret_func ) =
                                              @_;
                                            {
                                                my ( $loop_status, $loop_ret )
                                                  = iterate(
                                                    $f, $scope,
                                                    $$self->{'items'},
                                                    'x',
                                                    sub {
                                                        my ( $scope, $ret_func )
                                                          = @_;
                                                        $take->(
                                                            _sub(
                                                                $scope,
                                                                $pos->(41.2),
                                                                $f->zero,
                                                                $$scope->{'x'}
                                                            )
                                                        );
                                                    },
                                                    $pos->(40.25)
                                                  );
                                                return $ret_func->($loop_ret)
                                                  if $loop_status eq 'return';
                                            }
                                        }
                                      );
                                    return $ret_func->($gather_ret)
                                      if $gather_status eq 'return';
                                    $gather_ret;
                                  }
                            ]
                        ],
                        $scope,
                        undef,
                        $pos->(40.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opSub' definition
        my $func_7 = method_event_def(
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
                need( $scope, $args, 'rhs', 47.2 ) || return $ret_func->();
                if (
                    bool(
                        nequal(
                            $scope,
                            $pos->(48.4),
                            $$scope->{'rhs'}
                              ->property_u( 'dimension', $pos->(48.3) ),
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
                                        $pos->(49.35),
                                        str( $f, "Dimension mismatch " ),
                                        $$scope->{'rhs'}->property_u(
                                            'dimension', $pos->(49.45)
                                        ),
                                        str( $f, " != " ),
                                        $$self->{'dimension'}
                                    )
                                ],
                                $scope, undef,
                                $pos->(49.15)
                            ),
                            $pos->(49.05)
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
                                            $pos->(50.35),
                                            num( $f, "0" ),
                                            $$self->{'items'}->property_u(
                                                'lastIndex', $pos->(50.45)
                                            )
                                        ),
                                        'i',
                                        sub {
                                            my ( $scope, $ret_func ) = @_;
                                            $take->(
                                                _sub(
                                                    $scope,
                                                    $pos->(51.3),
                                                    ${ $scope->{special} }
                                                      ->{'self'}
                                                      ->get_index_value(
                                                        [ $$scope->{'i'} ],
                                                        $scope,
                                                        $pos->(51.15)
                                                      ),
                                                    $$scope->{'rhs'}
                                                      ->get_index_value(
                                                        [ $$scope->{'i'} ],
                                                        $scope,
                                                        $pos->(51.4)
                                                      )
                                                )
                                            );
                                        },
                                        $pos->(50.15)
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
                    $pos->(50.1)
                );
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [ undef, [ items => $$scope->{'items'} ] ],
                        $scope, undef, $pos->(53.3)
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
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'ehs', 58.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [
                            undef,
                            [
                                items => $$self->{'items'}
                                  ->property_u( 'map', $pos->(59.3) )->(
                                    [
                                        $func_8->inside_scope(
                                            (undef) => $scope,
                                            undef, $class, $ins, undef, undef
                                        )
                                    ],
                                    $scope, undef,
                                    $pos->(59.35)
                                  )
                            ]
                        ],
                        $scope, undef,
                        $pos->(59.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opDiv' definition
        my $func_10 = method_event_def(
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
                need( $scope, $args, 'rhs', 64.2 ) || return $ret_func->();
                return $ret_func->(
                    mul(
                        $scope,
                        $pos->(65.15),
                        ${ $scope->{special} }->{'self'},
                        div(
                            $scope, $pos->(65.3),
                            num( $f, "1" ), $$scope->{'rhs'}
                        )
                    )
                );
                return $ret;
            }
        );

        # Method event 'opMul' definition
        my $func_11 = method_event_def(
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
                need( $scope, $args, 'ehs', 70.2 ) || return $ret_func->();
                return $ret_func->( $$self->{'dot'}
                      ->( [ $$scope->{'ehs'} ], $scope, undef, $pos->(71.3) ) );
                return $ret;
            }
        );

        # Method event 'opEqual' definition
        my $func_12 = method_event_def(
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
                need( $scope, $args, 'ehs', 76.2 ) || return $ret_func->();
                if (
                    bool(
                        nequal(
                            $scope,
                            $pos->(77.4),
                            $$scope->{'ehs'}
                              ->property_u( 'dimension', $pos->(77.3) ),
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
                            $pos->(79.5),
                            num( $f, "0" ),
                            $$self->{'items'}
                              ->property_u( 'lastIndex', $pos->(79.7) )
                        ),
                        'i',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            if (
                                bool(
                                    equal(
                                        $scope,
                                        $pos->(80.3),
                                        ${ $scope->{special} }->{'self'}
                                          ->get_index_value(
                                            [ $$scope->{'i'} ], $scope,
                                            $pos->(80.15)
                                          ),
                                        $$scope->{'ehs'}->get_index_value(
                                            [ $$scope->{'i'} ], $scope,
                                            $pos->(80.4)
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
                        $pos->(79.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret_func->($true);
                return $ret;
            }
        );

        # Method event 'dot' definition
        my $func_13 = method_event_def(
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
                need( $scope, $args, 'ehs', 89.2 ) || return $ret_func->();
                if (
                    bool(
                        nequal(
                            $scope,
                            $pos->(90.4),
                            $$scope->{'ehs'}
                              ->property_u( 'dimension', $pos->(90.3) ),
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
                                        $pos->(91.35),
                                        str( $f, "Dimension mismatch " ),
                                        $$scope->{'ehs'}->property_u(
                                            'dimension', $pos->(91.45)
                                        ),
                                        str( $f, " != " ),
                                        $$self->{'dimension'}
                                    )
                                ],
                                $scope, undef,
                                $pos->(91.15)
                            ),
                            $pos->(91.05)
                        )
                    );
                }
                var( $scope, dot => num( $f, "0" ), $file_scope, $pos->(92.2) );
                {
                    my ( $loop_status, $loop_ret ) = iterate(
                        $f, $scope,
                        range(
                            $scope,
                            $pos->(93.5),
                            num( $f, "0" ),
                            $$self->{'items'}
                              ->property_u( 'lastIndex', $pos->(93.7) )
                        ),
                        'i',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            var(
                                $scope,
                                dot => add(
                                    $scope,
                                    $pos->(94.1),
                                    $$scope->{'dot'},
                                    mul(
                                        $scope,
                                        $pos->(94.35),
                                        ${ $scope->{special} }->{'self'}
                                          ->get_index_value(
                                            [ $$scope->{'i'} ], $scope,
                                            $pos->(94.2)
                                          ),
                                        $$scope->{'ehs'}->get_index_value(
                                            [ $$scope->{'i'} ], $scope,
                                            $pos->(94.45)
                                        )
                                    )
                                ),
                                $file_scope,
                                $pos->(94.1)
                            );
                        },
                        $pos->(93.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret_func->( $$scope->{'dot'} );
                return $ret;
            }
        );

        # Method event 'cross' definition
        my $func_14 = method_event_def(
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
                need( $scope, $args, 'ehs', 101.2 ) || return $ret_func->();
                if (
                    bool(
                        any_true(
                            $scope,
                            $pos->(102.2),
                            sub {
                                nequal(
                                    $scope,
                                    $pos->(102.2),
                                    $$scope->{'ehs'}->property_u(
                                        'dimension', $pos->(102.15)
                                    ),
                                    num( $f, "3" )
                                );
                            },
                            sub {
                                nequal( $scope, $pos->(102.2),
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
                                $pos->(103.3)
                            ),
                            $pos->(103.1)
                        )
                    );
                }
                $self->set_property(
                    a => _sub(
                        $scope,
                        $pos->(104.23333),
                        mul(
                            $scope,
                            $pos->(104.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "1" ) ], $scope,
                                $pos->(104.13333)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "2" ) ],
                                $scope, $pos->(104.3)
                            )
                        ),
                        mul(
                            $scope,
                            $pos->(104.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "2" ) ], $scope,
                                $pos->(104.46667)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "1" ) ], $scope,
                                $pos->(104.63333)
                            )
                        )
                    ),
                    $pos->(104.06667)
                );
                $self->set_property(
                    b => _sub(
                        $scope,
                        $pos->(105.23333),
                        mul(
                            $scope,
                            $pos->(105.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "2" ) ], $scope,
                                $pos->(105.13333)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "0" ) ],
                                $scope, $pos->(105.3)
                            )
                        ),
                        mul(
                            $scope,
                            $pos->(105.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "0" ) ], $scope,
                                $pos->(105.46667)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "2" ) ], $scope,
                                $pos->(105.63333)
                            )
                        )
                    ),
                    $pos->(105.06667)
                );
                $self->set_property(
                    c => _sub(
                        $scope,
                        $pos->(106.23333),
                        mul(
                            $scope,
                            $pos->(106.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "0" ) ], $scope,
                                $pos->(106.13333)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "1" ) ],
                                $scope, $pos->(106.3)
                            )
                        ),
                        mul(
                            $scope,
                            $pos->(106.23333),
                            ${ $scope->{special} }->{'self'}->get_index_value(
                                [ num( $f, "1" ) ], $scope,
                                $pos->(106.46667)
                            ),
                            $$scope->{'ehs'}->get_index_value(
                                [ num( $f, "0" ) ], $scope,
                                $pos->(106.63333)
                            )
                        )
                    ),
                    $pos->(106.06667)
                );
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [ $$self->{'a'}, $$self->{'b'}, $$self->{'c'} ],
                        $scope, undef, $pos->(107.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'angleBetween' definition
        my $func_15 = method_event_def(
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
                need( $scope, $args, 'ehs', 113.2 ) || return $ret_func->();
                var(
                    $scope,
                    cosθ => div(
                        $scope,
                        $pos->(115.35),
                        $$self->{'dot'}->(
                            [ $$scope->{'ehs'} ], $scope,
                            undef,                $pos->(115.2)
                        ),
                        mul(
                            $scope,
                            $pos->(115.5),
                            $$self->{'magnitude'},
                            $$scope->{'ehs'}
                              ->property_u( 'magnitude', $pos->(115.6) )
                        )
                    ),
                    $file_scope,
                    $pos->(115.1)
                );
                return $ret_func->(
                    $$scope->{'Math'}->property_u( 'acos', $pos->(116.3) )
                      ->( [ $$scope->{'cosθ'} ], $scope, undef, $pos->(116.4) )
                );
                return $ret;
            }
        );

        # Method event 'orthogonalTo' definition
        my $func_16 = method_event_def(
            $f, $scope,
            'orthogonalTo',
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
                need( $scope, $args, 'ehs', 123.2 ) || return $ret_func->();
                return $ret_func->(
                    equal(
                        $scope,
                        $pos->(124.6),
                        $$self->{'dot'}->(
                            [ $$scope->{'ehs'} ], $scope,
                            undef,                $pos->(124.3)
                        ),
                        num( $f, "0" )
                    )
                );
                return $ret;
            }
        );

        # Method event 'parallelTo' definition
        my $func_17 = method_event_def(
            $f, $scope,
            'parallelTo',
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
                need( $scope, $args, 'ehs', 129.2 ) || return $ret_func->();
                var(
                    $scope,
                    u1 => $$self->{'unitVector'},
                    $file_scope, $pos->(130.2)
                );
                var(
                    $scope,
                    u2 => $$scope->{'ehs'}
                      ->property_u( 'unitVector', $pos->(131.4) ),
                    $file_scope, $pos->(131.2)
                );
                if (
                    bool(
                        any_true(
                            $scope,
                            $pos->(132.15),
                            sub {
                                equal(
                                    $scope,          $pos->(132.15),
                                    $$scope->{'u1'}, $$scope->{'u2'}
                                );
                            },
                            sub {
                                equal(
                                    $scope,
                                    $pos->(132.15),
                                    _sub(
                                        $scope,   $pos->(132.15),
                                        $f->zero, $$scope->{'u1'}
                                    ),
                                    $$scope->{'u2'}
                                );
                            }
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->($true);
                }
                return $ret_func->($false);
                return $ret;
            }
        );

        # Method event 'getValue' definition
        my $func_18 = method_event_def(
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
                need( $scope, $args, 'index', 140.2 ) || return $ret_func->();
                return $ret_func->(
                    $$self->{'items'}->get_index_value(
                        [ $$scope->{'index'} ],
                        $scope, $pos->(141.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'copy' definition
        my $func_19 = method_event_def(
            $f, $scope, 'copy', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$scope->{'Vector'}->(
                        [
                            undef,
                            [
                                items => $$self->{'items'}
                                  ->property_u( 'copy', $pos->(146.3) )->(
                                    [ undef, [] ], $scope,
                                    undef, $pos->(146.35)
                                  )
                            ]
                        ],
                        $scope, undef,
                        $pos->(146.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $func_20 = method_event_def(
            $f, $scope,
            'description',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    add(
                        $scope,
                        $pos->(150.15),
                        str( $f, "<" ),
                        $$self->{'items'}->property_u( 'join', $pos->(150.25) )
                          ->(
                            [ str( $f, ", " ) ], $scope,
                            undef, $pos->(150.3)
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
            unitVector => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_5->inside_scope(
            opAdd => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_6->inside_scope(
            opSub => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_7->inside_scope(
            opSub => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_9->inside_scope(
            opMul => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_10->inside_scope(
            opDiv => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_11->inside_scope(
            opMul => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_12->inside_scope(
            opEqual => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_13->inside_scope(
            dot => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_14->inside_scope(
            cross => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_15->inside_scope(
            angleBetween => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_16->inside_scope(
            orthogonalTo => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_17->inside_scope(
            parallelTo => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_18->inside_scope(
            getValue => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_19->inside_scope(
            copy => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_20->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Error Math Num Vector) );
};

after_content();
