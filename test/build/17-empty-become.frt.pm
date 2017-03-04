# === Document Model ===
#  File './test/17-empty-become.frt'
#      Package 'main'
#          Instruction
#              Assignment
#                  Lexical variable '$obj'
#                  Object [0 items]
#          Instruction
#              Call
#                  Call
#                      Property 'init'
#                          Bareword 'Timer'
#                      Argument list [1 item]
#                          Item 0
#                              Lexical variable '$obj'
#                  Argument list [1 item]
#                      Item 0
#                          Number '5'
#          On
#              Expression ('on' parameter)
#                  Property 'expire'
#                      Call
#                          Property 'once'
#                              Lexical variable '$obj'
#                          Argument list [0 items]
#              Anonymous function
#                  Function body
#                      Instruction
#                          Call
#                              Bareword 'say'
#                              Argument list [1 item]
#                                  Item 0
#                                      String 'it works!'
#          Include (Timer)
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
use Ferret::Core::Operations qw(num str);

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) =
  before_content( '17-empty-become.frt', './test/17-empty-become.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main', 2.1 );
    my $scope = $file_scope;
    load_core('main');

    # Anonymous function definition
    my $func_0 = function_def(
        $f, undef, undef, undef, undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            $$scope->{'say'}
              ->( [ str( $f, "it works!" ) ], $scope, undef, $pos->(8.2) );
            return $ret;
        }
    );
    provides_namespaces( $context, $file_name, $pos->(9.1), qw() );
    load_namespaces( $context, $file_name, $pos->(9.1), qw(Timer) );
    var( $scope, obj => create_object( $f, [] ), undef, $pos->(2.2) );
    $$scope->{'Timer'}->property_u( 'init', $pos->(5.1) )
      ->( [ $$scope->{'obj'} ], $scope, undef, $pos->(5.15) )
      ->( [ num( $f, "5" ) ], $scope, undef, $pos->(5.3) );
    on(
        $$scope->{'obj'}->property_u( 'once', $pos->(7.3) )
          ->( [ undef, [] ], $scope, undef, $pos->(7.4) ),
        'expire', $self, $scope,
        $func_0->inside_scope(
            (undef) => $scope,
            undef, undef, $ins, undef, undef
        ),
        {}
    );
};

after_content($file_name);
