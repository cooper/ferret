# --- DOM ---
#  Document './test/hello19.frt'
#      Instruction
#          Assignment
#              Lexical variable '$words'
#              Call
#                  Property 'split'
#                      String 'how are you?'
#                  Structural list [1 items]
#                      Item 0
#                          String ' '
#      For
#          Expression ('for' parameter)
#              Lexical variable '$word'
#          Expression ('in' parameter)
#              Lexical variable '$words'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Structural list [1 items]
#                      Item 0
#                          Mathematical operation
#                              String 'part: '
#                              Addition operator (+)
#                              Lexical variable '$word'
#      Include
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
$Ferret::tried_files{'hello19.frt.pm'}++;

use Ferret::Core::Operations qw(add str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    $scope->set_property( words => str( $f, "how are you?" )->property('split')
          ->call( [ str( $f, " " ) ], $scope ) );
    foreach ( $scope->property('words')->iterate ) {
        my $scope = Ferret::Scope->new( $f, parent => $scope );
        $scope->set_property( word => $_ );

        $scope->property('say')
          ->call(
            [ add( $scope, str( $f, "part: " ), $scope->property('word') ) ],
            $scope );
    }
}

Ferret::runtime();
