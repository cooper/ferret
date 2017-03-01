# === Document Model ===
#  Document './std/Math.frt'
#      Package 'Math'
#      Instruction
#          Shared variable declaration
#              Lazy assignment
#                  Lexical variable '$pi'
#                  Operation
#                      Number '4'
#                      Multiplication operator (*)
#                      Call
#                          Bareword 'atan2'
#                          Argument list [2 items]
#                              Item 0
#                                  Number '1'
#                              Item 1
#                                  Number '1'
#      Instruction
#          Shared variable declaration
#              Lazy assignment
#                  Lexical variable '$e'
#                  Call
#                      Bareword 'exp'
#                      Argument list [1 item]
#                          Item 0
#                              Number '1'
#      Function 'sin' { $num:Num -> $result }
#          Function body
#              Instruction
#                  Need
#                      Lexical variable '$num'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Return
#                      Call
#                          Property 'sin'
#                              Bareword 'NATIVE::Math'
#                          Argument list [1 item]
#                              Item 0
#                                  Lexical variable '$num'
#      Function 'asin' { $num:Num -> $result }
#          Function body
#              Instruction
#                  Need
#                      Lexical variable '$num'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'atan2'
#                          Argument list [2 items]
#                              Item 0
#                                  Lexical variable '$num'
#                              Item 1
#                                  Property 'sqrt'
#                                      Single value [1 item]
#                                          Item 0
#                                              Operation
#                                                  Number '1'
#                                                  Subtraction operator (-)
#                                                  Lexical variable '$num'
#                                                  Exponent operator (^)
#                                                  Number '2'
#      Function 'cos' { $num:Num -> $result }
#          Function body
#              Instruction
#                  Need
#                      Lexical variable '$num'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Return
#                      Call
#                          Property 'cos'
#                              Bareword 'NATIVE::Math'
#                          Argument list [1 item]
#                              Item 0
#                                  Lexical variable '$num'
#      Function 'acos' { $num:Num -> $result }
#          Function body
#              Instruction
#                  Need
#                      Lexical variable '$num'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'atan2'
#                          Argument list [2 items]
#                              Item 0
#                                  Property 'sqrt'
#                                      Single value [1 item]
#                                          Item 0
#                                              Operation
#                                                  Number '1'
#                                                  Subtraction operator (-)
#                                                  Lexical variable '$num'
#                                                  Exponent operator (^)
#                                                  Number '2'
#                              Item 1
#                                  Lexical variable '$num'
#      Function 'tan' { $num:Num -> $result }
#          Function body
#              Instruction
#                  Need
#                      Lexical variable '$num'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Return
#                      Operation
#                          Call
#                              Bareword 'sin'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$num'
#                          Division operator (/)
#                          Call
#                              Bareword 'cos'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$num'
#      Function 'atan2' { $y:Num $x:Num -> $result }
#          Function body
#              Instruction
#                  Need
#                      Lexical variable '$y'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Need
#                      Lexical variable '$x'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Return
#                      Call
#                          Property 'atan2'
#                              Bareword 'NATIVE::Math'
#                          Argument list [2 items]
#                              Item 0
#                                  Lexical variable '$y'
#                              Item 1
#                                  Lexical variable '$x'
#      Function 'atan' { $num:Num -> $result }
#          Function body
#              Instruction
#                  Need
#                      Lexical variable '$num'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'atan2'
#                          Argument list [2 items]
#                              Item 0
#                                  Lexical variable '$num'
#                              Item 1
#                                  Number '1'
#      Function 'sec' { $num:Num -> $result }
#          Function body
#              Instruction
#                  Need
#                      Lexical variable '$num'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Return
#                      Operation
#                          Number '1'
#                          Division operator (/)
#                          Call
#                              Bareword 'cos'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$num'
#      Function 'csc' { $num:Num -> $result }
#          Function body
#              Instruction
#                  Need
#                      Lexical variable '$num'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Return
#                      Operation
#                          Number '1'
#                          Division operator (/)
#                          Call
#                              Bareword 'sin'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$num'
#      Function 'log' { $num:Num -> $result }
#          Function body
#              Instruction
#                  Need
#                      Lexical variable '$num'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Return
#                      Call
#                          Property 'log'
#                              Bareword 'NATIVE::Math'
#                          Argument list [1 item]
#                              Item 0
#                                  Lexical variable '$num'
#      Function 'log10' { $num:Num -> $result }
#          Function body
#              Instruction
#                  Need
#                      Lexical variable '$num'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Return
#                      Call
#                          Bareword 'logb'
#                          Argument list [2 items]
#                              Item 0
#                                  Number '10'
#                              Item 1
#                                  Lexical variable '$num'
#      Function 'logb' { $base:Num $num:Num -> $result }
#          Function body
#              Instruction
#                  Need
#                      Lexical variable '$base'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Need
#                      Lexical variable '$num'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Return
#                      Operation
#                          Call
#                              Bareword 'log'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$num'
#                          Division operator (/)
#                          Call
#                              Bareword 'log'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$base'
#      Function 'exp' { $num:Num -> $result }
#          Function body
#              Instruction
#                  Need
#                      Lexical variable '$num'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Return
#                      Call
#                          Property 'exp'
#                              Bareword 'NATIVE::Math'
#                          Argument list [1 item]
#                              Item 0
#                                  Lexical variable '$num'
#      Include (NATIVE, NATIVE::Math, Num)
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

