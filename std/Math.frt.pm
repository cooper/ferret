# === Document Model ===
#  Document './std/Math.frt'
#      Package 'Math'
#      Function 'sqrt'
#          Instruction
#              Need
#                  Lexical variable '$num'
#                  Bareword 'Num'
#          Instruction
#              Return
#                  Call
#                      Property 'sqrt'
#                          Bareword 'NATIVE::Math'
#                      Argument list [1 items]
#                          Item 0
#                              Lexical variable '$num'
#      Include (NATIVE, NATIVE::Math, Num)
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die 'config error';
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = FF::get_ferret();

FF::before_content('Math.frt');

use Ferret::Core::Operations qw();
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'Math' );
    FF::load_core('Math');

    # Function event 'sqrt' callback definition
    my $func_0 = FF::function_event_def(
        $f, $scope, 'sqrt',
        [ { name => 'num', type => 'Num', optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'num' ) or return;
            return $scope->property_u('NATIVE::Math')->property_u('sqrt')
              ->call_u( [ $scope->property_u('num') ], $scope, undef, 5 );
            return $return;
        }
    );
    $func_0->inside_scope( sqrt => $scope, $scope, undef, undef, undef );
    FF::load_namespaces( $context,
        qw(Math::NATIVE Math::NATIVE::Math Math::Num NATIVE NATIVE::Math Num) );
};

FF::after_content();
