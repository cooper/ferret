# === Document Model ===
#  Document './test/hello24.frt'
#      Instruction
#          Call
#              Bareword 'delay'
#              Argument list [2 items]
#                  Item 0
#                      Number '5'
#                  Item 1
#                      Anonymous function
#                          Instruction
#                              Call
#                                  Bareword 'say'
#                                  Argument list [1 items]
#                                      Item 0
#                                          String 'been five ...'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      String 'waiting...'
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

FF::before_content('hello24.frt');

use Ferret::Core::Operations qw(num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, $scope, undef,
        [],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property_u('say')
              ->call_u( [ str( $f, "been five seconds" ) ], $scope, undef, 2 );
            return $return;
        }
    );
    $scope->property_u('delay')->call_u(
        [
            num( $f, 5 ),
            $func_0->inside_scope(
                (undef) => $scope,
                $scope, undef, undef, undef
            )
        ],
        $scope, undef, 1
    );
    $scope->property_u('say')
      ->call_u( [ str( $f, "waiting..." ) ], $scope, undef, 5 );
};

FF::after_content();
