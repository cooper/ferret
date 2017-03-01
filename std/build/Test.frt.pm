# === Document Model ===
#  Document './std/Test.frt'
#      Class 'Test' version 1.0
#          Class method 'initializer__' { ?$name ?$fatal }
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
#          Method 'trueValue' { $a -> $result }
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
#          Method 'veryTrue' { $a -> $result }
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
#          Method 'equal' { $a $b -> $result }
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
#          Method 'objectsEqual' { $a $b -> $result }
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
#          Method 'notEqual' { $a $b -> $result }
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
#          Method 'objectsNotEqual' { $a $b -> $result }
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
#          Method 'instanceOf' { $a $b -> $result }
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
#                                      Call
#                                          Special property '*instanceOf'
#                                              Lexical variable '$a'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  Lexical variable '$b'
#                                  Item 1
#                                      String 'Object mus...'
#          Method 'review' { ?$quiet:Bool -> $tests $fails $passes $allOK }
#              Function body
#                  Instruction
#                      Want
#                          Lexical variable '$quiet'
#                          Argument type
#                              Bareword 'Bool'
#                  Instruction
#                      Assignment
#                          Lexical variable '$failed'
#                          Operation
#                              Instance variable '@tested'
#                              Subtraction operator (-)
#                              Instance variable '@passed'
#                  If
#                      Expression ('if' parameter)
#                          Negation
#                              Lexical variable '$quiet'
#                      If body
#                          Instruction
#                              Call
#                                  Bareword 'say'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Operation
#                                              String '['
#                                              Addition operator (+)
#                                              Instance variable '@name'
#                                              Addition operator (+)
#                                              String '] '
#                                              Addition operator (+)
#                                              Instance variable '@tested'
#                                              Addition operator (+)
#                                              String ' tests '
#                                              Addition operator (+)
#                                              Instance variable '@passed'
#                                              Addition operator (+)
#                                              String ' passed '
#                                              Addition operator (+)
#                                              Lexical variable '$failed'
#                                              Addition operator (+)
#                                              String ' failed'
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
#          Method '_test' { $yes $message -> $pass $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$yes'
#                  Instruction
#                      Need
#                          Lexical variable '$message'
#                  Instruction
#                      Addition assignment
#                          Instance variable '@tested'
#                          Number '1'
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
#                              Addition assignment
#                                  Instance variable '@passed'
#                                  Number '1'
#                          Instruction
#                              Return pair 'pass'
#                                  Boolean true
#                          Instruction
#                              Return
#                  Instruction
#                      Assignment
#                          Lexical variable '$e'
#                          Call
#                              Bareword 'Error'
#                              Argument list [2 items]
#                                  Item 0
#                                      Symbol :TestFailure
#                                  Item 1
#                                      Lexical variable '$message'
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@fatal'
#                      If body
#                          Instruction
#                              Throw (fatal exception)
#                                  Lexical variable '$e'
#                  Instruction
#                      Fail (nonfatal exception)
#                          Lexical variable '$e'
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
  qw(_not _sub add bool equal nequal num refs_equal refs_nequal str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'Test'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Test', 1.0, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
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
            undef,
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
        my $func_1 = method_event_def(
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
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'a', 19.2 ) || return $ret_func->();
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
        my $func_2 = method_event_def(
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
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'a', 25.2 ) || return $ret_func->();
                return $ret_func->(
                    $$self->{'_test'}->(
                        [
                            refs_equal(
                                $scope,         $pos->(26.25),
                                $$scope->{'a'}, $true
                            ),
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
        my $func_3 = method_event_def(
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
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'a', 31.2 ) || return $ret_func->();
                need( $scope, $args, 'b', 32.2 ) || return $ret_func->();
                return $ret_func->(
                    $$self->{'_test'}->(
                        [
                            equal(
                                $scope,         $pos->(33.25),
                                $$scope->{'a'}, $$scope->{'b'}
                            ),
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
        my $func_4 = method_event_def(
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
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'a', 38.2 ) || return $ret_func->();
                need( $scope, $args, 'b', 39.2 ) || return $ret_func->();
                return $ret_func->(
                    $$self->{'_test'}->(
                        [
                            refs_equal(
                                $scope,         $pos->(40.25),
                                $$scope->{'a'}, $$scope->{'b'}
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
        my $func_5 = method_event_def(
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
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'a', 45.2 ) || return $ret_func->();
                need( $scope, $args, 'b', 46.2 ) || return $ret_func->();
                return $ret_func->(
                    $$self->{'_test'}->(
                        [
                            nequal(
                                $scope,         $pos->(47.25),
                                $$scope->{'a'}, $$scope->{'b'}
                            ),
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
        my $func_6 = method_event_def(
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
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'a', 52.2 ) || return $ret_func->();
                need( $scope, $args, 'b', 53.2 ) || return $ret_func->();
                return $ret_func->(
                    $$self->{'_test'}->(
                        [
                            refs_nequal(
                                $scope,         $pos->(54.25),
                                $$scope->{'a'}, $$scope->{'b'}
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

        # Method event 'instanceOf' definition
        my $func_7 = method_event_def(
            $f, $scope,
            'instanceOf',
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
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'a', 59.2 ) || return $ret_func->();
                need( $scope, $args, 'b', 60.2 ) || return $ret_func->();
                return $ret_func->(
                    $$self->{'_test'}->(
                        [
                            $$scope->{'a'}
                              ->property_u( '*instanceOf', $pos->(61.25) )->(
                                [ $$scope->{'b'} ], $scope,
                                undef,              $pos->(61.3)
                              ),
                            str(
                                $f, "Object must be an instance of the class"
                            )
                        ],
                        $scope, undef,
                        $pos->(61.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'review' definition
        my $func_8 = method_event_def(
            $f, $scope, 'review',
            [
                {
                    name     => 'quiet',
                    type     => 'Bool',
                    optional => 1,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                want( $scope, $args, 'quiet', 66.2 );
                var(
                    $scope,
                    failed => _sub(
                        $scope,             $pos->(67.4),
                        $$self->{'tested'}, $$self->{'passed'}
                    ),
                    $file_scope,
                    $pos->(67.2)
                );
                if ( bool( _not( $$scope->{'quiet'} ) ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $$scope->{'say'}->(
                        [
                            add(
                                $scope, $pos->(70.13333),
                                str( $f, "[" ),        $$self->{'name'},
                                str( $f, "] " ),       $$self->{'tested'},
                                str( $f, " tests " ),  $$self->{'passed'},
                                str( $f, " passed " ), $$scope->{'failed'},
                                str( $f, " failed" )
                            )
                        ],
                        $scope, undef,
                        $pos->(70.06667)
                    );
                }
                $ret->set_property( tests => $$self->{'tested'}, $pos->(72.2) );
                $ret->set_property(
                    fails => $$scope->{'failed'},
                    $pos->(73.2)
                );
                $ret->set_property(
                    passes => $$self->{'passed'},
                    $pos->(74.2)
                );
                $ret->set_property(
                    allOK => equal(
                        $scope,             $pos->(75.4),
                        $$self->{'passed'}, $$self->{'tested'}
                    ),
                    $pos->(75.2)
                );
                return $ret;
            }
        );

        # Method event '_test' definition
        my $func_9 = method_event_def(
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
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'yes',     79.2 ) || return $ret_func->();
                need( $scope, $args, 'message', 79.4 ) || return $ret_func->();
                $self->set_property(
                    tested => add(
                        $scope, $pos->(80.2),
                        $$self->{'tested'}, num( $f, "1" )
                    ),
                    $pos->(80.2)
                );
                if ( bool( $$scope->{'yes'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $self->set_property(
                        passed => add(
                            $scope, $pos->(84.4),
                            $$self->{'passed'}, num( $f, "1" )
                        ),
                        $pos->(84.2)
                    );
                    $self->set_property(
                        passed => add(
                            $scope, $pos->(85.2),
                            $$self->{'passed'}, num( $f, "1" )
                        ),
                        $pos->(85.2)
                    );
                    $ret->set_property( pass => $true, $pos->(86.2) );
                    return $ret_func->();
                }
                var(
                    $scope,
                    e => $$scope->{'Error'}->(
                        [
                            get_symbol( $f, 'TestFailure' ),
                            $$scope->{'message'}
                        ],
                        $scope, undef,
                        $pos->(91.2)
                    ),
                    $file_scope,
                    $pos->(91.1)
                );
                if ( bool( $$self->{'fatal'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        $ret->throw( $$scope->{'e'}, $pos->(93.1) ) );
                }
                return $ret_func->(
                    $ret->fail( $$scope->{'e'}, $pos->(96.1) ) );
                return $ret;
            }
        );
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
            instanceOf => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_8->inside_scope(
            review => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_9->inside_scope(
            _test => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Bool Error) );
};

after_content();
