# === Document Model ===
#  Document './test/hello16.frt'
#      Instruction
#          Assignment (lexical variable '$obj')
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
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die "config error";
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello16.frt.pm'}++;

use Ferret::Core::Operations qw(U num str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    undef;

    Ferret::space( $context, $_ ) for qw(Math Math::Point);
    $scope->set_property_ow( $context, obj => str( $f, "hi" ) );
    U(
        U(
            $scope->property_u('Math::Point')->property_u('init')
              ->call( [ $scope->property_u('obj') ], $scope )
        )->call( [ num( $f, 1 ), num( $f, 1 ) ], $scope )
    );
    U(
        $scope->property_u('say')->call(
            [
                U(
                    $scope->property_u('obj')->property_u('pretty')
                      ->call( {}, $scope )
                )
            ],
            $scope
        )
    );
};

Ferret::runtime();
