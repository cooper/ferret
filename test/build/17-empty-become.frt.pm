# === Document Model ===
#  Document './test/17-empty-become.frt'
#      Instruction
#          Assignment
#              Lexical variable '$obj'
#              Object [0 items]
#      Instruction
#          Call
#              Call
#                  Property 'init'
#                      Bareword 'Timer'
#                  Argument list [1 items]
#                      Item 0
#                          Lexical variable '$obj'
#              Argument list [1 items]
#                  Item 0
#                      Number '5'
#      On
#          Expression ('on' parameter)
#              Property 'expire'
#                  Call
#                      Property 'once'
#                          Lexical variable '$obj'
#                      Argument list [0 items]
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  String 'it works!'
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

my $self;
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $pos = before_content( '17-empty-become.frt', './test/17-empty-become.frt' );

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
            my ( $scope, $_self, $this, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            $$scope->{'say'}
              ->( [ str( $f, "it works!" ) ], $scope, undef, $pos->(8.2) );
            return $ret;
        }
    );
    load_namespaces( $context, qw(Timer) );
    var( $scope, obj => create_object( $f, [] ), undef, $pos->(2.2) );
    $$scope->{'Timer'}->property_u( 'init', $pos->(5.1) )
      ->( [ $$scope->{'obj'} ], $scope, undef, $pos->(5.15) )
      ->( [ num( $f, "5" ) ], $scope, undef, $pos->(5.3) );
    on(
        $$scope->{'obj'}->property_u( 'once', $pos->(7.3) )
          ->( [ undef, [] ], $scope, undef, $pos->(7.4) ),
        'expire',
        $self,
        $scope,
        $func_0->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
};

after_content();
