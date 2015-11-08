# === Document Model ===
#  Document './test/hello9.frt'
#      Function 'sayHello'
#          Instruction
#              Need
#                  Lexical variable '$who'
#                  Bareword 'Str'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Argument list [1 items]
#                      Item 0
#                          Operation
#                              String 'Hello '
#                              Addition operator (+)
#                              Lexical variable '$who'
#                              Addition operator (+)
#                              String '!'
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

FF::before_content('hello9.frt');

use Ferret::Core::Operations qw(add bool str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Function event 'sayHello' callback definition
    my $func_0 = FF::function_event_def(
        $f, $scope,
        'sayHello',
        [ { name => 'who', type => 'Str', optional => undef, more => undef } ],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            FF::need( $scope, $arguments, 'who' ) or return;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope,                    str( $f, "Hello " ),
                        $scope->property_u('who'), str( $f, "!" )
                    )
                ],
                $scope
            );
            return $return;
        }
    );
    $func_0->inside_scope( sayHello => $scope, $scope, undef, undef, undef );
    FF::load_namespaces( $context, qw(Str) );
    {
        my $maybe_0 = $scope->property_u('sayHello');
        if ( bool($maybe_0) ) {
            $maybe_0->call_u( [ str( $f, "World" ) ], $scope );
        }
    }
    {
        my $maybe_0 = $scope->property_u('sayGoodbye');
        if ( bool($maybe_0) ) {
            $maybe_0->call_u( [ str( $f, "World" ) ], $scope );
        }
    }
};

FF::after_content();
