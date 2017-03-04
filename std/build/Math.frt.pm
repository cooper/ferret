# === Document Model ===
#  File './std/Math.frt'
#      Package 'Math'
#          Instruction
#              Shared variable declaration
#                  Lazy assignment
#                      Lexical variable '$pi'
#                      Operation
#                          Number '4'
#                          Multiplication operator (*)
#                          Call
#                              Bareword 'atan2'
#                              Argument list [2 items]
#                                  Item 0
#                                      Number '1'
#                                  Item 1
#                                      Number '1'
#          Instruction
#              Shared variable declaration
#                  Lazy assignment
#                      Lexical variable '$e'
#                      Call
#                          Bareword 'exp'
#                          Argument list [1 item]
#                              Item 0
#                                  Number '1'
#          Function 'sin' { $num:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$num'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Call
#                              Property 'sin'
#                                  Bareword 'NATIVE::Math'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$num'
#          Function 'asin' { $num:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$num'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'atan2'
#                              Argument list [2 items]
#                                  Item 0
#                                      Lexical variable '$num'
#                                  Item 1
#                                      Property 'sqrt'
#                                          Single value [1 item]
#                                              Item 0
#                                                  Operation
#                                                      Number '1'
#                                                      Subtraction operator (-)
#                                                      Lexical variable '$num'
#                                                      Exponent operator (^)
#                                                      Number '2'
#          Function 'cos' { $num:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$num'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Call
#                              Property 'cos'
#                                  Bareword 'NATIVE::Math'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$num'
#          Function 'acos' { $num:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$num'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'atan2'
#                              Argument list [2 items]
#                                  Item 0
#                                      Property 'sqrt'
#                                          Single value [1 item]
#                                              Item 0
#                                                  Operation
#                                                      Number '1'
#                                                      Subtraction operator (-)
#                                                      Lexical variable '$num'
#                                                      Exponent operator (^)
#                                                      Number '2'
#                                  Item 1
#                                      Lexical variable '$num'
#          Function 'tan' { $num:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$num'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Operation
#                              Call
#                                  Bareword 'sin'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$num'
#                              Division operator (/)
#                              Call
#                                  Bareword 'cos'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$num'
#          Function 'atan2' { $y:Num $x:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$y'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Need
#                          Lexical variable '$x'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Call
#                              Property 'atan2'
#                                  Bareword 'NATIVE::Math'
#                              Argument list [2 items]
#                                  Item 0
#                                      Lexical variable '$y'
#                                  Item 1
#                                      Lexical variable '$x'
#          Function 'atan' { $num:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$num'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'atan2'
#                              Argument list [2 items]
#                                  Item 0
#                                      Lexical variable '$num'
#                                  Item 1
#                                      Number '1'
#          Function 'sec' { $num:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$num'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Operation
#                              Number '1'
#                              Division operator (/)
#                              Call
#                                  Bareword 'cos'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$num'
#          Function 'csc' { $num:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$num'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Operation
#                              Number '1'
#                              Division operator (/)
#                              Call
#                                  Bareword 'sin'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$num'
#          Function 'log' { $num:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$num'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Call
#                              Property 'log'
#                                  Bareword 'NATIVE::Math'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$num'
#          Function 'log10' { $num:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$num'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'logb'
#                              Argument list [2 items]
#                                  Item 0
#                                      Number '10'
#                                  Item 1
#                                      Lexical variable '$num'
#          Function 'logb' { $base:Num $num:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$base'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Need
#                          Lexical variable '$num'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Operation
#                              Call
#                                  Bareword 'log'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$num'
#                              Division operator (/)
#                              Call
#                                  Bareword 'log'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$base'
#          Function 'exp' { $num:Num -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$num'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Call
#                              Property 'exp'
#                                  Bareword 'NATIVE::Math'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$num'
#          Include (NATIVE::Math, Num)
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
use Ferret::Core::Operations qw(_sub div mul num pow);

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) = before_content( 'Math.frt', './std/Math.frt' );

