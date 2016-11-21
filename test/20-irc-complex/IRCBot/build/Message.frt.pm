# === Document Model ===
#  Document './test/20-irc-complex/IRCBot/Message.frt'
#      Package 'IRCBot'
#      Class 'Message'
#          Class method 'initializer__'
#              Body ('function' scope)
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
#                              Mixed argument list [2 items]
#                                  Item 0
#                                      String ' '
#                                  Item 1
#                                      Pair 'limit'
#                                          Number '4'
#                  Instruction
#                      Assignment
#                          Instance variable '@channel'
#                          Index
#                              Lexical variable '$lineSplit'
#                              Index list [1 item]
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
#                                          Index list [1 item]
#                                              Item 0
#                                                  Number '0'
#                                  Mixed argument list [2 items]
#                                      Item 0
#                                          String '!'
#                                      Item 1
#                                          Pair 'limit'
#                                              Number '2'
#                              Index list [1 item]
#                                  Item 0
#                                      Number '0'
#                  Instruction
#                      Assignment
#                          Instance variable '@nickname'
#                          Call
#                              Property 'trimPrefix'
#                                  Instance variable '@nickname'
#                              Argument list [1 item]
#                                  Item 0
#                                      String ':'
#                  Instruction
#                      Assignment
#                          Instance variable '@message'
#                          Index
#                              Lexical variable '$lineSplit'
#                              Index list [1 item]
#                                  Item 0
#                                      Number '3'
#                  Instruction
#                      Assignment
#                          Instance variable '@message'
#                          Call
#                              Property 'trimPrefix'
#                                  Instance variable '@message'
#                              Argument list [1 item]
#                                  Item 0
#                                      String ':'
#                  Instruction
#                      Assignment
#                          Instance variable '@parts'
#                          Call
#                              Property 'split'
#                                  Instance variable '@message'
#                              Argument list [1 item]
#                                  Item 0
#                                      String ' '
#          Computed property 'command' (lazy)
#              Body ('function' scope)
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
#                                          Index list [1 item]
#                                              Item 0
#                                                  Number '0'
#                                  Argument list [1 item]
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
#                                              Index list [1 item]
#                                                  Item 0
#                                                      Number '0'
#                                      Argument list [1 item]
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
#              Body ('function' scope)
#                  Instruction
#                      Return
#                          Operation
#                              Property 'length'
#                                  Instance variable '@parts'
#                              Greater than operator (>)
#                              Number '1'
#          Method 'fromWord'
#              Body ('function' scope)
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
#                                  Mixed argument list [2 items]
#                                      Item 0
#                                          String ' '
#                                      Item 1
#                                          Pair 'limit'
#                                              Operation
#                                                  Lexical variable '$wordN'
#                                                  Addition operator (+)
#                                                  Number '1'
#                              Index list [1 item]
#                                  Item 0
#                                      Lexical variable '$wordN'
#      Include (Num, Str)
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

my $pos =
  before_content( 'Message.frt', './test/20-irc-complex/IRCBot/Message.frt' );

