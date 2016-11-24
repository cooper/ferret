# === Document Model ===
#  Document './std/Error.frt'
#      Class 'Error' version 1.0
#          Class method 'initializer__'
#              Function body
#                  Instruction
#                      Need
#                          Instance variable '@type'
#                          Argument type
#                              Bareword 'Sym'
#                  Instruction
#                      Need
#                          Instance variable '@msg'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Want
#                          Instance variable '@hints'
#                          Argument type
#                              Bareword 'List'
#                          Argument value
#                              Value list [0 items]
#                  Instruction
#                      Want
#                          Instance variable '@subError'
#                          Argument type
#                              Bareword 'Error'
#                  Instruction
#                      Want
#                          Instance variable '@fatal'
#                          Argument value
#                              Boolean false
#                  Instruction
#                      Call
#                          Property 'bless'
#                              Bareword 'NATIVE'
#                          Argument list [2 items]
#                              Item 0
#                                  Special variable '*self'
#                              Item 1
#                                  String 'Ferret::Error'
#          Method 'setPosition'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$file'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Need
#                          Lexical variable '$line'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Call
#                          Property 'push'
#                              Instance variable '@hints'
#                          Argument list [4 items]
#                              Item 0
#                                  String 'File'
#                              Item 1
#                                  Lexical variable '$file'
#                              Item 2
#                                  String 'Line'
#                              Item 3
#                                  Lexical variable '$line'
#          Method 'description'
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$desc'
#                          Operation
#                              String '['
#                              Addition operator (+)
#                              Property 'name'
#                                  Instance variable '@type'
#                              Addition operator (+)
#                              String '] '
#                              Addition operator (+)
#                              Instance variable '@msg'
#                  If
#                      Expression ('if' parameter)
#                          Negation
#                              Property 'empty'
#                                  Instance variable '@hints'
#                      If body
#                          Instruction
#                              Addition assignment
#                                  Lexical variable '$desc'
#                                  Call
#                                      Bareword '_prettyHints'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Instance variable '@hints'
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@subError'
#                      If body
#                          Instruction
#                              Addition assignment
#                                  Lexical variable '$desc'
#                                  Operation
#                                      String ' ->'
#                                      Addition operator (+)
#                                      Special property '*description'
#                                          Instance variable '@subError'
#                  Instruction
#                      Return
#                          Lexical variable '$desc'
#          Function '_prettyHints'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$list'
#                          Argument type
#                              Bareword 'List'
#                  Instruction
#                      Assignment
#                          Lexical variable '$str'
#                          String '␤'
#                  For (pairs)
#                      Expression ('for' parameter)
#                          Set [2 items]
#                              Item 0
#                                  Lexical variable '$i'
#                              Item 1
#                                  Lexical variable '$el'
#                      Expression ('in' parameter)
#                          Lexical variable '$list'
#                      For body
#                          If
#                              Expression ('if' parameter)
#                                  Property 'even'
#                                      Lexical variable '$i'
#                              If body
#                                  Instruction
#                                      Addition assignment
#                                          Lexical variable '$str'
#                                          Operation
#                                              String '    '
#                                              Addition operator (+)
#                                              Lexical variable '$el'
#                                              Addition operator (+)
#                                              String ': '
#                          Else
#                              Else body
#                                  Instruction
#                                      Addition assignment
#                                          Lexical variable '$str'
#                                          Operation
#                                              Lexical variable '$el'
#                                              Addition operator (+)
#                                              String '␤'
#                  Instruction
#                      Return
#                          Lexical variable '$str'
#      Include (Error, List, NATIVE, Num, Str, Sym)
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

my $pos = before_content( 'Error.frt', './std/Error.frt' );

use Ferret::Core::Operations qw(_not add bool str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Function event '_prettyHints' definition
    my $func_3 = function_event_def(
        $f, $scope,
        '_prettyHints',
        undef,
        [
            {
                name     => 'list',
                type     => 'List',
                optional => undef,
                more     => undef
            }
        ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'list', 29.2 ) || return $ret_func->();
            var( $scope, str => str( $f, "\n" ), $file_scope, $pos->(30.2) );
            {
                my ( $loop_status, $loop_ret ) = iterate_pair(
                    $f, $scope,
                    $$scope->{'list'},
                    'i', 'el',
                    sub {
                        my ( $scope, $ret_func ) = @_;
                        if (
                            bool(
                                $$scope->{'i'}
                                  ->property_u( 'even', $pos->(32.3) )
                            )
                          )
                        {
                            my $scope =
                              Ferret::Scope->new( $f, parent => $scope );

                            var(
                                $scope,
                                str => add(
                                    $scope,
                                    $$scope->{'str'},
                                    add(
                                        $scope,          str( $f, "    " ),
                                        $$scope->{'el'}, str( $f, ": " )
                                    )
                                ),
                                $file_scope,
                                $pos->(33.2)
                            );
                        }
                        else {
                            var(
                                $scope,
                                str => add(
                                    $scope,
                                    $$scope->{'str'},
                                    add(
                                        $scope, $$scope->{'el'},
                                        str( $f, "\n" )
                                    )
                                ),
                                $file_scope,
                                $pos->(35.2)
                            );
                        }
                    },
                    $pos->(31.05)
                );
                return $ret_func->($loop_ret) if $loop_status eq 'return';
            }
            return $ret_func->( $$scope->{'str'} );
            return $ret;
        }
    );

    # Class 'Error'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Error', 1.0, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def( $f, $scope, 'initializer__' );

        # Method event 'setPosition' definition
        my $func_1 = method_event_def( $f, $scope, 'setPosition' );

        # Method event 'description' definition
        my $func_2 = method_event_def( $f, $scope, 'description' );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            setPosition => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_2->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            _prettyHints => $scope,
            $scope, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Error List NATIVE Num Str Sym) );
};

after_content();
