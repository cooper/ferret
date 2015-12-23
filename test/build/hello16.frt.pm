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
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('hello16.frt');

use Ferret::Core::Operations qw(num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    FF::load_namespaces( $context, qw(Math Math::Point) );
    $scope->set_property_ow( $context, obj => str( $f, "hi" ), 2.2 );
    $scope->property_u('Math::Point')->property_u('init')
      ->call_u( [ $scope->property_u('obj') ], $scope, undef, 9.25 )
      ->call_u( [ num( $f, 1 ), num( $f, 1 ) ], $scope, undef, 9.4 );
    $scope->property_u('say')->call_u(
        [
            $scope->property_u('obj')->property_u('pretty')
              ->call_u( {}, $scope, undef, 11.5 )
        ],
        $scope, undef, 11.2
    );
};

FF::after_content();
