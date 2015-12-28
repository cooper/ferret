# === Document Model ===
#  Document './test/13-timers.frt'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      String 'hello'
#      On
#          Expression ('on' parameter)
#              Property 'expire'
#                  Call
#                      Property 'once'
#                          Call
#                              Bareword 'Timer'
#                              Argument list [1 items]
#                                  Item 0
#                                      Number '5'
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  String 'five secon...'
#      Instruction
#          Assignment (lexical variable '$t2')
#              Call
#                  Bareword 'Timer'
#                  Argument list [1 items]
#                      Item 0
#                          Number '2'
#      On
#          Expression ('on' parameter)
#              Property 'expire'
#                  Call
#                      Property 'once'
#                          Lexical variable '$t2'
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  String 'this shoul...'
#      Instruction
#          Call
#              Property 'cancel'
#                  Lexical variable '$t2'
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
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('13-timers.frt');

use Ferret::Core::Operations qw(num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, $scope, undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $scope->property_u('say')
              ->call_u( [ str( $f, "five seconds up" ) ], $scope, undef, 4.2 );
            return $ret->return;
        }
    );

    # Anonymous function definition
    my $func_1 = FF::function_def(
        $f, $scope, undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $scope->property_u('say')
              ->call_u( [ str( $f, "this shouldn't be said" ) ],
                $scope, undef, 9.2 );
            return $ret->return;
        }
    );
    FF::load_namespaces( $context, qw(Timer) );
    $scope->property_u('say')
      ->call_u( [ str( $f, "hello" ) ], $scope, undef, 1.2 );
    FF::on(
        $scope->property_u('Timer')
          ->call_u( [ num( $f, 5 ) ], $scope, undef, 3.15 )->property_u('once')
          ->call_u( {}, $scope, undef, 3.35 ),
        'expire',
        $self,
        $scope,
        $func_0->inside_scope( (undef) => $scope, $scope, undef, undef, undef ),
        {}
    );
    $scope->set_property_ow(
        $context,
        t2 => $scope->property_u('Timer')
          ->call_u( [ num( $f, 2 ) ], $scope, undef, 7.4 ),
        7.2
    );
    FF::on(
        $scope->property_u('t2')->property_u('once')
          ->call_u( {}, $scope, undef, 8.4 ),
        'expire',
        $self,
        $scope,
        $func_1->inside_scope( (undef) => $scope, $scope, undef, undef, undef ),
        {}
    );
    $scope->property_u('t2')->property_u('cancel')
      ->call_u( {}, $scope, undef, 12.3 );
};

FF::after_content();
