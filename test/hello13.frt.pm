# === Document Model ===
#  Document './test/hello13.frt'
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

FF::before_content('hello13.frt');

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
            $scope->property_u('say')->call_u( [ str( $f, "five seconds up" ) ],
                $scope, undef, 20.3488372093023 );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_1 = FF::function_def(
        $f, $scope, undef,
        [],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property_u('say')
              ->call_u( [ str( $f, "this shouldn't be said" ) ],
                $scope, undef, 44.7906976744186 );
            return $return;
        }
    );
    FF::load_namespaces( $context, qw(Timer) );
    $scope->property_u('say')
      ->call_u( [ str( $f, "hello" ) ], $scope, undef, 3.02325581395349 );
    FF::on(
        $scope->property_u('Timer')
          ->call_u( [ num( $f, 5 ) ], $scope, undef, 11.1627906976744 )
          ->property_u('once')->call_u( {}, $scope, undef, 15.2558139534884 ),
        'expire',
        $self,
        $scope,
        $func_0->inside_scope( (undef) => $scope, $scope, undef, undef, undef )
    );
    $scope->set_property_ow(
        $context,
        t2 => $scope->property_u('Timer')
          ->call_u( [ num( $f, 2 ) ], $scope, undef, 31.5348837209302 ),
        29.4883720930233
    );
    FF::on(
        $scope->property_u('t2')->property_u('once')
          ->call_u( {}, $scope, undef, 39.6976744186046 ),
        'expire',
        $self,
        $scope,
        $func_1->inside_scope( (undef) => $scope, $scope, undef, undef, undef )
    );
    $scope->property_u('t2')->property_u('cancel')
      ->call_u( {}, $scope, undef, 54.953488372093 );
};

FF::after_content();