use Ferret::Core::Operations qw(add all_true bool gr8r nequal num str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'IRCBot' );
    my $scope = $file_scope;
    load_core('IRCBot');

    # Class 'Message'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Message', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
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
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $self, $args, 'line' ) or return;
                var(
                    $scope,
                    lineSplit =>
                      $$self->{'line'}->property_u( 'split', $pos->(6.2) )->(
                        [ str( $f, " " ), [ limit => num( $f, "4" ) ] ],
                        $scope, undef, $pos->(6.25)
                      ),
                    $file_scope,
                    $pos->(6.1)
                );
                $self->set_property(
                    channel => $$scope->{'lineSplit'}->get_index_value(
                        [ num( $f, "2" ) ],
                        $scope, $pos->(7.4)
                    ),
                    $pos->(7.2)
                );
                $self->set_property(
                    nickname => $$scope->{'lineSplit'}
                      ->get_index_value( [ num( $f, "0" ) ],
                        $scope, $pos->(10.2) )
                      ->property_u( 'split', $pos->(10.35) )->(
                        [ str( $f, "!" ), [ limit => num( $f, "2" ) ] ],
                        $scope, undef, $pos->(10.4)
                      )->get_index_value(
                        [ num( $f, "0" ) ],
                        $scope, $pos->(10.7)
                      ),
                    $pos->(10.1)
                );
                $self->set_property(
                    nickname => $$self->{'nickname'}
                      ->property_u( 'trimPrefix', $pos->(11.4) )
                      ->( [ str( $f, ":" ) ], $scope, undef, $pos->(11.5) ),
                    $pos->(11.2)
                );
                $self->set_property(
                    message => $$scope->{'lineSplit'}->get_index_value(
                        [ num( $f, "3" ) ],
                        $scope, $pos->(14.4)
                    ),
                    $pos->(14.2)
                );
                $self->set_property(
                    message => $$self->{'message'}
                      ->property_u( 'trimPrefix', $pos->(15.4) )
                      ->( [ str( $f, ":" ) ], $scope, undef, $pos->(15.5) ),
                    $pos->(15.2)
                );
                $self->set_property(
                    parts =>
                      $$self->{'message'}->property_u( 'split', $pos->(18.4) )
                      ->( [ str( $f, " " ) ], $scope, undef, $pos->(18.5) ),
                    $pos->(18.2)
                );
                return $ret;
            }
        );

        # Method event 'command' definition
        my $func_1 = method_event_def(
            $f, $scope,
            'command',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                if (
                    bool(
                        all_true(
                            $scope,
                            sub {
                                nequal(
                                    $scope,
                                    $$self->{'parts'}
                                      ->property_u( 'length', $pos->(26.15) ),
                                    num( $f, "0" )
                                );
                            },
                            sub {
                                $$self->{'parts'}
                                  ->get_index_value( [ num( $f, "0" ) ],
                                    $scope, $pos->(26.4) )
                                  ->property_u( 'hasPrefix', $pos->(26.55) )->(
                                    [ str( $f, "." ) ],
                                    $scope, undef, $pos->(26.6)
                                  );
                            }
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    var(
                        $scope,
                        cmd => $$self->{'parts'}
                          ->get_index_value( [ num( $f, "0" ) ],
                            $scope, $pos->(27.2) )
                          ->property_u( 'trimPrefix', $pos->(27.35) )
                          ->( [ str( $f, "." ) ], $scope, undef, $pos->(27.4) ),
                        $file_scope,
                        $pos->(27.1)
                    );
                    if (
                        bool(
                            $$scope->{'cmd'}
                              ->property_u( 'length', $pos->(28.3) )
                        )
                      )
                    {
                        my $scope = Ferret::Scope->new( $f, parent => $scope );

                        return $ret_func->( $$scope->{'cmd'} );
                    }
                }
                return $ret_func->($false);
                return $ret;
            }
        );

        # Method event 'commandHasParameters' definition
        my $func_2 = method_event_def(
            $f, $scope,
            'commandHasParameters',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    gr8r(
                        $scope,
                        $$self->{'parts'}->property_u( 'length', $pos->(36.3) ),
                        num( $f, "1" )
                    )
                );
                return $ret;
            }
        );

        # Method event 'fromWord' definition
        my $func_3 = method_event_def(
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
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'wordN', 41.2 ) || return;
                return $ret_func->(
                    $$self->{'message'}->property_u( 'split', $pos->(42.15) )
                      ->(
                        [
                            str( $f, " " ),
                            [
                                limit => add(
                                    $scope, $$scope->{'wordN'},
                                    num( $f, "1" )
                                )
                            ]
                        ],
                        $scope, undef,
                        $pos->(42.2)
                      )->get_index_value(
                        [ $$scope->{'wordN'} ],
                        $scope, $pos->(42.6)
                      )
                );
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope( command => $scope, $proto, $class, $ins, 1, 1 );
        $func_2->inside_scope(
            commandHasParameters => $scope,
            $proto, $class, $ins, 1, 1
        );
        $func_3->inside_scope(
            fromWord => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Num Str) );
};

after_content();
