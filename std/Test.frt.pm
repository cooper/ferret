# === Document Model ===
#  Document './std/Test.frt'
#      Class 'Test'
#          Main method '_init_'
#              Instruction
#                  Want
#                      Instance variable '@name'
#                      Expression ('want' parameter)
#                          String 'Test'
#              Instruction
#                  Want
#                      Instance variable '@fatal'
#                      Expression ('want' parameter)
#                          Boolean true
#              Instruction
#                  Assignment (instance variable '@tested')
#                      Number '0'
#              Instruction
#                  Assignment (instance variable '@passed')
#                      Number '0'
#          Method 'trueValue'
#              Instruction
#                  Want
#                      Lexical variable '$a'
#              Instruction
#                  Return
#                      Call
#                          Instance variable '@_test'
#                          Structural list [2 items]
#                              Item 0
#                                  Call
#                                      Bareword 'Bool'
#                                      Structural list [1 items]
#                                          Item 0
#                                              Lexical variable '$a'
#                              Item 1
#                                  String 'Value must...'
#          Method 'veryTrue'
#              Instruction
#                  Want
#                      Lexical variable '$a'
#              Instruction
#                  Return
#                      Call
#                          Instance variable '@_test'
#                          Structural list [2 items]
#                              Item 0
#                                  Equality
#                                      Lexical variable '$a'
#                                      Boolean true
#                              Item 1
#                                  String 'Value must...'
#          Method 'equal'
#              Instruction
#                  Want
#                      Lexical variable '$a'
#              Instruction
#                  Want
#                      Lexical variable '$b'
#              Instruction
#                  Return
#                      Call
#                          Instance variable '@_test'
#                          Structural list [2 items]
#                              Item 0
#                                  Equality
#                                      Lexical variable '$a'
#                                      Lexical variable '$b'
#                              Item 1
#                                  String 'Values mus...'
#          Method 'objectsEqual'
#              Instruction
#                  Want
#                      Lexical variable '$a'
#              Instruction
#                  Want
#                      Lexical variable '$b'
#              Instruction
#                  Return
#                      Call
#                          Instance variable '@_test'
#                          Structural list [2 items]
#                              Item 0
#                                  Equality
#                                      Lexical variable '$a'
#                                      Lexical variable '$b'
#                              Item 1
#                                  String 'Objects mu...'
#          Method 'notEqual'
#              Instruction
#                  Want
#                      Lexical variable '$a'
#              Instruction
#                  Want
#                      Lexical variable '$b'
#              Instruction
#                  Return
#                      Call
#                          Instance variable '@_test'
#                          Structural list [2 items]
#                              Item 0
#                                  Equality
#                                      Lexical variable '$a'
#                                      Lexical variable '$b'
#                              Item 1
#                                  String 'Values mus...'
#          Method 'objectsNotEqual'
#              Instruction
#                  Want
#                      Lexical variable '$a'
#              Instruction
#                  Want
#                      Lexical variable '$b'
#              Instruction
#                  Return
#                      Call
#                          Instance variable '@_test'
#                          Structural list [2 items]
#                              Item 0
#                                  Equality
#                                      Lexical variable '$a'
#                                      Lexical variable '$b'
#                              Item 1
#                                  String 'Objects mu...'
#          Method 'review'
#              Instruction
#                  Assignment (lexical variable '$failed')
#                      Operation
#                          Instance variable '@tested'
#                          Subtraction operator (-)
#                          Instance variable '@passed'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Structural list [1 items]
#                          Item 0
#                              Operation
#                                  String '['
#                                  Addition operator (+)
#                                  Instance variable '@name'
#                                  Addition operator (+)
#                                  String '] '
#                                  Addition operator (+)
#                                  Instance variable '@tested'
#                                  Addition operator (+)
#                                  String ' tests; '
#                                  Addition operator (+)
#                                  Instance variable '@passed'
#                                  Addition operator (+)
#                                  String ' passed; '
#                                  Addition operator (+)
#                                  Lexical variable '$failed'
#                                  Addition operator (+)
#                                  String ' failed'
#              Instruction
#                  Return pair 'tests'
#                      Instance variable '@tested'
#              Instruction
#                  Return pair 'fails'
#                      Lexical variable '$failed'
#              Instruction
#                  Return pair 'passes'
#                      Instance variable '@passed'
#              Instruction
#                  Return pair 'allOK'
#                      Equality
#                          Instance variable '@passed'
#                          Instance variable '@tested'
#          Method '_test'
#              Instruction
#                  Want
#                      Lexical variable '$yes'
#              Instruction
#                  Want
#                      Lexical variable '$message'
#              Instruction
#                  Assignment (instance variable '@tested')
#                      Operation
#                          Instance variable '@tested'
#                          Addition operator (+)
#                          Number '1'
#              Instruction
#                  Return pair 'pass'
#                      Lexical variable '$yes'
#              If
#                  Expression ('if' parameter)
#                      Lexical variable '$yes'
#                  Instruction
#                      Assignment (instance variable '@passed')
#                          Operation
#                              Instance variable '@passed'
#                              Addition operator (+)
#                              Number '1'
#                  Instruction
#                      Return
#              If
#                  Expression ('if' parameter)
#                      Instance variable '@fatal'
#                  Instruction
#                      Call
#                          Property 'panic'
#                              Call
#                                  Bareword 'Error'
#                                  Structural list [1 items]
#                                      Item 0
#                                          Lexical variable '$message'
#                          Structural list [0 items]
#              Instruction
#                  Return pair 'message'
#                      Lexical variable '$message'
#      Include (Bool, Error)
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die "config error";
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'Test.frt.pm'}++;

