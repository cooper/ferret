# === Document Model ===
#  Document './std/Test.frt'
#      Class 'Test'
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
#                      Want
#                          Lexical variable '$a'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@_test'
#                              Argument list [2 items]
#                                  Item 0
#                                      Call
#                                          Bareword 'Bool'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  Lexical variable '$a'
#                                  Item 1
#                                      String 'Value must...'
#          Method 'veryTrue'
#              Body ('method' scope)
#                  Instruction
#                      Want
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
#                      Want
#                          Lexical variable '$a'
#                  Instruction
#                      Want
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
#                      Want
#                          Lexical variable '$a'
#                  Instruction
#                      Want
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
#                      Want
#                          Lexical variable '$a'
#                  Instruction
#                      Want
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
#                      Want
#                          Lexical variable '$a'
#                  Instruction
#                      Want
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
#                          Argument list [1 items]
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
#                      Want
#                          Lexical variable '$yes'
#                  Instruction
#                      Want
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
#                              Call
#                                  Property 'panic'
#                                      Call
#                                          Bareword 'Error'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  Lexical variable '$message'
#                                  Argument list [0 items]
#                  Instruction
#                      Return pair 'message'
#                          Lexical variable '$message'
#      Include (Bool, Error)
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

FF::before_content('Test.frt');

