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
#                          Argument list [1 items]
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
#                                  Argument list [1 items]
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
#                          Argument list [1 items]
#                              Item 0
#                                  String 'Got second...'
#      Instruction
#          Call
#              Property 'start'
#                  Call
#                      Bareword 'Timer'
#                      Argument list [1 items]
#                          Item 0
#                              Number '5'
#              Argument list [0 items]
#      Include (Signal, Timer)
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
my ( $true, $false, $undefined, $ret_func ) = FF::get_constant_objects($f);

my $pos = FF::before_content( '26-signals.frt', './test/26-signals.frt' );

use Ferret::Core::Operations qw(_not bool num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, undef, undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $$scope->{'say'}->(
                [ str( $f, "Got TERM. Terminating!" ) ],
                $scope, undef, $pos->(3.2)
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
            if ( bool( _not( $$scope->{'asked'} ) ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'say'}->(
                    [ str( $f, "Are you sure?" ) ],
                    $scope, undef, $pos->(13.2)
                );
                FF::lex_assign(
                    $scope,
                    asked => $true,
                    $file_scope, $pos->(14.2)
                );
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
    FF::load_namespaces( $context, qw(Signal Timer) );
    FF::on(
        ${ $$scope->{'Signal'} }->{'TERM'},
        'trap',
        $self,
        $scope,
        $func_0->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        { before => ['default'] }
    );
    FF::lex_assign( $scope, asked => $false, undef, $pos->(8.2) );
    FF::on(
        ${ $$scope->{'Signal'} }->{'INT'},
        'trap',
        $self,
        $scope,
        $func_1->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        { before => ['default'] }
    );
    ${ $$scope->{'Timer'}->( [ num( $f, "5" ) ], $scope, undef, $pos->(23.2) ) }
      ->{'start'}->( [ undef, [] ], $scope, undef, $pos->(23.6) );
};

FF::after_content();
