# === Document Model ===
#  File './test/16-become.frt'
#      Package 'main'
#          Instruction
#              Assignment
#                  Lexical variable '$obj'
#                  String 'hi'
#          Instruction
#              Call
#                  Call
#                      Property 'init'
#                          Bareword 'Math::Point'
#                      Argument list [1 item]
#                          Item 0
#                              Lexical variable '$obj'
#                  Argument list [2 items]
#                      Item 0
#                          Number '1'
#                      Item 1
#                          Number '1'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Argument list [1 item]
#                      Item 0
#                          Call
#                              Property 'pretty'
#                                  Lexical variable '$obj'
#          Include (Math::Point)
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
  before_content( '16-become.frt', './test/16-become.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    load_namespaces( $context, $file_name, qw(Math::Point) );
    var( $scope, obj => str( $f, "hi" ), undef, $pos->(2.2) );
    $$scope->{'Math::Point'}->property_u( 'init', $pos->(9.2) )
      ->( [ $$scope->{'obj'} ], $scope, undef, $pos->(9.25) )
      ->( [ num( $f, "1" ), num( $f, "1" ) ], $scope, undef, $pos->(9.4) );
    $$scope->{'say'}->(
        [
            $$scope->{'obj'}->property_u( 'pretty', $pos->(11.4) )
              ->( [ undef, [] ], $scope, undef, $pos->(11.5) )
        ],
        $scope, undef,
        $pos->(11.2)
    );
};

after_content($file_name);
