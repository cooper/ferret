# === Document Model ===
#  Document './std/Char.frt'
#      Class 'Char'
#          Class method 'initializer__' { $from:Num|Str ?$isInit:Bool -> $result $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$from'
#                          Argument type
#                              Bareword 'Num'
#                              Bareword 'Str'
#                  Instruction
#                      Want
#                          Lexical variable '$isInit'
#                          Argument type
#                              Bareword 'Bool'
#                  If
#                      Expression ('if' parameter)
#                          Lexical variable '$isInit'
#                      If body
#                          Instruction
#                              Return
#                                  Lexical variable '$from'
#                  If
#                      Expression ('if' parameter)
#                          Call
#                              Special property '*instanceOf'
#                                  Lexical variable '$from'
#                              Argument list [1 item]
#                                  Item 0
#                                      Bareword 'Num'
#                      If body
#                          Instruction
#                              Throw (fatal exception)
#                                  Call
#                                      Bareword 'Error'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Symbol :Unimplemented
#                                          Item 1
#                                              String 'not yet im...'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Property 'length'
#                                  Lexical variable '$from'
#                              Negated equality operator (!=)
#                              Number '1'
#                      If body
#                          Instruction
#                              Throw (fatal exception)
#                                  Call
#                                      Bareword 'Error'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Symbol :InvalidConversion
#                                          Item 1
#                                              String 'String of ...'
#                  Instruction
#                      Call
#                          Call
#                              Property 'init'
#                                  Bareword 'Char'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$from'
#                          Named argument list [2 items]
#                              Item 0
#                                  Pair 'from'
#                                      Lexical variable '$from'
#                              Item 1
#                                  Pair 'isInit'
#                                      Boolean true
#                  Instruction
#                      Return
#                          Lexical variable '$from'
#      Include (Bool, Char, Error, Num, Str)
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

my $pos = before_content( 'Char.frt', './std/Char.frt' );

use Ferret::Core::Operations qw(bool nequal num str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'Char'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Char', undef, undef );

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
                need( $scope, $args, 'from', 4.2 ) || return $ret_func->();
                want( $scope, $args, 'isInit', 5.2 );
                if ( bool( $$scope->{'isInit'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->( $$scope->{'from'} );
                }
                if (
                    bool(
                        $$scope->{'from'}
                          ->property_u( '*instanceOf', $pos->(10.3) )->(
                            [ $$scope->{'Num'} ], $scope,
                            undef,                $pos->(10.4)
                          )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $ret->throw(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'Unimplemented' ),
                                    str( $f, "not yet implemented" )
                                ],
                                $scope, undef,
                                $pos->(11.3)
                            ),
                            $pos->(11.1)
                        )
                    );
                }
                if (
                    bool(
                        nequal(
                            $scope,
                            $pos->(13.4),
                            $$scope->{'from'}
                              ->property_u( 'length', $pos->(13.3) ),
                            num( $f, "1" )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $ret->throw(
                            $$scope->{'Error'}->(
                                [
                                    get_symbol( $f, 'InvalidConversion' ),
                                    str(
                                        $f,
                                        "String of length != cannot be Char"
                                    )
                                ],
                                $scope, undef,
                                $pos->(14.3)
                            ),
                            $pos->(14.1)
                        )
                    );
                }
                $$scope->{'Char'}->property_u( 'init', $pos->(16.1) )
                  ->( [ $$scope->{'from'} ], $scope, undef, $pos->(16.15) )->(
                    [ undef, [ from => $$scope->{'from'}, isInit => $true ] ],
                    $scope, undef, $pos->(16.3)
                  );
                return $ret_func->( $$scope->{'from'} );
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Bool Char Error Num Str) );
};

after_content();