use Ferret::Core::Operations qw(_not _sub add bool num str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    undef;

    # Class 'Test'
    {
        my @methods;
        my ( $class, $self );
        if ( not $class = $f->get_class( $context, 'Test' ) ) {
            $class = $self = Ferret::Class->new(
                $f,
                name    => 'Test',
                version => undef
            );
            $context->set_property( Test => $class );
        }
        my $proto = $class->prototype;

        # Method event '_init_' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'name',  optional => 1 );
            $func->add_argument( name => 'fatal', optional => 1 );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                do {
                    my $want_val = $arguments->{name};
                    $want_val ||= str( $f, "Test" );
                    $self->set_property( name => $want_val );
                };
                do {
                    my $want_val = $arguments->{fatal};
                    $want_val ||= Ferret::true;
                    $self->set_property( fatal => $want_val );
                };
                $self->set_property( tested => num( $f, 0 ) );
                $self->set_property( passed => num( $f, 0 ) );
                return $return;
            };
            $methods[0] = Ferret::Event->new(
                $f,
                name         => '_init_',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'trueValue' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'a', optional => 1 );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property( a => $arguments->{a} );
                return $self->property_u('_test')->call(
                    [
                        $scope->property_u('Bool')
                          ->call( [ $scope->property_u('a') ], $scope ),
                        str( $f, "Value must be true" )
                    ],
                    $scope
                );
                return $return;
            };
            $methods[1] = Ferret::Event->new(
                $f,
                name         => 'trueValue',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'veryTrue' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'a', optional => 1 );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property( a => $arguments->{a} );
                return $self->property_u('_test')->call(
                    [
                        $scope->property_u('a')
                          ->equal_to_exactly( Ferret::true, $scope ),
                        str( $f, "Value must be exactly true" )
                    ],
                    $scope
                );
                return $return;
            };
            $methods[2] = Ferret::Event->new(
                $f,
                name         => 'veryTrue',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'equal' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'a', optional => 1 );
            $func->add_argument( name => 'b', optional => 1 );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property( a => $arguments->{a} );
                $scope->set_property( b => $arguments->{b} );
                return $self->property_u('_test')->call(
                    [
                        $scope->property_u('a')
                          ->equal_to( $scope->property_u('b'), $scope ),
                        str( $f, "Values must be equal" )
                    ],
                    $scope
                );
                return $return;
            };
            $methods[3] = Ferret::Event->new(
                $f,
                name         => 'equal',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'objectsEqual' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'a', optional => 1 );
            $func->add_argument( name => 'b', optional => 1 );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property( a => $arguments->{a} );
                $scope->set_property( b => $arguments->{b} );
                return $self->property_u('_test')->call(
                    [
                        $scope->property_u('a')
                          ->equal_to_exactly( $scope->property_u('b'), $scope ),
                        str( $f, "Objects must be exactly equal" )
                    ],
                    $scope
                );
                return $return;
            };
            $methods[4] = Ferret::Event->new(
                $f,
                name         => 'objectsEqual',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'notEqual' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'a', optional => 1 );
            $func->add_argument( name => 'b', optional => 1 );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property( a => $arguments->{a} );
                $scope->set_property( b => $arguments->{b} );
                return $self->property_u('_test')->call(
                    [
                        _not(
                            $scope->property_u('a')
                              ->equal_to( $scope->property_u('b'), $scope )
                        ),
                        str( $f, "Values must not be equal" )
                    ],
                    $scope
                );
                return $return;
            };
            $methods[5] = Ferret::Event->new(
                $f,
                name         => 'notEqual',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'objectsNotEqual' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'a', optional => 1 );
            $func->add_argument( name => 'b', optional => 1 );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property( a => $arguments->{a} );
                $scope->set_property( b => $arguments->{b} );
                return $self->property_u('_test')->call(
                    [
                        _not(
                            $scope->property_u('a')->equal_to_exactly(
                                $scope->property_u('b'), $scope
                            )
                        ),
                        str( $f, "Objects must not be equal" )
                    ],
                    $scope
                );
                return $return;
            };
            $methods[6] = Ferret::Event->new(
                $f,
                name         => 'objectsNotEqual',
                default_func => [ undef, $func ]
            );
        }

        # Method event 'review' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );

            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property_ow(
                    $context,
                    failed => _sub(
                        $scope,
                        $self->property_u('tested'),
                        $self->property_u('passed')
                    )
                );
                $scope->property_u('say')->call(
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
                    $scope
                );
                $return->set_property( tests  => $self->property_u('tested') );
                $return->set_property( fails  => $scope->property_u('failed') );
                $return->set_property( passes => $self->property_u('passed') );
                $return->set_property( allOK => $self->property_u('passed')
                      ->equal_to( $self->property_u('tested'), $scope ) );
                return $return;
            };
            $methods[7] = Ferret::Event->new(
                $f,
                name         => 'review',
                default_func => [ undef, $func ]
            );
        }

        # Method event '_test' definition
        {
            my $func = Ferret::Function->new(
                $f,
                name      => 'default',
                is_method => 1
            );
            $func->add_argument( name => 'yes',     optional => 1 );
            $func->add_argument( name => 'message', optional => 1 );
            $func->{code} = sub {
                my ( $self, $arguments, $call_scope, $scope, $return ) = @_;
                $scope->set_property( yes     => $arguments->{yes} );
                $scope->set_property( message => $arguments->{message} );
                $self->set_property( tested =>
                      add( $scope, $self->property_u('tested'), num( $f, 1 ) )
                );
                $return->set_property( pass => $scope->property_u('yes') );
                if ( bool( $scope->property_u('yes') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $self->set_property(
                        passed => add(
                            $scope, $self->property_u('passed'),
                            num( $f, 1 )
                        )
                    );
                    return $return;
                }
                if ( bool( $self->property_u('fatal') ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $scope->property_u('Error')
                      ->call( [ $scope->property_u('message') ], $scope )
                      ->property_u('panic')->call( {}, $scope );
                }
                $return->set_property(
                    message => $scope->property_u('message') );
                return $return;
            };
            $methods[8] = Ferret::Event->new(
                $f,
                name         => '_test',
                default_func => [ undef, $func ]
            );
        }
        $methods[0]->inside_scope( _init_          => $scope, $class, $class );
        $methods[1]->inside_scope( trueValue       => $scope, $proto, $class );
        $methods[2]->inside_scope( veryTrue        => $scope, $proto, $class );
        $methods[3]->inside_scope( equal           => $scope, $proto, $class );
        $methods[4]->inside_scope( objectsEqual    => $scope, $proto, $class );
        $methods[5]->inside_scope( notEqual        => $scope, $proto, $class );
        $methods[6]->inside_scope( objectsNotEqual => $scope, $proto, $class );
        $methods[7]->inside_scope( review          => $scope, $proto, $class );
        $methods[8]->inside_scope( _test           => $scope, $proto, $class );
    }
    Ferret::space( $context, $_ ) for qw(Bool Error);
};

Ferret::runtime();
