# === Document Model ===
#  Document './test/hello20/run.frt'
#      Instruction
#          Assignment (lexical variable '$bot')
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
#          Assignment (property 'autojoin')
#              Value list [1 items]
#                  Item 0
#                      String '#k'
#      Instruction
#          Call
#              Property 'addCommand'
#                  Lexical variable '$bot'
#              Set [2 items]
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
#                                  Set [2 items]
#                                      Item 0
#                                          Property 'channel'
#                                              Lexical variable '$msg'
#                                      Item 1
#                                          String 'Ferret IRC...'
#      Instruction
#          Call
#              Property 'addCommand'
#                  Lexical variable '$bot'
#              Set [2 items]
#                  Item 0
#                      String 't'
#                  Item 1
#                      Function '_anonymous_'
#                          Instruction
#                              Need
#                                  Lexical variable '$msg'
#                          Instruction
#                              Assignment (lexical variable '$c')
#                                  Call
#                                      Bareword 'COMPILER'
#                                      Single value [1 items]
#                                          Item 0
#                                              Call
#                                                  Property 'fromWord'
#                                                      Lexical variable '$msg'
#                                                  Single value [1 items]
#                                                      Item 0
#                                                          Number '1'
#                          Instruction
#                              Assignment (lexical variable '$res')
#                                  Call
#                                      Property 'tokenize'
#                                          Lexical variable '$c'
#                                      Hash [1 items]
#                                          Item 0
#                                              Pair 'pretty'
#                                                  Boolean true
#                          If
#                              Expression ('if' parameter)
#                                  Property 'error'
#                                      Lexical variable '$res'
#                              Instruction
#                                  Call
#                                      Property 'privmsg'
#                                          Lexical variable '$bot'
#                                      Set [2 items]
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
#                                  Set [2 items]
#                                      Item 0
#                                          Property 'channel'
#                                              Lexical variable '$msg'
#                                      Item 1
#                                          Property 'pretty'
#                                              Lexical variable '$res'
#      Instruction
#          Call
#              Property 'addCommand'
#                  Lexical variable '$bot'
#              Set [2 items]
#                  Item 0
#                      String 'c'
#                  Item 1
#                      Function '_anonymous_'
#                          Instruction
#                              Need
#                                  Lexical variable '$msg'
#                          Instruction
#                              Assignment (lexical variable '$c')
#                                  Call
#                                      Bareword 'COMPILER'
#                                      Single value [1 items]
#                                          Item 0
#                                              Call
#                                                  Property 'fromWord'
#                                                      Lexical variable '$msg'
#                                                  Single value [1 items]
#                                                      Item 0
#                                                          Number '1'
#                          Instruction
#                              Assignment (lexical variable '$res')
#                                  Call
#                                      Property 'construct'
#                                          Lexical variable '$c'
#                                      Hash [1 items]
#                                          Item 0
#                                              Pair 'pretty'
#                                                  Boolean true
#                          If
#                              Expression ('if' parameter)
#                                  Property 'error'
#                                      Lexical variable '$res'
#                              Instruction
#                                  Call
#                                      Property 'privmsg'
#                                          Lexical variable '$bot'
#                                      Set [2 items]
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
#                                  Set [2 items]
#                                      Item 0
#                                          Property 'channel'
#                                              Lexical variable '$msg'
#                                      Item 1
#                                          Property 'pretty'
#                                              Lexical variable '$res'
#      Instruction
#          Call
#              Property 'addCommand'
#                  Lexical variable '$bot'
#              Set [2 items]
#                  Item 0
#                      String 'p'
#                  Item 1
#                      Function '_anonymous_'
#                          Instruction
#                              Need
#                                  Lexical variable '$msg'
#                          Instruction
#                              Assignment (lexical variable '$c')
#                                  Call
#                                      Bareword 'COMPILER'
#                                      Single value [1 items]
#                                          Item 0
#                                              Call
#                                                  Property 'fromWord'
#                                                      Lexical variable '$msg'
#                                                  Single value [1 items]
#                                                      Item 0
#                                                          Number '1'
#                          Instruction
#                              Assignment (lexical variable '$res')
#                                  Call
#                                      Property 'compile'
#                                          Lexical variable '$c'
#                                      Structural list [0 items]
#                          If
#                              Expression ('if' parameter)
#                                  Property 'error'
#                                      Lexical variable '$res'
#                              Instruction
#                                  Call
#                                      Property 'privmsg'
#                                          Lexical variable '$bot'
#                                      Set [2 items]
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
#                                  Set [2 items]
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
#              Set [2 items]
#                  Item 0
#                      String 'e'
#                  Item 1
#                      Function '_anonymous_'
#                          Instruction
#                              Need
#                                  Lexical variable '$msg'
#                          Instruction
#                              Assignment (lexical variable '$res')
#                                  Call
#                                      Property 'eval'
#                                          Call
#                                              Bareword 'COMPILER'
#                                              Single value [1 items]
#                                                  Item 0
#                                                      Call
#                                                          Property 'fromWord'
#                                                              Lexical variable '$msg'
#                                                          Single value [1 items]
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
#                                      Set [2 items]
#                                          Item 0
#                                              Property 'channel'
#                                                  Lexical variable '$msg'
#                                          Item 1
#                                              Property 'error'
#                                                  Lexical variable '$res'
#                              Instruction
#                                  Return
#                          Instruction
#                              Assignment (lexical variable '$string')
#                                  Property 'string'
#                                      Call
#                                          Bareword 'inspect'
#                                          Hash [2 items]
#                                              Item 0
#                                                  Pair 'value'
#                                                      Property 'result'
#                                                          Lexical variable '$res'
#                                              Item 1
#                                                  Pair 'quiet'
#                                                      Boolean true
#                          Instruction
#                              Call
#                                  Property 'privmsg'
#                                      Lexical variable '$bot'
#                                  Set [2 items]
#                                      Item 0
#                                          Property 'channel'
#                                              Lexical variable '$msg'
#                                      Item 1
#                                          Lexical variable '$string'
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
    undef;

    # Anonymous function definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, anonymous => 1 );
        $func->add_argument( name => 'msg', type => '' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{msg};
                $scope->set_property( msg => $arguments->{msg} );
            };
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    str( $f, "Ferret IRC bot" )
                ],
                $scope
            );
            return $return;
        };
    }

    # Anonymous function definition
    {
        my $func = $funcs[1] = Ferret::Function->new( $f, anonymous => 1 );
        $func->add_argument( name => 'msg', type => '' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{msg};
                $scope->set_property( msg => $arguments->{msg} );
            };
            $scope->set_property_ow(
                $context,
                c => $scope->property_u('COMPILER')->call_u(
                    [
                        $scope->property_u('msg')->property_u('fromWord')
                          ->call_u( [ num( $f, 1 ) ], $scope )
                    ],
                    $scope
                )
            );
            $scope->set_property_ow( $context,
                res => $scope->property_u('c')->property_u('tokenize')
                  ->call_u( { pretty => Ferret::true }, $scope ) );
            if ( bool( $scope->property_u('res')->property_u('error') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('bot')->property_u('privmsg')->call_u(
                    [
                        $scope->property_u('msg')->property_u('channel'),
                        $scope->property_u('res')->property_u('error')
                    ],
                    $scope
                );
                return $return;
            }
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('res')->property_u('pretty')
                ],
                $scope
            );
            return $return;
        };
    }

    # Anonymous function definition
    {
        my $func = $funcs[2] = Ferret::Function->new( $f, anonymous => 1 );
        $func->add_argument( name => 'msg', type => '' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{msg};
                $scope->set_property( msg => $arguments->{msg} );
            };
            $scope->set_property_ow(
                $context,
                c => $scope->property_u('COMPILER')->call_u(
                    [
                        $scope->property_u('msg')->property_u('fromWord')
                          ->call_u( [ num( $f, 1 ) ], $scope )
                    ],
                    $scope
                )
            );
            $scope->set_property_ow( $context,
                res => $scope->property_u('c')->property_u('construct')
                  ->call_u( { pretty => Ferret::true }, $scope ) );
            if ( bool( $scope->property_u('res')->property_u('error') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('bot')->property_u('privmsg')->call_u(
                    [
                        $scope->property_u('msg')->property_u('channel'),
                        $scope->property_u('res')->property_u('error')
                    ],
                    $scope
                );
                return $return;
            }
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('res')->property_u('pretty')
                ],
                $scope
            );
            return $return;
        };
    }

    # Anonymous function definition
    {
        my $func = $funcs[3] = Ferret::Function->new( $f, anonymous => 1 );
        $func->add_argument( name => 'msg', type => '' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{msg};
                $scope->set_property( msg => $arguments->{msg} );
            };
            $scope->set_property_ow(
                $context,
                c => $scope->property_u('COMPILER')->call_u(
                    [
                        $scope->property_u('msg')->property_u('fromWord')
                          ->call_u( [ num( $f, 1 ) ], $scope )
                    ],
                    $scope
                )
            );
            $scope->set_property_ow( $context,
                res => $scope->property_u('c')->property_u('compile')
                  ->call_u( {}, $scope ) );
            if ( bool( $scope->property_u('res')->property_u('error') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('bot')->property_u('privmsg')->call_u(
                    [
                        $scope->property_u('msg')->property_u('channel'),
                        $scope->property_u('res')->property_u('error')
                    ],
                    $scope
                );
                return $return;
            }
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('res')->property_u('perl')
                ],
                $scope
            );
            return $return;
        };
    }

    # Anonymous function definition
    {
        my $func = $funcs[4] = Ferret::Function->new( $f, anonymous => 1 );
        $func->add_argument( name => 'msg', type => '' );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{msg};
                $scope->set_property( msg => $arguments->{msg} );
            };
            $scope->set_property_ow(
                $context,
                res => $scope->property_u('COMPILER')->call_u(
                    [
                        $scope->property_u('msg')->property_u('fromWord')
                          ->call_u( [ num( $f, 1 ) ], $scope )
                    ],
                    $scope
                )->property_u('eval')->call_u( {}, $scope )
            );
            if ( bool( $scope->property_u('res')->property_u('error') ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                $scope->property_u('bot')->property_u('privmsg')->call_u(
                    [
                        $scope->property_u('msg')->property_u('channel'),
                        $scope->property_u('res')->property_u('error')
                    ],
                    $scope
                );
                return $return;
            }
            $scope->set_property_ow(
                $context,
                string => $scope->property_u('inspect')->call_u(
                    {
                        value =>
                          $scope->property_u('res')->property_u('result'),
                        quiet => Ferret::true
                    },
                    $scope
                )->property_u('string')
            );
            $scope->property_u('bot')->property_u('privmsg')->call_u(
                [
                    $scope->property_u('msg')->property_u('channel'),
                    $scope->property_u('string')
                ],
                $scope
            );
            return $return;
        };
    }
    Ferret::space( $context, $_ ) for qw(COMPILER IRC IRC::Bot);
    $scope->set_property_ow(
        $context,
        bot => $scope->property_u('IRC::Bot')->call_u(
            {
                addr => str( $f, "k.notroll.net" ),
                nick => str( $f, "bottie" ),
                user => str( $f, "ferret" )
            },
            $scope
        )
    );
    $scope->property_u('bot')
      ->set_property(
        autojoin => Ferret::List->new( $f, items => [ str( $f, "#k" ) ] ) );
    $scope->property_u('bot')->property_u('addCommand')->call_u(
        [
            str( $f, "info" ),
            $funcs[0]->inside_scope( (undef) => $scope, $scope )
        ],
        $scope
    );
    $scope->property_u('bot')->property_u('addCommand')->call_u(
        [
            str( $f, "t" ), $funcs[1]->inside_scope( (undef) => $scope, $scope )
        ],
        $scope
    );
    $scope->property_u('bot')->property_u('addCommand')->call_u(
        [
            str( $f, "c" ), $funcs[2]->inside_scope( (undef) => $scope, $scope )
        ],
        $scope
    );
    $scope->property_u('bot')->property_u('addCommand')->call_u(
        [
            str( $f, "p" ), $funcs[3]->inside_scope( (undef) => $scope, $scope )
        ],
        $scope
    );
    $scope->property_u('bot')->property_u('addCommand')->call_u(
        [
            str( $f, "e" ), $funcs[4]->inside_scope( (undef) => $scope, $scope )
        ],
        $scope
    );
    $scope->property_u('bot')->property_u('connect')->call_u( {}, $scope );
};

Ferret::runtime();
