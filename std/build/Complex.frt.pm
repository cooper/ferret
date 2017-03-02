# === Document Model ===
#  File './std/Complex.frt'
#      Package 'main'
#          Class 'Complex' version 1.0
#              Class method 'initializer__' { $a:Num $b:Num -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Instance variable '@a'
#                              Argument type
#                                  Bareword 'Num'
#                      Instruction
#                          Need
#                              Instance variable '@b'
#                              Argument type
#                                  Bareword 'Num'
#                      If
#                          Expression ('if' parameter)
#                              Operation
#                                  Instance variable '@b'
#                                  Equality operator (==)
#                                  Number '0'
#                          If body
#                              Instruction
#                                  Return
#                                      Instance variable '@a'
#              Class method 'polar' { $r:Num $θ:Num -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$r'
#                              Argument type
#                                  Bareword 'Num'
#                      Instruction
#                          Need
#                              Lexical variable '$θ'
#                              Argument type
#                                  Bareword 'Num'
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'Complex'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Operation
#                                              Lexical variable '$r'
#                                              Multiplication operator (*)
#                                              Call
#                                                  Property 'cos'
#                                                      Bareword 'Math'
#                                                  Argument list [1 item]
#                                                      Item 0
#                                                          Lexical variable '$θ'
#                                      Item 1
#                                          Operation
#                                              Lexical variable '$r'
#                                              Multiplication operator (*)
#                                              Call
#                                                  Property 'sin'
#                                                      Bareword 'Math'
#                                                  Argument list [1 item]
#                                                      Item 0
#                                                          Lexical variable '$θ'
#              Computed property 'abs' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Property 'sqrt'
#                                  Single value [1 item]
#                                      Item 0
#                                          Operation
#                                              Instance variable '@a'
#                                              Exponent operator (^)
#                                              Number '2'
#                                              Addition operator (+)
#                                              Instance variable '@b'
#                                              Exponent operator (^)
#                                              Number '2'
#              Computed property 'arg' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Call
#                                  Property 'atan2'
#                                      Bareword 'Math'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Instance variable '@b'
#                                      Item 1
#                                          Instance variable '@a'
#              Computed property 'conj' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'Complex'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Instance variable '@a'
#                                      Item 1
#                                          Operation
#                                              Constant zero
#                                              Negation operator (-)
#                                              Instance variable '@b'
#              Method 'opAdd' { $rhs:Complex -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$rhs'
#                              Argument type
#                                  Bareword 'Complex'
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'Complex'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Operation
#                                              Instance variable '@a'
#                                              Addition operator (+)
#                                              Property 'a'
#                                                  Lexical variable '$rhs'
#                                      Item 1
#                                          Operation
#                                              Instance variable '@b'
#                                              Addition operator (+)
#                                              Property 'b'
#                                                  Lexical variable '$rhs'
#              Method 'opAdd' { $ehs:Num -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$ehs'
#                              Argument type
#                                  Bareword 'Num'
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'Complex'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Operation
#                                              Instance variable '@a'
#                                              Addition operator (+)
#                                              Lexical variable '$ehs'
#                                      Item 1
#                                          Instance variable '@b'
#              Method 'opSub' { $rhs:Complex -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$rhs'
#                              Argument type
#                                  Bareword 'Complex'
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'Complex'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Operation
#                                              Instance variable '@a'
#                                              Subtraction operator (-)
#                                              Property 'a'
#                                                  Lexical variable '$rhs'
#                                      Item 1
#                                          Operation
#                                              Instance variable '@b'
#                                              Subtraction operator (-)
#                                              Property 'b'
#                                                  Lexical variable '$rhs'
#              Method 'opSub' { $rhs:Num -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$rhs'
#                              Argument type
#                                  Bareword 'Num'
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'Complex'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Operation
#                                              Instance variable '@a'
#                                              Subtraction operator (-)
#                                              Lexical variable '$rhs'
#                                      Item 1
#                                          Instance variable '@b'
#              Method 'opSub' { $lhs:Num -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$lhs'
#                              Argument type
#                                  Bareword 'Num'
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'Complex'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Operation
#                                              Lexical variable '$lhs'
#                                              Subtraction operator (-)
#                                              Instance variable '@a'
#                                      Item 1
#                                          Operation
#                                              Constant zero
#                                              Negation operator (-)
#                                              Instance variable '@b'
#              Method 'opMul' { $rhs:Complex -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$rhs'
#                              Argument type
#                                  Bareword 'Complex'
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'Complex'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Operation
#                                              Instance variable '@a'
#                                              Multiplication operator (*)
#                                              Property 'a'
#                                                  Lexical variable '$rhs'
#                                              Subtraction operator (-)
#                                              Instance variable '@b'
#                                              Multiplication operator (*)
#                                              Property 'b'
#                                                  Lexical variable '$rhs'
#                                      Item 1
#                                          Operation
#                                              Instance variable '@a'
#                                              Multiplication operator (*)
#                                              Property 'b'
#                                                  Lexical variable '$rhs'
#                                              Addition operator (+)
#                                              Instance variable '@b'
#                                              Multiplication operator (*)
#                                              Property 'a'
#                                                  Lexical variable '$rhs'
#              Method 'opMul' { $ehs:Num -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$ehs'
#                              Argument type
#                                  Bareword 'Num'
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'Complex'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Operation
#                                              Lexical variable '$ehs'
#                                              Multiplication operator (*)
#                                              Instance variable '@a'
#                                      Item 1
#                                          Operation
#                                              Lexical variable '$ehs'
#                                              Multiplication operator (*)
#                                              Instance variable '@b'
#              Method 'opDiv' { $rhs:Complex -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$rhs'
#                              Argument type
#                                  Bareword 'Complex'
#                      Instruction
#                          Assignment
#                              Lexical variable '$conj'
#                              Property 'conj'
#                                  Lexical variable '$rhs'
#                      Instruction
#                          Assignment
#                              Lexical variable '$num'
#                              Operation
#                                  Special variable '*self'
#                                  Multiplication operator (*)
#                                  Lexical variable '$conj'
#                      Instruction
#                          Assignment
#                              Lexical variable '$den'
#                              Operation
#                                  Lexical variable '$rhs'
#                                  Multiplication operator (*)
#                                  Lexical variable '$conj'
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'Complex'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Operation
#                                              Property 'a'
#                                                  Lexical variable '$num'
#                                              Division operator (/)
#                                              Property 'a'
#                                                  Lexical variable '$den'
#                                      Item 1
#                                          Operation
#                                              Property 'b'
#                                                  Lexical variable '$num'
#                                              Division operator (/)
#                                              Property 'a'
#                                                  Lexical variable '$den'
#              Method 'opDiv' { $rhs:Num -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$rhs'
#                              Argument type
#                                  Bareword 'Num'
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'Complex'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Operation
#                                              Instance variable '@a'
#                                              Division operator (/)
#                                              Lexical variable '$rhs'
#                                      Item 1
#                                          Operation
#                                              Instance variable '@b'
#                                              Division operator (/)
#                                              Lexical variable '$rhs'
#              Method 'opPow' { $rhs:Num -> $result $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$rhs'
#                              Argument type
#                                  Bareword 'Num'
#                      If
#                          Expression ('if' parameter)
#                              Operation
#                                  Lexical variable '$rhs'
#                                  Less than or equal to operator (<=)
#                                  Number '0'
#                          If body
#                              Instruction
#                                  Return
#                                      Number '1'
#                      Instruction
#                          Return
#                              Operation
#                                  Special variable '*self'
#                                  Multiplication operator (*)
#                                  Special variable '*self'
#                                  Exponent operator (^)
#                                  Single value [1 item]
#                                      Item 0
#                                          Operation
#                                              Lexical variable '$rhs'
#                                              Subtraction operator (-)
#                                              Number '1'
#              Method 'pow' { $rhs:Num -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$rhs'
#                              Argument type
#                                  Bareword 'Num'
#                      Instruction
#                          Assignment
#                              Lexical variable '$log_a'
#                              Call
#                                  Property 'log'
#                                      Bareword 'Math'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Instance variable '@abs'
#                      Instruction
#                          Assignment
#                              Lexical variable '$factor'
#                              Call
#                                  Property 'exp'
#                                      Bareword 'Math'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Operation
#                                              Lexical variable '$rhs'
#                                              Multiplication operator (*)
#                                              Lexical variable '$log_a'
#                      Instruction
#                          Assignment
#                              Lexical variable '$θ'
#                              Operation
#                                  Lexical variable '$rhs'
#                                  Multiplication operator (*)
#                                  Instance variable '@arg'
#                      Instruction
#                          Return
#                              Call
#                                  Bareword 'Complex'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Operation
#                                              Lexical variable '$factor'
#                                              Multiplication operator (*)
#                                              Call
#                                                  Property 'cos'
#                                                      Bareword 'Math'
#                                                  Argument list [1 item]
#                                                      Item 0
#                                                          Lexical variable '$θ'
#                                      Item 1
#                                          Operation
#                                              Lexical variable '$factor'
#                                              Multiplication operator (*)
#                                              Call
#                                                  Property 'sin'
#                                                      Bareword 'Math'
#                                                  Argument list [1 item]
#                                                      Item 0
#                                                          Lexical variable '$θ'
#              Method 'opEqual' { $ehs:Complex -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$ehs'
#                              Argument type
#                                  Bareword 'Complex'
#                      Instruction
#                          Return
#                              Operation
#                                  Instance variable '@a'
#                                  Equality operator (==)
#                                  Property 'a'
#                                      Lexical variable '$ehs'
#                                  Logical and operator (&&)
#                                  Instance variable '@b'
#                                  Equality operator (==)
#                                  Property 'b'
#                                      Lexical variable '$ehs'
#              Method 'opEqual' { $ehs:Num -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$ehs'
#                              Argument type
#                                  Bareword 'Num'
#                      Instruction
#                          Return
#                              Operation
#                                  Instance variable '@a'
#                                  Equality operator (==)
#                                  Lexical variable '$ehs'
#                                  Logical and operator (&&)
#                                  Instance variable '@b'
#                                  Equality operator (==)
#                                  Number '0'
#              Method 'description' { -> $result $result }
#                  Function body
#                      Instruction
#                          Assignment
#                              Lexical variable '$r'
#                              Instance variable '@a'
#                      Instruction
#                          Assignment
#                              Lexical variable '$i'
#                              Instance variable '@b'
#                      If
#                          Expression ('if' parameter)
#                              Operation
#                                  Lexical variable '$r'
#                                  Equality operator (==)
#                                  Number '0'
#                                  Logical and operator (&&)
#                                  Lexical variable '$i'
#                                  Equality operator (==)
#                                  Number '0'
#                          If body
#                              Instruction
#                                  Return
#                                      String '0'
#                      If
#                          Expression ('if' parameter)
#                              Operation
#                                  Lexical variable '$r'
#                                  Equality operator (==)
#                                  Number '0'
#                          If body
#                              Instruction
#                                  Assignment
#                                      Lexical variable '$r'
#                                      String ''
#                      If
#                          Expression ('if' parameter)
#                              Operation
#                                  Lexical variable '$i'
#                                  Equality operator (==)
#                                  Number '0'
#                          If body
#                              Instruction
#                                  Assignment
#                                      Lexical variable '$i'
#                                      String ''
#                      If
#                          Expression ('if' parameter)
#                              Operation
#                                  Lexical variable '$i'
#                                  Equality operator (==)
#                                  Constant zero
#                                  Negation operator (-)
#                                  Number '1'
#                          If body
#                              Instruction
#                                  Assignment
#                                      Lexical variable '$i'
#                                      String '-i'
#                      If
#                          Expression ('if' parameter)
#                              Operation
#                                  Lexical variable '$i'
#                                  Less than operator (<)
#                                  Number '0'
#                          If body
#                              Instruction
#                                  Addition assignment
#                                      Lexical variable '$i'
#                                      String 'i'
#                      If
#                          Expression ('if' parameter)
#                              Operation
#                                  Lexical variable '$i'
#                                  Equality operator (==)
#                                  Number '1'
#                          If body
#                              Instruction
#                                  Assignment
#                                      Lexical variable '$i'
#                                      String '+i'
#                      Else
#                          Else body
#                              Instruction
#                                  Assignment
#                                      Lexical variable '$i'
#                                      Operation
#                                          String '+'
#                                          Addition operator (+)
#                                          Lexical variable '$i'
#                                          Addition operator (+)
#                                          String 'i'
#                      Instruction
#                          Return
#                              Call
#                                  Property 'trimPrefix'
#                                      Single value [1 item]
#                                          Item 0
#                                              Operation
#                                                  Lexical variable '$r'
#                                                  Addition operator (+)
#                                                  Lexical variable '$i'
#                                  Argument list [1 item]
#                                      Item 0
#                                          String '+'
#          Include (Complex, Math, Num)
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
use Ferret::Core::Operations
  qw(_sub add all_true bool div equal less less_e mul num pow str);

