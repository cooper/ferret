# === Document Model ===
#  Document './test/9-maybes.frt'
#      Function 'sayHello' { $who:Str }
#          Function body
#              Instruction
#                  Need
#                      Lexical variable '$who'
#                      Argument type
#                          Bareword 'Str'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Argument list [1 item]
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
#              Argument list [1 item]
#                  Item 0
#                      String 'World'
#      Instruction
#          Call
#              Maybe
#                  Bareword 'sayGoodbye'
#              Argument list [1 item]
#                  Item 0
#                      String 'World'
#      Include (Str)
package FF;

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

my ( $self, $ins );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $pos = before_content( '9-maybes.frt', './test/9-maybes.frt' );

use Ferret::Core::Operations qw(add bool str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Function event 'sayHello' definition
    my $func_0 = function_event_def(
        $f, $context,
        'sayHello',
        undef,
        [ { name => 'who', type => 'Str', optional => undef, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'who', 2.2 ) || return $ret_func->();
            $$scope->{'say'}->(
                [
                    add(
                        $scope, $pos->(3.2),
                        str( $f, "Hello " ), $$scope->{'who'},
                        str( $f, "!" )
                    )
                ],
                $scope, undef,
                $pos->(3.1)
            );
            return $ret;
        }
    );
    $func_0->inside_scope(
        sayHello => $scope,
        $context, undef, $ins, undef, undef
    );
    load_namespaces( $context, qw(Str) );
    {
        my $maybe_0 = $$scope->{'sayHello'};
        if ( bool($maybe_0) ) {
            $maybe_0->( [ str( $f, "World" ) ], $scope, undef, $pos->(6.3) );
        }
    }
    {
        my $maybe_0 = $$scope->{'sayGoodbye'};
        if ( bool($maybe_0) ) {
            $maybe_0->( [ str( $f, "World" ) ], $scope, undef, $pos->(7.3) );
        }
    }
};

after_content();
