# === Document Model ===
#  Document './std/Math.frt'
#      Package 'Math'
#      Function 'sqrt'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$num'
#                      Argument type
#                          Bareword 'Num'
#              Instruction
#                  Return
#                      Call
#                          Property 'sqrt'
#                              Bareword 'NATIVE::Math'
#                          Argument list [1 items]
#                              Item 0
#                                  Lexical variable '$num'
#      Function 'root'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$root'
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
#                          Lexical variable '$num'
#                          Exponent operator (^)
#                          Single value [1 items]
#                              Item 0
#                                  Operation
#                                      Number '1'
#                                      Division operator (/)
#                                      Lexical variable '$root'
#      Include (NATIVE, NATIVE::Math, Num)
use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('Math.frt');

use Ferret::Core::Operations qw(div num pow);
my $result = do {
    my ( $scope, $context ) = FF::get_context( $f, 'Math' );
    FF::load_core('Math');

    # Function event 'sqrt' definition
    my $func_0 = FF::function_event_def(
        $f, $context, 'sqrt',
        [ { name => 'num', type => 'Num', optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'num', 4.2 ) or return;
            return $ret->return(
                $scope->property_u('NATIVE::Math')->property_u('sqrt')
                  ->call_u( [ $scope->property_u('num') ], $scope, undef, 5.3 )
            );
            return $ret->return;
        }
    );

    # Function event 'root' definition
    my $func_1 = FF::function_event_def(
        $f, $context, 'root',
        [
            { name => 'root', type => 'Num', optional => undef, more => undef },
            { name => 'num',  type => 'Num', optional => undef, more => undef }
        ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'root', 9.1 ) or return;
            FF::need( $scope, $args, 'num',  9.3 ) or return;
            return $ret->return(
                pow(
                    $scope,
                    $scope->property_u('num'),
                    div( $scope, num( $f, 1 ), $scope->property_u('root') )
                )
            );
            return $ret->return;
        }
    );
    $func_0->inside_scope( sqrt => $scope, $context, undef, undef, undef );
    $func_1->inside_scope( root => $scope, $context, undef, undef, undef );
    FF::load_namespaces( $context, qw(NATIVE NATIVE::Math Num) );
};

FF::after_content();
