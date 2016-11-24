# === Document Model ===
#  Document './std/Signal.frt'
#      Class 'Signal'
#          Instruction
#              Load
#                  Bareword 'NATIVE::Signal'
#          Instruction
#              Shared variable declaration
#                  Lazy assignment
#                      Lexical variable '$INT'
#                      Call
#                          Special variable '*class'
#                          Argument list [1 item]
#                              Item 0
#                                  Symbol :INT
#          Instruction
#              Shared variable declaration
#                  Lazy assignment
#                      Lexical variable '$HUP'
#                      Call
#                          Special variable '*class'
#                          Argument list [1 item]
#                              Item 0
#                                  Symbol :HUP
#          Instruction
#              Shared variable declaration
#                  Lazy assignment
#                      Lexical variable '$TERM'
#                      Call
#                          Special variable '*class'
#                          Argument list [1 item]
#                              Item 0
#                                  Symbol :TERM
#          Instruction
#              Shared variable declaration
#                  Lazy assignment
#                      Lexical variable '$ALRM'
#                      Call
#                          Special variable '*class'
#                          Argument list [1 item]
#                              Item 0
#                                  Symbol :ALRM
#          Instruction
#              Lazy assignment
#                  Lexical variable '$signals'
#                  Hash [4 items]
#                      Item 0
#                          Pair 'INT'
#                              Lexical variable '$INT'
#                      Item 1
#                          Pair 'HUP'
#                              Lexical variable '$HUP'
#                      Item 2
#                          Pair 'TERM'
#                              Lexical variable '$TERM'
#                      Item 3
#                          Pair 'ALRM'
#                              Lexical variable '$ALRM'
#          Class method 'initializer__'
#              Function body
#                  Instruction
#                      Need
#                          Instance variable '@type'
#                          Argument type
#                              Bareword 'Sym'
#          Method 'trap'
#              Function body
#                  Instruction
#                      Call
#                          Bareword '_exit'
#                          Argument list [1 item]
#                              Item 0
#                                  Number '0'
#          Class method 'fireSignal'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$type'
#                          Argument type
#                              Bareword 'Sym'
#                  Instruction
#                      Call
#                          Property 'trap'
#                              Maybe
#                                  Index
#                                      Lexical variable '$signals'
#                                      Index list [1 item]
#                                          Item 0
#                                              Lexical variable '$type'
#                          Argument list [0 items]
#      Include (NATIVE, NATIVE::Signal, Sym)
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

my $pos = before_content( 'Signal.frt', './std/Signal.frt' );

use Ferret::Core::Operations qw(bool num);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'Signal'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Signal', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def( $f, $scope, 'initializer__' );

        # Method event 'trap' definition
        my $func_1 = method_event_def( $f, $scope, 'trap' );

        # Method event 'fireSignal' definition
        my $func_2 = method_event_def( $f, $scope, 'fireSignal' );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            trap => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_2->inside_scope(
            fireSignal => $scope,
            $class, $class, $ins, undef, undef
        );

        var(
            $class,
            INT => [
                sub {
                    ${ $scope->{special} }->{'class'}->(
                        [ get_symbol( $f, 'INT' ) ],
                        $scope, undef, $pos->(7.5)
                    );
                }
            ],
            undef,
            $pos->(7.3)
        );
        var(
            $class,
            HUP => [
                sub {
                    ${ $scope->{special} }->{'class'}->(
                        [ get_symbol( $f, 'HUP' ) ],
                        $scope, undef, $pos->(8.5)
                    );
                }
            ],
            undef,
            $pos->(8.3)
        );
        var(
            $class,
            TERM => [
                sub {
                    ${ $scope->{special} }->{'class'}->(
                        [ get_symbol( $f, 'TERM' ) ],
                        $scope, undef, $pos->(9.5)
                    );
                }
            ],
            undef,
            $pos->(9.3)
        );
        var(
            $class,
            ALRM => [
                sub {
                    ${ $scope->{special} }->{'class'}->(
                        [ get_symbol( $f, 'ALRM' ) ],
                        $scope, undef, $pos->(10.5)
                    );
                }
            ],
            undef,
            $pos->(10.3)
        );
        var(
            $scope,
            signals => [
                sub {
                    create_hash(
                        $f,
                        [
                            INT  => $$scope->{'INT'},
                            HUP  => $$scope->{'HUP'},
                            TERM => $$scope->{'TERM'},
                            ALRM => $$scope->{'ALRM'}
                        ]
                    );
                }
            ],
            undef,
            $pos->(12.2)
        );
    }
    load_namespaces( $context, qw(NATIVE NATIVE::Signal Sym) );
};

after_content();
