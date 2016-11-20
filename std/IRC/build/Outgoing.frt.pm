# === Document Model ===
#  Document './std/IRC/Outgoing.frt'
#      Package 'IRC'
#      Class 'Connection'
#          Method 'sendJoin'
#              Body ('function' scope)
#                  Instruction
#                      Need (...)
#                          Lexical variable '$channelNames'
#                          Argument type
#                              Bareword 'Str'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$name'
#                      Expression ('in' parameter)
#                          Lexical variable '$channelNames'
#                      Body ('for' scope)
#                          Instruction
#                              Call
#                                  Instance variable '@send'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Operation
#                                              String 'JOIN '
#                                              Addition operator (+)
#                                              Lexical variable '$name'
#          Method 'sendPrivmsg'
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$target'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Need
#                          Lexical variable '$message'
#                          Argument type
#                              Bareword 'Str::Any'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$line'
#                      Expression ('in' parameter)
#                          Call
#                              Property 'split'
#                                  Lexical variable '$message'
#                              Argument list [1 item]
#                                  Item 0
#                                      String '␤'
#                      Body ('for' scope)
#                          If
#                              Expression ('if' parameter)
#                                  Property 'empty'
#                                      Lexical variable '$line'
#                              Body ('if' scope)
#                                  Instruction
#                                      Next
#                          Instruction
#                              Call
#                                  Instance variable '@send'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Operation
#                                              String 'PRIVMSG '
#                                              Addition operator (+)
#                                              Lexical variable '$target'
#                                              Addition operator (+)
#                                              String ' :'
#                                              Addition operator (+)
#                                              Lexical variable '$line'
#          Method 'sendNick'
#              Body ('function' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$nick'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Call
#                          Instance variable '@send'
#                          Argument list [1 item]
#                              Item 0
#                                  Operation
#                                      String 'NICK '
#                                      Addition operator (+)
#                                      Lexical variable '$nick'
#      Include (Str, Str::Any)
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

my $pos = before_content( 'Outgoing.frt', './std/IRC/Outgoing.frt' );

use Ferret::Core::Operations qw(add bool str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'IRC' );
    my $scope = $file_scope;
    load_core('IRC');

    # Class 'Connection'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Connection', undef, undef );

        # Method event 'sendJoin' definition
        my $method_0 = method_event_def(
            $f, $scope,
            'sendJoin',
            [
                {
                    name     => 'channelNames',
                    type     => 'Str',
                    optional => undef,
                    more     => 1
                }
            ],
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'channelNames', 6.2 ) or return;
                {
                    my $loop_ret = iterate(
                        $f, $scope,
                        $$scope->{'channelNames'},
                        'name',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            $$self->{'send'}->(
                                [
                                    add(
                                        $scope, str( $f, "JOIN " ),
                                        $$scope->{'name'}
                                    )
                                ],
                                $scope, undef,
                                $pos->(8.2)
                            );
                        },
                        $pos->(7.1)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret;
            }
        );

        # Method event 'sendPrivmsg' definition
        my $method_1 = method_event_def(
            $f, $scope,
            'sendPrivmsg',
            [
                {
                    name     => 'target',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'message',
                    type     => 'Str::Any',
                    optional => undef,
                    more     => undef
                }
            ],
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'target',  13.1 ) or return;
                need( $scope, $args, 'message', 13.3 ) or return;
                {
                    my $loop_ret = iterate(
                        $f, $scope,
                        $$scope->{'message'}
                          ->property_u( 'split', $pos->(14.25) )->(
                            [ str( $f, "\n" ) ], $scope, undef, $pos->(14.3)
                          ),
                        'line',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            if (
                                bool(
                                    $$scope->{'line'}
                                      ->property_u( 'empty', $pos->(15.3) )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                return 'next';
                            }
                            $$self->{'send'}->(
                                [
                                    add(
                                        $scope,
                                        str( $f, "PRIVMSG " ),
                                        $$scope->{'target'},
                                        str( $f, " :" ),
                                        $$scope->{'line'}
                                    )
                                ],
                                $scope, undef,
                                $pos->(16.1)
                            );
                        },
                        $pos->(14.05)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret;
            }
        );

        # Method event 'sendNick' definition
        my $method_2 = method_event_def(
            $f, $scope,
            'sendNick',
            [
                {
                    name     => 'nick',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'nick', 23.2 ) or return;
                $$self->{'send'}->(
                    [ add( $scope, str( $f, "NICK " ), $$scope->{'nick'} ) ],
                    $scope, undef, $pos->(24.2)
                );
                return $ret;
            }
        );
        $method_0->inside_scope(
            sendJoin => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_1->inside_scope(
            sendPrivmsg => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_2->inside_scope(
            sendNick => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Str Str::Any) );
};

after_content();
