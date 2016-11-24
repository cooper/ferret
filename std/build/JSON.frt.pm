# === Document Model ===
#  Document './std/JSON.frt'
#      Class 'JSON' version 1.0
#          Instruction
#              Alias
#                  Assignment
#                      Bareword '_PO'
#                      Bareword 'NATIVE::PerlObject'
#          Instruction
#              Lazy assignment
#                  Lexical variable '$default'
#                  Call
#                      Special variable '*class'
#                      Argument list [0 items]
#          Type definition ('Charset')
#              Type body
#                  Instruction
#                      Symbol :ascii
#                  Instruction
#                      Symbol :latin1
#                  Instruction
#                      Symbol :utf8
#          Class method 'initializer__'
#              Function body
#                  Instruction
#                      Want
#                          Instance variable '@strict'
#                          Argument type
#                              Bareword 'Bool'
#                          Argument value
#                              Boolean true
#                  Instruction
#                      Want
#                          Instance variable '@consistent'
#                          Argument type
#                              Bareword 'Bool'
#                          Argument value
#                              Boolean false
#                  Instruction
#                      Want
#                          Instance variable '@charset'
#                          Argument type
#                              Bareword 'Charset'
#                          Argument value
#                              Symbol :utf8
#                  Instruction
#                      Want
#                          Instance variable '@strictRoot'
#                          Argument type
#                              Bareword 'Bool'
#                          Argument value
#                              Boolean false
#                  Instruction
#                      Want
#                          Instance variable '@pretty'
#                          Argument type
#                              Bareword 'Bool'
#                          Argument value
#                              Boolean false
#                  Instruction
#                      Want
#                          Instance variable '@spaceBefore'
#                          Argument type
#                              Bareword 'Bool'
#                          Argument value
#                              Boolean false
#                  Instruction
#                      Want
#                          Instance variable '@spaceAfter'
#                          Argument type
#                              Bareword 'Bool'
#                          Argument value
#                              Boolean false
#                  Instruction
#                      Want
#                          Instance variable '@indent'
#                          Argument type
#                              Bareword 'Bool'
#                          Argument value
#                              Boolean false
#                  Instruction
#                      Call
#                          Property 'require'
#                              Bareword '_PO'
#                          Argument list [1 item]
#                              Item 0
#                                  String 'JSON::XS'
#                      Catch
#                          Expression ('catch' parameter)
#                              Lexical variable '$err'
#                          Catch body
#                              Instruction
#                                  Fail (nonfatal exception)
#                                      Call
#                                          Bareword 'Error'
#                                          Mixed argument list [3 items]
#                                              Item 0
#                                                  Symbol :PerlRequireFailed
#                                              Item 1
#                                                  String 'Unable to ...'
#                                              Item 2
#                                                  Pair 'subError'
#                                                      Lexical variable '$err'
#                  Instruction
#                      Assignment
#                          Instance variable '@xs'
#                          Call
#                              Bareword '_PO'
#                              Argument list [1 item]
#                                  Item 0
#                                      String 'JSON::XS'
#                      Catch
#                          Expression ('catch' parameter)
#                              Lexical variable '$err'
#                          Catch body
#                              Instruction
#                                  Fail (nonfatal exception)
#                                      Call
#                                          Bareword 'Error'
#                                          Mixed argument list [3 items]
#                                              Item 0
#                                                  Symbol :PerlConstructorFailed
#                                              Item 1
#                                                  String 'Could not ...'
#                                              Item 2
#                                                  Pair 'subError'
#                                                      Lexical variable '$err'
#                  Instruction
#                      Call
#                          Property (name evaluated at runtime)
#                              Instance variable '@xs'
#                              Property index [1 item]
#                                  Item 0
#                                      Instance variable '@charset'
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@pretty'
#                      If body
#                          Instruction
#                              Call
#                                  Property 'pretty'
#                                      Instance variable '@xs'
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@spaceBefore'
#                      If body
#                          Instruction
#                              Call
#                                  Property 'spaceBefore'
#                                      Instance variable '@xs'
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@spaceAfter'
#                      If body
#                          Instruction
#                              Call
#                                  Property 'spaceAfter'
#                                      Instance variable '@xs'
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@indent'
#                      If body
#                          Instruction
#                              Call
#                                  Property 'indent'
#                                      Instance variable '@xs'
#                  If
#                      Expression ('if' parameter)
#                          Negation
#                              Instance variable '@strict'
#                      If body
#                          Instruction
#                              Call
#                                  Property 'relaxed'
#                                      Instance variable '@xs'
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@consistent'
#                      If body
#                          Instruction
#                              Call
#                                  Property 'canonical'
#                                      Instance variable '@xs'
#                  If
#                      Expression ('if' parameter)
#                          Negation
#                              Instance variable '@strictRoot'
#                      If body
#                          Instruction
#                              Call
#                                  Property 'allow_nonref'
#                                      Instance variable '@xs'
#          Method 'encode'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$data'
#                  Instruction
#                      Return pair 'json'
#                          Call
#                              Property 'encode'
#                                  Instance variable '@xs'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$data'
#                      Catch
#                          Expression ('catch' parameter)
#                              Lexical variable '$err'
#                          Catch body
#                              Instruction
#                                  Fail (nonfatal exception)
#                                      Call
#                                          Bareword 'Error'
#                                          Mixed argument list [3 items]
#                                              Item 0
#                                                  Symbol :JSONError
#                                              Item 1
#                                                  String 'JSON encod...'
#                                              Item 2
#                                                  Pair 'subError'
#                                                      Lexical variable '$err'
#          Method 'decode'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$json'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Return pair 'data'
#                          Call
#                              Property 'decode'
#                                  Instance variable '@xs'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$json'
#                      Catch
#                          Expression ('catch' parameter)
#                              Lexical variable '$err'
#                          Catch body
#                              Instruction
#                                  Fail (nonfatal exception)
#                                      Call
#                                          Bareword 'Error'
#                                          Mixed argument list [3 items]
#                                              Item 0
#                                                  Symbol :JSONError
#                                              Item 1
#                                                  String 'JSON decod...'
#                                              Item 2
#                                                  Pair 'subError'
#                                                      Lexical variable '$err'
#          Method 'decoderAdd'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$fragment'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Call
#                          Property 'perlCall'
#                              Instance variable '@xs'
#                          Mixed argument list [3 items]
#                              Item 0
#                                  String 'incr_parse'
#                              Item 1
#                                  Lexical variable '$fragment'
#                              Item 2
#                                  Pair 'CONTEXT'
#                                      String 'void'
#                      Catch
#                          Expression ('catch' parameter)
#                              Lexical variable '$err'
#                          Catch body
#                              Instruction
#                                  Fail (nonfatal exception)
#                                      Call
#                                          Bareword 'Error'
#                                          Mixed argument list [3 items]
#                                              Item 0
#                                                  Symbol :JSONError
#                                              Item 1
#                                                  String 'JSON incr_...'
#                                              Item 2
#                                                  Pair 'subError'
#                                                      Lexical variable '$err'
#                  Instruction
#                      Return pair 'added'
#                          Boolean true
#          Method 'decoderDone'
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$objects'
#                          Call
#                              Property 'perlCall'
#                                  Instance variable '@xs'
#                              Mixed argument list [2 items]
#                                  Item 0
#                                      String 'incr_parse'
#                                  Item 1
#                                      Pair 'CONTEXT'
#                                          String 'list'
#                      Catch
#                          Expression ('catch' parameter)
#                              Lexical variable '$err'
#                          Catch body
#                              Instruction
#                                  Fail (nonfatal exception)
#                                      Call
#                                          Bareword 'Error'
#                                          Mixed argument list [3 items]
#                                              Item 0
#                                                  Symbol :JSONError
#                                              Item 1
#                                                  String 'JSON incr_...'
#                                              Item 2
#                                                  Pair 'subError'
#                                                      Lexical variable '$err'
#                  If
#                      Expression ('if' parameter)
#                          Call
#                              Special property '*instanceOf'
#                                  Lexical variable '$objects'
#                              Argument list [1 item]
#                                  Item 0
#                                      Bareword 'List'
#                      If body
#                          Instruction
#                              Return pair 'found'
#                                  Property 'length'
#                                      Lexical variable '$objects'
#                  Instruction
#                      Return pair 'data'
#                          Lexical variable '$objects'
#          Method 'decoderReset'
#              Function body
#                  Instruction
#                      Call
#                          Property 'incr_reset'
#                              Instance variable '@xs'
#                          Argument list [0 items]
#          Class method 'encode'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$data'
#                  Instruction
#                      Return
#                          Call
#                              Property 'encode'
#                                  Lexical variable '$default'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$data'
#          Class method 'decode'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$json'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Return
#                          Call
#                              Property 'decode'
#                                  Lexical variable '$default'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$json'
#          Instruction
#              Alias
#                  Assignment
#                      Bareword 'stringify'
#                      Bareword 'encode'
#          Instruction
#              Alias
#                  Assignment
#                      Bareword 'parse'
#                      Bareword 'decode'
#      Include (Bool, Charset, Error, List, NATIVE, NATIVE::PerlObject, Str)
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

