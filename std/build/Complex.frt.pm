# === Document Model ===
#  Document './std/Complex.frt'
#      Class 'Complex'
#          Class method 'initializer__' { $real:Int $imag:Int }
#              Function body
#                  Instruction
#                      Need
#                          Instance variable '@real'
#                          Argument type
#                              Bareword 'Int'
#                  Instruction
#                      Need
#                          Instance variable '@imag'
#                          Argument type
#                              Bareword 'Int'
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
#                                          Instance variable '@real'
#                                          Addition operator (+)
#                                          Property 'real'
#                                              Lexical variable '$rhs'
#                                  Item 1
#                                      Operation
#                                          Instance variable '@imag'
#                                          Addition operator (+)
#                                          Property 'imag'
#                                              Lexical variable '$rhs'
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
#                                          Instance variable '@real'
#                                          Subtraction operator (-)
#                                          Property 'real'
#                                              Lexical variable '$rhs'
#                                  Item 1
#                                      Operation
#                                          Instance variable '@imag'
#                                          Subtraction operator (-)
#                                          Property 'imag'
#                                              Lexical variable '$rhs'
#          Method 'description' { -> $result $result }
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$r'
#                          Instance variable '@real'
#                  Instruction
#                      Assignment
#                          Lexical variable '$i'
#                          Instance variable '@imag'
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
#      Include (Complex, Int)
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

use Ferret::Core::Operations qw(_sub add all_true bool equal less num str);
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
                    type     => 'Int',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'imag',
                    type     => 'Int',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $self, $args, 'real' ) || return $ret_func->();
                need( $self, $args, 'imag' ) || return $ret_func->();
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
                need( $scope, $args, 'rhs', 9.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            add(
                                $scope,
                                $$self->{'real'},
                                $$scope->{'rhs'}
                                  ->property_u( 'real', $pos->(10.35) )
                            ),
                            add(
                                $scope,
                                $$self->{'imag'},
                                $$scope->{'rhs'}
                                  ->property_u( 'imag', $pos->(10.6) )
                            )
                        ],
                        $scope, undef,
                        $pos->(10.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opSub' definition
        my $func_2 = method_event_def(
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
                need( $scope, $args, 'rhs', 14.2 ) || return $ret_func->();
                return $ret_func->(
                    $$scope->{'Complex'}->(
                        [
                            _sub(
                                $scope,
                                $$self->{'real'},
                                $$scope->{'rhs'}
                                  ->property_u( 'real', $pos->(15.35) )
                            ),
                            _sub(
                                $scope,
                                $$self->{'imag'},
                                $$scope->{'rhs'}
                                  ->property_u( 'imag', $pos->(15.6) )
                            )
                        ],
                        $scope, undef,
                        $pos->(15.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $func_3 = method_event_def(
            $f, $scope,
            'description',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var( $scope, r => $$self->{'real'}, $file_scope, $pos->(19.2) );
                var( $scope, i => $$self->{'imag'}, $file_scope, $pos->(20.2) );
                if (
                    bool(
                        all_true(
                            $scope,
                            sub {
                                equal( $scope, $$scope->{'r'}, num( $f, "0" ) );
                            },
                            sub {
                                equal( $scope, $$scope->{'i'}, num( $f, "0" ) );
                            }
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( str( $f, "0" ) );
                }
                if ( bool( equal( $scope, $$scope->{'r'}, num( $f, "0" ) ) ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    var(
                        $scope,
                        r => str( $f, "" ),
                        $file_scope, $pos->(24.2)
                    );
                }
                if ( bool( equal( $scope, $$scope->{'i'}, num( $f, "0" ) ) ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    var(
                        $scope,
                        i => str( $f, "" ),
                        $file_scope, $pos->(26.2)
                    );
                }
                elsif (
                    bool(
                        equal(
                            $scope, $$scope->{'i'},
                            _sub( $scope, $f->zero, num( $f, "1" ) )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    var(
                        $scope,
                        i => str( $f, "-i" ),
                        $file_scope, $pos->(28.2)
                    );
                }
                elsif ( bool( less( $scope, $$scope->{'i'}, num( $f, "0" ) ) ) )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    var(
                        $scope,
                        i => add( $scope, $$scope->{'i'}, str( $f, "i" ) ),
                        $file_scope, $pos->(30.2)
                    );
                }
                elsif (
                    bool( equal( $scope, $$scope->{'i'}, num( $f, "1" ) ) ) )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    var(
                        $scope,
                        i => str( $f, "+i" ),
                        $file_scope, $pos->(32.2)
                    );
                }
                else {
                    var(
                        $scope,
                        i => add(
                            $scope,         str( $f, "+" ),
                            $$scope->{'i'}, str( $f, "i" )
                        ),
                        $file_scope,
                        $pos->(34.2)
                    );
                }
                return $ret_func->(
                    add( $scope, $$scope->{'r'}, $$scope->{'i'} )
                      ->property_u( 'trimPrefix', $pos->(35.35) )
                      ->( [ str( $f, "+" ) ], $scope, undef, $pos->(35.4) ) );
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
            opSub => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Complex Int) );
};

after_content();
