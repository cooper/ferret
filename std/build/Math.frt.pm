# === Document Model ===
#  Document './std/Math.frt'
#      Package 'Math'
#      Instruction
#          Shared variable declaration
#              Lazy assignment
#                  Lexical variable '$pi'
#                  Call
#                      Property 'pi'
#                          Bareword 'NATIVE::Math'
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

use Ferret::Core::Operations qw(div);
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
            need( $scope, $args, 'num', 6.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'NATIVE::Math'}->property_u( 'sin', $pos->(7.25) )
                  ->( [ $$scope->{'num'} ], $scope, undef, $pos->(7.3) ) );
            return $ret;
        }
    );

    # Function event 'cos' definition
    my $func_1 = function_event_def(
        $f, $context, 'cos', undef,
        [ { name => 'num', type => 'Num', optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'num', 11.2 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'NATIVE::Math'}->property_u( 'cos', $pos->(12.25) )
                  ->( [ $$scope->{'num'} ], $scope, undef, $pos->(12.3) ) );
            return $ret;
        }
    );

    # Function event 'tan' definition
    my $func_2 = function_event_def(
        $f, $context, 'tan', undef,
        [ { name => 'num', type => 'Num', optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'num', 16.2 ) || return $ret_func->();
            return $ret_func->(
                div(
                    $scope,
                    $pos->(17.3),
                    $$scope->{'sin'}
                      ->( [ $$scope->{'num'} ], $scope, undef, $pos->(17.15) ),
                    $$scope->{'cos'}
                      ->( [ $$scope->{'num'} ], $scope, undef, $pos->(17.4) )
                )
            );
            return $ret;
        }
    );

    # Function event 'atan2' definition
    my $func_3 = function_event_def(
        $f, $context, 'atan2', undef,
        [
            { name => 'y', type => 'Num', optional => undef, more => undef },
            { name => 'x', type => 'Num', optional => undef, more => undef }
        ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'y', 21.1 ) || return $ret_func->();
            need( $scope, $args, 'x', 21.3 ) || return $ret_func->();
            return $ret_func->(
                $$scope->{'NATIVE::Math'}->property_u( 'atan2', $pos->(22.25) )
                  ->(
                    [ $$scope->{'y'}, $$scope->{'x'} ], $scope,
                    undef, $pos->(22.3)
                  )
            );
            return $ret;
        }
    );
    $func_0->inside_scope( sin => $scope, $context, undef, $ins, undef, undef );
    $func_1->inside_scope( cos => $scope, $context, undef, $ins, undef, undef );
    $func_2->inside_scope( tan => $scope, $context, undef, $ins, undef, undef );
    $func_3->inside_scope(
        atan2 => $scope,
        $context, undef, $ins, undef, undef
    );
    load_namespaces( $context, qw(NATIVE NATIVE::Math Num) );

    var(
        $context,
        pi => [
            sub {
                $$scope->{'NATIVE::Math'}->property_u( 'pi', $pos->(3.35) )
                  ->( [ undef, [] ], $scope, undef, $pos->(3.4) );
            }
        ],
        undef,
        $pos->(3.15)
    );
};

after_content();