$result = do {
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
            need( $scope, $args, 'num', 11.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'NATIVE::Math'}->property_u( 'sin', $pos->(12.25) )
                  ->( [ $$scope->{'num'} ], $scope, undef, $pos->(12.3) ) );
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
            need( $scope, $args, 'num', 17.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'atan2'}->(
                    [
                        $$scope->{'num'},
                        _sub(
                            $scope,
                            $pos->(18.4),
                            num( $f, "1" ),
                            pow(
                                $scope, $pos->(18.4),
                                $$scope->{'num'}, num( $f, "2" )
                            )
                        )->property_u( 'sqrt', $pos->(18.65) )
                    ],
                    $scope, undef,
                    $pos->(18.15)
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
            need( $scope, $args, 'num', 23.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'NATIVE::Math'}->property_u( 'cos', $pos->(24.25) )
                  ->( [ $$scope->{'num'} ], $scope, undef, $pos->(24.3) ) );
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
            need( $scope, $args, 'num', 29.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'atan2'}->(
                    [
                        _sub(
                            $scope,
                            $pos->(30.3),
                            num( $f, "1" ),
                            pow(
                                $scope, $pos->(30.3),
                                $$scope->{'num'}, num( $f, "2" )
                            )
                          )->property_u( 'sqrt', $pos->(30.55) ),
                        $$scope->{'num'}
                    ],
                    $scope, undef,
                    $pos->(30.15)
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
            need( $scope, $args, 'num', 35.2 ) || return $ret_func->();
            return $ret_func->(
                div(
                    $scope,
                    $pos->(36.3),
                    $$scope->{'sin'}
                      ->( [ $$scope->{'num'} ], $scope, undef, $pos->(36.15) ),
                    $$scope->{'cos'}
                      ->( [ $$scope->{'num'} ], $scope, undef, $pos->(36.4) )
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
            need( $scope, $args, 'y', 42.1 ) || return $ret_func->();
            need( $scope, $args, 'x', 42.3 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'NATIVE::Math'}->property_u( 'atan2', $pos->(43.25) )
                  ->(
                    [ $$scope->{'y'}, $$scope->{'x'} ], $scope,
                    undef, $pos->(43.3)
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
            need( $scope, $args, 'num', 48.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'atan2'}->(
                    [ $$scope->{'num'}, num( $f, "1" ) ], $scope,
                    undef, $pos->(49.3)
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
            need( $scope, $args, 'num', 54.2 ) || return $ret_func->();
            return $ret_func->(
                div(
                    $scope,
                    $pos->(55.3),
                    num( $f, "1" ),
                    $$scope->{'cos'}
                      ->( [ $$scope->{'num'} ], $scope, undef, $pos->(55.5) )
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
            need( $scope, $args, 'num', 60.2 ) || return $ret_func->();
            return $ret_func->(
                div(
                    $scope,
                    $pos->(61.3),
                    num( $f, "1" ),
                    $$scope->{'sin'}
                      ->( [ $$scope->{'num'} ], $scope, undef, $pos->(61.5) )
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
            need( $scope, $args, 'num', 66.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'NATIVE::Math'}->property_u( 'log', $pos->(67.25) )
                  ->( [ $$scope->{'num'} ], $scope, undef, $pos->(67.3) ) );
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
            need( $scope, $args, 'num', 72.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'logb'}->(
                    [ num( $f, "10" ), $$scope->{'num'} ], $scope,
                    undef, $pos->(73.3)
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
            need( $scope, $args, 'base', 78.1 ) || return $ret_func->();
            need( $scope, $args, 'num',  78.3 ) || return $ret_func->();
            return $ret_func->(
                div(
                    $scope,
                    $pos->(79.3),
                    $$scope->{'log'}
                      ->( [ $$scope->{'num'} ], $scope, undef, $pos->(79.15) ),
                    $$scope->{'log'}
                      ->( [ $$scope->{'base'} ], $scope, undef, $pos->(79.4) )
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
            need( $scope, $args, 'num', 84.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'NATIVE::Math'}->property_u( 'exp', $pos->(85.25) )
                  ->( [ $$scope->{'num'} ], $scope, undef, $pos->(85.3) ) );
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
    provides_namespaces( $context, $file_name, qw() );
    load_namespaces( $context, $file_name, qw(NATIVE::Math Num) );
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
                  ->( [ num( $f, "1" ) ], $scope, undef, $pos->(7.5) );
            }
        ],
        undef,
        $pos->(7.3)
    );
};

after_content($file_name);
