# === Document Model ===
#  File './test/23-property-modifiers/test.frt'
#      Package 'main'
#          Instruction
#              Assignment
#                  Lexical variable '$x'
#                  Object [0 items]
#          Instruction
#              Delete modifier
#                  Lexical variable '$x'
#          Instruction
#              Bareword 'Second'
#          Include (Second)
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
use Ferret::Core::Operations qw();

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) =
  before_content( 'test.frt', './test/23-property-modifiers/test.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    provides_namespaces( $context, $file_name, qw() );
    load_namespaces( $context, $file_name, qw(Second) );
    var( $scope, x => create_object( $f, [] ), undef, $pos->(1.2) );

    $scope->delete_property_ow( 'x', $pos->(2.1) );
    $$scope->{'Second'};
};

after_content($file_name);
