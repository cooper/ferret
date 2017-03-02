# === Document Model ===
#  File './test/23-property-modifiers/Second.frt'
#      Package 'main'
#          Instruction
#              Assignment
#                  Lexical variable '$x'
#                  Object [0 items]
#          Instruction
#              Weaken modifier
#                  Lexical variable '$x'
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

my $file_name = './test/23-property-modifiers/Second.frt';
my $pos = before_content( 'Second.frt', $file_name );

use Ferret::Core::Operations qw();
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    var( $scope, x => create_object( $f, [] ), undef, $pos->(1.2) );

    $scope->weaken_property_ow( 'x', $pos->(2.1) );
};

after_content($file_name);
