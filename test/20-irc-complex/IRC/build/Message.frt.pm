# === Document Model ===
#  Document './test/20-irc-complex/IRC/Message.frt'
#      Package 'IRC'
#      Class 'Message'
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Instance variable '@line'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Assignment
#                          Lexical variable '$lineSplit'
#                          Call
#                              Property 'split'
#                                  Instance variable '@line'
#                              Named argument list [2 items]
#                                  Item 0
#                                      Pair 'separator'
#                                          String ' '
#                                  Item 1
#                                      Pair 'limit'
#                                          Number '4'
#                  Instruction
#                      Assignment
#                          Instance variable '@channel'
#                          Index
#                              Lexical variable '$lineSplit'
#                              Index list [1 items]
#                                  Item 0
#                                      Number '2'
#                  Instruction
#                      Assignment
#                          Instance variable '@nickname'
#                          Index
#                              Call
#                                  Property 'split'
#                                      Index
#                                          Lexical variable '$lineSplit'
#                                          Index list [1 items]
#                                              Item 0
#                                                  Number '0'
#                                  Named argument list [2 items]
#                                      Item 0
#                                          Pair 'separator'
#                                              String '!'
#                                      Item 1
#                                          Pair 'limit'
#                                              Number '2'
#                              Index list [1 items]
#                                  Item 0
#                                      Number '0'
#                  Instruction
#                      Assignment
#                          Instance variable '@nickname'
#                          Call
#                              Property 'trimPrefix'
#                                  Instance variable '@nickname'
#                              Argument list [1 items]
#                                  Item 0
#                                      String ':'
#                  Instruction
#                      Assignment
#                          Instance variable '@message'
#                          Index
#                              Lexical variable '$lineSplit'
#                              Index list [1 items]
#                                  Item 0
#                                      Number '3'
#                  Instruction
#                      Assignment
#                          Instance variable '@message'
#                          Call
#                              Property 'trimPrefix'
#                                  Instance variable '@message'
#                              Argument list [1 items]
#                                  Item 0
#                                      String ':'
#                  Instruction
#                      Assignment
#                          Instance variable '@parts'
#                          Call
#                              Property 'split'
#                                  Instance variable '@message'
#                              Argument list [1 items]
#                                  Item 0
#                                      String ' '
#          Computed property 'command' (lazy)
#              Body ('method' scope)
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Property 'length'
#                                  Instance variable '@parts'
#                              Negated equality operator (!=)
#                              Number '0'
#                              Logical and operator (&&)
#                              Call
#                                  Property 'hasPrefix'
#                                      Index
#                                          Instance variable '@parts'
#                                          Index list [1 items]
#                                              Item 0
#                                                  Number '0'
#                                  Argument list [1 items]
#                                      Item 0
#                                          String '.'
#                      Body ('if' scope)
#                          Instruction
#                              Assignment
#                                  Lexical variable '$cmd'
#                                  Call
#                                      Property 'trimPrefix'
#                                          Index
#                                              Instance variable '@parts'
#                                              Index list [1 items]
#                                                  Item 0
#                                                      Number '0'
#                                      Argument list [1 items]
#                                          Item 0
#                                              String '.'
#                          If
#                              Expression ('if' parameter)
#                                  Property 'length'
#                                      Lexical variable '$cmd'
#                              Body ('if' scope)
#                                  Instruction
#                                      Return
#                                          Lexical variable '$cmd'
#                  Instruction
#                      Return
#                          Boolean false
#          Computed property 'commandHasParameters' (lazy)
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Operation
#                              Property 'length'
#                                  Instance variable '@parts'
#                              Greater than operator (>)
#                              Number '1'
#          Method 'fromWord'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$wordN'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Return
#                          Index
#                              Call
#                                  Property 'split'
#                                      Instance variable '@message'
#                                  Named argument list [2 items]
#                                      Item 0
#                                          Pair 'separator'
#                                              String ' '
#                                      Item 1
#                                          Pair 'limit'
#                                              Operation
#                                                  Lexical variable '$wordN'
#                                                  Addition operator (+)
#                                                  Number '1'
#                              Index list [1 items]
#                                  Item 0
#                                      Lexical variable '$wordN'
#      Include (Num, Str)
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

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined, $ret_func ) = FF::get_constant_objects($f);

FF::before_content('Message.frt');

