# === Document Model ===
#  Document './std/Test.frt'
#      Class 'Test' version 1.0
#          Class method 'initializer__'
#              Body ('method' scope)
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
#              Body ('method' scope)
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
#              Body ('method' scope)
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
#              Body ('method' scope)
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
#              Body ('method' scope)
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
#              Body ('method' scope)
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
#              Body ('method' scope)
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
#              Body ('method' scope)
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
#              Body ('method' scope)
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
#                      Body ('if' scope)
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
#                      Body ('if' scope)
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
        my $method_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [
                { name => 'name', type => undef, optional => 1, more => undef },
                {
                    name     => 'fatal',
                    type     => undef,
                    optional => 1,
                    more     => undef
                }
            ],
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                want( $self, $args, 'name', 7.2, str( $f, "Test" ) );
                want( $self, $args, 'fatal', 11.2, $true );
                $self->set_property( tested => num( $f, "0" ), $pos->(13.2) );
                $self->set_property( passed => num( $f, "0" ), $pos->(14.2) );
                return $ret;
            }
        );

        # Method event 'trueValue' definition
        my $method_1 = method_event_def(
            $f, $scope,
            'trueValue',
            [
                {
                    name     => 'a',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'a', 19.2 ) or return;
                return $ret_func->(
                    $$self->{'_test'}->(
                        [
                            $$scope->{'Bool'}->(
                                [ $$scope->{'a'} ], $scope,
                                undef,              $pos->(20.25)
                            ),
                            str( $f, "Value must be true" )
                        ],
                        $scope, undef,
                        $pos->(20.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'veryTrue' definition
        my $method_2 = method_event_def(
            $f, $scope,
            'veryTrue',
            [
                {
                    name     => 'a',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'a', 25.2 ) or return;
                return $ret_func->(
                    $$self->{'_test'}->(
                        [
                            refs_equal( $scope, $$scope->{'a'}, $true ),
                            str( $f, "Value must be exactly true" )
                        ],
                        $scope, undef,
                        $pos->(26.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'equal' definition
        my $method_3 = method_event_def(
            $f, $scope, 'equal',
            [
                {
                    name     => 'a',
                    type     => undef,
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'b',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'a', 31.2 ) or return;
                need( $scope, $args, 'b', 32.2 ) or return;
                return $ret_func->(
                    $$self->{'_test'}->(
                        [
                            equal( $scope, $$scope->{'a'}, $$scope->{'b'} ),
                            str( $f, "Values must be equal" )
                        ],
                        $scope, undef,
                        $pos->(33.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'objectsEqual' definition
        my $method_4 = method_event_def(
            $f, $scope,
            'objectsEqual',
            [
                {
                    name     => 'a',
                    type     => undef,
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'b',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'a', 38.2 ) or return;
                need( $scope, $args, 'b', 39.2 ) or return;
                return $ret_func->(
                    $$self->{'_test'}->(
                        [
                            refs_equal(
                                $scope, $$scope->{'a'}, $$scope->{'b'}
                            ),
                            str( $f, "Objects must be exactly equal" )
                        ],
                        $scope, undef,
                        $pos->(40.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'notEqual' definition
        my $method_5 = method_event_def(
            $f, $scope,
            'notEqual',
            [
                {
                    name     => 'a',
                    type     => undef,
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'b',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'a', 45.2 ) or return;
                need( $scope, $args, 'b', 46.2 ) or return;
                return $ret_func->(
                    $$self->{'_test'}->(
                        [
                            nequal( $scope, $$scope->{'a'}, $$scope->{'b'} ),
                            str( $f, "Values must not be equal" )
                        ],
                        $scope, undef,
                        $pos->(47.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'objectsNotEqual' definition
        my $method_6 = method_event_def(
            $f, $scope,
            'objectsNotEqual',
            [
                {
                    name     => 'a',
                    type     => undef,
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'b',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'a', 52.2 ) or return;
                need( $scope, $args, 'b', 53.2 ) or return;
                return $ret_func->(
                    $$self->{'_test'}->(
                        [
                            refs_nequal(
                                $scope, $$scope->{'a'}, $$scope->{'b'}
                            ),
                            str( $f, "Objects must not be equal" )
                        ],
                        $scope, undef,
                        $pos->(54.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'review' definition
        my $method_7 = method_event_def(
            $f, $scope, 'review',
            [],
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var(
                    $scope,
                    failed =>
                      _sub( $scope, $$self->{'tested'}, $$self->{'passed'} ),
                    $file_scope, $pos->(59.2)
                );
                $$scope->{'say'}->(
                    [
                        add(
                            $scope,              str( $f, "[" ),
                            $$self->{'name'},    str( $f, "] " ),
                            $$self->{'tested'},  str( $f, " tests " ),
                            $$self->{'passed'},  str( $f, " passed " ),
                            $$scope->{'failed'}, str( $f, " failed" )
                        )
                    ],
                    $scope, undef,
                    $pos->(60.06667)
                );
                $ret->set_property( tests => $$self->{'tested'}, $pos->(62.2) );
                $ret->set_property(
                    fails => $$scope->{'failed'},
                    $pos->(63.2)
                );
                $ret->set_property(
                    passes => $$self->{'passed'},
                    $pos->(64.2)
                );
                $ret->set_property(
                    allOK =>
                      equal( $scope, $$self->{'passed'}, $$self->{'tested'} ),
                    $pos->(65.2)
                );
                return $ret;
            }
        );

        # Method event '_test' definition
        my $method_8 = method_event_def(
            $f, $scope, '_test',
            [
                {
                    name     => 'yes',
                    type     => undef,
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'message',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'yes',     69.2 ) or return;
                need( $scope, $args, 'message', 69.4 ) or return;
                $self->set_property(
                    tested => add( $scope, $$self->{'tested'}, num( $f, "1" ) ),
                    $pos->(71.2)
                );
                $ret->set_property( pass => $$scope->{'yes'}, $pos->(72.2) );
                if ( bool( $$scope->{'yes'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $self->set_property(
                        passed =>
                          add( $scope, $$self->{'passed'}, num( $f, "1" ) ),
                        $pos->(75.2)
                    );
                    return $ret_func->();
                }
                if ( bool( $$self->{'fatal'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret->throw(
                        $$scope->{'Error'}->(
                            [
                                get_symbol( $f, 'TestFailure' ),
                                $$scope->{'message'}
                            ],
                            $scope, undef,
                            $pos->(80.3)
                        ),
                        $pos->(80.1)
                    );
                }
                $ret->set_property(
                    message => $$scope->{'message'},
                    $pos->(82.2)
                );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $method_1->inside_scope(
            trueValue => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_2->inside_scope(
            veryTrue => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_3->inside_scope(
            equal => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_4->inside_scope(
            objectsEqual => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_5->inside_scope(
            notEqual => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_6->inside_scope(
            objectsNotEqual => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_7->inside_scope(
            review => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_8->inside_scope(
            _test => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Bool Error) );
};

after_content();
