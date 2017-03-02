# === Document Model ===
#  Document './std/Math/Matrix.frt'
#      Package 'Math'
#      Class 'Matrix'
#          Class method 'initializer__' { $m:Int ?$items:Num... }
#              Function body
#                  Instruction
#                      Need
#                          Instance variable '@m'
#                          Argument type
#                              Bareword 'Int'
#                  Instruction
#                      Want (...)
#                          Instance variable '@items'
#                          Argument type
#                              Bareword 'Num'
#          Computed property 'rows' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Instance variable '@m'
#          Computed property 'columns' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Operation
#                              Property 'length'
#                                  Instance variable '@items'
#                              Division operator (/)
#                              Instance variable '@m'
#          Computed property 'dimensionHR' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Operation
#                              Instance variable '@rows'
#                              Addition operator (+)
#                              String 'x'
#                              Addition operator (+)
#                              Instance variable '@columns'
#          Computed property 'rowList' { -> $result }
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$items'
#                          Call
#                              Property 'copy'
#                                  Instance variable '@items'
#                  Instruction
#                      Return
#                          Gather
#                              Gather body
#                                  For (while)
#                                      Expression ('for' parameter)
#                                          Assignment
#                                              Lexical variable '$row'
#                                              Call
#                                                  Property 'splice'
#                                                      Lexical variable '$items'
#                                                  Argument list [2 items]
#                                                      Item 0
#                                                          Number '0'
#                                                      Item 1
#                                                          Instance variable '@columns'
#                                      Expression ('in' parameter)
#                                      For body
#                                          Instruction
#                                              Take
#                                                  Lexical variable '$row'
#          Method 'map' { $code:Code -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$code'
#                          Argument type
#                              Bareword 'Code'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Matrix'
#                              Named argument list [2 items]
#                                  Item 0
#                                      Pair 'm'
#                                          Instance variable '@m'
#                                  Item 1
#                                      Pair 'items'
#                                          Call
#                                              Property 'map'
#                                                  Instance variable '@items'
#                                              Argument list [1 item]
#                                                  Item 0
#                                                      Lexical variable '$code'
#          Method 'mapWith' { $rhs:Matrix $code:Code -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$rhs'
#                          Argument type
#                              Bareword 'Matrix'
#                  Instruction
#                      Need
#                          Lexical variable '$code'
#                          Argument type
#                              Bareword 'Code'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Instance variable '@dimensionHR'
#                              Negated equality operator (!=)
#                              Property 'dimensionHR'
#                                  Lexical variable '$rhs'
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
#                                                  Instance variable '@dimensionHR'
#                                                  Addition operator (+)
#                                                  String ' != '
#                                                  Addition operator (+)
#                                                  Property 'dimensionHR'
#                                                      Lexical variable '$rhs'
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
#                                                  Call
#                                                      Lexical variable '$code'
#                                                      Argument list [2 items]
#                                                          Item 0
#                                                              Index
#                                                                  Property 'items'
#                                                                      Special variable '*self'
#                                                                  Index list [1 item]
#                                                                      Item 0
#                                                                          Lexical variable '$i'
#                                                          Item 1
#                                                              Index
#                                                                  Property 'items'
#                                                                      Lexical variable '$rhs'
#                                                                  Index list [1 item]
#                                                                      Item 0
#                                                                          Lexical variable '$i'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Matrix'
#                              Named argument list [2 items]
#                                  Item 0
#                                      Pair 'm'
#                                          Instance variable '@m'
#                                  Item 1
#                                      Pair 'items'
#                                          Lexical variable '$items'
#          Method 'opAdd' { $ehs:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@map'
#                              Argument list [1 item]
#                                  Item 0
#                                      Anonymous function { -> $result }
#                                          Function body
#                                              Instruction
#                                                  Return
#                                                      Operation
#                                                          Topic variable '$_'
#                                                          Addition operator (+)
#                                                          Lexical variable '$ehs'
#          Method 'opSub' { $rhs:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$rhs'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@map'
#                              Argument list [1 item]
#                                  Item 0
#                                      Anonymous function { -> $result }
#                                          Function body
#                                              Instruction
#                                                  Return
#                                                      Operation
#                                                          Topic variable '$_'
#                                                          Subtraction operator (-)
#                                                          Lexical variable '$rhs'
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
#                              Instance variable '@map'
#                              Argument list [1 item]
#                                  Item 0
#                                      Anonymous function { -> $result }
#                                          Function body
#                                              Instruction
#                                                  Return
#                                                      Operation
#                                                          Constant zero
#                                                          Negation operator (-)
#                                                          Topic variable '$_'
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
#                              Instance variable '@map'
#                              Argument list [1 item]
#                                  Item 0
#                                      Anonymous function { -> $result }
#                                          Function body
#                                              Instruction
#                                                  Return
#                                                      Operation
#                                                          Topic variable '$_'
#                                                          Multiplication operator (*)
#                                                          Lexical variable '$ehs'
#          Method 'opDiv' { $rhs:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$rhs'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@map'
#                              Argument list [1 item]
#                                  Item 0
#                                      Anonymous function { -> $result }
#                                          Function body
#                                              Instruction
#                                                  Return
#                                                      Operation
#                                                          Topic variable '$_'
#                                                          Division operator (/)
#                                                          Lexical variable '$rhs'
#          Method 'opAdd' { $ehs:Matrix -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Matrix'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@mapWith'
#                              Argument list [2 items]
#                                  Item 0
#                                      Lexical variable '$ehs'
#                                  Item 1
#                                      Anonymous function { $a $b -> $result }
#                                          Function body
#                                              Instruction
#                                                  Need
#                                                      Lexical variable '$a'
#                                              Instruction
#                                                  Need
#                                                      Lexical variable '$b'
#                                              Instruction
#                                                  Return
#                                                      Operation
#                                                          Lexical variable '$a'
#                                                          Addition operator (+)
#                                                          Lexical variable '$b'
#          Method 'opSub' { $rhs:Matrix -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$rhs'
#                          Argument type
#                              Bareword 'Matrix'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@mapWith'
#                              Argument list [2 items]
#                                  Item 0
#                                      Lexical variable '$rhs'
#                                  Item 1
#                                      Anonymous function { $a $b -> $result }
#                                          Function body
#                                              Instruction
#                                                  Need
#                                                      Lexical variable '$a'
#                                              Instruction
#                                                  Need
#                                                      Lexical variable '$b'
#                                              Instruction
#                                                  Return
#                                                      Operation
#                                                          Lexical variable '$a'
#                                                          Subtraction operator (-)
#                                                          Lexical variable '$b'
#          Method 'description' { -> $result }
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$str'
#                          String ''
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$row'
#                      Expression ('in' parameter)
#                          Instance variable '@rowList'
#                      For body
#                          Instruction
#                              Addition assignment
#                                  Lexical variable '$str'
#                                  Operation
#                                      String '[ '
#                                      Addition operator (+)
#                                      Call
#                                          Property 'join'
#                                              Lexical variable '$row'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  String ' '
#                                      Addition operator (+)
#                                      String ' ]'
#                                      Addition operator (+)
#                                      String '␤'
#                  Instruction
#                      Return
#                          Lexical variable '$str'
#      Include (Code, Error, Int, Matrix, Num)
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

