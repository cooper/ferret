# === Document Model ===
#  Document './test/9-maybes.frt'
#      Function 'sayHello'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$who'
#                      Argument type
#                          Bareword 'Str'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Argument list [1 items]
#                          Item 0
#                              Operation
#                                  String 'Hello '
#                                  Addition operator (+)
#                                  Lexical variable '$who'
#                                  Addition operator (+)
#                                  String '!'
#      Instruction
#          Call
#              Maybe
#                  Bareword 'sayHello'
#              Argument list [1 items]
#                  Item 0
#                      String 'World'
#      Instruction
#          Call
#              Maybe
#                  Bareword 'sayGoodbye'
#              Argument list [1 items]
#                  Item 0
#                      String 'World'
#      Include (Str)
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

FF::before_content('9-maybes.frt');

use Ferret::Core::Operations qw(add bool str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Function event 'sayHello' definition
    my $func_0 = FF::function_event_def(
        $f, $context,
        'sayHello',
        [ { name => 'who', type => 'Str', optional => undef, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            FF::need( $scope, $args, 'who', 2.2 ) or return;
            $$scope->{'say'}->(
                [
                    add(
                        $scope,           str( $f, "Hello " ),
                        $$scope->{'who'}, str( $f, "!" )
                    )
                ],
                $scope, undef, 3.1
            );
            return $ret->return;
        }
    );
    $func_0->inside_scope( sayHello => $scope, $context, undef, undef, undef );
    FF::load_namespaces( $context, qw(Str) );
    {
        my $maybe_0 = $$scope->{'sayHello'};
        if ( bool($maybe_0) ) {
            $maybe_0->( [ str( $f, "World" ) ], $scope, undef, 6.3 );
        }
    }
    {
        my $maybe_0 = $$scope->{'sayGoodbye'};
        if ( bool($maybe_0) ) {
            $maybe_0->( [ str( $f, "World" ) ], $scope, undef, 7.3 );
        }
    }
};

FF::after_content();
