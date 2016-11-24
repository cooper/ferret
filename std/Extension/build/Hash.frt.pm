# === Document Model ===
#  Document './std/Extension/Hash.frt'
#      Class 'Hash' <K, V>
#          Computed property 'empty'
#              Function body
#                  Instruction
#                      Return
#                          Operation
#                              Instance variable '@length'
#                              Equality operator (==)
#                              Number '0'
#          Computed property 'iterator'
#              Function body
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'HashIterator'
#                              Argument list [1 item]
#                                  Item 0
#                                      Special variable '*self'
#                          Bareword 'Iterator'
#      Class 'OrderedHash' <K, V>
#          Class method 'initializer__'
#              Function body
#                  Instruction
#                      Assignment
#                          Instance variable '@orderedKeys'
#                          Value list [0 items]
#                  Instruction
#                      Call
#                          Call
#                              Property 'init'
#                                  Class name with generics
#                                      Bareword 'Hash'
#                                      Bareword 'K'
#                                      Bareword 'V'
#                              Argument list [1 item]
#                                  Item 0
#                                      Special variable '*self'
#                          Argument list [0 items]
#          Computed property 'keys'
#              Function body
#                  Instruction
#                      Return
#                          Instance variable '@orderedKeys'
#          Method 'pushPair'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$key'
#                          Argument type
#                              Bareword 'K'
#                  Instruction
#                      Need
#                          Lexical variable '$value'
#                          Argument type
#                              Bareword 'V'
#                  If
#                      Expression ('if' parameter)
#                          Property 'removed'
#                              Call
#                                  Property 'remove'
#                                      Instance variable '@orderedKeys'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$key'
#                      If body
#                          Instruction
#                              Return pair 'overwritten'
#                                  Boolean true
#                  Instruction
#                      Assignment
#                          Index
#                              Special variable '*self'
#                              Index list [1 item]
#                                  Item 0
#                                      Lexical variable '$key'
#                          Lexical variable '$value'
#                  Instruction
#                      Call
#                          Property 'push'
#                              Instance variable '@orderedKeys'
#                          Argument list [1 item]
#                              Item 0
#                                  Lexical variable '$key'
#          Computed property 'iterator'
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$it'
#                          Call
#                              Bareword 'HashIterator'
#                              Argument list [1 item]
#                                  Item 0
#                                      Special variable '*self'
#                  Instruction
#                      Assignment
#                          Property 'keysLeft'
#                              Lexical variable '$it'
#                          Call
#                              Property 'copy'
#                                  Instance variable '@orderedKeys'
#                              Argument list [0 items]
#                  Instruction
#                      Return
#                          Lexical variable '$it'
#                          Bareword 'Iterator'
#      Include (Hash, HashIterator, Iterator, K, V)
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

my $pos = before_content( 'Hash.frt', './std/Extension/Hash.frt' );

use Ferret::Core::Operations qw(bool equal num);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'Hash'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Hash', undef, [ \'K', \'V' ] );

        # Method event 'empty' definition
        my $func_0 = method_event_def( $f, $scope, 'empty' );

        # Method event 'iterator' definition
        my $func_1 = method_event_def( $f, $scope, 'iterator' );
        $func_0->inside_scope(
            empty => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_1->inside_scope(
            iterator => $scope,
            $proto, $class, $ins, 1, undef
        );
    }

    # Class 'OrderedHash'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'OrderedHash', undef,
            [ \'K', \'V' ] );

        # Method event 'initializer__' definition
        my $func_2 = method_event_def( $f, $scope, 'initializer__' );

        # Method event 'keys' definition
        my $func_3 = method_event_def( $f, $scope, 'keys' );

        # Method event 'pushPair' definition
        my $func_4 = method_event_def( $f, $scope, 'pushPair' );

        # Method event 'iterator' definition
        my $func_5 = method_event_def( $f, $scope, 'iterator' );
        $func_2->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_3->inside_scope( keys => $scope, $proto, $class, $ins, 1, undef );
        $func_4->inside_scope(
            pushPair => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_5->inside_scope(
            iterator => $scope,
            $proto, $class, $ins, 1, undef
        );
    }
    load_namespaces( $context, qw(Hash HashIterator Iterator K V) );
};

after_content();
