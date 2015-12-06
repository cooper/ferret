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
#                  Argument list [1 items]
#                      Item 0
#                          Lexical variable '$obj'
#              Argument list [2 items]
#                  Item 0
#                      Number '1'
#                  Item 1
#                      Number '1'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Call
#                          Property 'pretty'
#                              Lexical variable '$obj'
#      Include (Math, Math::Point)
use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

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

FF::before_content('hello16.frt');

use Ferret::Core::Operations qw(num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    FF::load_namespaces( $context, qw(Math Math::Point) );
    $scope->set_property_ow(
        $context,
        obj => str( $f, "hi" ),
        4.04166666666667
    );
    $scope->property_u('Math::Point')->property_u('init')
      ->call_u( [ $scope->property_u('obj') ], $scope, undef, 18.3333333333333 )
      ->call_u( [ num( $f, 1 ), num( $f, 1 ) ],
        $scope, undef, 21.4583333333333 );
    $scope->property_u('say')->call_u(
        [
            $scope->property_u('obj')->property_u('pretty')
              ->call_u( {}, $scope, undef, 33.875 )
        ],
        $scope, undef, 30.75
    );
};

FF::after_content();
