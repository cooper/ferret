# === Document Model ===
#  Document './std/Extension/List.frt'
#      Class 'List' <T>
#          Type definition ('Pairs')
#              Type body
#                  Instruction
#                      Isa
#                          Special variable '*class'
#                  Instruction
#                      Satisfies
#                          Property 'even'
#                              Property variable '.length'
#          Computed property 'empty'
#              Function body
#                  Instruction
#                      Return
#                          Operation
#                              Instance variable '@length'
#                              Equality operator (==)
#                              Number '0'
#          Method 'map'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$code'
#                          Argument type
#                              Bareword 'Code'
#                  Instruction
#                      Return
#                          Gather
#                              Gather body
#                                  For (values)
#                                      Expression ('for' parameter)
#                                          Lexical variable '$el'
#                                      Expression ('in' parameter)
#                                          Special variable '*self'
#                                      For body
#                                          Instruction
#                                              Take
#                                                  Call
#                                                      Lexical variable '$code'
#                                                      Argument list [1 item]
#                                                          Item 0
#                                                              Lexical variable '$el'
#          Method 'grep'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$code'
#                          Argument type
#                              Bareword 'Code'
#                  Instruction
#                      Return
#                          Gather
#                              Gather body
#                                  For (values)
#                                      Expression ('for' parameter)
#                                          Lexical variable '$el'
#                                      Expression ('in' parameter)
#                                          Special variable '*self'
#                                      For body
#                                          If
#                                              Expression ('if' parameter)
#                                                  Call
#                                                      Lexical variable '$code'
#                                                      Argument list [1 item]
#                                                          Item 0
#                                                              Lexical variable '$el'
#                                              If body
#                                                  Instruction
#                                                      Take
#                                                          Lexical variable '$el'
#          Method 'flatten'
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$new'
#                          Value list [0 items]
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$el'
#                      Expression ('in' parameter)
#                          Special variable '*self'
#                      For body
#                          If
#                              Expression ('if' parameter)
#                                  Call
#                                      Special property '*instanceOf'
#                                          Lexical variable '$el'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Bareword 'List'
#                              If body
#                                  Instruction
#                                      Call
#                                          Property 'push'
#                                              Lexical variable '$new'
#                                          Named argument list [1 item]
#                                              Item 0
#                                                  Pair 'items'
#                                                      Call
#                                                          Property 'flatten'
#                                                              Lexical variable '$el'
#                                                          Argument list [0 items]
#                          Else
#                              Else body
#                                  Instruction
#                                      Call
#                                          Property 'push'
#                                              Lexical variable '$new'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  Lexical variable '$el'
#                  Instruction
#                      Return
#                          Lexical variable '$new'
#          Method 'withoutAll'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$what'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@grep'
#                              Argument list [1 item]
#                                  Item 0
#                                      Anonymous function
#                                          Function body
#                                              Instruction
#                                                  Return
#                                                      Operation
#                                                          Lexical variable '$what'
#                                                          Negated equality operator (!=)
#                                                          Topic variable '$_'
#          Method 'without'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$what'
#                  Instruction
#                      Local variable declaration
#                          Lexical variable '$found'
#                  Instruction
#                      Return
#                          Gather
#                              Gather body
#                                  For (pairs)
#                                      Expression ('for' parameter)
#                                          Set [2 items]
#                                              Item 0
#                                                  Lexical variable '$i'
#                                              Item 1
#                                                  Lexical variable '$el'
#                                      Expression ('in' parameter)
#                                          Special variable '*self'
#                                      For body
#                                          If
#                                              Expression ('if' parameter)
#                                                  Operation
#                                                      Negation
#                                                          Lexical variable '$found'
#                                                      Logical and operator (&&)
#                                                      Lexical variable '$what'
#                                                      Equality operator (==)
#                                                      Lexical variable '$el'
#                                              If body
#                                                  Instruction
#                                                      Assignment
#                                                          Lexical variable '$found'
#                                                          Boolean true
#                                                  Instruction
#                                                      Next
#                                          Instruction
#                                              Take
#                                                  Lexical variable '$el'
#          Method 'remove'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$what'
#                  Instruction
#                      Return pair 'removed'
#                          Boolean false
#                  For (pairs)
#                      Expression ('for' parameter)
#                          Set [2 items]
#                              Item 0
#                                  Lexical variable '$i'
#                              Item 1
#                                  Lexical variable '$el'
#                      Expression ('in' parameter)
#                          Special variable '*self'
#                      For body
#                          If
#                              Expression ('if' parameter)
#                                  Operation
#                                      Lexical variable '$what'
#                                      Negated equality operator (!=)
#                                      Lexical variable '$el'
#                              If body
#                                  Instruction
#                                      Next
#                          Instruction
#                              Delete modifier
#                                  Index
#                                      Special variable '*self'
#                                      Index list [1 item]
#                                          Item 0
#                                              Lexical variable '$i'
#                          Instruction
#                              Return pair 'found'
#                                  Lexical variable '$el'
#                          Instruction
#                              Return pair 'removed'
#                                  Boolean true
#                          Instruction
#                              Last
#          Method 'removeAll'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$what'
#                  Instruction
#                      Assignment
#                          Lexical variable '$found'
#                          Gather
#                              Gather body
#                                  For (pairs)
#                                      Expression ('for' parameter)
#                                          Set [2 items]
#                                              Item 0
#                                                  Lexical variable '$i'
#                                              Item 1
#                                                  Lexical variable '$el'
#                                      Expression ('in' parameter)
#                                          Special variable '*self'
#                                      For body
#                                          If
#                                              Expression ('if' parameter)
#                                                  Operation
#                                                      Lexical variable '$what'
#                                                      Negated equality operator (!=)
#                                                      Lexical variable '$el'
#                                              If body
#                                                  Instruction
#                                                      Next
#                                          Instruction
#                                              Delete modifier
#                                                  Index
#                                                      Special variable '*self'
#                                                      Index list [1 item]
#                                                          Item 0
#                                                              Lexical variable '$i'
#                                          Instruction
#                                              Take
#                                                  Lexical variable '$el'
#                  Instruction
#                      Return pair 'found'
#                          Lexical variable '$found'
#                  Instruction
#                      Return pair 'removed'
#                          Property 'length'
#                              Lexical variable '$found'
#          Method 'first'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$code'
#                          Argument type
#                              Bareword 'Code'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$el'
#                      Expression ('in' parameter)
#                          Special variable '*self'
#                      For body
#                          If
#                              Expression ('if' parameter)
#                                  Call
#                                      Lexical variable '$code'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Lexical variable '$el'
#                              If body
#                                  Instruction
#                                      Return
#                                          Lexical variable '$el'
#                  Instruction
#                      Return
#                          Undefined
#          Method 'any'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$code'
#                          Argument type
#                              Bareword 'Code'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$el'
#                      Expression ('in' parameter)
#                          Special variable '*self'
#                      For body
#                          If
#                              Expression ('if' parameter)
#                                  Call
#                                      Lexical variable '$code'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Lexical variable '$el'
#                              If body
#                                  Instruction
#                                      Return
#                                          Boolean true
#                  Instruction
#                      Return
#                          Boolean false
#          Method 'all'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$code'
#                          Argument type
#                              Bareword 'Code'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$el'
#                      Expression ('in' parameter)
#                          Special variable '*self'
#                      For body
#                          If
#                              Expression ('if' parameter)
#                                  Negation
#                                      Call
#                                          Lexical variable '$code'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  Lexical variable '$el'
#                              If body
#                                  Instruction
#                                      Return
#                                          Boolean false
#                  Instruction
#                      Return
#                          Boolean true
#          Computed property 'sum'
#              Function body
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@empty'
#                      If body
#                          Instruction
#                              Return
#                                  Undefined
#                  Instruction
#                      Assignment
#                          Lexical variable '$c'
#                          Index
#                              Special variable '*self'
#                              Index list [1 item]
#                                  Item 0
#                                      Number '0'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$i'
#                      Expression ('in' parameter)
#                          Operation
#                              Number '1'
#                              Range operator (..)
#                              Instance variable '@lastIndex'
#                      For body
#                          Instruction
#                              Assignment
#                                  Lexical variable '$c'
#                                  Operation
#                                      Lexical variable '$c'
#                                      Addition operator (+)
#                                      Index
#                                          Special variable '*self'
#                                          Index list [1 item]
#                                              Item 0
#                                                  Lexical variable '$i'
#                  Instruction
#                      Return
#                          Lexical variable '$c'
#          Computed property 'sum0'
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$c'
#                          Number '0'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$el'
#                      Expression ('in' parameter)
#                          Special variable '*self'
#                      For body
#                          Instruction
#                              Assignment
#                                  Lexical variable '$c'
#                                  Operation
#                                      Lexical variable '$c'
#                                      Addition operator (+)
#                                      Lexical variable '$el'
#                  Instruction
#                      Return
#                          Lexical variable '$c'
#          Computed property 'iterator'
#              Function body
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'ListIterator'
#                              Argument list [1 item]
#                                  Item 0
#                                      Special variable '*self'
#                          Bareword 'Iterator'
#      Include (Code, Iterator, List, ListIterator, T)
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

