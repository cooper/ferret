# === Document Model ===
#  Document './std/IRC/Massage.frt'
#      Package 'IRC'
#      Class 'Massage'
#          Class method 'initializer__'
#              Function body
#                  Instruction
#                      Want
#                          Lexical variable '$data'
#                          Argument type
#                              Bareword 'Str::NE'
#                  If
#                      Expression ('if' parameter)
#                          Lexical variable '$data'
#                      If body
#                          Instruction
#                              Call
#                                  Instance variable '@parse'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$data'
#                  Instruction
#                      Want
#                          Instance variable '@connection'
#                          Argument type
#                              Bareword 'Connection'
#                  Instruction
#                      Weaken modifier
#                          Instance variable '@connection'
#          Method 'parse'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$data'
#                          Argument type
#                              Bareword 'Str::NE'
#                  Instruction
#                      Assignment
#                          Lexical variable '$words'
#                          Call
#                              Property 'split'
#                                  Lexical variable '$data'
#                              Argument list [1 item]
#                                  Item 0
#                                      Regex /\s+/
#                  Instruction
#                      Local variable declaration
#                          Lexical variable '$gotTags'
#                  Instruction
#                      Local variable declaration
#                          Lexical variable '$gotSource'
#                  Instruction
#                      Local variable declaration
#                          Lexical variable '$gotCommand'
#                  Instruction
#                      Local variable declaration
#                          Lexical variable '$word'
#                  Instruction
#                      Local variable declaration
#                          Lexical variable '$lastWord'
#                  Instruction
#                      Assignment
#                          Lexical variable '$params'
#                          Value list [0 items]
#                  Instruction
#                      Assignment
#                          Lexical variable '$wordI'
#                          Number '0'
#                  Instruction
#                      Assignment
#                          Lexical variable '$wordN'
#                          Number '0'
#                  Function 'updateWord'
#                      Function body
#                          Instruction
#                              Want
#                                  Lexical variable '$incN'
#                                  Argument type
#                                      Bareword 'Bool'
#                          Instruction
#                              Addition assignment
#                                  Lexical variable '$wordI'
#                                  Number '1'
#                          If
#                              Expression ('if' parameter)
#                                  Lexical variable '$incN'
#                              If body
#                                  Instruction
#                                      Addition assignment
#                                          Lexical variable '$wordN'
#                                          Number '1'
#                          Instruction
#                              Assignment
#                                  Lexical variable '$lastWord'
#                                  Lexical variable '$word'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$word'
#                      Expression ('in' parameter)
#                          Lexical variable '$words'
#                      For body
#                          If
#                              Expression ('if' parameter)
#                                  Operation
#                                      Negation
#                                          Lexical variable '$gotSource'
#                                      Logical and operator (&&)
#                                      Negation
#                                          Lexical variable '$gotTags'
#                                      Logical and operator (&&)
#                                      Lexical variable '$wordI'
#                                      Equality operator (==)
#                                      Number '0'
#                                      Logical and operator (&&)
#                                      Call
#                                          Property 'hasPrefix'
#                                              Lexical variable '$word'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  String '@'
#                              If body
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$word'
#                                          Call
#                                              Property 'trimPrefix'
#                                                  Lexical variable '$word'
#                                              Argument list [1 item]
#                                                  Item 0
#                                                      String '@'
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$tags'
#                                          Hash [0 items]
#                                  For (values)
#                                      Expression ('for' parameter)
#                                          Lexical variable '$tag'
#                                      Expression ('in' parameter)
#                                          Call
#                                              Property 'split'
#                                                  Lexical variable '$word'
#                                              Argument list [1 item]
#                                                  Item 0
#                                                      String ';'
#                                      For body
#                                          Instruction
#                                              Assignment
#                                                  Lexical variable '$tagParts'
#                                                  Call
#                                                      Property 'split'
#                                                          Lexical variable '$tag'
#                                                      Mixed argument list [2 items]
#                                                          Item 0
#                                                              String '='
#                                                          Item 1
#                                                              Pair 'limit'
#                                                                  Number '2'
#                                          If
#                                              Expression ('if' parameter)
#                                                  Operation
#                                                      Property 'length'
#                                                          Lexical variable '$tagParts'
#                                                      Greater than operator (>)
#                                                      Number '1'
#                                              If body
#                                                  Instruction
#                                                      Assignment
#                                                          Index
#                                                              Lexical variable '$tags'
#                                                              Index list [1 item]
#                                                                  Item 0
#                                                                      Index
#                                                                          Lexical variable '$tagParts'
#                                                                          Index list [1 item]
#                                                                              Item 0
#                                                                                  Number '0'
#                                                          Index
#                                                              Lexical variable '$tagParts'
#                                                              Index list [1 item]
#                                                                  Item 0
#                                                                      Number '1'
#                                                  Instruction
#                                                      Next
#                                          Instruction
#                                              Assignment
#                                                  Index
#                                                      Lexical variable '$tags'
#                                                      Index list [1 item]
#                                                          Item 0
#                                                              Lexical variable '$tag'
#                                                  Boolean true
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$gotTags'
#                                          Boolean true
#                                  Instruction
#                                      Assignment
#                                          Instance variable '@tags'
#                                          Lexical variable '$tags'
#                                  Instruction
#                                      Call
#                                          Bareword 'updateWord'
#                                          Argument list [0 items]
#                                  Instruction
#                                      Next
#                          If
#                              Expression ('if' parameter)
#                                  Operation
#                                      Negation
#                                          Lexical variable '$gotCommand'
#                                      Logical and operator (&&)
#                                      Negation
#                                          Lexical variable '$gotSource'
#                                      Logical and operator (&&)
#                                      Call
#                                          Property 'hasPrefix'
#                                              Lexical variable '$word'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  String ':'
#                              If body
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$word'
#                                          Call
#                                              Property 'trimPrefix'
#                                                  Lexical variable '$word'
#                                              Argument list [1 item]
#                                                  Item 0
#                                                      String ':'
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$gotSource'
#                                          Boolean true
#                                  Instruction
#                                      Assignment
#                                          Instance variable '@source'
#                                          Lexical variable '$word'
#                                  Instruction
#                                      Call
#                                          Bareword 'updateWord'
#                                          Argument list [0 items]
#                                  Instruction
#                                      Next
#                          If
#                              Expression ('if' parameter)
#                                  Negation
#                                      Lexical variable '$gotCommand'
#                              If body
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$gotCommand'
#                                          Boolean true
#                                  Instruction
#                                      Assignment
#                                          Instance variable '@command'
#                                          Property 'uppercase'
#                                              Lexical variable '$word'
#                                  Instruction
#                                      Call
#                                          Bareword 'updateWord'
#                                          Argument list [0 items]
#                                  Instruction
#                                      Next
#                          If
#                              Expression ('if' parameter)
#                                  Call
#                                      Property 'hasPrefix'
#                                          Lexical variable '$word'
#                                      Argument list [1 item]
#                                          Item 0
#                                              String ':'
#                              If body
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$rest'
#                                          Call
#                                              Property 'trimPrefix'
#                                                  Index
#                                                      Call
#                                                          Property 'split'
#                                                              Lexical variable '$data'
#                                                          Mixed argument list [2 items]
#                                                              Item 0
#                                                                  Regex /\s+/
#                                                              Item 1
#                                                                  Pair 'limit'
#                                                                      Operation
#                                                                          Lexical variable '$wordI'
#                                                                          Addition operator (+)
#                                                                          Number '1'
#                                                      Index list [1 item]
#                                                          Item 0
#                                                              Lexical variable '$wordI'
#                                              Argument list [1 item]
#                                                  Item 0
#                                                      String ':'
#                                  Instruction
#                                      Call
#                                          Property 'push'
#                                              Lexical variable '$params'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  Lexical variable '$rest'
#                                  Instruction
#                                      Last
#                          Instruction
#                              Call
#                                  Property 'push'
#                                      Lexical variable '$params'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$word'
#                          Instruction
#                              Call
#                                  Bareword 'updateWord'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Boolean true
#                  Instruction
#                      Assignment
#                          Instance variable '@params'
#                          Lexical variable '$params'
#          Computed property 'target'
#              Function body
#                  Instruction
#                      Return
#                          Call
#                              Property 'getTarget'
#                                  Maybe
#                                      Instance variable '@connection'
#                              Argument list [1 item]
#                                  Item 0
#                                      Index
#                                          Instance variable '@params'
#                                          Index list [1 item]
#                                              Item 0
#                                                  Number '0'
#          Computed property '_parsedSource' (lazy)
#              Function body
#                  If
#                      Expression ('if' parameter)
#                          Negation
#                              Instance variable '@source'
#                      If body
#                          Instruction
#                              Return
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Instance variable '@source'
#                              Similarity operator (=~)
#                              Regex /^(.+)!(.+).../
#                      If body
#                          Instruction
#                              Return pair 'nick'
#                                  Lexical variable '$1'
#                          Instruction
#                              Return pair 'user'
#                                  Lexical variable '$2'
#                          Instruction
#                              Return pair 'host'
#                                  Lexical variable '$3'
#          Computed property 'nick'
#              Function body
#                  Instruction
#                      Return
#                          Property 'nick'
#                              Instance variable '@_parsedSource'
#          Computed property 'user'
#              Function body
#                  Instruction
#                      Return
#                          Property 'user'
#                              Instance variable '@_parsedSource'
#          Computed property 'host'
#              Function body
#                  Instruction
#                      Return
#                          Property 'host'
#                              Instance variable '@_parsedSource'
#      Include (Bool, Connection, Str, Str::NE)
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

