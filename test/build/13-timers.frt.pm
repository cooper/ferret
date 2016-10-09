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
#          Assignment
#              Lexical variable '$t2'
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

my $pos = before_content( '13-timers.frt', './test/13-timers.frt' );

use Ferret::Core::Operations qw(num str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Anonymous function definition
    my $func_0 = function_def(
        $f, undef, undef,
        [],
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            $$scope->{'say'}->( [ str( $f, "five seconds up" ) ], $scope, undef,
                $pos->(4.2) );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_1 = function_def(
        $f, undef, undef,
        [],
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            $$scope->{'say'}->(
                [ str( $f, "this shouldn't be said" ) ],
                $scope, undef, $pos->(9.2)
            );
            return $ret;
        }
    );
    load_namespaces( $context, qw(Timer) );
    $$scope->{'say'}->( [ str( $f, "hello" ) ], $scope, undef, $pos->(1.2) );
    on(
        $$scope->{'Timer'}->( [ num( $f, "5" ) ], $scope, undef, $pos->(3.15) )
          ->property_u( 'once', $pos->(3.3) )
          ->( [ undef, [] ], $scope, undef, $pos->(3.35) ),
        'expire', $self, $scope,
        $func_0->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    var(
        $scope,
        t2 => $$scope->{'Timer'}
          ->( [ num( $f, "2" ) ], $scope, undef, $pos->(7.4) ),
        undef, $pos->(7.2)
    );
    on(
        $$scope->{'t2'}->property_u( 'once', $pos->(8.3) )
          ->( [ undef, [] ], $scope, undef, $pos->(8.4) ),
        'expire', $self, $scope,
        $func_1->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
    $$scope->{'t2'}->property_u( 'cancel', $pos->(12.2) )
      ->( [ undef, [] ], $scope, undef, $pos->(12.3) );
};

after_content();
