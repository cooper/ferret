# === Document Model ===
#  Document './std/Math.frt'
#      Package 'Math'
#      Function 'sqrt'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$num'
#                      Bareword 'Num'
#              Instruction
#                  Return
#                      Call
#                          Property 'sqrt'
#                              Bareword 'NATIVE::Math'
#                          Argument list [1 items]
#                              Item 0
#                                  Lexical variable '$num'
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

use Ferret::Core::Operations qw();
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'Math' );
    FF::load_core('Math');

    # Function event 'sqrt' definition
    my $func_0 = FF::function_event_def(
        $f, $scope, 'sqrt',
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
    $func_0->inside_scope( sqrt => $scope, $scope, undef, undef, undef );
    FF::load_namespaces( $context, qw(NATIVE NATIVE::Math Num) );
};

FF::after_content();
