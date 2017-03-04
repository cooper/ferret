# === Document Model ===
#  File './std/Char.frt'
#      Package 'main'
#          Type definition ('Char')
#              Type body
#                  Instruction
#                      Transform
#                          Call
#                              Bareword 'Character'
#                              Named argument list [1 item]
#                                  Item 0
#                                      Pair 'from'
#                                          Topic variable '$_'
#          Class 'Character'
#              Class method 'initializer__' { $from:Num|Str ?$isInit:Bool -> $result $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$from'
#                              Argument type
#                                  Bareword 'Num'
#                                  Bareword 'Str'
#                      Instruction
#                          Want
#                              Lexical variable '$isInit'
#                              Argument type
#                                  Bareword 'Bool'
#                      If
#                          Expression ('if' parameter)
#                              Lexical variable '$isInit'
#                          If body
#                              Instruction
#                                  Return
#                                      Lexical variable '$from'
#                      If
#                          Expression ('if' parameter)
#                              Call
#                                  Special property '*instanceOf'
#                                      Lexical variable '$from'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Bareword 'Num'
#                          If body
#                              Instruction
#                                  Fail (nonfatal exception)
#                                      Call
#                                          Bareword 'Error'
#                                          Argument list [2 items]
#                                              Item 0
#                                                  Symbol :Unimplemented
#                                              Item 1
#                                                  String 'not yet im...'
#                      If
#                          Expression ('if' parameter)
#                              Operation
#                                  Property 'length'
#                                      Lexical variable '$from'
#                                  Negated equality operator (!=)
#                                  Number '1'
#                          If body
#                              Instruction
#                                  Fail (nonfatal exception)
#                                      Call
#                                          Bareword 'Error'
#                                          Argument list [2 items]
#                                              Item 0
#                                                  Symbol :InvalidConversion
#                                              Item 1
#                                                  String 'String of ...'
#                      Instruction
#                          Call
#                              Call
#                                  Property 'init'
#                                      Bareword 'Character'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$from'
#                              Named argument list [2 items]
#                                  Item 0
#                                      Pair 'from'
#                                          Lexical variable '$from'
#                                  Item 1
#                                      Pair 'isInit'
#                                          Boolean true
#                      Instruction
#                          Return
#                              Lexical variable '$from'
#              Computed property 'ord' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Call
#                                  Property 'ord'
#                                      Bareword 'NATIVE'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Special variable '*self'
#          Include (Bool, Character, Error, NATIVE, Num, Str)
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
use Ferret::Core::Operations qw(bool nequal num str);

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) = before_content( 'Char.frt', './std/Char.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'Character'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Character', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'from',
                    type     => [ 'Num', 'Str' ],
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'isInit',
                    type     => 'Bool',
                    optional => 1,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'from', 8.2 ) || return $ret_func->();
                want( $scope, $args, 'isInit', 9.2 );
                if ( bool( $$scope->{'isInit'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( $$scope->{'from'} );
                }
                if (
                    bool(
                        $$scope->{'from'}
                          ->property_u( '*instanceOf', $pos->(14.3) )->(
                            [ $$scope->{'Num'} ], $scope,
                            undef,                $pos->(14.4)
                          )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $ret->fail(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'Unimplemented' ),
                                    str( $f, "not yet implemented" )
                                ],
                                $scope, undef,
                                $pos->(15.3)
                            ),
                            $pos->(15.1)
                        )
                    );
                }
                if (
                    bool(
                        nequal(
                            $scope,
                            $pos->(17.4),
                            $$scope->{'from'}
                              ->property_u( 'length', $pos->(17.3) ),
                            num( $f, "1" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $ret->fail(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'InvalidConversion' ),
                                    str(
                                        $f,
                                        "String of length != cannot be Char"
                                    )
                                ],
                                $scope, undef,
                                $pos->(18.3)
                            ),
                            $pos->(18.1)
                        )
                    );
                }
                $$scope->{'Character'}->property_u( 'init', $pos->(20.1) )
                  ->( [ $$scope->{'from'} ], $scope, undef, $pos->(20.15) )->(
                    [ undef, [ from => $$scope->{'from'}, isInit => $true ] ],
                    $scope, undef, $pos->(20.3)
                  );
                return $ret_func->( $$scope->{'from'} );
                return $ret;
            }
        );

        # Method event 'ord' definition
        my $func_1 = method_event_def(
            $f, $scope, 'ord', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$scope->{'NATIVE'}->property_u( 'ord', $pos->(25.3) )->(
                        [ ${ $scope->{special} }->{'self'} ], $scope,
                        undef,                                $pos->(25.4)
                    )
                );
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope( ord => $scope, $proto, $class, $ins, 1, undef );
    }
    provides_namespaces( $context, $file_name, qw(Char Character) );
    load_namespaces( $context, $file_name,
        qw(Bool Character Error NATIVE Num Str) );
    typedef(
        $scope, $context, 'Char',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            state $anchor = \0 + 0;
            typedef_check(
                $scope, $scope, $ins, $anchor,
                conditions => [
                    sub {
                        do {
                            $ins = $transform->(
                                $$scope->{'Character'}->(
                                    [ undef, [ from => $ins ] ], $scope,
                                    undef, $pos->(2.3)
                                ),
                                $ins
                            );
                          }
                    }
                ],
                equal_to => undef
            ) ? $ins : undef;
        },
        undef
    );
};

after_content($file_name);
