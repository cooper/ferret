# === Document Model ===
#  Document './std/Extension/Number.frt'
#      Class 'Number'
#          Type definition ('Even')
#              Type body
#                  Instruction
#                      Isa
#                          Special variable '*class'
#                  Instruction
#                      Satisfies
#                          Property variable '.even'
#          Type definition ('Odd')
#              Type body
#                  Instruction
#                      Isa
#                          Special variable '*class'
#                  Instruction
#                      Satisfies
#                          Property variable '.odd'
#          Type definition ('Integer')
#              Type body
#                  Instruction
#                      Isa
#                          Special variable '*class'
#                  Instruction
#                      Transform
#                          Property variable '.floor'
#          Instruction
#              Alias
#                  Assignment
#                      Bareword 'Int'
#                      Bareword 'Integer'
#          Computed property 'sqrt'
#              Function body
#                  Instruction
#                      Return
#                          Call
#                              Property 'sqrt'
#                                  Bareword 'Math'
#                              Argument list [1 item]
#                                  Item 0
#                                      Special variable '*self'
#          Computed property 'cbrt'
#              Function body
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@root'
#                              Argument list [1 item]
#                                  Item 0
#                                      Number '3'
#          Computed property 'square'
#              Function body
#                  Instruction
#                      Return
#                          Operation
#                              Special variable '*self'
#                              Exponent operator (^)
#                              Number '2'
#          Computed property 'even'
#              Function body
#                  Instruction
#                      Return
#                          Operation
#                              Special variable '*self'
#                              Modulus operator (%)
#                              Number '2'
#                              Equality operator (==)
#                              Number '0'
#          Computed property 'odd'
#              Function body
#                  Instruction
#                      Return
#                          Operation
#                              Special variable '*self'
#                              Modulus operator (%)
#                              Number '2'
#                              Negated equality operator (!=)
#                              Number '0'
#          Method 'root'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$root'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Call
#                              Property 'root'
#                                  Bareword 'Math'
#                              Argument list [2 items]
#                                  Item 0
#                                      Lexical variable '$root'
#                                  Item 1
#                                      Special variable '*self'
#          Method 'factorial'
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$new'
#                          Number '1'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Special variable '*self'
#                              Less than operator (<)
#                              Number '2'
#                      If body
#                          Instruction
#                              Return
#                                  Special variable '*self'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$i'
#                      Expression ('in' parameter)
#                          Operation
#                              Special variable '*self'
#                              Range operator (..)
#                              Number '2'
#                      For body
#                          Instruction
#                              Multiplication assignment
#                                  Lexical variable '$new'
#                                  Lexical variable '$i'
#                  Instruction
#                      Return
#                          Lexical variable '$new'
#          Method 'toFunction'
#              Function body
#                  Instruction
#                      Return
#                          Instance variable '@factorial'
#          Instruction
#              Shared variable declaration
#                  Assignment
#                      Lexical variable '$inf'
#                      Call
#                          Bareword 'Num'
#                          Argument list [1 item]
#                              Item 0
#                                  String 'inf'
#          Instruction
#              Shared variable declaration
#                  Assignment
#                      Lexical variable '$nan'
#                      Call
#                          Bareword 'Num'
#                          Argument list [1 item]
#                              Item 0
#                                  String 'nan'
#      Include (Int, Integer, Math, Num)
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

my $pos = before_content( 'Number.frt', './std/Extension/Number.frt' );

use Ferret::Core::Operations
  qw(bool equal less mod mul nequal num pow range str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
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
                    $$scope->{'Math'}->property_u( 'sqrt', $pos->(21.3) )->(
                        [ ${ $scope->{special} }->{'self'} ], $scope,
                        undef,                                $pos->(21.4)
                    )
                );
                return $ret;
            }
        );

        # Method event 'cbrt' definition
        my $func_1 = method_event_def(
            $f, $scope, 'cbrt', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->( $$self->{'root'}
                      ->( [ num( $f, "3" ) ], $scope, undef, $pos->(25.3) ) );
                return $ret;
            }
        );

        # Method event 'square' definition
        my $func_2 = method_event_def(
            $f, $scope, 'square', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    pow(
                        $scope,
                        ${ $scope->{special} }->{'self'},
                        num( $f, "2" )
                    )
                );
                return $ret;
            }
        );

        # Method event 'even' definition
        my $func_3 = method_event_def(
            $f, $scope, 'even', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    equal(
                        $scope,
                        mod(
                            $scope,
                            ${ $scope->{special} }->{'self'},
                            num( $f, "2" )
                        ),
                        num( $f, "0" )
                    )
                );
                return $ret;
            }
        );

        # Method event 'odd' definition
        my $func_4 = method_event_def(
            $f, $scope, 'odd', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    nequal(
                        $scope,
                        mod(
                            $scope,
                            ${ $scope->{special} }->{'self'},
                            num( $f, "2" )
                        ),
                        num( $f, "0" )
                    )
                );
                return $ret;
            }
        );

        # Method event 'root' definition
        my $func_5 = method_event_def(
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
                need( $scope, $args, 'root', 41.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Math'}->property_u( 'root', $pos->(42.15) )->(
                        [ $$scope->{'root'}, ${ $scope->{special} }->{'self'} ],
                        $scope,
                        undef,
                        $pos->(42.2)
                    )
                );
                return $ret;
            }
        );

        # Method event 'factorial' definition
        my $func_6 = method_event_def(
            $f, $scope,
            'factorial',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var( $scope, new => num( $f, "1" ), $file_scope, $pos->(46.2) );
                if (
                    bool(
                        less(
                            $scope,
                            ${ $scope->{special} }->{'self'},
                            num( $f, "2" )
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
                            $scope,
                            ${ $scope->{special} }->{'self'},
                            num( $f, "2" )
                        ),
                        'i',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            var(
                                $scope,
                                new => mul(
                                    $scope, $$scope->{'new'},
                                    $$scope->{'i'}
                                ),
                                $file_scope,
                                $pos->(50.2)
                            );
                        },
                        $pos->(49.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret_func->( $$scope->{'new'} );
                return $ret;
            }
        );

        # Method event 'toFunction' definition
        my $func_7 = method_event_def(
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
        $func_1->inside_scope( cbrt => $scope, $proto, $class, $ins, 1, undef );
        $func_2->inside_scope(
            square => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_3->inside_scope( even => $scope, $proto, $class, $ins, 1, undef );
        $func_4->inside_scope( odd  => $scope, $proto, $class, $ins, 1, undef );
        $func_5->inside_scope(
            root => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_6->inside_scope(
            factorial => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_7->inside_scope(
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
        $class->set_property( Int => $$scope->{'Integer'}, $pos->(18.3) );
        var(
            $class,
            inf => $$scope->{'Num'}
              ->( [ str( $f, "inf" ) ], $scope, undef, $pos->(58.5) ),
            undef, $pos->(58.3)
        );
        var(
            $class,
            nan => $$scope->{'Num'}
              ->( [ str( $f, "nan" ) ], $scope, undef, $pos->(59.5) ),
            undef, $pos->(59.3)
        );
    }
    load_namespaces( $context, qw(Int Integer Math Num) );
};

after_content();
