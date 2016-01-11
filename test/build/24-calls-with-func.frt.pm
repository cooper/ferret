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
    my $config = $ENV{FERRET_CONFIG} || '/etc/ferret.conf';
    do $config or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('24-calls-with-func.frt');

use Ferret::Core::Operations qw(num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Function event 'something' definition
    my $func_0 = FF::function_event_def(
        $f, $context,
        'something',
        undef,
        [ { name => 'code', type => undef, optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'code', 17.2 ) or return;
            $ret->set_property(
                message => $$scope->{'code'}->( {}, $scope, undef, 18.4 ),
                18.2
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_1 = FF::function_def(
        $f, undef, undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $$scope->{'say'}
              ->( [ str( $f, "been five seconds" ) ], $scope, undef, 4.2 );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_2 = FF::function_def(
        $f, undef, undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            return str( $f, "any second now" );
            return $ret;
        }
    );
    $func_0->inside_scope( something => $scope, $context, undef, undef, undef );
    $$scope->{'delay'}->(
        [
            num( $f, "5" ),
            $func_1->inside_scope(
                (undef) => $scope,
                undef, undef, undef, undef
            )
        ],
        $scope, undef, 3.2
    );
    $$scope->{'say'}->( [ str( $f, "waiting..." ) ], $scope, undef, 7.2 );
    $$scope->{'say'}->(
        [
            ${
                $$scope->{'something'}->(
                    [
                        $func_2->inside_scope(
                            (undef) => $scope,
                            undef, undef, undef, undef
                        )
                    ],
                    $scope, undef, 12.4
                )
            }->{'message'}
        ],
        $scope, undef, 12.2
    );
};

FF::after_content();
