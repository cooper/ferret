# === Document Model ===
#  Document './std/Stack.frt'
#      Class 'Stack' <T>
#          Class method 'initializer__'
#              Function body
#                  Instruction
#                      Want (...)
#                          Instance variable '@items'
#                          Argument type
#                              Bareword 'T'
#          Method 'push'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$item'
#                          Argument type
#                              Bareword 'T'
#                  Instruction
#                      Call
#                          Property 'push'
#                              Instance variable '@items'
#                          Argument list [1 item]
#                              Item 0
#                                  Lexical variable '$item'
#          Method 'pop'
#              Function body
#                  Instruction
#                      Return
#                          Call
#                              Property 'pop'
#                                  Instance variable '@items'
#                              Argument list [0 items]
#          Method 'description'
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$name'
#                          Property 'name'
#                              Bareword 'T'
#                  Instruction
#                      Return
#                          Operation
#                              String 'Stack<'
#                              Addition operator (+)
#                              Lexical variable '$name'
#                              Addition operator (+)
#                              String '> '
#                              Addition operator (+)
#                              Special property '*description'
#                                  Instance variable '@items'
#      Include (T)
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

my $pos = before_content( 'Stack.frt', './std/Stack.frt' );

use Ferret::Core::Operations qw(add str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'Stack'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Stack', undef, [ \'T' ] );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def( $f, $scope, 'initializer__' );

        # Method event 'push' definition
        my $func_1 = method_event_def( $f, $scope, 'push' );

        # Method event 'pop' definition
        my $func_2 = method_event_def( $f, $scope, 'pop' );

        # Method event 'description' definition
        my $func_3 = method_event_def( $f, $scope, 'description' );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            push => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_2->inside_scope(
            pop => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(T) );
};

after_content();
