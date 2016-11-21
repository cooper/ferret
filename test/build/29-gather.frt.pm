# === Document Model ===
#  Document './test/29-gather.frt'
#      Function 'nonZeroCoodinates'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$pt'
#                      Argument type
#                          Bareword 'Math::Point'
#              Instruction
#                  Return
#                      Gather
#                          Body ('gather' scope)
#                              If
#                                  Expression ('if' parameter)
#                                      Operation
#                                          Property 'x'
#                                              Lexical variable '$pt'
#                                          Negated equality operator (!=)
#                                          Number '0'
#                                  Body ('if' scope)
#                                      Instruction
#                                          Take
#                                              Property 'x'
#                                                  Lexical variable '$pt'
#                              If
#                                  Expression ('if' parameter)
#                                      Operation
#                                          Property 'y'
#                                              Lexical variable '$pt'
#                                          Negated equality operator (!=)
#                                          Number '0'
#                                  Body ('if' scope)
#                                      Instruction
#                                          Take
#                                              Property 'y'
#                                                  Lexical variable '$pt'
#      Instruction
#          Assignment
#              Lexical variable '$pt1'
#              Call
#                  Bareword 'Math::Point'
#                  Argument list [2 items]
#                      Item 0
#                          Number '0'
#                      Item 1
#                          Number '0'
#      Instruction
#          Assignment
#              Lexical variable '$pt2'
#              Call
#                  Bareword 'Math::Point'
#                  Argument list [2 items]
#                      Item 0
#                          Number '1'
#                      Item 1
#                          Number '1'
#      Instruction
#          Assignment
#              Lexical variable '$pt3'
#              Call
#                  Bareword 'Math::Point'
#                  Argument list [2 items]
#                      Item 0
#                          Number '1'
#                      Item 1
#                          Number '0'
#      For (values)
#          Expression ('for' parameter)
#              Lexical variable '$pt'
#          Expression ('in' parameter)
#              Value list [3 items]
#                  Item 0
#                      Lexical variable '$pt1'
#                  Item 1
#                      Lexical variable '$pt2'
#                  Item 2
#                      Lexical variable '$pt3'
#          Body ('for' scope)
#              Instruction
#                  Call
#                      Bareword 'inspect'
#                      Argument list [1 item]
#                          Item 0
#                              Call
#                                  Bareword 'nonZeroCoodinates'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$pt'
#      Function 'evenNumbers'
#          Body ('function' scope)
#              Instruction
#                  Need (...)
#                      Lexical variable '$nums'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Return pair 'even'
#                      Gather
#                          Body ('gather' scope)
#                              For (values)
#                                  Expression ('for' parameter)
#                                      Lexical variable '$n'
#                                  Expression ('in' parameter)
#                                      Lexical variable '$nums'
#                                  Body ('for' scope)
#                                      If
#                                          Expression ('if' parameter)
#                                              Property 'even'
#                                                  Lexical variable '$n'
#                                          Body ('if' scope)
#                                              Instruction
#                                                  Take
#                                                      Lexical variable '$n'
#      Instruction
#          Call
#              Bareword 'inspect'
#              Argument list [1 item]
#                  Item 0
#                      Call
#                          Bareword 'evenNumbers'
#                          Argument list [1 item]
#                              Item 0
#                                  Value list [4 items]
#                                      Item 0
#                                          Number '1'
#                                      Item 1
#                                          Number '2'
#                                      Item 2
#                                          Number '3'
#                                      Item 3
#                                          Number '4'
#      Instruction
#          Call
#              Bareword 'inspect'
#              Argument list [1 item]
#                  Item 0
#                      Call
#                          Bareword 'evenNumbers'
#                          Argument list [1 item]
#                              Item 0
#                                  Call
#                                      Property 'toList'
#                                          Single value [1 item]
#                                              Item 0
#                                                  Operation
#                                                      Number '0'
#                                                      Range operator (..)
#                                                      Number '9'
#      Include (Math, Math::Point, Num)
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

my $pos = before_content( '29-gather.frt', './test/29-gather.frt' );

