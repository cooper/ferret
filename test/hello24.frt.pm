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
#                          Body ('function' scope)
#                              Instruction
#                                  Call
#                                      Bareword 'say'
#                                      Argument list [1 items]
#                                          Item 0
#                                              String 'been five ...'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      String 'waiting...'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      Property 'message'
#                          Call
#                              Bareword 'something'
#                              Argument list [1 items]
#                                  Item 1
#                                      Anonymous function
#                                          Body ('function' scope)
#                                              Instruction
#                                                  Return
#                                                      String 'any second...'
#      Function 'something'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$code'
#              Instruction
#                  Return pair 'message'
#                      Call
#                          Lexical variable '$code'
#                          Argument list [0 items]
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

FF::before_content('hello24.frt');

use Ferret::Core::Operations qw(num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Function event 'something' callback definition
    my $func_0 = FF::function_event_def(
        $f, $scope,
        'something',
        [ { name => 'code', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'code' ) or return;
            $return->set_property(
                message =>
                  $scope->property_u('code')->call_u( {}, $scope, undef, 18 ),
                18
            );
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
              ->call_u( [ str( $f, "been five seconds" ) ], $scope, undef, 4 );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_2 = FF::function_def(
        $f, $scope, undef,
        [],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            return str( $f, "any second now" );
            return $return;
        }
    );
    $func_0->inside_scope( something => $scope, $scope, undef, undef, undef );
    $scope->property_u('delay')->call_u(
        [
            num( $f, 5 ),
            $func_1->inside_scope(
                (undef) => $scope,
                $scope, undef, undef, undef
            )
        ],
        $scope, undef, 3
    );
    $scope->property_u('say')
      ->call_u( [ str( $f, "waiting..." ) ], $scope, undef, 7 );
    $scope->property_u('say')->call_u(
        [
            $scope->property_u('something')->call_u(
                [
                    $func_2->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    )
                ],
                $scope, undef, 12
            )->property_u('message')
        ],
        $scope, undef, 12
    );
};

FF::after_content();
