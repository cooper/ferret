# === Document Model ===
#  Document './std/Module.frt'
#      Class 'Module' version 1.0
#          Class method 'initializer__'
#              Function body
#                  Instruction
#                      Need
#                          Instance variable '@name'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Want
#                          Instance variable '@prefix'
#                          Argument type
#                              Bareword 'Str'
#                          Argument value
#                              String 'CORE'
#                  Instruction
#                      Want
#                          Instance variable '@version'
#                          Argument type
#                              Bareword 'Num'
#                          Argument value
#                              Number '1.0'
#                  Instruction
#                      Assignment
#                          Instance variable '@fullName'
#                          Operation
#                              Instance variable '@prefix'
#                              Addition operator (+)
#                              String '::'
#                              Addition operator (+)
#                              Instance variable '@name'
#      Include (Num, Str)
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

my $pos = before_content( 'Module.frt', './std/Module.frt' );

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'Module'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Module', 1.0, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def( $f, $scope, 'initializer__' );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Num Str) );
};

after_content();
