# === Document Model ===
#  Document './test/26-signals.frt'
#      On
#          Expression ('on' parameter)
#              Property 'trap'
#                  Property 'TERM'
#                      Bareword 'Signal'
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 item]
#                              Item 0
#                                  String 'Got TERM. ...'
#      Instruction
#          Assignment
#              Lexical variable '$asked'
#              Boolean false
#      On
#          Expression ('on' parameter)
#              Property 'trap'
#                  Property 'INT'
#                      Bareword 'Signal'
#          Anonymous function
#              Body ('function' scope)
#                  If
#                      Expression ('if' parameter)
#                          Negation
#                              Lexical variable '$asked'
#                      Body ('if' scope)
#                          Instruction
#                              Call
#                                  Bareword 'say'
#                                  Argument list [1 item]
#                                      Item 0
#                                          String 'Are you sure?'
#                          Instruction
#                              Assignment
#                                  Lexical variable '$asked'
#                                  Boolean true
#                          Instruction
#                              Stop
#                          Instruction
#                              Return
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 item]
#                              Item 0
#                                  String 'Got second...'
#      Instruction
#          Call
#              Property 'start'
#                  Call
#                      Bareword 'Timer'
#                      Argument list [1 item]
#                          Item 0
#                              Number '5'
#              Argument list [0 items]
#      Include (Signal, Timer)
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

my $pos = before_content( '26-signals.frt', './test/26-signals.frt' );

use Ferret::Core::Operations qw(_not bool num str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Anonymous function definition
    my $func_0 = function_def(
        $f, undef, undef,
        [],
        [],
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            $$scope->{'say'}->(
                [ str( $f, "Got TERM. Terminating!" ) ],
                $scope, undef, $pos->(3.2)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_1 = function_def(
        $f, undef, undef,
        [],
        [ { name => 'result', type => '(none)' } ],
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            if ( bool( _not( $$scope->{'asked'} ) ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'say'}->(
                    [ str( $f, "Are you sure?" ) ],
                    $scope, undef, $pos->(13.2)
                );
                var( $scope, asked => $true, $file_scope, $pos->(14.2) );
                $ret->stop;
                return $ret_func->();
            }
            $$scope->{'say'}->(
                [ str( $f, "Got second INT. Terminating!" ) ],
                $scope, undef, $pos->(19.2)
            );
            return $ret;
        }
    );
    load_namespaces( $context, qw(Signal Timer) );
    on(
        $$scope->{'Signal'}->property_u( 'TERM', $pos->(2.3) ),
        'trap', $self, $scope,
        $func_0->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        { before => ['default'] }
    );
    var( $scope, asked => $false, undef, $pos->(8.2) );
    on(
        $$scope->{'Signal'}->property_u( 'INT', $pos->(9.3) ),
        'trap', $self, $scope,
        $func_1->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        { before => ['default'] }
    );
    $$scope->{'Timer'}->( [ num( $f, "5" ) ], $scope, undef, $pos->(23.2) )
      ->property_u( 'start', $pos->(23.5) )
      ->( [ undef, [] ], $scope, undef, $pos->(23.6) );
};

after_content();
