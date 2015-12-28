# === Document Model ===
#  Document './std/Signal.frt'
#      Class 'Signal'
#          Instruction
#              Load
#                  Bareword 'NATIVE::Signal'
#          Instruction
#              Lazy assignment (lexical variable '$INT')
#                  Call
#                      Special variable '*class'
#                      Argument list [1 items]
#                          Item 0
#                              Symbol :INT
#          Instruction
#              Lazy assignment (lexical variable '$HUP')
#                  Call
#                      Special variable '*class'
#                      Argument list [1 items]
#                          Item 0
#                              Symbol :HUP
#          Instruction
#              Lazy assignment (lexical variable '$TERM')
#                  Call
#                      Special variable '*class'
#                      Argument list [1 items]
#                          Item 0
#                              Symbol :TERM
#          Instruction
#              Lazy assignment (lexical variable '$ALRM')
#                  Call
#                      Special variable '*class'
#                      Argument list [1 items]
#                          Item 0
#                              Symbol :ALRM
#          Instruction
#              Lazy assignment (lexical variable '$signals')
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
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Instance variable '@type'
#                          Bareword 'Sym'
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
#                          Bareword 'Sym'
#                  Instruction
#                      Call
#                          Property 'catch'
#                              Maybe
#                                  Index
#                                      Lexical variable '$signals'
#                                      Single value [1 items]
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
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Class 'Signal'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, 'Signal', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
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
            _init_ => $scope,
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

        $class->set_property_ow(
            $context,
            INT => [
                sub {
                    $scope->{special}->property_u('class')
                      ->call_u( [ FF::get_symbol( $f, 'INT' ) ],
                        $scope, undef, 7.4 );
                }
            ],
            7.2
        );
        $class->set_property_ow(
            $context,
            HUP => [
                sub {
                    $scope->{special}->property_u('class')
                      ->call_u( [ FF::get_symbol( $f, 'HUP' ) ],
                        $scope, undef, 8.4 );
                }
            ],
            8.2
        );
        $class->set_property_ow(
            $context,
            TERM => [
                sub {
                    $scope->{special}->property_u('class')
                      ->call_u( [ FF::get_symbol( $f, 'TERM' ) ],
                        $scope, undef, 9.4 );
                }
            ],
            9.2
        );
        $class->set_property_ow(
            $context,
            ALRM => [
                sub {
                    $scope->{special}->property_u('class')
                      ->call_u( [ FF::get_symbol( $f, 'ALRM' ) ],
                        $scope, undef, 10.4 );
                }
            ],
            10.2
        );
        $class->set_property_ow(
            $context,
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
