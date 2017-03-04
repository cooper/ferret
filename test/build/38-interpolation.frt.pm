# === Document Model ===
#  File './test/38-interpolation.frt'
#      Package 'main'
#          Instruction
#              Load
#                  Bareword 'String::Any'
#          Instruction
#              Assignment
#                  Lexical variable '$name'
#                  String 'Bob'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Argument list [1 item]
#                      Item 0
#                          Operation
#                              String 'Hello '
#                              Addition operator (+)
#                              Lexical variable '$name'
#                              Addition operator (+)
#                              String '!'
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
use Ferret::Core::Operations qw(add str);

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) =
  before_content( '38-interpolation.frt', './test/38-interpolation.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');
Ferret::inspect($context->f->main_context->property('String::Any'));
    load_namespaces( $context, $file_name, 'String::Any' );
    var( $scope, name => str( $f, "Bob" ), undef, $pos->(2.2) );
    $$scope->{'say'}->(
        [
            add(
                $scope, $pos->(3.2),
                str( $f, "Hello " ), $$scope->{'name'},
                str( $f, "!" )
            )
        ],
        $scope, undef,
        $pos->(3.1)
    );
};

after_content($file_name);