my ( $self, $ins );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $file_name = './std/Complex.frt';
my $pos = before_content( 'Complex.frt', $file_name );
my $result;

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'Complex'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Complex', 1.0, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'a',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'b',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $self, $args, 'a' ) || return $ret_func->();
                need( $self, $args, 'b' ) || return $ret_func->();
                if (
                    bool(
                        equal(
                            $scope, $pos->(24.3),
                            $$self->{'b'}, num( $f, "0" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( $$self->{'a'} );
                }
                return $ret;
            }
        );

        # Method event 'polar' definition
        my $func_1 = method_event_def(
            $f, $scope, 'polar',
            [
                {
                    name     => 'r',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'θ',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'r', 30.2 ) || return $ret_func->();
                need( $scope, $args, 'θ', 31.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            mul(
                                $scope,
                                $pos->(34.2),
                                $$scope->{'r'},
                                $$scope->{'Math'}
                                  ->property_u( 'cos', $pos->(34.4) )->(
                                    [ $$scope->{'θ'} ], $scope,
                                    undef,              $pos->(34.5)
                                  )
                            ),
                            mul(
                                $scope,
                                $pos->(35.2),
                                $$scope->{'r'},
                                $$scope->{'Math'}
                                  ->property_u( 'sin', $pos->(35.4) )->(
                                    [ $$scope->{'θ'} ], $scope,
                                    undef,              $pos->(35.5)
                                  )
                            )
                        ],
                        $scope, undef,
                        $pos->(33.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'abs' definition
        my $func_2 = method_event_def(
            $f, $scope, 'abs', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    add(
                        $scope,
                        $pos->(44.2),
                        pow(
                            $scope, $pos->(44.2),
                            $$self->{'a'}, num( $f, "2" )
                        ),
                        pow(
                            $scope, $pos->(44.2),
                            $$self->{'b'}, num( $f, "2" )
                        )
                    )->property_u( 'sqrt', $pos->(44.55) )
                );
                return $ret;
            }
        );

        # Method event 'arg' definition
        my $func_3 = method_event_def(
            $f, $scope, 'arg', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$scope->{'Math'}->property_u( 'atan2', $pos->(53.15) )->(
                        [ $$self->{'b'}, $$self->{'a'} ], $scope,
                        undef, $pos->(53.2)
                    )
                );
                return $ret;
            }
        );

        # Method event 'conj' definition
        my $func_4 = method_event_def(
            $f, $scope, 'conj', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            $$self->{'a'},
                            _sub(
                                $scope,   $pos->(59.3),
                                $f->zero, $$self->{'b'}
                            )
                        ],
                        $scope, undef,
                        $pos->(59.15)
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
                    name     => 'rhs',
                    type     => 'Complex',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'rhs', 64.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            add(
                                $scope,
                                $pos->(65.25),
                                $$self->{'a'},
                                $$scope->{'rhs'}
                                  ->property_u( 'a', $pos->(65.35) )
                            ),
                            add(
                                $scope,
                                $pos->(65.5),
                                $$self->{'b'},
                                $$scope->{'rhs'}
                                  ->property_u( 'b', $pos->(65.6) )
                            )
                        ],
                        $scope, undef,
                        $pos->(65.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opAdd' definition
        my $func_6 = method_event_def(
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
                need( $scope, $args, 'ehs', 70.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            add(
                                $scope,        $pos->(71.25),
                                $$self->{'a'}, $$scope->{'ehs'}
                            ),
                            $$self->{'b'}
                        ],
                        $scope, undef,
                        $pos->(71.15)
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
                    type     => 'Complex',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'rhs', 76.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            _sub(
                                $scope,
                                $pos->(77.25),
                                $$self->{'a'},
                                $$scope->{'rhs'}
                                  ->property_u( 'a', $pos->(77.35) )
                            ),
                            _sub(
                                $scope,
                                $pos->(77.5),
                                $$self->{'b'},
                                $$scope->{'rhs'}
                                  ->property_u( 'b', $pos->(77.6) )
                            )
                        ],
                        $scope, undef,
                        $pos->(77.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opSub' definition
        my $func_8 = method_event_def(
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
                need( $scope, $args, 'rhs', 82.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            _sub(
                                $scope,        $pos->(83.25),
                                $$self->{'a'}, $$scope->{'rhs'}
                            ),
                            $$self->{'b'}
                        ],
                        $scope, undef,
                        $pos->(83.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opSub' definition
        my $func_9 = method_event_def(
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
                need( $scope, $args, 'lhs', 90.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            _sub(
                                $scope,           $pos->(91.25),
                                $$scope->{'lhs'}, $$self->{'a'}
                            ),
                            _sub(
                                $scope,   $pos->(91.4),
                                $f->zero, $$self->{'b'}
                            )
                        ],
                        $scope, undef,
                        $pos->(91.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opMul' definition
        my $func_10 = method_event_def(
            $f, $scope, 'opMul',
            [
                {
                    name     => 'rhs',
                    type     => 'Complex',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'rhs', 96.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            _sub(
                                $scope,
                                $pos->(98.1),
                                mul(
                                    $scope,
                                    $pos->(98.1),
                                    $$self->{'a'},
                                    $$scope->{'rhs'}
                                      ->property_u( 'a', $pos->(98.2) )
                                ),
                                mul(
                                    $scope,
                                    $pos->(98.1),
                                    $$self->{'b'},
                                    $$scope->{'rhs'}
                                      ->property_u( 'b', $pos->(98.45) )
                                )
                            ),
                            add(
                                $scope,
                                $pos->(99.1),
                                mul(
                                    $scope,
                                    $pos->(99.1),
                                    $$self->{'a'},
                                    $$scope->{'rhs'}
                                      ->property_u( 'b', $pos->(99.2) )
                                ),
                                mul(
                                    $scope,
                                    $pos->(99.1),
                                    $$self->{'b'},
                                    $$scope->{'rhs'}
                                      ->property_u( 'a', $pos->(99.45) )
                                )
                            )
                        ],
                        $scope, undef,
                        $pos->(97.3)
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
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'ehs', 105.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            mul(
                                $scope,           $pos->(106.25),
                                $$scope->{'ehs'}, $$self->{'a'}
                            ),
                            mul(
                                $scope,           $pos->(106.45),
                                $$scope->{'ehs'}, $$self->{'b'}
                            )
                        ],
                        $scope, undef,
                        $pos->(106.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opDiv' definition
        my $func_12 = method_event_def(
            $f, $scope, 'opDiv',
            [
                {
                    name     => 'rhs',
                    type     => 'Complex',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'rhs', 111.2 ) || return $ret_func->();
                var(
                    $scope,
                    conj =>
                      $$scope->{'rhs'}->property_u( 'conj', $pos->(112.4) ),
                    $file_scope, $pos->(112.2)
                );
                var(
                    $scope,
                    num => mul(
                        $scope,                           $pos->(113.4),
                        ${ $scope->{special} }->{'self'}, $$scope->{'conj'}
                    ),
                    $file_scope,
                    $pos->(113.2)
                );
                var(
                    $scope,
                    den => mul(
                        $scope,           $pos->(114.4),
                        $$scope->{'rhs'}, $$scope->{'conj'}
                    ),
                    $file_scope,
                    $pos->(114.2)
                );
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            div(
                                $scope,
                                $pos->(116.3),
                                $$scope->{'num'}
                                  ->property_u( 'a', $pos->(116.2) ),
                                $$scope->{'den'}
                                  ->property_u( 'a', $pos->(116.5) )
                            ),
                            div(
                                $scope,
                                $pos->(117.3),
                                $$scope->{'num'}
                                  ->property_u( 'b', $pos->(117.2) ),
                                $$scope->{'den'}
                                  ->property_u( 'a', $pos->(117.5) )
                            )
                        ],
                        $scope, undef,
                        $pos->(115.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opDiv' definition
        my $func_13 = method_event_def(
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
                need( $scope, $args, 'rhs', 123.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            div(
                                $scope,        $pos->(125.2),
                                $$self->{'a'}, $$scope->{'rhs'}
                            ),
                            div(
                                $scope,        $pos->(126.2),
                                $$self->{'b'}, $$scope->{'rhs'}
                            )
                        ],
                        $scope, undef,
                        $pos->(124.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opPow' definition
        my $func_14 = method_event_def(
            $f, $scope, 'opPow',
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
                need( $scope, $args, 'rhs', 134.2 ) || return $ret_func->();
                if (
                    bool(
                        less_e(
                            $scope, $pos->(135.3),
                            $$scope->{'rhs'}, num( $f, "0" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( num( $f, "1" ) );
                }
                return $ret_func->(
                    mul(
                        $scope,
                        $pos->(137.15),
                        ${ $scope->{special} }->{'self'},
                        pow(
                            $scope,
                            $pos->(137.15),
                            ${ $scope->{special} }->{'self'},
                            _sub(
                                $scope, $pos->(137.4),
                                $$scope->{'rhs'}, num( $f, "1" )
                            )
                        )
                    )
                );
                return $ret;
            }
        );

        # Method event 'pow' definition
        my $func_15 = method_event_def(
            $f, $scope, 'pow',
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
                need( $scope, $args, 'rhs', 143.2 ) || return $ret_func->();
                var(
                    $scope,
                    log_a =>
                      $$scope->{'Math'}->property_u( 'log', $pos->(144.4) )
                      ->( [ $$self->{'abs'} ], $scope, undef, $pos->(144.5) ),
                    $file_scope, $pos->(144.2)
                );
                var(
                    $scope,
                    factor =>
                      $$scope->{'Math'}->property_u( 'exp', $pos->(145.2) )->(
                        [
                            mul(
                                $scope,           $pos->(145.35),
                                $$scope->{'rhs'}, $$scope->{'log_a'}
                            )
                        ],
                        $scope, undef,
                        $pos->(145.25)
                      ),
                    $file_scope,
                    $pos->(145.1)
                );
                var(
                    $scope,
                    θ => mul(
                        $scope,           $pos->(146.4),
                        $$scope->{'rhs'}, $$self->{'arg'}
                    ),
                    $file_scope,
                    $pos->(146.2)
                );
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            mul(
                                $scope,
                                $pos->(148.2),
                                $$scope->{'factor'},
                                $$scope->{'Math'}
                                  ->property_u( 'cos', $pos->(148.4) )->(
                                    [ $$scope->{'θ'} ], $scope,
                                    undef,              $pos->(148.5)
                                  )
                            ),
                            mul(
                                $scope,
                                $pos->(149.2),
                                $$scope->{'factor'},
                                $$scope->{'Math'}
                                  ->property_u( 'sin', $pos->(149.4) )->(
                                    [ $$scope->{'θ'} ], $scope,
                                    undef,              $pos->(149.5)
                                  )
                            )
                        ],
                        $scope, undef,
                        $pos->(147.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opEqual' definition
        my $func_16 = method_event_def(
            $f, $scope,
            'opEqual',
            [
                {
                    name     => 'ehs',
                    type     => 'Complex',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'ehs', 155.2 ) || return $ret_func->();
                return $ret_func->(
                    all_true(
                        $scope,
                        $pos->(156.15),
                        sub {
                            equal( $scope, $pos->(156.15), $$self->{'a'},
                                $$scope->{'ehs'}
                                  ->property_u( 'a', $pos->(156.25) ) );
                        },
                        sub {
                            equal( $scope, $pos->(156.15), $$self->{'b'},
                                $$scope->{'ehs'}
                                  ->property_u( 'b', $pos->(156.5) ) );
                        }
                    )
                );
                return $ret;
            }
        );

        # Method event 'opEqual' definition
        my $func_17 = method_event_def(
            $f, $scope,
            'opEqual',
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
                need( $scope, $args, 'ehs', 161.2 ) || return $ret_func->();
                return $ret_func->(
                    all_true(
                        $scope,
                        $pos->(162.15),
                        sub {
                            equal(
                                $scope,        $pos->(162.15),
                                $$self->{'a'}, $$scope->{'ehs'}
                            );
                        },
                        sub {
                            equal(
                                $scope, $pos->(162.15),
                                $$self->{'b'}, num( $f, "0" )
                            );
                        }
                    )
                );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $func_18 = method_event_def(
            $f, $scope,
            'description',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var( $scope, r => $$self->{'a'}, $file_scope, $pos->(166.2) );
                var( $scope, i => $$self->{'b'}, $file_scope, $pos->(167.2) );
                if (
                    bool(
                        all_true(
                            $scope,
                            $pos->(168.15),
                            sub {
                                equal(
                                    $scope, $pos->(168.15),
                                    $$scope->{'r'}, num( $f, "0" )
                                );
                            },
                            sub {
                                equal(
                                    $scope, $pos->(168.15),
                                    $$scope->{'i'}, num( $f, "0" )
                                );
                            }
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( str( $f, "0" ) );
                }
                if (
                    bool(
                        equal(
                            $scope, $pos->(170.3),
                            $$scope->{'r'}, num( $f, "0" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    var(
                        $scope,
                        r => str( $f, "" ),
                        $file_scope, $pos->(171.2)
                    );
                }
                if (
                    bool(
                        equal(
                            $scope, $pos->(172.3),
                            $$scope->{'i'}, num( $f, "0" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    var(
                        $scope,
                        i => str( $f, "" ),
                        $file_scope, $pos->(173.2)
                    );
                }
                elsif (
                    bool(
                        equal(
                            $scope,
                            $pos->(174.3),
                            $$scope->{'i'},
                            _sub(
                                $scope, $pos->(174.3),
                                $f->zero, num( $f, "1" )
                            )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    var(
                        $scope,
                        i => str( $f, "-i" ),
                        $file_scope, $pos->(175.2)
                    );
                }
                elsif (
                    bool(
                        less(
                            $scope, $pos->(176.3),
                            $$scope->{'i'}, num( $f, "0" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    var(
                        $scope,
                        i => add(
                            $scope, $pos->(177.2),
                            $$scope->{'i'}, str( $f, "i" )
                        ),
                        $file_scope,
                        $pos->(177.2)
                    );
                }
                elsif (
                    bool(
                        equal(
                            $scope, $pos->(178.3),
                            $$scope->{'i'}, num( $f, "1" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    var(
                        $scope,
                        i => str( $f, "+i" ),
                        $file_scope, $pos->(179.2)
                    );
                }
                else {
                    var(
                        $scope,
                        i => add(
                            $scope, $pos->(181.4),
                            str( $f, "+" ), $$scope->{'i'},
                            str( $f, "i" )
                        ),
                        $file_scope,
                        $pos->(181.2)
                    );
                }
                return $ret_func->(
                    add(
                        $scope, $pos->(182.2), $$scope->{'r'}, $$scope->{'i'}
                      )->property_u( 'trimPrefix', $pos->(182.35) )
                      ->( [ str( $f, "+" ) ], $scope, undef, $pos->(182.4) )
                );
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            polar => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_2->inside_scope( abs  => $scope, $proto, $class, $ins, 1, undef );
        $func_3->inside_scope( arg  => $scope, $proto, $class, $ins, 1, undef );
        $func_4->inside_scope( conj => $scope, $proto, $class, $ins, 1, undef );
        $func_5->inside_scope(
            opAdd => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_6->inside_scope(
            opAdd => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_7->inside_scope(
            opSub => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_8->inside_scope(
            opSub => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_9->inside_scope(
            opSub => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_10->inside_scope(
            opMul => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_11->inside_scope(
            opMul => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_12->inside_scope(
            opDiv => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_13->inside_scope(
            opDiv => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_14->inside_scope(
            opPow => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_15->inside_scope(
            pow => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_16->inside_scope(
            opEqual => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_17->inside_scope(
            opEqual => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_18->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, $file_name, qw(Complex Math Num) );
};

after_content($file_name);
