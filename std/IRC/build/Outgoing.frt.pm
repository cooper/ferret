# === Document Model ===
#  Document './std/IRC/Outgoing.frt'
#      Package 'IRC'
#      Class 'Connection'
#          Method 'sendJoin'
#              Body ('method' scope)
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
#                                  Argument list [1 items]
#                                      Item 0
#                                          Operation
#                                              String 'JOIN '
#                                              Addition operator (+)
#                                              Lexical variable '$name'
#          Method 'sendPrivmsg'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$target'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Need
#                          Lexical variable '$message'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Call
#                          Instance variable '@send'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      String 'PRIVMSG '
#                                      Addition operator (+)
#                                      Lexical variable '$target'
#                                      Addition operator (+)
#                                      String ' :'
#                                      Addition operator (+)
#                                      Lexical variable '$message'
#          Method 'sendNick'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$nick'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Call
#                          Instance variable '@send'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      String 'NICK '
#                                      Addition operator (+)
#                                      Lexical variable '$nick'
#      Include (Str)
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

my $pos = FF::before_content( 'Outgoing.frt', './std/IRC/Outgoing.frt' );

use Ferret::Core::Operations qw(add str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'IRC' );
    my $scope = $file_scope;
    FF::load_core('IRC');

    # Class 'Connection'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Connection', undef,
            undef );

        # Method event 'sendJoin' definition
        my $method_0 = FF::method_event_def(
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
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'channelNames', 6.2 ) or return;
                {
                    my $loop_ret = FF::iterate(
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
        my $method_1 = FF::method_event_def(
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
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'target',  13.1 ) or return;
                FF::need( $scope, $args, 'message', 13.3 ) or return;
                $$self->{'send'}->(
                    [
                        add(
                            $scope,              str( $f, "PRIVMSG " ),
                            $$scope->{'target'}, str( $f, " :" ),
                            $$scope->{'message'}
                        )
                    ],
                    $scope, undef,
                    $pos->(14.1)
                );
                return $ret;
            }
        );

        # Method event 'sendNick' definition
        my $method_2 = FF::method_event_def(
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
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'nick', 20.2 ) or return;
                $$self->{'send'}->(
                    [ add( $scope, str( $f, "NICK " ), $$scope->{'nick'} ) ],
                    $scope, undef, $pos->(21.2)
                );
                return $ret;
            }
        );
        $method_0->inside_scope(
            sendJoin => $scope,
            $proto, $class, undef, undef
        );
        $method_1->inside_scope(
            sendPrivmsg => $scope,
            $proto, $class, undef, undef
        );
        $method_2->inside_scope(
            sendNick => $scope,
            $proto, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Str) );
};

FF::after_content();
