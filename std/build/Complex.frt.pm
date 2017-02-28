# === Document Model ===
#  Document './std/Complex.frt'
#      Class 'Complex'
#          Class method 'initializer__' { $real:Num $imag:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$real'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Need
#                          Lexical variable '$imag'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Assignment
#                          Instance variable '@a'
#                          Lexical variable '$real'
#                  Instruction
#                      Assignment
#                          Instance variable '@b'
#                          Lexical variable '$imag'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Lexical variable '$imag'
#                              Equality operator (==)
#                              Number '0'
#                      If body
#                          Instruction
#                              Return
#                                  Lexical variable '$imag'
#          Method 'opAdd' { $rhs:Complex -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$rhs'
#                          Argument type
#                              Bareword 'Complex'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Complex'
#                              Argument list [2 items]
#                                  Item 0
#                                      Operation
#                                          Instance variable '@a'
#                                          Addition operator (+)
#                                          Property 'a'
#                                              Lexical variable '$rhs'
#                                  Item 1
#                                      Operation
#                                          Instance variable '@b'
#                                          Addition operator (+)
#                                          Property 'b'
#                                              Lexical variable '$rhs'
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
#                              Bareword 'Complex'
#                              Argument list [2 items]
#                                  Item 0
#                                      Operation
#                                          Instance variable '@a'
#                                          Addition operator (+)
#                                          Lexical variable '$ehs'
#                                  Item 1
#                                      Instance variable '@b'
#          Method 'opSub' { $rhs:Complex -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$rhs'
#                          Argument type
#                              Bareword 'Complex'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Complex'
#                              Argument list [2 items]
#                                  Item 0
#                                      Operation
#                                          Instance variable '@a'
#                                          Subtraction operator (-)
#                                          Property 'a'
#                                              Lexical variable '$rhs'
#                                  Item 1
#                                      Operation
#                                          Instance variable '@b'
#                                          Subtraction operator (-)
#                                          Property 'b'
#                                              Lexical variable '$rhs'
#          Method 'opSub' { $ehs:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$ehs'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Complex'
#                              Argument list [2 items]
#                                  Item 0
#                                      Operation
#                                          Instance variable '@a'
#                                          Subtraction operator (-)
#                                          Lexical variable '$ehs'
#                                  Item 1
#                                      Instance variable '@b'
#          Method 'opMul' { $rhs:Complex -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$rhs'
#                          Argument type
#                              Bareword 'Complex'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Complex'
#                              Argument list [2 items]
#                                  Item 0
#                                      Operation
#                                          Instance variable '@a'
#                                          Multiplication operator (*)
#                                          Property 'a'
#                                              Lexical variable '$rhs'
#                                          Subtraction operator (-)
#                                          Instance variable '@b'
#                                          Multiplication operator (*)
#                                          Property 'b'
#                                              Lexical variable '$rhs'
#                                  Item 1
#                                      Operation
#                                          Instance variable '@a'
#                                          Multiplication operator (*)
#                                          Property 'b'
#                                              Lexical variable '$rhs'
#                                          Addition operator (+)
#                                          Instance variable '@b'
#                                          Multiplication operator (*)
#                                          Property 'a'
#                                              Lexical variable '$rhs'
#          Method 'opDiv' { $rhs:Complex -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$rhs'
#                          Argument type
#                              Bareword 'Complex'
#                  Instruction
#                      Assignment
#                          Lexical variable '$conj'
#                          Property 'conj'
#                              Lexical variable '$rhs'
#                  Instruction
#                      Assignment
#                          Lexical variable '$num'
#                          Operation
#                              Special variable '*self'
#                              Multiplication operator (*)
#                              Lexical variable '$conj'
#                  Instruction
#                      Assignment
#                          Lexical variable '$den'
#                          Operation
#                              Lexical variable '$rhs'
#                              Multiplication operator (*)
#                              Lexical variable '$conj'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Complex'
#                              Argument list [2 items]
#                                  Item 0
#                                      Operation
#                                          Property 'a'
#                                              Lexical variable '$num'
#                                          Division operator (/)
#                                          Property 'a'
#                                              Lexical variable '$den'
#                                  Item 1
#                                      Operation
#                                          Property 'b'
#                                              Lexical variable '$num'
#                                          Division operator (/)
#                                          Property 'a'
#                                              Lexical variable '$den'
#          Method 'opPow' { $rhs:Int -> $result $result $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$rhs'
#                          Argument type
#                              Bareword 'Int'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Lexical variable '$rhs'
#                              Equality operator (==)
#                              Number '0'
#                      If body
#                          Instruction
#                              Return
#                                  Number '1'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Lexical variable '$rhs'
#                              Equality operator (==)
#                              Number '1'
#                      If body
#                          Instruction
#                              Return
#                                  Special variable '*self'
#                  Instruction
#                      Assignment
#                          Lexical variable '$new'
#                          Special variable '*self'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$i'
#                      Expression ('in' parameter)
#                          Operation
#                              Number '2'
#                              Range operator (..)
#                              Lexical variable '$rhs'
#                      For body
#                          Instruction
#                              Multiplication assignment
#                                  Lexical variable '$new'
#                                  Special variable '*self'
#                  Instruction
#                      Return
#                          Lexical variable '$new'
#          Computed property 'abs' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Property 'sqrt'
#                              Single value [1 item]
#                                  Item 0
#                                      Operation
#                                          Instance variable '@a'
#                                          Exponent operator (^)
#                                          Number '2'
#                                          Addition operator (+)
#                                          Instance variable '@b'
#                                          Exponent operator (^)
#                                          Number '2'
#          Computed property 'conj' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'Complex'
#                              Argument list [2 items]
#                                  Item 0
#                                      Instance variable '@a'
#                                  Item 1
#                                      Operation
#                                          Constant zero
#                                          Negation operator (-)
#                                          Instance variable '@b'
#          Method 'description' { -> $result $result }
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$r'
#                          Instance variable '@a'
#                  Instruction
#                      Assignment
#                          Lexical variable '$i'
#                          Instance variable '@b'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Lexical variable '$r'
#                              Equality operator (==)
#                              Number '0'
#                              Logical and operator (&&)
#                              Lexical variable '$i'
#                              Equality operator (==)
#                              Number '0'
#                      If body
#                          Instruction
#                              Return
#                                  String '0'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Lexical variable '$r'
#                              Equality operator (==)
#                              Number '0'
#                      If body
#                          Instruction
#                              Assignment
#                                  Lexical variable '$r'
#                                  String ''
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Lexical variable '$i'
#                              Equality operator (==)
#                              Number '0'
#                      If body
#                          Instruction
#                              Assignment
#                                  Lexical variable '$i'
#                                  String ''
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Lexical variable '$i'
#                              Equality operator (==)
#                              Constant zero
#                              Negation operator (-)
#                              Number '1'
#                      If body
#                          Instruction
#                              Assignment
#                                  Lexical variable '$i'
#                                  String '-i'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Lexical variable '$i'
#                              Less than operator (<)
#                              Number '0'
#                      If body
#                          Instruction
#                              Addition assignment
#                                  Lexical variable '$i'
#                                  String 'i'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Lexical variable '$i'
#                              Equality operator (==)
#                              Number '1'
#                      If body
#                          Instruction
#                              Assignment
#                                  Lexical variable '$i'
#                                  String '+i'
#                  Else
#                      Else body
#                          Instruction
#                              Assignment
#                                  Lexical variable '$i'
#                                  Operation
#                                      String '+'
#                                      Addition operator (+)
#                                      Lexical variable '$i'
#                                      Addition operator (+)
#                                      String 'i'
#                  Instruction
#                      Return
#                          Call
#                              Property 'trimPrefix'
#                                  Single value [1 item]
#                                      Item 0
#                                          Operation
#                                              Lexical variable '$r'
#                                              Addition operator (+)
#                                              Lexical variable '$i'
#                              Argument list [1 item]
#                                  Item 0
#                                      String '+'
#      Include (Complex, Int, Num)
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

