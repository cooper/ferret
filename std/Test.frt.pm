# === Document Model ===
#  Document './std/Test.frt'
#      Class 'Test'
#          Class method '_init_'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Instance variable '@name'
#                          Expression ('want' parameter)
#                              String 'Test'
#                  Instruction
#                      Want
#                          Instance variable '@fatal'
#                          Expression ('want' parameter)
#                              Boolean true
#                  Instruction
#                      Assignment (instance variable '@tested')
#                          Number '0'
#                  Instruction
#                      Assignment (instance variable '@passed')
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
#                                      Equality
#                                          Lexical variable '$a'
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
#                                      Equality
#                                          Lexical variable '$a'
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
#                                      Equality
#                                          Lexical variable '$a'
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
#                                      Equality
#                                          Lexical variable '$a'
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
#                                      Equality
#                                          Lexical variable '$a'
#                                          Lexical variable '$b'
#                                  Item 1
#                                      String 'Objects mu...'
#          Method 'review'
#              Body ('method' scope)
#                  Instruction
#                      Assignment (lexical variable '$failed')
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
#                                      String ' tests; '
#                                      Addition operator (+)
#                                      Instance variable '@passed'
#                                      Addition operator (+)
#                                      String ' passed; '
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
#                          Equality
#                              Instance variable '@passed'
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
#                      Assignment (instance variable '@tested')
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
#                              Assignment (instance variable '@passed')
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
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die 'config error';
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = FF::get_ferret();

FF::before_content('Test.frt');

use Ferret::Core::Operations qw(_not _sub add bool num str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Class 'Test'
    {
        my ( $class, $self, $proto ) =
          FF::get_class( $f, $context, 'Test', undef );

        # Method event '_init_' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, '_init_',
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
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    my $want_val = $arguments->{name};
                    $want_val ||= str( $f, "Test" );
                    $self->set_property( name => $want_val, 4.0008210180624 );
                };
                do {
                    my $want_val = $arguments->{fatal};
                    $want_val ||= Ferret::true;
                    $self->set_property( fatal => $want_val, 6.0008210180624 );
                };
                $self->set_property( tested => num( $f, 0 ), 7.00164203612479 );
                $self->set_property( passed => num( $f, 0 ), 8.0016420361248 );
                return $return;
            }
        );

        # Method event 'trueValue' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'trueValue',
            [ { name => 'a', type => undef, optional => 1, more => undef } ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property( a => $arguments->{a}, 12.0008210180624 );
                return $self->property_u('_test')->call_u(
                    [
                        $scope->property_u('Bool')->call_u(
                            [ $scope->property_u('a') ], $scope,
                            undef,                       13.004105090312
                        ),
                        str( $f, "Value must be true" )
                    ],
                    $scope, undef,
                    13.0024630541872
                );
                return $return;
            }
        );

        # Method event 'veryTrue' definition
        my $method_2 = FF::method_event_def(
            $f, $scope,
            'veryTrue',
            [ { name => 'a', type => undef, optional => 1, more => undef } ],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property( a => $arguments->{a}, 18.0008210180624 );
                return $self->property_u('_test')->call_u(
                    [
                        $scope->property_u('a')
                          ->equal_to_exactly( Ferret::true, $scope ),
                        str( $f, "Value must be exactly true" )
                    ],
                    $scope, undef,
                    19.0024630541872
                );
                return $return;
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
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property( a => $arguments->{a}, 24.0008210180624 );
                $scope->set_property( b => $arguments->{b}, 24.0024630541872 );
                return $self->property_u('_test')->call_u(
                    [
                        $scope->property_u('a')
                          ->equal_to( $scope->property_u('b'), $scope ),
                        str( $f, "Values must be equal" )
                    ],
                    $scope, undef,
                    25.0024630541872
                );
                return $return;
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
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property( a => $arguments->{a}, 30.0008210180624 );
                $scope->set_property( b => $arguments->{b}, 30.0024630541872 );
                return $self->property_u('_test')->call_u(
                    [
                        $scope->property_u('a')
                          ->equal_to_exactly( $scope->property_u('b'), $scope ),
                        str( $f, "Objects must be exactly equal" )
                    ],
                    $scope, undef,
                    31.0024630541872
                );
                return $return;
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
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property( a => $arguments->{a}, 36.0008210180624 );
                $scope->set_property( b => $arguments->{b}, 36.0024630541872 );
                return $self->property_u('_test')->call_u(
                    [
                        _not(
                            $scope->property_u('a')
                              ->equal_to( $scope->property_u('b'), $scope )
                        ),
                        str( $f, "Values must not be equal" )
                    ],
                    $scope, undef,
                    37.0024630541872
                );
                return $return;
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
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property( a => $arguments->{a}, 42.0008210180624 );
                $scope->set_property( b => $arguments->{b}, 42.0024630541872 );
                return $self->property_u('_test')->call_u(
                    [
                        _not(
                            $scope->property_u('a')->equal_to_exactly(
                                $scope->property_u('b'), $scope
                            )
                        ),
                        str( $f, "Objects must not be equal" )
                    ],
                    $scope, undef,
                    43.0024630541872
                );
                return $return;
            }
        );

        # Method event 'review' definition
        my $method_7 = FF::method_event_def(
            $f, $scope, 'review',
            [],
            sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property_ow(
                    $context,
                    failed => _sub(
                        $scope,
                        $self->property_u('tested'),
                        $self->property_u('passed')
                    ),
                    47.0016420361248
                );
                $scope->property_u('say')->call_u(
                    [
                        add(
                            $scope,
                            str( $f, "[" ),
                            $self->property_u('name'),
                            str( $f, "] " ),
                            $self->property_u('tested'),
                            str( $f, " tests; " ),
                            $self->property_u('passed'),
                            str( $f, " passed; " ),
                            $scope->property_u('failed'),
                            str( $f, " failed" )
                        )
                    ],
                    $scope, undef,
                    48.0016420361248
                );
                $return->set_property(
                    tests => $self->property_u('tested'),
                    50.0016420361248
                );
                $return->set_property(
                    fails => $scope->property_u('failed'),
                    51.0016420361248
                );
                $return->set_property(
                    passes => $self->property_u('passed'),
                    52.0016420361248
                );
                $return->set_property(
                    allOK => $self->property_u('passed')
                      ->equal_to( $self->property_u('tested'), $scope ),
                    53.0016420361248
                );
                return $return;
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
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property(
                    yes => $arguments->{yes},
                    57.0008210180624
                );
                $scope->set_property(
                    message => $arguments->{message},
                    57.0024630541872
                );
                $self->set_property(
                    tested =>
                      add( $scope, $self->property_u('tested'), num( $f, 1 ) ),
                    59.0016420361248
                );
                $return->set_property(
                    pass => $scope->property_u('yes'),
                    60.0016420361248
                );
                if ( bool( $scope->property_u('yes') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $self->set_property(
                        passed => add(
                            $scope, $self->property_u('passed'),
                            num( $f, 1 )
                        ),
                        63.0016420361248
                    );
                    return $return;
                }
                if ( bool( $self->property_u('fatal') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $scope->property_u('Error')
                      ->call_u( [ $scope->property_u('message') ],
                        $scope, undef, 68.0016420361248 )->property_u('panic')
                      ->call_u( {}, $scope, undef, 68.0049261083744 );
                }
                $return->set_property(
                    message => $scope->property_u('message'),
                    70.0016420361248
                );
                return $return;
            }
        );
        $method_0->inside_scope(
            _init_ => $scope,
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