my $pos = before_content( 'List.frt', './std/Extension/List.frt' );

use Ferret::Core::Operations qw(_not add all_true bool equal nequal num range);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Anonymous function definition with topicalizer
    my $func_4 = function_def(
        $f, undef, undef,
        [ { name => '_' } ],
        undef,
        sub {
            my ( $scope, $self, $this, undef, $args, $ret ) = &args_v1;
            my $ins = $args->{_};
            return $ret_func->( nequal( $scope, $$scope->{'what'}, $ins ) );
            return $ret;
        }
    );

    # Class 'List'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'List', undef, [ \'T' ] );

        # Method event 'empty' definition
        my $func_0 = method_event_def( $f, $scope, 'empty' );

        # Method event 'map' definition
        my $func_1 = method_event_def( $f, $scope, 'map' );

        # Method event 'grep' definition
        my $func_2 = method_event_def( $f, $scope, 'grep' );

        # Method event 'flatten' definition
        my $func_3 = method_event_def( $f, $scope, 'flatten' );

        # Method event 'withoutAll' definition
        my $func_5 = method_event_def( $f, $scope, 'withoutAll' );

        # Method event 'without' definition
        my $func_6 = method_event_def( $f, $scope, 'without' );

        # Method event 'remove' definition
        my $func_7 = method_event_def( $f, $scope, 'remove' );

        # Method event 'removeAll' definition
        my $func_8 = method_event_def( $f, $scope, 'removeAll' );

        # Method event 'first' definition
        my $func_9 = method_event_def( $f, $scope, 'first' );

        # Method event 'any' definition
        my $func_10 = method_event_def( $f, $scope, 'any' );

        # Method event 'all' definition
        my $func_11 = method_event_def( $f, $scope, 'all' );

        # Method event 'sum' definition
        my $func_12 = method_event_def( $f, $scope, 'sum' );

        # Method event 'sum0' definition
        my $func_13 = method_event_def( $f, $scope, 'sum0' );

        # Method event 'iterator' definition
        my $func_14 = method_event_def( $f, $scope, 'iterator' );
        $func_0->inside_scope(
            empty => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_1->inside_scope(
            map => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_2->inside_scope(
            grep => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            flatten => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_5->inside_scope(
            withoutAll => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_6->inside_scope(
            without => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_7->inside_scope(
            remove => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_8->inside_scope(
            removeAll => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_9->inside_scope(
            first => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_10->inside_scope(
            any => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_11->inside_scope(
            all => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_12->inside_scope( sum => $scope, $proto, $class, $ins, 1, undef );
        $func_13->inside_scope(
            sum0 => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_14->inside_scope(
            iterator => $scope,
            $proto, $class, $ins, 1, undef
        );
        typedef(
            $scope, $class, 'Pairs',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                state $anchor = \0 + 0;
                typedef_check(
                    $scope, $scope, $ins, $anchor,
                    conditions => [
                        sub {
                            $ins->fits_type_u(
                                ${ $scope->{special} }->{'class'} );
                        },
                        sub {
                            $$ins->{'length'}
                              ->property_u( 'even', $pos->(7.3) );
                        }
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            },
            undef
        );
    }
    load_namespaces( $context, qw(Code Iterator List ListIterator T) );
};

after_content();
