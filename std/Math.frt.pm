# --- DOM ---
#  Document './std/Math.frt'
#      Package 'Math'
#      Function 'sqrt'
#          Instruction
#              Need
#                  Lexical variable '$num'
#                  Colon (:)
#                  Bareword 'Num'
#          Instruction
#              Return
#                  Call
#                      Property 'sqrt'
#                          Bareword 'NATIVE::Math'
#                      Structural list [1 items]
#                          Item 0
#                              Lexical variable '$num'
#      Include (NATIVE, Num, NATIVE::Math)
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    my $libs = do '/etc/ferret.conf';
    ref $libs eq 'ARRAY' or die "config error";
    unshift @INC, @$libs;
}

use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'Math.frt.pm'}++;

use Ferret::Core::Operations qw();
{
    my @funcs;
    my $scope = my $context = $f->get_context('Math');

    # Function 'sqrt' definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, name => 'sqrt' );
        $func->add_argument( name => 'num' );
        $func->{code} = sub {
            my ( $self, $arguments, $from_scope, $scope, $return ) = @_;
            do {
                return if not defined $arguments->{num};
                $scope->set_property( num => $arguments->{num} );
            };
            return $scope->property('NATIVE::Math')->property('sqrt')
              ->call( [ $scope->property('num') ], $scope );
            return $return;
        };
    }
    $funcs[0]->inside_scope( sqrt => $scope, $scope );
    Ferret::space( $context, $_ ) for qw(NATIVE Num NATIVE::Math);
}

Ferret::runtime();
