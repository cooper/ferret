# === Document Model ===
#  Document './test/hello20/run.frt'
#      Instruction
#          Assignment
#              Lexical variable '$bot'
#              Call
#                  Bareword 'IRC::Bot'
#                  Hash [3 items]
#                      Item 0
#                          Pair 'addr'
#                              String 'k.notroll.net'
#                      Item 1
#                          Pair 'nick'
#                              String 'bottie'
#                      Item 2
#                          Pair 'user'
#                              String 'ferret'
#      Instruction
#          Call
#              Property 'addCommand'
#                  Lexical variable '$bot'
#              Structural list [2 items]
#                  Item 0
#                      String 'info'
#                  Item 1
#                      Function '_anonymous_'
#                          Instruction
#                              Need
#                                  Lexical variable '$msg'
#                          Instruction
#                              Call
#                                  Property 'privmsg'
#                                      Lexical variable '$bot'
#                                  Structural list [2 items]
#                                      Item 0
#                                          Property 'channel'
#                                              Lexical variable '$msg'
#                                      Item 1
#                                          String 'Ferret IRC...'
#      Instruction
#          Call
#              Property 'addCommand'
#                  Lexical variable '$bot'
#              Structural list [2 items]
#                  Item 0
#                      String 't'
#                  Item 1
#                      Function '_anonymous_'
#                          Instruction
#                              Need
#                                  Lexical variable '$msg'
#                          Instruction
#                              Assignment
#                                  Lexical variable '$res'
#                                  Call
#                                      Property 'tokenize'
#                                          Call
#                                              Bareword 'COMPILER'
#                                              Structural list [1 items]
#                                                  Item 0
#                                                      Call
#                                                          Property 'fromWord'
#                                                              Lexical variable '$msg'
#                                                          Structural list [1 items]
#                                                              Item 0
#                                                                  Number '1'
#                                      Structural list [0 items]
#                          If
#                              Expression ('if' parameter)
#                                  Property 'error'
#                                      Lexical variable '$res'
#                              Instruction
#                                  Call
#                                      Property 'privmsg'
#                                          Lexical variable '$bot'
#                                      Structural list [2 items]
#                                          Item 0
#                                              Property 'channel'
#                                                  Lexical variable '$msg'
#                                          Item 1
#                                              Property 'error'
#                                                  Lexical variable '$res'
#                              Instruction
#                                  Return
#                          Instruction
#                              Call
#                                  Property 'privmsg'
#                                      Lexical variable '$bot'
#                                  Structural list [2 items]
#                                      Item 0
#                                          Property 'channel'
#                                              Lexical variable '$msg'
#                                      Item 1
#                                          String 'success'
#      Instruction
#          Call
#              Property 'addCommand'
#                  Lexical variable '$bot'
#              Structural list [2 items]
#                  Item 0
#                      String 'compile'
#                  Item 1
#                      Function '_anonymous_'
#                          Instruction
#                              Need
#                                  Lexical variable '$msg'
#                          Instruction
#                              Assignment
#                                  Lexical variable '$c'
#                                  Call
#                                      Bareword 'COMPILER'
#                                      Structural list [1 items]
#                                          Item 0
#                                              Call
#                                                  Property 'fromWord'
#                                                      Lexical variable '$msg'
#                                                  Structural list [1 items]
#                                                      Item 0
#                                                          Number '1'
#                          Instruction
#                              Assignment
#                                  Lexical variable '$res'
#                                  Call
#                                      Property 'compile'
#                                          Lexical variable '$c'
#                                      Structural list [0 items]
#                          Instruction
#                              Call
#                                  Bareword 'dump'
#                                  Structural list [1 items]
#                                      Item 0
#                                          Lexical variable '$c'
#                          If
#                              Expression ('if' parameter)
#                                  Property 'error'
#                                      Lexical variable '$res'
#                              Instruction
#                                  Call
#                                      Property 'privmsg'
#                                          Lexical variable '$bot'
#                                      Structural list [2 items]
#                                          Item 0
#                                              Property 'channel'
#                                                  Lexical variable '$msg'
#                                          Item 1
#                                              Property 'error'
#                                                  Lexical variable '$res'
#                              Instruction
#                                  Return
#                          Instruction
#                              Call
#                                  Property 'privmsg'
#                                      Lexical variable '$bot'
#                                  Structural list [2 items]
#                                      Item 0
#                                          Property 'channel'
#                                              Lexical variable '$msg'
#                                      Item 1
#                                          Property 'perl'
#                                              Lexical variable '$res'
#      Instruction
#          Call
#              Property 'addCommand'
#                  Lexical variable '$bot'
#              Structural list [2 items]
#                  Item 0
#                      String 'e'
#                  Item 1
#                      Function '_anonymous_'
#                          Instruction
#                              Need
#                                  Lexical variable '$msg'
#                          Instruction
#                              Assignment
#                                  Lexical variable '$res'
#                                  Call
#                                      Property 'eval'
#                                          Call
#                                              Bareword 'COMPILER'
#                                              Structural list [1 items]
#                                                  Item 0
#                                                      Call
#                                                          Property 'fromWord'
#                                                              Lexical variable '$msg'
#                                                          Structural list [1 items]
#                                                              Item 0
#                                                                  Number '1'
#                                      Structural list [0 items]
#                          If
#                              Expression ('if' parameter)
#                                  Property 'error'
#                                      Lexical variable '$res'
#                              Instruction
#                                  Call
#                                      Property 'privmsg'
#                                          Lexical variable '$bot'
#                                      Structural list [2 items]
#                                          Item 0
#                                              Property 'channel'
#                                                  Lexical variable '$msg'
#                                          Item 1
#                                              Property 'error'
#                                                  Lexical variable '$res'
#                              Instruction
#                                  Return
#                          Instruction
#                              Call
#                                  Property 'privmsg'
#                                      Lexical variable '$bot'
#                                  Structural list [2 items]
#                                      Item 0
#                                          Property 'channel'
#                                              Lexical variable '$msg'
#                                      Item 1
#                                          Property 'stringResult'
#                                              Lexical variable '$res'
#      Instruction
#          Call
#              Property 'connect'
#                  Lexical variable '$bot'
#              Structural list [0 items]
#      Include (COMPILER, IRC, IRC::Bot)
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
$Ferret::tried_files{'run.frt.pm'}++;

