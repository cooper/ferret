# === Document Model ===
#  Document './test/hello17.frt'
#      Instruction
#          Assignment (lexical variable '$obj')
#              Object [0 items]
#      Instruction
#          Call
#              Call
#                  Property 'init'
#                      Bareword 'Timer'
#                  Argument list [1 items]
#                      Item 0
#                          Lexical variable '$obj'
#              Argument list [1 items]
#                  Item 0
#                      Number '5'
#      On
#          Expression ('on' parameter)
#              Property 'expire'
#                  Call
#                      Property 'once'
#                          Lexical variable '$obj'
#                      Argument list [0 items]
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  String 'it works!'
#      Include (Timer)
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

FF::before_content('hello17.frt');

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
              ->call_u( [ str( $f, "it works!" ) ], $scope, undef, 8.4 );
            return $return;
        }
    );
    FF::load_namespaces( $context, qw(Timer) );
    $scope->set_property_ow(
        $context,
        obj => FF::create_object( $f, {} ),
        3.33333
    );
    $scope->property_u('Timer')->property_u('init')
      ->call_u( [ $scope->property_u('obj') ], $scope, undef, 5.33333 )
      ->call_u( [ num( $f, 5 ) ], $scope, undef, 5.66667 );
    FF::on(
        $scope->property_u('obj')->property_u('once')
          ->call_u( {}, $scope, undef, 7.57143 ),
        'expire',
        $self,
        $scope,
        $func_0->inside_scope( (undef) => $scope, $scope, undef, undef, undef ),
        {}
    );
};

FF::after_content();
