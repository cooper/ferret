# === Document Model ===
#  Document './test/hello26.frt'
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
#          Assignment (lexical variable '$asked')
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

FF::before_content('hello26.frt');

use Ferret::Core::Operations qw(_not bool num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, $scope, undef,
        [],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property_u('say')
              ->call_u( [ str( $f, "Got TERM. Terminating!" ) ],
                $scope, undef, 3.2 );
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
            if ( bool( _not( $scope->property_u('asked') ) ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('say')
                  ->call_u( [ str( $f, "Are you sure?" ) ],
                    $scope, undef, 11.2 );
                return $return;
            }
            $scope->property_u('say')
              ->call_u( [ str( $f, "Got second INT. Terminating!" ) ],
                $scope, undef, 15.2 );
            return $return;
        }
    );
    FF::load_namespaces( $context, qw(Signal Timer) );
    FF::on(
        $scope->property_u('Signal')->property_u('TERM'),
        'catch',
        $self,
        $scope,
        $func_0->inside_scope( (undef) => $scope, $scope, undef, undef, undef ),
        { before => ['default'] }
    );
    str( $f, "are you sure?" );
    $scope->set_property_ow( $context, asked => $false, 8.2 );
    FF::on(
        $scope->property_u('Signal')->property_u('INT'),
        'catch',
        $self,
        $scope,
        $func_1->inside_scope( (undef) => $scope, $scope, undef, undef, undef ),
        { before => ['default'] }
    );
    $scope->property_u('Timer')
      ->call_u( [ num( $f, 5 ) ], $scope, undef, 19.2 )->property_u('start')
      ->call_u( {}, $scope, undef, 19.6 );
};

FF::after_content();