my $pos = before_content( 'JSON.frt', './std/JSON.frt' );

use Ferret::Core::Operations qw(_not bool str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'JSON'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'JSON', 1.0, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def( $f, $scope, 'initializer__' );

        # Method event 'encode' definition
        my $func_1 = method_event_def( $f, $scope, 'encode' );

        # Method event 'decode' definition
        my $func_2 = method_event_def( $f, $scope, 'decode' );

        # Method event 'decoderAdd' definition
        my $func_3 = method_event_def( $f, $scope, 'decoderAdd' );

        # Method event 'decoderDone' definition
        my $func_4 = method_event_def( $f, $scope, 'decoderDone' );

        # Method event 'decoderReset' definition
        my $func_5 = method_event_def( $f, $scope, 'decoderReset' );

        # Method event 'encode' definition
        my $func_6 = method_event_def( $f, $scope, 'encode' );

        # Method event 'decode' definition
        my $func_7 = method_event_def( $f, $scope, 'decode' );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            encode => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_2->inside_scope(
            decode => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            decoderAdd => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_4->inside_scope(
            decoderDone => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_5->inside_scope(
            decoderReset => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_6->inside_scope(
            encode => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_7->inside_scope(
            decode => $scope,
            $class, $class, $ins, undef, undef
        );
        $scope->set_property(
            _PO => $$scope->{'NATIVE::PerlObject'},
            $pos->(9.3)
        );
        var(
            $scope,
            default => [
                sub {
                    ${ $scope->{special} }->{'class'}
                      ->( [ undef, [] ], $scope, undef, $pos->(12.4) );
                }
            ],
            undef,
            $pos->(12.2)
        );
        typedef(
            $scope, $class,
            'Charset',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                state $anchor = \0 + 0;
                typedef_check(
                    $scope, $scope, $ins, $anchor,
                    conditions => undef,
                    equal_to   => [
                        sub { get_symbol( $f, 'ascii' ) },
                        sub { get_symbol( $f, 'latin1' ) },
                        sub { get_symbol( $f, 'utf8' ) }
                    ]
                ) ? $ins : undef;
            },
            undef
        );
        $class->set_property( stringify => $$scope->{'encode'}, $pos->(191.3) );
        $class->set_property( parse     => $$scope->{'decode'}, $pos->(192.3) );
    }
    load_namespaces( $context,
        qw(Bool Charset Error List NATIVE NATIVE::PerlObject Str) );
};

after_content();
