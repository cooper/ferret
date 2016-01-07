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

FF::before_content('13-timers.frt');

use Ferret::Core::Operations qw(num str);
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
            $$scope->{'say'}
              ->( [ str( $f, "five seconds up" ) ], $scope, undef, 4.2 );
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
              ->( [ str( $f, "this shouldn't be said" ) ], $scope, undef, 9.2 );
            return $ret;
        }
    );
    FF::load_namespaces( $context, qw(Timer) );
    $$scope->{'say'}->( [ str( $f, "hello" ) ], $scope, undef, 1.2 );
    FF::on(
        ${ $$scope->{'Timer'}->( [ num( $f, "5" ) ], $scope, undef, 3.15 ) }
          ->{'once'}->( {}, $scope, undef, 3.35 ),
        'expire',
        $self,
        $scope,
        $func_0->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    FF::lex_assign(
        $scope,
        t2 => $$scope->{'Timer'}->( [ num( $f, "2" ) ], $scope, undef, 7.4 ),
        undef, 7.2
    );
    FF::on(
        ${ $$scope->{'t2'} }->{'once'}->( {}, $scope, undef, 8.4 ),
        'expire',
        $self,
        $scope,
        $func_1->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    ${ $$scope->{'t2'} }->{'cancel'}->( {}, $scope, undef, 12.3 );
};

FF::after_content();