my $pos = before_content( 'Massage.frt', './std/IRC/Massage.frt' );

use Ferret::Core::Operations
  qw(_not add all_true bool equal gr8r num rgx sim str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'IRC' );
    my $scope = $file_scope;
    load_core('IRC');

    # Function event 'updateWord' definition
    my $func_1 = function_event_def(
        $f, $scope,
        'updateWord',
        undef,
        [ { name => 'incN', type => 'Bool', optional => 1, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            want( $scope, $args, 'incN', 30.2 );
            var(
                $scope,
                wordI => add( $scope, $$scope->{'wordI'}, num( $f, "1" ) ),
                $file_scope, $pos->(31.2)
            );
            if ( bool( $$scope->{'incN'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                var(
                    $scope,
                    wordN => add( $scope, $$scope->{'wordN'}, num( $f, "1" ) ),
                    $file_scope, $pos->(33.2)
                );
            }
            var(
                $scope,
                lastWord => $$scope->{'word'},
                $file_scope, $pos->(34.2)
            );
            return $ret;
        }
    );

    # Class 'Massage'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Massage', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def( $f, $scope, 'initializer__' );

        # Method event 'parse' definition
        my $func_2 = method_event_def( $f, $scope, 'parse' );

        # Method event 'target' definition
        my $func_3 = method_event_def( $f, $scope, 'target' );

        # Method event '_parsedSource' definition
        my $func_4 = method_event_def( $f, $scope, '_parsedSource' );

        # Method event 'nick' definition
        my $func_5 = method_event_def( $f, $scope, 'nick' );

        # Method event 'user' definition
        my $func_6 = method_event_def( $f, $scope, 'user' );

        # Method event 'host' definition
        my $func_7 = method_event_def( $f, $scope, 'host' );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_2->inside_scope(
            parse => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            target => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_4->inside_scope(
            _parsedSource => $scope,
            $proto, $class, $ins, 1, 1
        );
        $func_5->inside_scope( nick => $scope, $proto, $class, $ins, 1, undef );
        $func_6->inside_scope( user => $scope, $proto, $class, $ins, 1, undef );
        $func_7->inside_scope( host => $scope, $proto, $class, $ins, 1, undef );
    }
    load_namespaces( $context, qw(Bool Connection Str Str::NE) );
};

after_content();
