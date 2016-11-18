# === Document Model ===
#  Document './std/Extension/Number.frt'
#      Class 'Number'
#          Type definition ('Even')
#              Body ('type' scope)
#                  Instruction
#                      Isa
#                          Special variable '*class'
#                  Instruction
#                      Satisfies
#                          Property variable '.even'
#          Type definition ('Odd')
#              Body ('type' scope)
#                  Instruction
#                      Isa
#                          Special variable '*class'
#                  Instruction
#                      Satisfies
#                          Property variable '.odd'
#          Type definition ('Integer')
#              Body ('type' scope)
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
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Property 'sqrt'
#                                  Bareword 'Math'
#                              Argument list [1 item]
#                                  Item 0
#                                      Special variable '*self'
#          Computed property 'cbrt'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@root'
#                              Argument list [1 item]
#                                  Item 0
#                                      Number '3'
#          Computed property 'square'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Operation
#                              Special variable '*self'
#                              Exponent operator (^)
#                              Number '2'
#          Computed property 'even' (lazy)
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Operation
#                              Special variable '*self'
#                              Modulus operator (%)
#                              Number '2'
#                              Equality operator (==)
#                              Number '0'
#          Computed property 'odd' (lazy)
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Operation
#                              Special variable '*self'
#                              Modulus operator (%)
#                              Number '2'
#                              Negated equality operator (!=)
#                              Number '0'
#          Method 'root'
#              Body ('method' scope)
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

use Ferret::Core::Operations qw(equal mod nequal num pow str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'Number'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Number', undef, undef );

        # Method event 'sqrt' definition
        my $method_0 = method_event_def(
            $f, $scope, 'sqrt',
            [],
            [],
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
        my $method_1 = method_event_def(
            $f, $scope, 'cbrt',
            [],
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->( $$self->{'root'}
                      ->( [ num( $f, "3" ) ], $scope, undef, $pos->(25.3) ) );
                return $ret;
            }
        );

        # Method event 'square' definition
        my $method_2 = method_event_def(
            $f, $scope, 'square',
            [],
            [],
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
        my $method_3 = method_event_def(
            $f, $scope, 'even',
            [],
            [],
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
        my $method_4 = method_event_def(
            $f, $scope, 'odd',
            [],
            [],
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
        my $method_5 = method_event_def(
            $f, $scope, 'root',
            [
                {
                    name     => 'root',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'root', 41.2 ) or return;
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
        $method_0->inside_scope(
            sqrt => $scope,
            $proto, $class, $ins, 1, undef
        );
        $method_1->inside_scope(
            cbrt => $scope,
            $proto, $class, $ins, 1, undef
        );
        $method_2->inside_scope(
            square => $scope,
            $proto, $class, $ins, 1, undef
        );
        $method_3->inside_scope( even => $scope, $proto, $class, $ins, 1, 1 );
        $method_4->inside_scope( odd  => $scope, $proto, $class, $ins, 1, 1 );
        $method_5->inside_scope(
            root => $scope,
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
              ->( [ str( $f, "inf" ) ], $scope, undef, $pos->(45.5) ),
            undef, $pos->(45.3)
        );
        var(
            $class,
            nan => $$scope->{'Num'}
              ->( [ str( $f, "nan" ) ], $scope, undef, $pos->(46.5) ),
            undef, $pos->(46.3)
        );
    }
    load_namespaces( $context, qw(Int Integer Math Num) );
};

after_content();