my $file_name = './std/Math/Matrix.frt';
my $pos = before_content( 'Matrix.frt', $file_name );

use Ferret::Core::Operations qw(_sub add bool div mul nequal num range str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'Math' );
    my $scope = $file_scope;
    load_core('Math');

    # Anonymous function definition with topicalizer
    my $func_7 = function_def(
        $f, undef, undef,
        [ { name => '_' } ],
        undef,
        sub {
            my ( $scope, $self, $this, undef, $args, $ret ) = &args_v1;
            my $ins = $args->{_};
            return $ret_func->(
                add( $scope, $pos->(58.35), $ins, $$scope->{'ehs'} ) );
            return $ret;
        }
    );

    # Anonymous function definition with topicalizer
    my $func_9 = function_def(
        $f, undef, undef,
        [ { name => '_' } ],
        undef,
        sub {
            my ( $scope, $self, $this, undef, $args, $ret ) = &args_v1;
            my $ins = $args->{_};
            return $ret_func->(
                _sub( $scope, $pos->(64.35), $ins, $$scope->{'rhs'} ) );
            return $ret;
        }
    );

    # Anonymous function definition with topicalizer
    my $func_11 = function_def(
        $f, undef, undef,
        [ { name => '_' } ],
        undef,
        sub {
            my ( $scope, $self, $this, undef, $args, $ret ) = &args_v1;
            my $ins = $args->{_};
            return $ret_func->( _sub( $scope, $pos->(72.6), $f->zero, $ins ) );
            return $ret;
        }
    );

    # Anonymous function definition with topicalizer
    my $func_13 = function_def(
        $f, undef, undef,
        [ { name => '_' } ],
        undef,
        sub {
            my ( $scope, $self, $this, undef, $args, $ret ) = &args_v1;
            my $ins = $args->{_};
            return $ret_func->(
                mul( $scope, $pos->(78.35), $ins, $$scope->{'ehs'} ) );
            return $ret;
        }
    );

    # Anonymous function definition with topicalizer
    my $func_15 = function_def(
        $f, undef, undef,
        [ { name => '_' } ],
        undef,
        sub {
            my ( $scope, $self, $this, undef, $args, $ret ) = &args_v1;
            my $ins = $args->{_};
            return $ret_func->(
                div( $scope, $pos->(84.35), $ins, $$scope->{'rhs'} ) );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_17 = function_def(
        $f, undef, undef,
        [
            { name => 'a', type => undef, optional => undef, more => undef },
            { name => 'b', type => undef, optional => undef, more => undef }
        ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'a', 91.2 ) || return $ret_func->();
            need( $scope, $args, 'b', 91.4 ) || return $ret_func->();
            return $ret_func->(
                add( $scope, $pos->(92.3), $$scope->{'a'}, $$scope->{'b'} ) );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_19 = function_def(
        $f, undef, undef,
        [
            { name => 'a', type => undef, optional => undef, more => undef },
            { name => 'b', type => undef, optional => undef, more => undef }
        ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'a', 100.2 ) || return $ret_func->();
            need( $scope, $args, 'b', 100.4 ) || return $ret_func->();
            return $ret_func->(
                _sub( $scope, $pos->(101.3), $$scope->{'a'}, $$scope->{'b'} ) );
            return $ret;
        }
    );

    # Class 'Matrix'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Matrix', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'm',
                    type     => 'Int',
                    optional => undef,
                    more     => undef
                },
                { name => 'items', type => 'Num', optional => 1, more => 1 }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $self, $args, 'm' ) || return $ret_func->();
                want( $self, $args, 'items', 9.2 );
                return $ret;
            }
        );

        # Method event 'rows' definition
        my $func_1 = method_event_def(
            $f, $scope, 'rows', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->( $$self->{'m'} );
                return $ret;
            }
        );

        # Method event 'columns' definition
        my $func_2 = method_event_def(
            $f, $scope,
            'columns',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    div(
                        $scope,
                        $pos->(19.4),
                        $$self->{'items'}->property_u( 'length', $pos->(19.3) ),
                        $$self->{'m'}
                    )
                );
                return $ret;
            }
        );

        # Method event 'dimensionHR' definition
        my $func_3 = method_event_def(
            $f, $scope,
            'dimensionHR',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    add(
                        $scope, $pos->(24.3),
                        $$self->{'rows'}, str( $f, "x" ),
                        $$self->{'columns'}
                    )
                );
                return $ret;
            }
        );

        # Method event 'rowList' definition
        my $func_4 = method_event_def(
            $f, $scope,
            'rowList',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var(
                    $scope,
                    items =>
                      $$self->{'items'}->property_u( 'copy', $pos->(29.4) )
                      ->( [ undef, [] ], $scope, undef, $pos->(29.5) ),
                    $file_scope, $pos->(29.2)
                );
                return $ret_func->(
                    do {
                        my ( $gather_status, $gather_ret ) = gather(
                            $f, $scope,
                            sub {
                                my ( $scope, $take, $ret_func ) = @_;
                                {
                                    my ( $loop_status, $loop_ret ) =
                                      while_true(
                                        $f, $scope,
                                        sub {
                                            var(
                                                $scope,
                                                row => $$scope->{'items'}
                                                  ->property_u( 'splice',
                                                    $pos->(30.3) )->(
                                                    [
                                                        num( $f, "0" ),
                                                        $$self->{'columns'}
                                                    ],
                                                    $scope, undef,
                                                    $pos->(30.35)
                                                    ),
                                                $file_scope,
                                                $pos->(30.2)
                                            );
                                        },
                                        sub {
                                            my ( $scope, $ret_func ) = @_;
                                            $take->( $$scope->{'row'} );
                                        },
                                        $pos->(30.1)
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
                );
                return $ret;
            }
        );

        # Method event 'map' definition
        my $func_5 = method_event_def(
            $f, $scope, 'map',
            [
                {
                    name     => 'code',
                    type     => 'Code',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'code', 37.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Matrix'}->(
                        [
                            undef,
                            [
                                m     => $$self->{'m'},
                                items => $$self->{'items'}
                                  ->property_u( 'map', $pos->(38.45) )->(
                                    [ $$scope->{'code'} ], $scope,
                                    undef,                 $pos->(38.5)
                                  )
                            ]
                        ],
                        $scope, undef,
                        $pos->(38.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'mapWith' definition
        my $func_6 = method_event_def(
            $f, $scope,
            'mapWith',
            [
                {
                    name     => 'rhs',
                    type     => 'Matrix',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'code',
                    type     => 'Code',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'rhs',  44.2 ) || return $ret_func->();
                need( $scope, $args, 'code', 45.2 ) || return $ret_func->();
                if (
                    bool(
                        nequal(
                            $scope,
                            $pos->(47.3),
                            $$self->{'dimensionHR'},
                            $$scope->{'rhs'}
                              ->property_u( 'dimensionHR', $pos->(47.5) )
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
                                        $$self->{'dimensionHR'},
                                        str( $f, " != " ),
                                        $$scope->{'rhs'}->property_u(
                                            'dimensionHR', $pos->(48.65)
                                        )
                                    )
                                ],
                                $scope, undef,
                                $pos->(48.15)
                            ),
                            $pos->(48.05)
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
                                            $pos->(49.35),
                                            num( $f, "0" ),
                                            $$self->{'items'}->property_u(
                                                'lastIndex', $pos->(49.45)
                                            )
                                        ),
                                        'i',
                                        sub {
                                            my ( $scope, $ret_func ) = @_;
                                            $take->(
                                                $$scope->{'code'}->(
                                                    [
                                                        ${ $scope->{special} }
                                                          ->{'self'}
                                                          ->property_u( 'items',
                                                            $pos->(50.25) )
                                                          ->get_index_value(
                                                            [ $$scope->{'i'} ],
                                                            $scope,
                                                            $pos->(50.3)
                                                          ),
                                                        $$scope->{'rhs'}
                                                          ->property_u( 'items',
                                                            $pos->(50.55) )
                                                          ->get_index_value(
                                                            [ $$scope->{'i'} ],
                                                            $scope,
                                                            $pos->(50.6)
                                                          )
                                                    ],
                                                    $scope, undef,
                                                    $pos->(50.15)
                                                )
                                            );
                                        },
                                        $pos->(49.15)
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
                    $pos->(49.1)
                );
                return $ret_func->(
                    $$scope->{'Matrix'}->(
                        [
                            undef,
                            [ m => $$self->{'m'}, items => $$scope->{'items'} ]
                        ],
                        $scope, undef,
                        $pos->(52.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opAdd' definition
        my $func_8 = method_event_def(
            $f, $scope, 'opAdd',
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
                need( $scope, $args, 'ehs', 57.2 ) || return $ret_func->();
                return $ret_func->(
                    $$self->{'map'}->(
                        [
                            $func_7->inside_scope(
                                (undef) => $scope,
                                undef, $class, $ins, undef, undef
                            )
                        ],
                        $scope, undef,
                        $pos->(58.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opSub' definition
        my $func_10 = method_event_def(
            $f, $scope, 'opSub',
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
                need( $scope, $args, 'rhs', 63.2 ) || return $ret_func->();
                return $ret_func->(
                    $$self->{'map'}->(
                        [
                            $func_9->inside_scope(
                                (undef) => $scope,
                                undef, $class, $ins, undef, undef
                            )
                        ],
                        $scope, undef,
                        $pos->(64.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opSub' definition
        my $func_12 = method_event_def(
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
                need( $scope, $args, 'lhs', 69.2 ) || return $ret_func->();
                if (
                    bool(
                        nequal(
                            $scope, $pos->(70.3),
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
                            $pos->(71.1)
                        )
                    );
                }
                return $ret_func->(
                    $$self->{'map'}->(
                        [
                            $func_11->inside_scope(
                                (undef) => $scope,
                                undef, $class, $ins, undef, undef
                            )
                        ],
                        $scope, undef,
                        $pos->(72.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opMul' definition
        my $func_14 = method_event_def(
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
                need( $scope, $args, 'ehs', 77.2 ) || return $ret_func->();
                return $ret_func->(
                    $$self->{'map'}->(
                        [
                            $func_13->inside_scope(
                                (undef) => $scope,
                                undef, $class, $ins, undef, undef
                            )
                        ],
                        $scope, undef,
                        $pos->(78.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opDiv' definition
        my $func_16 = method_event_def(
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
                need( $scope, $args, 'rhs', 83.2 ) || return $ret_func->();
                return $ret_func->(
                    $$self->{'map'}->(
                        [
                            $func_15->inside_scope(
                                (undef) => $scope,
                                undef, $class, $ins, undef, undef
                            )
                        ],
                        $scope, undef,
                        $pos->(84.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opAdd' definition
        my $func_18 = method_event_def(
            $f, $scope, 'opAdd',
            [
                {
                    name     => 'ehs',
                    type     => 'Matrix',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'ehs', 89.2 ) || return $ret_func->();
                return $ret_func->(
                    $$self->{'mapWith'}->(
                        [
                            $$scope->{'ehs'},
                            $func_17->inside_scope(
                                (undef) => $scope,
                                undef, $class, $ins, undef, undef
                            )
                        ],
                        $scope, undef,
                        $pos->(90.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opSub' definition
        my $func_20 = method_event_def(
            $f, $scope, 'opSub',
            [
                {
                    name     => 'rhs',
                    type     => 'Matrix',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'rhs', 98.2 ) || return $ret_func->();
                return $ret_func->(
                    $$self->{'mapWith'}->(
                        [
                            $$scope->{'rhs'},
                            $func_19->inside_scope(
                                (undef) => $scope,
                                undef, $class, $ins, undef, undef
                            )
                        ],
                        $scope, undef,
                        $pos->(99.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $func_21 = method_event_def(
            $f, $scope,
            'description',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var( $scope, str => str( $f, "" ), $file_scope, $pos->(106.2) );
                {
                    my ( $loop_status, $loop_ret ) = iterate(
                        $f, $scope,
                        $$self->{'rowList'},
                        'row',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            var(
                                $scope,
                                str => add(
                                    $scope,
                                    $pos->(108.1),
                                    $$scope->{'str'},
                                    add(
                                        $scope,
                                        $pos->(108.2),
                                        str( $f, "[ " ),
                                        $$scope->{'row'}
                                          ->property_u( 'join', $pos->(108.3) )
                                          ->(
                                            [ str( $f, " " ) ],
                                            $scope,
                                            undef,
                                            $pos->(108.35)
                                          ),
                                        str( $f, " ]" ),
                                        str( $f, "\n" )
                                    )
                                ),
                                $file_scope,
                                $pos->(108.1)
                            );
                        },
                        $pos->(107.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret_func->( $$scope->{'str'} );
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope( rows => $scope, $proto, $class, $ins, 1, undef );
        $func_2->inside_scope(
            columns => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_3->inside_scope(
            dimensionHR => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_4->inside_scope(
            rowList => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_5->inside_scope(
            map => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_6->inside_scope(
            mapWith => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_8->inside_scope(
            opAdd => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_10->inside_scope(
            opSub => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_12->inside_scope(
            opSub => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_14->inside_scope(
            opMul => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_16->inside_scope(
            opDiv => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_18->inside_scope(
            opAdd => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_20->inside_scope(
            opSub => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_21->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, $file_name, qw(Code Error Int Matrix Num) );
};

after_content($file_name);