use Ferret::Core::Operations qw(bool num str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    # Function '+undef' definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, name => '+undef' );
        $func->add_argument( name => 'msg' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{msg};
                $scope->set_property( msg => $arguments->{msg} );
            };
            $scope->property('bot')->property('privmsg')->call(
                [
                    $scope->property('msg')->property('channel'),
                    str( $f, "Ferret IRC bot" )
                ],
                $scope
            );
            return $return;
        };
    }

    # Function '+undef' definition
    {
        my $func = $funcs[1] = Ferret::Function->new( $f, name => '+undef' );
        $func->add_argument( name => 'msg' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{msg};
                $scope->set_property( msg => $arguments->{msg} );
            };
            $scope->set_property_ow(
                res => $scope->property('COMPILER')->call(
                    [
                        $scope->property('msg')->property('fromWord')
                          ->call( [ num( $f, 1 ) ], $scope )
                    ],
                    $scope
                )->property('tokenize')->call( {}, $scope )
            );
            if ( bool( $scope->property('res')->property('error') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property('bot')->property('privmsg')->call(
                    [
                        $scope->property('msg')->property('channel'),
                        $scope->property('res')->property('error')
                    ],
                    $scope
                );
                return $return;
            }
            $scope->property('bot')->property('privmsg')->call(
                [
                    $scope->property('msg')->property('channel'),
                    str( $f, "success" )
                ],
                $scope
            );
            return $return;
        };
    }

    # Function '+undef' definition
    {
        my $func = $funcs[2] = Ferret::Function->new( $f, name => '+undef' );
        $func->add_argument( name => 'msg' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{msg};
                $scope->set_property( msg => $arguments->{msg} );
            };
            $scope->set_property_ow(
                c => $scope->property('COMPILER')->call(
                    [
                        $scope->property('msg')->property('fromWord')
                          ->call( [ num( $f, 1 ) ], $scope )
                    ],
                    $scope
                )
            );
            $scope->set_property_ow( res =>
                  $scope->property('c')->property('compile')->call( {}, $scope )
            );
            $scope->property('dump')->call( [ $scope->property('c') ], $scope );
            if ( bool( $scope->property('res')->property('error') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property('bot')->property('privmsg')->call(
                    [
                        $scope->property('msg')->property('channel'),
                        $scope->property('res')->property('error')
                    ],
                    $scope
                );
                return $return;
            }
            $scope->property('bot')->property('privmsg')->call(
                [
                    $scope->property('msg')->property('channel'),
                    $scope->property('res')->property('perl')
                ],
                $scope
            );
            return $return;
        };
    }

    # Function '+undef' definition
    {
        my $func = $funcs[3] = Ferret::Function->new( $f, name => '+undef' );
        $func->add_argument( name => 'msg' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{msg};
                $scope->set_property( msg => $arguments->{msg} );
            };
            $scope->set_property_ow(
                res => $scope->property('COMPILER')->call(
                    [
                        $scope->property('msg')->property('fromWord')
                          ->call( [ num( $f, 1 ) ], $scope )
                    ],
                    $scope
                )->property('eval')->call( {}, $scope )
            );
            if ( bool( $scope->property('res')->property('error') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property('bot')->property('privmsg')->call(
                    [
                        $scope->property('msg')->property('channel'),
                        $scope->property('res')->property('error')
                    ],
                    $scope
                );
                return $return;
            }
            $scope->property('bot')->property('privmsg')->call(
                [
                    $scope->property('msg')->property('channel'),
                    $scope->property('res')->property('stringResult')
                ],
                $scope
            );
            return $return;
        };
    }
    Ferret::space( $context, $_ ) for qw(COMPILER IRC IRC::Bot);
    $scope->set_property_ow(
        bot => $scope->property('IRC::Bot')->call(
            {
                addr => str( $f, "k.notroll.net" ),
                nick => str( $f, "bottie" ),
                user => str( $f, "ferret" )
            },
            $scope
        )
    );
    $scope->property('bot')->property('addCommand')->call(
        [
            str( $f, "info" ),
            $funcs[0]->inside_scope( +undef => $scope, $scope )
        ],
        $scope
    );
    $scope->property('bot')->property('addCommand')->call(
        [ str( $f, "t" ), $funcs[1]->inside_scope( +undef => $scope, $scope ) ],
        $scope
    );
    $scope->property('bot')->property('addCommand')->call(
        [
            str( $f, "compile" ),
            $funcs[2]->inside_scope( +undef => $scope, $scope )
        ],
        $scope
    );
    $scope->property('bot')->property('addCommand')->call(
        [ str( $f, "e" ), $funcs[3]->inside_scope( +undef => $scope, $scope ) ],
        $scope
    );
    $scope->property('bot')->property('connect')->call( {}, $scope );
};

Ferret::runtime();