use Ferret::Core::Operations qw(bool nequal num range);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Function event 'nonZeroCoodinates' definition
    my $func_0 = function_event_def(
        $f, $context,
        'nonZeroCoodinates',
        undef,
        [
            {
                name     => 'pt',
                type     => 'Math::Point',
                optional => undef,
                more     => undef
            }
        ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'pt', 4.2 ) || return;
            return $ret_func->(
                do {
                    my ( $gather_status, $gather_ret ) = gather(
                        $f, $scope,
                        sub {
                            my ( $scope, $take, $ret_func ) = @_;
                            if (
                                bool(
                                    nequal(
                                        $scope,
                                        $$scope->{'pt'}
                                          ->property_u( 'x', $pos->(6.3) ),
                                        num( $f, "0" )
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                $take->( $$scope->{'pt'}
                                      ->property_u( 'x', $pos->(7.3) ) );
                            }
                            if (
                                bool(
                                    nequal(
                                        $scope,
                                        $$scope->{'pt'}
                                          ->property_u( 'y', $pos->(8.3) ),
                                        num( $f, "0" )
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                $take->( $$scope->{'pt'}
                                      ->property_u( 'y', $pos->(9.3) ) );
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

    # Function event 'evenNumbers' definition
    my $func_1 = function_event_def(
        $f, $context,
        'evenNumbers',
        undef,
        [ { name => 'nums', type => 'Num', optional => undef, more => 1 } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'nums', 27.2 ) || return;
            $ret->set_property(
                even => do {
                    my ( $gather_status, $gather_ret ) = gather(
                        $f, $scope,
                        sub {
                            my ( $scope, $take, $ret_func ) = @_;
                            {
                                my $loop_ret = iterate(
                                    $f, $scope,
                                    $$scope->{'nums'},
                                    'n',
                                    sub {
                                        my ( $scope, $ret_func ) = @_;
                                        if (
                                            bool(
                                                $$scope->{'n'}->property_u(
                                                    'even', $pos->(29.3)
                                                )
                                            )
                                          )
                                        {
                                            my $scope =
                                              Ferret::Scope->new( $f,
                                                parent => $scope );

                                            $take->( $$scope->{'n'} );
                                        }
                                    },
                                    $pos->(28.3)
                                );
                                return $ret_func->($loop_ret) if $loop_ret;
                            }
                        }
                    );
                    return $ret_func->($gather_ret)
                      if $gather_status eq 'return';
                    $gather_ret;
                },
                $pos->(28.2)
            );
            return $ret;
        }
    );
    $func_0->inside_scope(
        nonZeroCoodinates => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_1->inside_scope(
        evenNumbers => $scope,
        $context, undef, $ins, undef, undef
    );
    load_namespaces( $context, qw(Math Math::Point Num) );
    var(
        $scope,
        pt1 => $$scope->{'Math::Point'}
          ->( [ num( $f, "0" ), num( $f, "0" ) ], $scope, undef, $pos->(13.3) ),
        undef, $pos->(13.1)
    );
    var(
        $scope,
        pt2 => $$scope->{'Math::Point'}
          ->( [ num( $f, "1" ), num( $f, "1" ) ], $scope, undef, $pos->(14.3) ),
        undef, $pos->(14.1)
    );
    var(
        $scope,
        pt3 => $$scope->{'Math::Point'}
          ->( [ num( $f, "1" ), num( $f, "0" ) ], $scope, undef, $pos->(15.3) ),
        undef, $pos->(15.1)
    );
    {
        my $loop_ret = iterate(
            $f, $scope,
            create_list(
                $f, [ $$scope->{'pt1'}, $$scope->{'pt2'}, $$scope->{'pt3'} ]
            ),
            'pt',
            sub {
                my ( $scope, $ret_func ) = @_;
                $$scope->{'inspect'}->(
                    [
                        $$scope->{'nonZeroCoodinates'}->(
                            [ $$scope->{'pt'} ], $scope, undef, $pos->(21.4)
                        )
                    ],
                    $scope, undef,
                    $pos->(21.2)
                );
            },
            $pos->(17.05)
        );
        return $ret_func->($loop_ret) if $loop_ret;
    }
    $$scope->{'inspect'}->(
        [
            $$scope->{'evenNumbers'}->(
                [
                    create_list(
                        $f,
                        [
                            num( $f, "1" ),
                            num( $f, "2" ),
                            num( $f, "3" ),
                            num( $f, "4" )
                        ]
                    )
                ],
                $scope, undef,
                $pos->(34.2)
            )
        ],
        $scope, undef,
        $pos->(34.1)
    );
    $$scope->{'inspect'}->(
        [
            $$scope->{'evenNumbers'}->(
                [
                    range( $scope, num( $f, "0" ), num( $f, "9" ) )
                      ->property_u( 'toList', $pos->(35.5) )
                      ->( [ undef, [] ], $scope, undef, $pos->(35.55) )
                ],
                $scope, undef,
                $pos->(35.2)
            )
        ],
        $scope, undef,
        $pos->(35.1)
    );
};

after_content();
