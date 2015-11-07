# === Document Model ===
#  Document './test/hello19.frt'
#      Instruction
#          Assignment (lexical variable '$words')
#              Call
#                  Property 'split'
#                      String 'how are you?'
#                  Single value [1 items]
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
#                  Single value [1 items]
#                      Item 0
#                          Operation
#                              String 'part: '
#                              Addition operator (+)
#                              Lexical variable '$word'
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

FF::before_content('hello19.frt');

use Ferret::Core::Operations qw(add str);
my $result = do {
    my @funcs;
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    $scope->set_property_ow( $context,
        words => str( $f, "how are you?" )->property_u('split')
          ->call_u( [ str( $f, " " ) ], $scope ) );
    FF::iterate(
        $f, $scope,
        $scope->property_u('words'),
        'word',
        sub {
            my $scope = shift;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope, str( $f, "part: " ),
                        $scope->property_u('word')
                    )
                ],
                $scope
            );
        }
    );
};

FF::after_content();
