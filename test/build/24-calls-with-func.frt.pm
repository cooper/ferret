# === Document Model ===
#  Document './test/24-calls-with-func.frt'
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
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('24-calls-with-func.frt');

use Ferret::Core::Operations qw(num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Function event 'something' definition
    my $func_0 = FF::function_event_def(
        $f, $scope,
        'something',
        [ { name => 'code', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'code', 17.2 ) or return;
            $ret->set_property(
                message =>
                  $scope->property_u('code')->call_u( {}, $scope, undef, 18.4 ),
                18.2
            );
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
            $ret->inc;
            $scope->property_u('say')
              ->call_u( [ str( $f, "been five seconds" ) ], $scope, undef,
                4.2 );
            return $ret->return;
        }
    );

    # Anonymous function definition
    my $func_2 = FF::function_def(
        $f, $scope, undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            return $ret->return( str( $f, "any second now" ) );
            return $ret->return;
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
        $scope, undef, 3.2
    );
    $scope->property_u('say')
      ->call_u( [ str( $f, "waiting..." ) ], $scope, undef, 7.2 );
    $scope->property_u('say')->call_u(
        [
            $scope->property_u('something')->call_u(
                [
                    $func_2->inside_scope(
                        (undef) => $scope,
                        $scope, undef, undef, undef
                    )
                ],
                $scope, undef, 12.4
            )->property_u('message')
        ],
        $scope, undef, 12.2
    );
};

FF::after_content();