my $pos = before_content( 'Complex.frt', './std/Complex.frt' );

use Ferret::Core::Operations
  qw(_sub add all_true bool div equal less mul num pow range str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'Complex'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Complex', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'real',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'imag',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'real', 4.2 ) || return $ret_func->();
                need( $scope, $args, 'imag', 5.2 ) || return $ret_func->();
                $self->set_property( a => $$scope->{'real'}, $pos->(6.2) );
                $self->set_property( b => $$scope->{'imag'}, $pos->(7.2) );
                if (
                    bool(
                        equal(
                            $scope, $pos->(10.3),
                            $$scope->{'imag'}, num( $f, "0" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( $$scope->{'imag'} );
                }
                return $ret;
            }
        );

        # Method event 'opAdd' definition
        my $func_1 = method_event_def(
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
                need( $scope, $args, 'rhs', 16.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            add(
                                $scope,
                                $pos->(17.25),
                                $$self->{'a'},
                                $$scope->{'rhs'}
                                  ->property_u( 'a', $pos->(17.35) )
                            ),
                            add(
                                $scope,
                                $pos->(17.5),
                                $$self->{'b'},
                                $$scope->{'rhs'}
                                  ->property_u( 'b', $pos->(17.6) )
                            )
                        ],
                        $scope, undef,
                        $pos->(17.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opAdd' definition
        my $func_2 = method_event_def(
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
                need( $scope, $args, 'ehs', 22.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            add(
                                $scope,        $pos->(23.25),
                                $$self->{'a'}, $$scope->{'ehs'}
                            ),
                            $$self->{'b'}
                        ],
                        $scope, undef,
                        $pos->(23.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opSub' definition
        my $func_3 = method_event_def(
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
                need( $scope, $args, 'rhs', 28.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            _sub(
                                $scope,
                                $pos->(29.25),
                                $$self->{'a'},
                                $$scope->{'rhs'}
                                  ->property_u( 'a', $pos->(29.35) )
                            ),
                            _sub(
                                $scope,
                                $pos->(29.5),
                                $$self->{'b'},
                                $$scope->{'rhs'}
                                  ->property_u( 'b', $pos->(29.6) )
                            )
                        ],
                        $scope, undef,
                        $pos->(29.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opSub' definition
        my $func_4 = method_event_def(
            $f, $scope, 'opSub',
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
                need( $scope, $args, 'ehs', 34.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            _sub(
                                $scope,        $pos->(35.25),
                                $$self->{'a'}, $$scope->{'ehs'}
                            ),
                            $$self->{'b'}
                        ],
                        $scope, undef,
                        $pos->(35.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opMul' definition
        my $func_5 = method_event_def(
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
                need( $scope, $args, 'rhs', 40.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            _sub(
                                $scope,
                                $pos->(42.1),
                                mul(
                                    $scope,
                                    $pos->(42.1),
                                    $$self->{'a'},
                                    $$scope->{'rhs'}
                                      ->property_u( 'a', $pos->(42.2) )
                                ),
                                mul(
                                    $scope,
                                    $pos->(42.1),
                                    $$self->{'b'},
                                    $$scope->{'rhs'}
                                      ->property_u( 'b', $pos->(42.45) )
                                )
                            ),
                            add(
                                $scope,
                                $pos->(43.1),
                                mul(
                                    $scope,
                                    $pos->(43.1),
                                    $$self->{'a'},
                                    $$scope->{'rhs'}
                                      ->property_u( 'b', $pos->(43.2) )
                                ),
                                mul(
                                    $scope,
                                    $pos->(43.1),
                                    $$self->{'b'},
                                    $$scope->{'rhs'}
                                      ->property_u( 'a', $pos->(43.45) )
                                )
                            )
                        ],
                        $scope, undef,
                        $pos->(41.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opDiv' definition
        my $func_6 = method_event_def(
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
                need( $scope, $args, 'rhs', 49.2 ) || return $ret_func->();
                var(
                    $scope,
                    conj =>
                      $$scope->{'rhs'}->property_u( 'conj', $pos->(50.4) ),
                    $file_scope, $pos->(50.2)
                );
                var(
                    $scope,
                    num => mul(
                        $scope,                           $pos->(51.4),
                        ${ $scope->{special} }->{'self'}, $$scope->{'conj'}
                    ),
                    $file_scope,
                    $pos->(51.2)
                );
                var(
                    $scope,
                    den => mul(
                        $scope,           $pos->(52.4),
                        $$scope->{'rhs'}, $$scope->{'conj'}
                    ),
                    $file_scope,
                    $pos->(52.2)
                );
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            div(
                                $scope,
                                $pos->(54.3),
                                $$scope->{'num'}
                                  ->property_u( 'a', $pos->(54.2) ),
                                $$scope->{'den'}
                                  ->property_u( 'a', $pos->(54.5) )
                            ),
                            div(
                                $scope,
                                $pos->(55.3),
                                $$scope->{'num'}
                                  ->property_u( 'b', $pos->(55.2) ),
                                $$scope->{'den'}
                                  ->property_u( 'a', $pos->(55.5) )
                            )
                        ],
                        $scope, undef,
                        $pos->(53.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opPow' definition
        my $func_7 = method_event_def(
            $f, $scope, 'opPow',
            [
                {
                    name     => 'rhs',
                    type     => 'Int',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'rhs', 62.2 ) || return $ret_func->();
                if (
                    bool(
                        equal(
                            $scope, $pos->(63.3),
                            $$scope->{'rhs'}, num( $f, "0" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( num( $f, "1" ) );
                }
                if (
                    bool(
                        equal(
                            $scope, $pos->(65.3),
                            $$scope->{'rhs'}, num( $f, "1" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( ${ $scope->{special} }->{'self'} );
                }
                var(
                    $scope,
                    new => ${ $scope->{special} }->{'self'},
                    $file_scope, $pos->(67.2)
                );
                {
                    my ( $loop_status, $loop_ret ) = iterate(
                        $f, $scope,
                        range(
                            $scope, $pos->(68.5),
                            num( $f, "2" ), $$scope->{'rhs'}
                        ),
                        'i',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            var(
                                $scope,
                                new => mul(
                                    $scope, $pos->(69.2), $$scope->{'new'},
                                    ${ $scope->{special} }->{'self'}
                                ),
                                $file_scope,
                                $pos->(69.2)
                            );
                        },
                        $pos->(68.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret_func->( $$scope->{'new'} );
                return $ret;
            }
        );

        # Method event 'abs' definition
        my $func_8 = method_event_def(
            $f, $scope, 'abs', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    add(
                        $scope,
                        $pos->(75.2),
                        pow(
                            $scope, $pos->(75.2),
                            $$self->{'a'}, num( $f, "2" )
                        ),
                        pow(
                            $scope, $pos->(75.2),
                            $$self->{'b'}, num( $f, "2" )
                        )
                    )->property_u( 'sqrt', $pos->(75.55) )
                );
                return $ret;
            }
        );

        # Method event 'conj' definition
        my $func_9 = method_event_def(
            $f, $scope, 'conj', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            $$self->{'a'},
                            _sub(
                                $scope,   $pos->(80.3),
                                $f->zero, $$self->{'b'}
                            )
                        ],
                        $scope, undef,
                        $pos->(80.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $func_10 = method_event_def(
            $f, $scope,
            'description',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var( $scope, r => $$self->{'a'}, $file_scope, $pos->(84.2) );
                var( $scope, i => $$self->{'b'}, $file_scope, $pos->(85.2) );
                if (
                    bool(
                        all_true(
                            $scope,
                            $pos->(86.15),
                            sub {
                                equal(
                                    $scope, $pos->(86.15),
                                    $$scope->{'r'}, num( $f, "0" )
                                );
                            },
                            sub {
                                equal(
                                    $scope, $pos->(86.15),
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
                            $scope, $pos->(88.3),
                            $$scope->{'r'}, num( $f, "0" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    var(
                        $scope,
                        r => str( $f, "" ),
                        $file_scope, $pos->(89.2)
                    );
                }
                if (
                    bool(
                        equal(
                            $scope, $pos->(90.3),
                            $$scope->{'i'}, num( $f, "0" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    var(
                        $scope,
                        i => str( $f, "" ),
                        $file_scope, $pos->(91.2)
                    );
                }
                elsif (
                    bool(
                        equal(
                            $scope,
                            $pos->(92.3),
                            $$scope->{'i'},
                            _sub(
                                $scope, $pos->(92.3),
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
                        $file_scope, $pos->(93.2)
                    );
                }
                elsif (
                    bool(
                        less(
                            $scope, $pos->(94.3),
                            $$scope->{'i'}, num( $f, "0" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    var(
                        $scope,
                        i => add(
                            $scope, $pos->(95.2),
                            $$scope->{'i'}, str( $f, "i" )
                        ),
                        $file_scope,
                        $pos->(95.2)
                    );
                }
                elsif (
                    bool(
                        equal(
                            $scope, $pos->(96.3),
                            $$scope->{'i'}, num( $f, "1" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    var(
                        $scope,
                        i => str( $f, "+i" ),
                        $file_scope, $pos->(97.2)
                    );
                }
                else {
                    var(
                        $scope,
                        i => add(
                            $scope, $pos->(99.4),
                            str( $f, "+" ), $$scope->{'i'},
                            str( $f, "i" )
                        ),
                        $file_scope,
                        $pos->(99.2)
                    );
                }
                return $ret_func->(
                    add(
                        $scope, $pos->(100.2), $$scope->{'r'}, $$scope->{'i'}
                      )->property_u( 'trimPrefix', $pos->(100.35) )
                      ->( [ str( $f, "+" ) ], $scope, undef, $pos->(100.4) )
                );
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            opAdd => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_2->inside_scope(
            opAdd => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            opSub => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_4->inside_scope(
            opSub => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_5->inside_scope(
            opMul => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_6->inside_scope(
            opDiv => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_7->inside_scope(
            opPow => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_8->inside_scope( abs  => $scope, $proto, $class, $ins, 1, undef );
        $func_9->inside_scope( conj => $scope, $proto, $class, $ins, 1, undef );
        $func_10->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Complex Int Num) );
};

after_content();
