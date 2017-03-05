# === Document Model ===
#  File './std/Extension/Number.frt'
#      Package 'main'
#          Class 'Number'
#              Type definition ('Even')
#                  Type body
#                      Instruction
#                          Isa
#                              Special variable '*class'
#                      Instruction
#                          Satisfies
#                              Property variable '.even'
#              Type definition ('Odd')
#                  Type body
#                      Instruction
#                          Isa
#                              Special variable '*class'
#                      Instruction
#                          Satisfies
#                              Property variable '.odd'
#              Type definition ('Integer')
#                  Type body
#                      Instruction
#                          Isa
#                              Special variable '*class'
#                      Instruction
#                          Transform
#                              Property variable '.floor'
#              Instruction
#                  Alias
#                      Assignment
#                          Bareword 'Int'
#                          Bareword 'Integer'
#              Computed property 'sqrt' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Call
#                                  Property 'sqrt'
#                                      Bareword 'NATIVE::Math'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Special variable '*self'
#              Computed property 'sqrti' { -> $result $result }
#                  Function body
#                      If
#                          Expression ('if' parameter)
#                              Operation
#                                  Special variable '*self'
#                                  Less than operator (<)
#                                  Number '0'
#                          If body
#                              Instruction
#                                  Return
#                                      Operation
#                                          Property 'sqrt'
#                                              Property 'abs'
#                                                  Special variable '*self'
#                                          Multiplication operator (*)
#                                          Imaginary unit
#                      Instruction
#                          Return
#                              Instance variable '@sqrt'
#              Computed property 'cbrt' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Call
#                                  Instance variable '@root'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Number '3'
#              Computed property 'square' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Operation
#                                  Special variable '*self'
#                                  Exponent operator (^)
#                                  Number '2'
#              Computed property 'abs' { -> $result $result }
#                  Function body
#                      If
#                          Expression ('if' parameter)
#                              Operation
#                                  Special variable '*self'
#                                  Less than operator (<)
#                                  Number '0'
#                          If body
#                              Instruction
#                                  Return
#                                      Operation
#                                          Constant zero
#                                          Negation operator (-)
#                                          Special variable '*self'
#                      Instruction
#                          Return
#                              Special variable '*self'
#              Computed property 'even' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Operation
#                                  Special variable '*self'
#                                  Modulus operator (%)
#                                  Number '2'
#                                  Equality operator (==)
#                                  Number '0'
#              Computed property 'odd' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Operation
#                                  Special variable '*self'
#                                  Modulus operator (%)
#                                  Number '2'
#                                  Negated equality operator (!=)
#                                  Number '0'
#              Method 'root' { $root:Num -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$root'
#                              Argument type
#                                  Bareword 'Num'
#                      Instruction
#                          Return
#                              Operation
#                                  Special variable '*self'
#                                  Exponent operator (^)
#                                  Single value [1 item]
#                                      Item 0
#                                          Operation
#                                              Number '1'
#                                              Division operator (/)
#                                              Lexical variable '$root'
#              Method 'rooti' { $root:Num -> $result $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$root'
#                              Argument type
#                                  Bareword 'Num'
#                      If
#                          Expression ('if' parameter)
#                              Operation
#                                  Property 'even'
#                                      Lexical variable '$root'
#                                  Logical and operator (&&)
#                                  Special variable '*self'
#                                  Less than operator (<)
#                                  Number '0'
#                          If body
#                              Instruction
#                                  Return
#                                      Operation
#                                          Call
#                                              Property 'root'
#                                                  Property 'abs'
#                                                      Special variable '*self'
#                                              Argument list [1 item]
#                                                  Item 0
#                                                      Lexical variable '$root'
#                                          Multiplication operator (*)
#                                          Imaginary unit
#                      Instruction
#                          Return
#                              Call
#                                  Instance variable '@root'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$root'
#              Method 'factorial' { -> $result $result }
#                  Function body
#                      Instruction
#                          Assignment
#                              Lexical variable '$new'
#                              Number '1'
#                      If
#                          Expression ('if' parameter)
#                              Operation
#                                  Special variable '*self'
#                                  Less than operator (<)
#                                  Number '2'
#                          If body
#                              Instruction
#                                  Return
#                                      Special variable '*self'
#                      For (values)
#                          Expression ('for' parameter)
#                              Lexical variable '$i'
#                          Expression ('in' parameter)
#                              Operation
#                                  Special variable '*self'
#                                  Range operator (..)
#                                  Number '2'
#                          For body
#                              Instruction
#                                  Multiplication assignment
#                                      Lexical variable '$new'
#                                      Lexical variable '$i'
#                      Instruction
#                          Return
#                              Lexical variable '$new'
#              Method 'toFunction' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Instance variable '@factorial'
#              Instruction
#                  Shared variable declaration
#                      Assignment
#                          Lexical variable '$Inf'
#                          Call
#                              Bareword 'Num'
#                              Argument list [1 item]
#                                  Item 0
#                                      String 'inf'
#              Instruction
#                  Shared variable declaration
#                      Assignment
#                          Lexical variable '$NaN'
#                          Call
#                              Bareword 'Num'
#                              Argument list [1 item]
#                                  Item 0
#                                      String 'nan'
#          Instruction
#              Alias
#                  Assignment
#                      Bareword 'Int'
#                      Bareword 'Num::Int'
#          Instruction
#              Alias
#                  Assignment
#                      Bareword 'Inf'
#                      Bareword 'Num::Inf'
#          Instruction
#              Alias
#                  Assignment
#                      Bareword 'NaN'
#                      Bareword 'Num::NaN'
#          Include (Inf, Int, Integer, NATIVE::Math, NaN, Num, Num::Inf, Num::Int, Num::NaN)
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
  qw(_sub all_true bool div equal less mod mul nequal num pow range str);

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) =
  before_content( 'Number.frt', './std/Extension/Number.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main', 1.1 );
    my $scope = $file_scope;
    load_core('main');

    # Class 'Number'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Number', undef, undef );

        # Method event 'sqrt' definition
        my $func_0 = method_event_def(
            $f, $scope, 'sqrt', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$scope->{'NATIVE::Math'}
                      ->property_u( 'sqrt', $pos->(26.25) )->(
                        [ ${ $scope->{special} }->{'self'} ], $scope,
                        undef,                                $pos->(26.3)
                      )
                );
                return $ret;
            }
        );

        # Method event 'sqrti' definition
        my $func_1 = method_event_def(
            $f, $scope, 'sqrti', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                if (
                    bool(
                        less(
                            $scope, $pos->(31.3),
                            ${ $scope->{special} }->{'self'}, num( $f, "0" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        mul(
                            $scope,
                            $pos->(32.5),
                            ${ $scope->{special} }->{'self'}
                              ->property_u( 'abs',  $pos->(32.3) )
                              ->property_u( 'sqrt', $pos->(32.4) ),
                            num( $f, "i" )
                        )
                    );
                }
                return $ret_func->( $$self->{'sqrt'} );
                return $ret;
            }
        );

        # Method event 'cbrt' definition
        my $func_2 = method_event_def(
            $f, $scope, 'cbrt', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->( $$self->{'root'}
                      ->( [ num( $f, "3" ) ], $scope, undef, $pos->(38.3) ) );
                return $ret;
            }
        );

        # Method event 'square' definition
        my $func_3 = method_event_def(
            $f, $scope, 'square', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    pow(
                        $scope, $pos->(43.3),
                        ${ $scope->{special} }->{'self'}, num( $f, "2" )
                    )
                );
                return $ret;
            }
        );

        # Method event 'abs' definition
        my $func_4 = method_event_def(
            $f, $scope, 'abs', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                if (
                    bool(
                        less(
                            $scope, $pos->(48.3),
                            ${ $scope->{special} }->{'self'}, num( $f, "0" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        _sub(
                            $scope,   $pos->(49.2),
                            $f->zero, ${ $scope->{special} }->{'self'}
                        )
                    );
                }
                return $ret_func->( ${ $scope->{special} }->{'self'} );
                return $ret;
            }
        );

        # Method event 'even' definition
        my $func_5 = method_event_def(
            $f, $scope, 'even', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    equal(
                        $scope,
                        $pos->(55.3),
                        mod(
                            $scope, $pos->(55.3),
                            ${ $scope->{special} }->{'self'}, num( $f, "2" )
                        ),
                        num( $f, "0" )
                    )
                );
                return $ret;
            }
        );

        # Method event 'odd' definition
        my $func_6 = method_event_def(
            $f, $scope, 'odd', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    nequal(
                        $scope,
                        $pos->(60.3),
                        mod(
                            $scope, $pos->(60.3),
                            ${ $scope->{special} }->{'self'}, num( $f, "2" )
                        ),
                        num( $f, "0" )
                    )
                );
                return $ret;
            }
        );

        # Method event 'root' definition
        my $func_7 = method_event_def(
            $f, $scope, 'root',
            [
                {
                    name     => 'root',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'root', 65.2 ) || return $ret_func->();
                return $ret_func->(
                    pow(
                        $scope,
                        $pos->(66.15),
                        ${ $scope->{special} }->{'self'},
                        div(
                            $scope, $pos->(66.3),
                            num( $f, "1" ), $$scope->{'root'}
                        )
                    )
                );
                return $ret;
            }
        );

        # Method event 'rooti' definition
        my $func_8 = method_event_def(
            $f, $scope, 'rooti',
            [
                {
                    name     => 'root',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'root', 72.2 ) || return $ret_func->();
                if (
                    bool(
                        all_true(
                            $scope,
                            $pos->(73.4),
                            sub {
                                $$scope->{'root'}
                                  ->property_u( 'even', $pos->(73.3) );
                            },
                            sub {
                                less(
                                    $scope, $pos->(73.4),
                                    ${ $scope->{special} }->{'self'},
                                    num( $f, "0" )
                                );
                            }
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        mul(
                            $scope,
                            $pos->(74.4),
                            ${ $scope->{special} }->{'self'}
                              ->property_u( 'abs',  $pos->(74.15) )
                              ->property_u( 'root', $pos->(74.2) )->(
                                [ $$scope->{'root'} ], $scope,
                                undef,                 $pos->(74.25)
                              ),
                            num( $f, "i" )
                        )
                    );
                }
                return $ret_func->( $$self->{'root'}
                      ->( [ $$scope->{'root'} ], $scope, undef, $pos->(75.3) )
                );
                return $ret;
            }
        );

        # Method event 'factorial' definition
        my $func_9 = method_event_def(
            $f, $scope,
            'factorial',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var( $scope, new => num( $f, "1" ), $file_scope, $pos->(80.2) );
                if (
                    bool(
                        less(
                            $scope, $pos->(81.3),
                            ${ $scope->{special} }->{'self'}, num( $f, "2" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( ${ $scope->{special} }->{'self'} );
                }
                {
                    my ( $loop_status, $loop_ret ) = iterate(
                        $f, $scope,
                        range(
                            $scope, $pos->(83.5),
                            ${ $scope->{special} }->{'self'}, num( $f, "2" )
                        ),
                        'i',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            var(
                                $scope,
                                new => mul(
                                    $scope,           $pos->(84.2),
                                    $$scope->{'new'}, $$scope->{'i'}
                                ),
                                $file_scope,
                                $pos->(84.2)
                            );
                        },
                        $pos->(83.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret_func->( $$scope->{'new'} );
                return $ret;
            }
        );

        # Method event 'toFunction' definition
        my $func_10 = method_event_def(
            $f, $scope,
            'toFunction',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->( $$self->{'factorial'} );
                return $ret;
            }
        );
        $func_0->inside_scope( sqrt => $scope, $proto, $class, $ins, 1, undef );
        $func_1->inside_scope(
            sqrti => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_2->inside_scope( cbrt => $scope, $proto, $class, $ins, 1, undef );
        $func_3->inside_scope(
            square => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_4->inside_scope( abs  => $scope, $proto, $class, $ins, 1, undef );
        $func_5->inside_scope( even => $scope, $proto, $class, $ins, 1, undef );
        $func_6->inside_scope( odd  => $scope, $proto, $class, $ins, 1, undef );
        $func_7->inside_scope(
            root => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_8->inside_scope(
            rooti => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_9->inside_scope(
            factorial => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_10->inside_scope(
            toFunction => $scope,
            $proto, $class, $ins, undef, undef
        );
        typedef(
            $scope, $class, 'Even',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                state $anchor = \0 + 0;
                typedef_check(
                    $scope, $scope, $ins, $anchor,
                    conditions => [
                        sub {
                            $ins->fits_type_u(
                                ${ $scope->{special} }->{'class'} );
                        },
                        sub { $$ins->{'even'} }
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            },
            undef
        );
        typedef(
            $scope, $class, 'Odd',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                state $anchor = \0 + 0;
                typedef_check(
                    $scope, $scope, $ins, $anchor,
                    conditions => [
                        sub {
                            $ins->fits_type_u(
                                ${ $scope->{special} }->{'class'} );
                        },
                        sub { $$ins->{'odd'} }
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            },
            undef
        );
        typedef(
            $scope, $class,
            'Integer',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                state $anchor = \0 + 0;
                typedef_check(
                    $scope, $scope, $ins, $anchor,
                    conditions => [
                        sub {
                            $ins->fits_type_u(
                                ${ $scope->{special} }->{'class'} );
                        },
                        sub {
                            do { $ins = $transform->( $$ins->{'floor'}, $ins ) }
                        }
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            },
            undef
        );
        $class->set_property( Int => $$scope->{'Integer'}, $pos->(22.3) );
        var(
            $class,
            Inf => $$scope->{'Num'}
              ->( [ str( $f, "inf" ) ], $scope, undef, $pos->(94.5) ),
            undef, $pos->(94.3)
        );
        var(
            $class,
            NaN => $$scope->{'Num'}
              ->( [ str( $f, "nan" ) ], $scope, undef, $pos->(97.5) ),
            undef, $pos->(97.3)
        );
    }
    provides_namespaces( $context, $file_name, $pos->(105.7),
        qw(Even Inf Int Integer NaN Number Odd) );
    load_namespaces( $context, $file_name, $pos->(105.7),
        qw(Inf Int Integer NATIVE::Math NaN Num Num::Inf Num::Int Num::NaN) );
    $context->set_property( Int => $$scope->{'Num::Int'}, $pos->(103.3) );
    $context->set_property( Inf => $$scope->{'Num::Inf'}, $pos->(104.3) );
    $context->set_property( NaN => $$scope->{'Num::NaN'}, $pos->(105.3) );
};

after_content($file_name);