use Ferret::Core::Operations
  qw(_sub add bool equal nequal num refs_equal refs_nequal str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Class 'Test'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Test', undef );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
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
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::want( $self, $args, 'name', 4.2, str( $f, "Test" ) );
                FF::want( $self, $args, 'fatal', 5.2, $true );
                $self->set_property( tested => num( $f, "0" ), 6.2 );
                $self->set_property( passed => num( $f, "0" ), 7.2 );
                return $ret;
            }
        );

        # Method event 'trueValue' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'trueValue',
            [ { name => 'a', type => undef, optional => 1, more => undef } ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::want( $scope, $args, 'a', 12.2 );
                return $$self->{'_test'}->(
                    [
                        $$scope->{'Bool'}
                          ->( [ $$scope->{'a'} ], $scope, undef, 13.25 ),
                        str( $f, "Value must be true" )
                    ],
                    $scope, undef, 13.15
                );
                return $ret;
            }
        );

        # Method event 'veryTrue' definition
        my $method_2 = FF::method_event_def(
            $f, $scope,
            'veryTrue',
            [ { name => 'a', type => undef, optional => 1, more => undef } ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::want( $scope, $args, 'a', 18.2 );
                return $$self->{'_test'}->(
                    [
                        refs_equal( $scope, $$scope->{'a'}, $true ),
                        str( $f, "Value must be exactly true" )
                    ],
                    $scope, undef, 19.15
                );
                return $ret;
            }
        );

        # Method event 'equal' definition
        my $method_3 = FF::method_event_def(
            $f, $scope, 'equal',
            [
                { name => 'a', type => undef, optional => 1, more => undef },
                { name => 'b', type => undef, optional => 1, more => undef }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::want( $scope, $args, 'a', 24.2 );
                FF::want( $scope, $args, 'b', 24.4 );
                return $$self->{'_test'}->(
                    [
                        equal( $scope, $$scope->{'a'}, $$scope->{'b'} ),
                        str( $f, "Values must be equal" )
                    ],
                    $scope, undef, 25.15
                );
                return $ret;
            }
        );

        # Method event 'objectsEqual' definition
        my $method_4 = FF::method_event_def(
            $f, $scope,
            'objectsEqual',
            [
                { name => 'a', type => undef, optional => 1, more => undef },
                { name => 'b', type => undef, optional => 1, more => undef }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::want( $scope, $args, 'a', 30.2 );
                FF::want( $scope, $args, 'b', 30.4 );
                return $$self->{'_test'}->(
                    [
                        refs_equal( $scope, $$scope->{'a'}, $$scope->{'b'} ),
                        str( $f, "Objects must be exactly equal" )
                    ],
                    $scope, undef, 31.15
                );
                return $ret;
            }
        );

        # Method event 'notEqual' definition
        my $method_5 = FF::method_event_def(
            $f, $scope,
            'notEqual',
            [
                { name => 'a', type => undef, optional => 1, more => undef },
                { name => 'b', type => undef, optional => 1, more => undef }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::want( $scope, $args, 'a', 36.2 );
                FF::want( $scope, $args, 'b', 36.4 );
                return $$self->{'_test'}->(
                    [
                        nequal( $scope, $$scope->{'a'}, $$scope->{'b'} ),
                        str( $f, "Values must not be equal" )
                    ],
                    $scope, undef, 37.15
                );
                return $ret;
            }
        );

        # Method event 'objectsNotEqual' definition
        my $method_6 = FF::method_event_def(
            $f, $scope,
            'objectsNotEqual',
            [
                { name => 'a', type => undef, optional => 1, more => undef },
                { name => 'b', type => undef, optional => 1, more => undef }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::want( $scope, $args, 'a', 42.2 );
                FF::want( $scope, $args, 'b', 42.4 );
                return $$self->{'_test'}->(
                    [
                        refs_nequal( $scope, $$scope->{'a'}, $$scope->{'b'} ),
                        str( $f, "Objects must not be equal" )
                    ],
                    $scope, undef, 43.15
                );
                return $ret;
            }
        );

        # Method event 'review' definition
        my $method_7 = FF::method_event_def(
            $f, $scope, 'review',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::lex_assign(
                    $scope,
                    failed =>
                      _sub( $scope, $$self->{'tested'}, $$self->{'passed'} ),
                    $file_scope, 47.2
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
                    $scope, undef, 48.06667
                );
                $ret->set_property( tests  => $$self->{'tested'},  50.2 );
                $ret->set_property( fails  => $$scope->{'failed'}, 51.2 );
                $ret->set_property( passes => $$self->{'passed'},  52.2 );
                $ret->set_property(
                    allOK =>
                      equal( $scope, $$self->{'passed'}, $$self->{'tested'} ),
                    53.2
                );
                return $ret;
            }
        );

        # Method event '_test' definition
        my $method_8 = FF::method_event_def(
            $f, $scope, '_test',
            [
                { name => 'yes', type => undef, optional => 1, more => undef },
                {
                    name     => 'message',
                    type     => undef,
                    optional => 1,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::want( $scope, $args, 'yes',     57.2 );
                FF::want( $scope, $args, 'message', 57.4 );
                $self->set_property(
                    tested => add( $scope, $$self->{'tested'}, num( $f, "1" ) ),
                    59.2
                );
                $ret->set_property( pass => $$scope->{'yes'}, 60.2 );
                if ( bool( $$scope->{'yes'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $self->set_property(
                        passed =>
                          add( $scope, $$self->{'passed'}, num( $f, "1" ) ),
                        63.2
                    );
                    return;
                }
                if ( bool( $$self->{'fatal'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    ${ $$scope->{'Error'}
                          ->( [ $$scope->{'message'} ], $scope, undef, 68.2 ) }
                      ->{'panic'}->( {}, $scope, undef, 68.6 );
                }
                $ret->set_property( message => $$scope->{'message'}, 70.2 );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            trueValue => $scope,
            $proto, $class, undef, undef
        );
        $method_2->inside_scope(
            veryTrue => $scope,
            $proto, $class, undef, undef
        );
        $method_3->inside_scope(
            equal => $scope,
            $proto, $class, undef, undef
        );
        $method_4->inside_scope(
            objectsEqual => $scope,
            $proto, $class, undef, undef
        );
        $method_5->inside_scope(
            notEqual => $scope,
            $proto, $class, undef, undef
        );
        $method_6->inside_scope(
            objectsNotEqual => $scope,
            $proto, $class, undef, undef
        );
        $method_7->inside_scope(
            review => $scope,
            $proto, $class, undef, undef
        );
        $method_8->inside_scope(
            _test => $scope,
            $proto, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Bool Error) );
};

FF::after_content();
