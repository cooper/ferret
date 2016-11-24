# === Document Model ===
#  Document './std/Test.frt'
#      Class 'Test' version 1.0
#          Class method 'initializer__'
#              Function body
#                  Instruction
#                      Want
#                          Instance variable '@name'
#                          Argument value
#                              String 'Test'
#                  Instruction
#                      Want
#                          Instance variable '@fatal'
#                          Argument value
#                              Boolean true
#                  Instruction
#                      Assignment
#                          Instance variable '@tested'
#                          Number '0'
#                  Instruction
#                      Assignment
#                          Instance variable '@passed'
#                          Number '0'
#          Method 'trueValue'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$a'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@_test'
#                              Argument list [2 items]
#                                  Item 0
#                                      Call
#                                          Bareword 'Bool'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  Lexical variable '$a'
#                                  Item 1
#                                      String 'Value must...'
#          Method 'veryTrue'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$a'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@_test'
#                              Argument list [2 items]
#                                  Item 0
#                                      Operation
#                                          Lexical variable '$a'
#                                          Reference equality operator (===)
#                                          Boolean true
#                                  Item 1
#                                      String 'Value must...'
#          Method 'equal'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$a'
#                  Instruction
#                      Need
#                          Lexical variable '$b'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@_test'
#                              Argument list [2 items]
#                                  Item 0
#                                      Operation
#                                          Lexical variable '$a'
#                                          Equality operator (==)
#                                          Lexical variable '$b'
#                                  Item 1
#                                      String 'Values mus...'
#          Method 'objectsEqual'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$a'
#                  Instruction
#                      Need
#                          Lexical variable '$b'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@_test'
#                              Argument list [2 items]
#                                  Item 0
#                                      Operation
#                                          Lexical variable '$a'
#                                          Reference equality operator (===)
#                                          Lexical variable '$b'
#                                  Item 1
#                                      String 'Objects mu...'
#          Method 'notEqual'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$a'
#                  Instruction
#                      Need
#                          Lexical variable '$b'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@_test'
#                              Argument list [2 items]
#                                  Item 0
#                                      Operation
#                                          Lexical variable '$a'
#                                          Negated equality operator (!=)
#                                          Lexical variable '$b'
#                                  Item 1
#                                      String 'Values mus...'
#          Method 'objectsNotEqual'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$a'
#                  Instruction
#                      Need
#                          Lexical variable '$b'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@_test'
#                              Argument list [2 items]
#                                  Item 0
#                                      Operation
#                                          Lexical variable '$a'
#                                          Negated reference equality operator (!==)
#                                          Lexical variable '$b'
#                                  Item 1
#                                      String 'Objects mu...'
#          Method 'review'
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$failed'
#                          Operation
#                              Instance variable '@tested'
#                              Subtraction operator (-)
#                              Instance variable '@passed'
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 item]
#                              Item 0
#                                  Operation
#                                      String '['
#                                      Addition operator (+)
#                                      Instance variable '@name'
#                                      Addition operator (+)
#                                      String '] '
#                                      Addition operator (+)
#                                      Instance variable '@tested'
#                                      Addition operator (+)
#                                      String ' tests '
#                                      Addition operator (+)
#                                      Instance variable '@passed'
#                                      Addition operator (+)
#                                      String ' passed '
#                                      Addition operator (+)
#                                      Lexical variable '$failed'
#                                      Addition operator (+)
#                                      String ' failed'
#                  Instruction
#                      Return pair 'tests'
#                          Instance variable '@tested'
#                  Instruction
#                      Return pair 'fails'
#                          Lexical variable '$failed'
#                  Instruction
#                      Return pair 'passes'
#                          Instance variable '@passed'
#                  Instruction
#                      Return pair 'allOK'
#                          Operation
#                              Instance variable '@passed'
#                              Equality operator (==)
#                              Instance variable '@tested'
#          Method '_test'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$yes'
#                  Instruction
#                      Need
#                          Lexical variable '$message'
#                  Instruction
#                      Assignment
#                          Instance variable '@tested'
#                          Operation
#                              Instance variable '@tested'
#                              Addition operator (+)
#                              Number '1'
#                  Instruction
#                      Return pair 'pass'
#                          Lexical variable '$yes'
#                  If
#                      Expression ('if' parameter)
#                          Lexical variable '$yes'
#                      If body
#                          Instruction
#                              Assignment
#                                  Instance variable '@passed'
#                                  Operation
#                                      Instance variable '@passed'
#                                      Addition operator (+)
#                                      Number '1'
#                          Instruction
#                              Return
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@fatal'
#                      If body
#                          Instruction
#                              Throw (fatal exception)
#                                  Call
#                                      Bareword 'Error'
#                                      Argument list [2 items]
#                                          Item 0
#                                              Symbol :TestFailure
#                                          Item 1
#                                              Lexical variable '$message'
#                  Instruction
#                      Return pair 'message'
#                          Lexical variable '$message'
#      Include (Bool, Error)
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

my $pos = before_content( 'Test.frt', './std/Test.frt' );

use Ferret::Core::Operations
  qw(_sub add bool equal nequal num refs_equal refs_nequal str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'Test'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Test', 1.0, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def( $f, $scope, 'initializer__' );

        # Method event 'trueValue' definition
        my $func_1 = method_event_def( $f, $scope, 'trueValue' );

        # Method event 'veryTrue' definition
        my $func_2 = method_event_def( $f, $scope, 'veryTrue' );

        # Method event 'equal' definition
        my $func_3 = method_event_def( $f, $scope, 'equal' );

        # Method event 'objectsEqual' definition
        my $func_4 = method_event_def( $f, $scope, 'objectsEqual' );

        # Method event 'notEqual' definition
        my $func_5 = method_event_def( $f, $scope, 'notEqual' );

        # Method event 'objectsNotEqual' definition
        my $func_6 = method_event_def( $f, $scope, 'objectsNotEqual' );

        # Method event 'review' definition
        my $func_7 = method_event_def( $f, $scope, 'review' );

        # Method event '_test' definition
        my $func_8 = method_event_def( $f, $scope, '_test' );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            trueValue => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_2->inside_scope(
            veryTrue => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            equal => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_4->inside_scope(
            objectsEqual => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_5->inside_scope(
            notEqual => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_6->inside_scope(
            objectsNotEqual => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_7->inside_scope(
            review => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_8->inside_scope(
            _test => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Bool Error) );
};

after_content();
