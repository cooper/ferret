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
#                          Argument list [1 items]
#                              Item 0
#                                  Symbol :INT
#          Instruction
#              Shared variable declaration
#                  Lazy assignment
#                      Lexical variable '$HUP'
#                      Call
#                          Special variable '*class'
#                          Argument list [1 items]
#                              Item 0
#                                  Symbol :HUP
#          Instruction
#              Shared variable declaration
#                  Lazy assignment
#                      Lexical variable '$TERM'
#                      Call
#                          Special variable '*class'
#                          Argument list [1 items]
#                              Item 0
#                                  Symbol :TERM
#          Instruction
#              Shared variable declaration
#                  Lazy assignment
#                      Lexical variable '$ALRM'
#                      Call
#                          Special variable '*class'
#                          Argument list [1 items]
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
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Instance variable '@type'
#                          Argument type
#                              Bareword 'Sym'
#          Method 'catch'
#              Body ('method' scope)
#                  Instruction
#                      Call
#                          Bareword '_exit'
#                          Argument list [1 items]
#                              Item 0
#                                  Number '0'
#          Class method 'fireSignal'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$type'
#                          Argument type
#                              Bareword 'Sym'
#                  Instruction
#                      Call
#                          Property 'catch'
#                              Maybe
#                                  Index
#                                      Lexical variable '$signals'
#                                      Index list [1 items]
#                                          Item 0
#                                              Lexical variable '$type'
#                          Argument list [0 items]
#      Include (NATIVE, NATIVE::Signal, Sym)
use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('Signal.frt');

use Ferret::Core::Operations qw(bool num);
my $result = do {
    my ( $scope, $context ) = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Class 'Signal'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Signal', undef );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'type',
                    type     => 'Sym',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                FF::need( $self, $args, 'type' ) or return;
                return $ret->return;
            }
        );

        # Method event 'catch' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'catch',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                $scope->property_u('_exit')
                  ->call_u( [ num( $f, 0 ) ], $scope, undef, 25.2 );
                return $ret->return;
            }
        );

        # Method event 'fireSignal' definition
        my $method_2 = FF::method_event_def(
            $f, $scope,
            'fireSignal',
            [
                {
                    name     => 'type',
                    type     => 'Sym',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $ret->inc;
                FF::need( $scope, $args, 'type', 31.2 ) or return;
                {
                    my $maybe_0 =
                      $scope->property_u('signals')
                      ->get_index_value( [ $scope->property_u('type') ],
                        $scope );
                    if ( bool($maybe_0) ) {
                        $maybe_0->property_u('catch')
                          ->call_u( {}, $scope, undef, 32.35 );
                    }
                }
                return $ret->return;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            catch => $scope,
            $proto, $class, undef, undef
        );
        $method_2->inside_scope(
            fireSignal => $scope,
            $class, $class, undef, undef
        );

        $class->set_property(
            INT => [
                sub {
                    $scope->{special}->property_u('class')
                      ->call_u( [ FF::get_symbol( $f, 'INT' ) ],
                        $scope, undef, 7.5 );
                }
            ],
            7.3
        );
        $class->set_property(
            HUP => [
                sub {
                    $scope->{special}->property_u('class')
                      ->call_u( [ FF::get_symbol( $f, 'HUP' ) ],
                        $scope, undef, 8.5 );
                }
            ],
            8.3
        );
        $class->set_property(
            TERM => [
                sub {
                    $scope->{special}->property_u('class')
                      ->call_u( [ FF::get_symbol( $f, 'TERM' ) ],
                        $scope, undef, 9.5 );
                }
            ],
            9.3
        );
        $class->set_property(
            ALRM => [
                sub {
                    $scope->{special}->property_u('class')
                      ->call_u( [ FF::get_symbol( $f, 'ALRM' ) ],
                        $scope, undef, 10.5 );
                }
            ],
            10.3
        );
        $scope->set_property(
            signals => [
                sub {
                    FF::create_hash(
                        $f,
                        {
                            INT  => $scope->property_u('INT'),
                            HUP  => $scope->property_u('HUP'),
                            TERM => $scope->property_u('TERM'),
                            ALRM => $scope->property_u('ALRM')
                        }
                    );
                }
            ],
            12.2
        );
    }
    FF::load_namespaces( $context, qw(NATIVE NATIVE::Signal Sym) );
};

FF::after_content();
