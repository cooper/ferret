# === Document Model ===
#  Document './test/26-signals.frt'
#      On
#          Expression ('on' parameter)
#              Property 'catch'
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
#          String 'are you sure?'
#      Instruction
#          Assignment
#              Lexical variable '$asked'
#              Boolean false
#      On
#          Expression ('on' parameter)
#              Property 'catch'
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
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('26-signals.frt');

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
            $ret->inc;
            $$scope->{'say'}
              ->( [ str( $f, "Got TERM. Terminating!" ) ], $scope, undef, 3.2 );
            return $ret->return;
        }
    );

    # Anonymous function definition
    my $func_1 = FF::function_def(
        $f, undef, undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $ret->inc;
            if ( bool( _not( $$scope->{'asked'} ) ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $$scope->{'say'}
                  ->( [ str( $f, "Are you sure?" ) ], $scope, undef, 13.2 );
                my $lv_asked =
                  FF::lex_assign( $scope, asked => $true, $file_scope, 14.2 );
                $ret->stop;
                return $ret->return();
            }
            $$scope->{'say'}->(
                [ str( $f, "Got second INT. Terminating!" ) ],
                $scope, undef, 19.2
            );
            return $ret->return;
        }
    );
    FF::load_namespaces( $context, qw(Signal Timer) );
    FF::on(
        ${ $$scope->{'Signal'} }->{'TERM'},
        'catch',
        $self,
        $scope,
        $func_0->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        { before => ['default'] }
    );
    str( $f, "are you sure?" );
    my $lv_asked = FF::lex_assign( $scope, asked => $false, undef, 8.2 );
    FF::on(
        ${ $$scope->{'Signal'} }->{'INT'},
        'catch',
        $self,
        $scope,
        $func_1->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        { before => ['default'] }
    );
    ${ $$scope->{'Timer'}->( [ num( $f, 5 ) ], $scope, undef, 23.2 ) }
      ->{'start'}->( {}, $scope, undef, 23.6 );
};

FF::after_content();