use Ferret::Core::Operations qw(add all_true bool gr8r nequal num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'IRC' );
    my $scope = $file_scope;
    FF::load_core('IRC');

    # Class 'Message'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Message', undef, undef );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'line',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $self, $args, 'line' ) or return;
                FF::lex_assign(
                    $scope,
                    lineSplit => ${ $$self->{'line'} }->{'split'}->(
                        {
                            separator => str( $f, " " ),
                            limit     => num( $f, "4" )
                        },
                        $scope, undef, 6.25
                    ),
                    $file_scope,
                    6.1
                );
                $self->set_property(
                    channel => $$scope->{'lineSplit'}
                      ->get_index_value( [ num( $f, "2" ) ], $scope, 7.4 ),
                    7.2
                );
                $self->set_property(
                    nickname => ${
                        $$scope->{'lineSplit'}
                          ->get_index_value( [ num( $f, "0" ) ], $scope, 10.2 )
                      }->{'split'}->(
                        {
                            separator => str( $f, "!" ),
                            limit     => num( $f, "2" )
                        },
                        $scope, undef, 10.4
                      )->get_index_value( [ num( $f, "0" ) ], $scope, 10.75 ),
                    10.1
                );
                $self->set_property(
                    nickname => ${ $$self->{'nickname'} }->{'trimPrefix'}
                      ->( [ str( $f, ":" ) ], $scope, undef, 11.5 ),
                    11.2
                );
                $self->set_property(
                    message => $$scope->{'lineSplit'}
                      ->get_index_value( [ num( $f, "3" ) ], $scope, 14.4 ),
                    14.2
                );
                $self->set_property(
                    message => ${ $$self->{'message'} }->{'trimPrefix'}
                      ->( [ str( $f, ":" ) ], $scope, undef, 15.5 ),
                    15.2
                );
                $self->set_property(
                    parts => ${ $$self->{'message'} }->{'split'}
                      ->( [ str( $f, " " ) ], $scope, undef, 18.5 ),
                    18.2
                );
                return $ret;
            }
        );

        # Method event 'command' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'command',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                if (
                    bool(
                        all_true(
                            $scope,
                            sub {
                                nequal(
                                    $scope,
                                    ${ $$self->{'parts'} }->{'length'},
                                    num( $f, "0" )
                                );
                            },
                            sub {
                                ${
                                    $$self->{'parts'}
                                      ->get_index_value( [ num( $f, "0" ) ],
                                        $scope, 26.4 )
                                  }->{'hasPrefix'}
                                  ->( [ str( $f, "." ) ], $scope, undef, 26.6 );
                            }
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    FF::lex_assign(
                        $scope,
                        cmd => ${
                            $$self->{'parts'}
                              ->get_index_value( [ num( $f, "0" ) ],
                                $scope, 27.2 )
                          }->{'trimPrefix'}
                          ->( [ str( $f, "." ) ], $scope, undef, 27.4 ),
                        $file_scope,
                        27.1
                    );
                    if ( bool( ${ $$scope->{'cmd'} }->{'length'} ) ) {
                        my $scope = Ferret::Scope->new( $f, parent => $scope );

                        return $ret_func->( $$scope->{'cmd'} );
                    }
                }
                return $ret_func->($false);
                return $ret;
            }
        );

        # Method event 'commandHasParameters' definition
        my $method_2 = FF::method_event_def(
            $f, $scope,
            'commandHasParameters',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                return $ret_func->(
                    gr8r(
                        $scope,
                        ${ $$self->{'parts'} }->{'length'},
                        num( $f, "1" )
                    )
                );
                return $ret;
            }
        );

        # Method event 'fromWord' definition
        my $method_3 = FF::method_event_def(
            $f, $scope,
            'fromWord',
            [
                {
                    name     => 'wordN',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'wordN', 41.2 ) or return;
                return $ret_func->(
                    ${ $$self->{'message'} }->{'split'}->(
                        {
                            separator => str( $f, " " ),
                            limit =>
                              add( $scope, $$scope->{'wordN'}, num( $f, "1" ) )
                        },
                        $scope, undef, 42.2
                      )->get_index_value(
                        [ $$scope->{'wordN'} ], $scope, 42.65
                      )
                );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope( command => $scope, $proto, $class, 1, 1 );
        $method_2->inside_scope(
            commandHasParameters => $scope,
            $proto, $class, 1, 1
        );
        $method_3->inside_scope(
            fromWord => $scope,
            $proto, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Num Str) );
};

FF::after_content();
