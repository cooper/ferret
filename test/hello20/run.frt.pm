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
#              Property 'connect'
#                  Lexical variable '$bot'
#              Structural list [0 items]
#      Include (IRC, IRC::Bot)
use warnings;
use strict;
use utf8;
use 5.010;

BEGIN {
    my $libs = do '/etc/ferret.conf';
    ref $libs eq 'ARRAY' or die "config error";
    unshift @INC, @$libs;
}

use Ferret;

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'run.frt.pm'}++;

use Ferret::Core::Operations qw(str);
{
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
    Ferret::space( $context, $_ ) for qw(IRC IRC::Bot);
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
    $scope->property('bot')->property('connect')->call( {}, $scope );
}

Ferret::runtime();
