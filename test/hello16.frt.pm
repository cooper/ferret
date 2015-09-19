# --- DOM ---
#  Document './test/hello16.frt'
#      Instruction
#          Assignment
#              Lexical variable '$obj'
#              String 'hi'
#      Instruction
#          Call
#              Call
#                  Property 'init'
#                      Bareword 'Math::Point'
#                  Structural list [1 items]
#                      Item 0
#                          Lexical variable '$obj'
#              Structural list [2 items]
#                  Item 0
#                      Number '1'
#                  Item 1
#                      Number '1'
#      Instruction
#          Call
#              Bareword 'say'
#              Structural list [1 items]
#                  Item 0
#                      Call
#                          Property 'pretty'
#                              Lexical variable '$obj'
#      Include (Math, Math::Point)
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

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello16.frt.pm'}++;

use Ferret::Core::Operations qw(num str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    Ferret::space( $context, $_ ) for qw(Math Math::Point);
    $scope->set_property( obj => str( $f, "hi" ) );
    $scope->property('Math::Point')->property('init')
      ->call( [ $scope->property('obj') ], $scope )
      ->call( [ num( $f, 1 ), num( $f, 1 ) ], $scope );
    $scope->property('say')
      ->call(
        [ $scope->property('obj')->property('pretty')->call( {}, $scope ) ],
        $scope );
}

Ferret::runtime();