my $pos = before_content( 'Math.frt', './std/Math.frt' );

use Ferret::Core::Operations qw(_sub div mul num pow);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'Math' );
    my $scope = $file_scope;
    load_core('Math');

    # Function event 'sin' definition
    my $func_0 = function_event_def(
        $f, $context, 'sin', undef,
        [ { name => 'num', type => 'Num', optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'num', 9.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'NATIVE::Math'}->property_u( 'sin', $pos->(10.25) )
                  ->( [ $$scope->{'num'} ], $scope, undef, $pos->(10.3) ) );
            return $ret;
        }
    );

    # Function event 'asin' definition
    my $func_1 = function_event_def(
        $f, $context, 'asin', undef,
        [ { name => 'num', type => 'Num', optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'num', 15.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'atan2'}->(
                    [
                        $$scope->{'num'},
                        _sub(
                            $scope,
                            $pos->(16.4),
                            num( $f, "1" ),
                            pow(
                                $scope, $pos->(16.4),
                                $$scope->{'num'}, num( $f, "2" )
                            )
                        )->property_u( 'sqrt', $pos->(16.65) )
                    ],
                    $scope, undef,
                    $pos->(16.15)
                )
            );
            return $ret;
        }
    );

    # Function event 'cos' definition
    my $func_2 = function_event_def(
        $f, $context, 'cos', undef,
        [ { name => 'num', type => 'Num', optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'num', 21.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'NATIVE::Math'}->property_u( 'cos', $pos->(22.25) )
                  ->( [ $$scope->{'num'} ], $scope, undef, $pos->(22.3) ) );
            return $ret;
        }
    );

    # Function event 'acos' definition
    my $func_3 = function_event_def(
        $f, $context, 'acos', undef,
        [ { name => 'num', type => 'Num', optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'num', 27.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'atan2'}->(
                    [
                        _sub(
                            $scope,
                            $pos->(28.3),
                            num( $f, "1" ),
                            pow(
                                $scope, $pos->(28.3),
                                $$scope->{'num'}, num( $f, "2" )
                            )
                          )->property_u( 'sqrt', $pos->(28.55) ),
                        $$scope->{'num'}
                    ],
                    $scope, undef,
                    $pos->(28.15)
                )
            );
            return $ret;
        }
    );

    # Function event 'tan' definition
    my $func_4 = function_event_def(
        $f, $context, 'tan', undef,
        [ { name => 'num', type => 'Num', optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'num', 33.2 ) || return $ret_func->();
            return $ret_func->(
                div(
                    $scope,
                    $pos->(34.3),
                    $$scope->{'sin'}
                      ->( [ $$scope->{'num'} ], $scope, undef, $pos->(34.15) ),
                    $$scope->{'cos'}
                      ->( [ $$scope->{'num'} ], $scope, undef, $pos->(34.4) )
                )
            );
            return $ret;
        }
    );

    # Function event 'atan2' definition
    my $func_5 = function_event_def(
        $f, $context, 'atan2', undef,
        [
            { name => 'y', type => 'Num', optional => undef, more => undef },
            { name => 'x', type => 'Num', optional => undef, more => undef }
        ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'y', 40.1 ) || return $ret_func->();
            need( $scope, $args, 'x', 40.3 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'NATIVE::Math'}->property_u( 'atan2', $pos->(41.25) )
                  ->(
                    [ $$scope->{'y'}, $$scope->{'x'} ], $scope,
                    undef, $pos->(41.3)
                  )
            );
            return $ret;
        }
    );

    # Function event 'atan' definition
    my $func_6 = function_event_def(
        $f, $context, 'atan', undef,
        [ { name => 'num', type => 'Num', optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'num', 46.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'atan2'}->(
                    [ $$scope->{'num'}, num( $f, "1" ) ], $scope,
                    undef, $pos->(47.3)
                )
            );
            return $ret;
        }
    );

    # Function event 'sec' definition
    my $func_7 = function_event_def(
        $f, $context, 'sec', undef,
        [ { name => 'num', type => 'Num', optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'num', 52.2 ) || return $ret_func->();
            return $ret_func->(
                div(
                    $scope,
                    $pos->(53.3),
                    num( $f, "1" ),
                    $$scope->{'cos'}
                      ->( [ $$scope->{'num'} ], $scope, undef, $pos->(53.5) )
                )
            );
            return $ret;
        }
    );

    # Function event 'csc' definition
    my $func_8 = function_event_def(
        $f, $context, 'csc', undef,
        [ { name => 'num', type => 'Num', optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'num', 58.2 ) || return $ret_func->();
            return $ret_func->(
                div(
                    $scope,
                    $pos->(59.3),
                    num( $f, "1" ),
                    $$scope->{'sin'}
                      ->( [ $$scope->{'num'} ], $scope, undef, $pos->(59.5) )
                )
            );
            return $ret;
        }
    );

    # Function event 'log' definition
    my $func_9 = function_event_def(
        $f, $context, 'log', undef,
        [ { name => 'num', type => 'Num', optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'num', 64.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'NATIVE::Math'}->property_u( 'log', $pos->(65.25) )
                  ->( [ $$scope->{'num'} ], $scope, undef, $pos->(65.3) ) );
            return $ret;
        }
    );

    # Function event 'log10' definition
    my $func_10 = function_event_def(
        $f, $context, 'log10', undef,
        [ { name => 'num', type => 'Num', optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'num', 70.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'logb'}->(
                    [ num( $f, "10" ), $$scope->{'num'} ], $scope,
                    undef, $pos->(71.3)
                )
            );
            return $ret;
        }
    );

    # Function event 'logb' definition
    my $func_11 = function_event_def(
        $f, $context, 'logb', undef,
        [
            { name => 'base', type => 'Num', optional => undef, more => undef },
            { name => 'num',  type => 'Num', optional => undef, more => undef }
        ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'base', 76.1 ) || return $ret_func->();
            need( $scope, $args, 'num',  76.3 ) || return $ret_func->();
            return $ret_func->(
                div(
                    $scope,
                    $pos->(77.3),
                    $$scope->{'log'}
                      ->( [ $$scope->{'num'} ], $scope, undef, $pos->(77.15) ),
                    $$scope->{'log'}
                      ->( [ $$scope->{'base'} ], $scope, undef, $pos->(77.4) )
                )
            );
            return $ret;
        }
    );

    # Function event 'exp' definition
    my $func_12 = function_event_def(
        $f, $context, 'exp', undef,
        [ { name => 'num', type => 'Num', optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'num', 82.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'NATIVE::Math'}->property_u( 'exp', $pos->(83.25) )
                  ->( [ $$scope->{'num'} ], $scope, undef, $pos->(83.3) ) );
            return $ret;
        }
    );
    $func_0->inside_scope( sin => $scope, $context, undef, $ins, undef, undef );
    $func_1->inside_scope(
        asin => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_2->inside_scope( cos => $scope, $context, undef, $ins, undef, undef );
    $func_3->inside_scope(
        acos => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_4->inside_scope( tan => $scope, $context, undef, $ins, undef, undef );
    $func_5->inside_scope(
        atan2 => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_6->inside_scope(
        atan => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_7->inside_scope( sec => $scope, $context, undef, $ins, undef, undef );
    $func_8->inside_scope( csc => $scope, $context, undef, $ins, undef, undef );
    $func_9->inside_scope( log => $scope, $context, undef, $ins, undef, undef );
    $func_10->inside_scope(
        log10 => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_11->inside_scope(
        logb => $scope,
        $context, undef, $ins, undef, undef
    );
    $func_12->inside_scope(
        exp => $scope,
        $context, undef, $ins, undef, undef
    );
    load_namespaces( $context, qw(NATIVE NATIVE::Math Num) );

    var(
        $context,
        pi => [
            sub {
                mul(
                    $scope,
                    $pos->(4.25),
                    num( $f, "4" ),
                    $$scope->{'atan2'}->(
                        [ num( $f, "1" ), num( $f, "1" ) ], $scope,
                        undef, $pos->(4.35)
                    )
                );
            }
        ],
        undef,
        $pos->(4.15)
    );
    var(
        $context,
        e => [
            sub {
                $$scope->{'exp'}
                  ->( [ num( $f, "1" ) ], $scope, undef, $pos->(5.5) );
            }
        ],
        undef,
        $pos->(5.3)
    );
};

after_content();
