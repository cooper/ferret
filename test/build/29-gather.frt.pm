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
#                      Argument list [1 items]
#                          Item 0
#                              Call
#                                  Bareword 'nonZeroCoodinates'
#                                  Argument list [1 items]
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
#              Argument list [1 items]
#                  Item 0
#                      Call
#                          Bareword 'evenNumbers'
#                          Argument list [1 items]
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
#              Argument list [1 items]
#                  Item 0
#                      Call
#                          Bareword 'evenNumbers'
#                          Argument list [1 items]
#                              Item 0
#                                  Call
#                                      Property 'toList'
#                                          Single value [1 items]
#                                              Item 0
#                                                  Operation
#                                                      Number '0'
#                                                      Range operator (..)
#                                                      Number '9'
#      Include (Math, Math::Point, Num)
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

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('29-gather.frt');

use Ferret::Core::Operations qw(bool nequal num range);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Function event 'nonZeroCoodinates' definition
    my $func_0 = FF::function_event_def(
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
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'pt', 4.2 ) or return;
            return FF::gather(
                $f, $scope,
                sub {
                    my ( $scope, $take ) = @_;
                    if (
                        bool(
                            nequal(
                                $scope,
                                ${ $$scope->{'pt'} }->{'x'},
                                num( $f, "0" )
                            )
                        )
                      )
                    {
                        my $scope = Ferret::Scope->new( $f, parent => $scope );

                        $take->( ${ $$scope->{'pt'} }->{'x'} );
                    }
                    if (
                        bool(
                            nequal(
                                $scope,
                                ${ $$scope->{'pt'} }->{'y'},
                                num( $f, "0" )
                            )
                        )
                      )
                    {
                        my $scope = Ferret::Scope->new( $f, parent => $scope );

                        $take->( ${ $$scope->{'pt'} }->{'y'} );
                    }
                }
            );
            return $ret;
        }
    );

    # Function event 'evenNumbers' definition
    my $func_1 = FF::function_event_def(
        $f, $context,
        'evenNumbers',
        undef,
        [ { name => 'nums', type => 'Num', optional => undef, more => 1 } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'nums', 27.2 ) or return;
            $ret->set_property(
                even => FF::gather(
                    $f, $scope,
                    sub {
                        my ( $scope, $take ) = @_;
                        FF::iterate(
                            $f, $scope,
                            $$scope->{'nums'},
                            'n',
                            sub {
                                my ( $scope, $loop ) = @_;
                                if ( bool( ${ $$scope->{'n'} }->{'even'} ) ) {
                                    my $scope =
                                      Ferret::Scope->new( $f,
                                        parent => $scope );

                                    $take->( $$scope->{'n'} );
                                }
                            },
                            28.3
                        );
                    }
                ),
                28.2
            );
            return $ret;
        }
    );
    $func_0->inside_scope(
        nonZeroCoodinates => $scope,
        $context, undef, undef, undef
    );
    $func_1->inside_scope(
        evenNumbers => $scope,
        $context, undef, undef, undef
    );
    FF::load_namespaces( $context, qw(Math Math::Point Num) );
    FF::lex_assign(
        $scope,
        pt1 => $$scope->{'Math::Point'}
          ->( [ num( $f, "0" ), num( $f, "0" ) ], $scope, undef, 13.3 ),
        undef, 13.1
    );
    FF::lex_assign(
        $scope,
        pt2 => $$scope->{'Math::Point'}
          ->( [ num( $f, "1" ), num( $f, "1" ) ], $scope, undef, 14.3 ),
        undef, 14.1
    );
    FF::lex_assign(
        $scope,
        pt3 => $$scope->{'Math::Point'}
          ->( [ num( $f, "1" ), num( $f, "0" ) ], $scope, undef, 15.3 ),
        undef, 15.1
    );
    FF::iterate(
        $f, $scope,
        FF::create_list(
            $f, [ $$scope->{'pt1'}, $$scope->{'pt2'}, $$scope->{'pt3'} ]
        ),
        'pt',
        sub {
            my ( $scope, $loop ) = @_;
            $$scope->{'inspect'}->(
                [
                    $$scope->{'nonZeroCoodinates'}
                      ->( [ $$scope->{'pt'} ], $scope, undef, 21.4 )
                ],
                $scope, undef, 21.2
            );
        },
        17.05
    );
    $$scope->{'inspect'}->(
        [
            $$scope->{'evenNumbers'}->(
                [
                    FF::create_list(
                        $f,
                        [
                            num( $f, "1" ),
                            num( $f, "2" ),
                            num( $f, "3" ),
                            num( $f, "4" )
                        ]
                    )
                ],
                $scope, undef, 34.2
            )
        ],
        $scope, undef, 34.1
    );
    $$scope->{'inspect'}->(
        [
            $$scope->{'evenNumbers'}->(
                [
                    ${ range( $scope, num( $f, "0" ), num( $f, "9" ) ) }
                      ->{'toList'}->( {}, $scope, undef, 35.55 )
                ],
                $scope, undef, 35.2
            )
        ],
        $scope, undef, 35.1
    );
};

FF::after_content();
