# --- DOM ---
#  Document './test/hello18.frt'
#      Instruction
#          Assignment
#              Lexical variable '$list'
#              Value list [1 items]
#                  Item 0
#                      String 'hi'
#      Instruction
#          Call
#              Property 'push'
#                  Lexical variable '$list'
#              Structural list [1 items]
#                  Item 0
#                      String 'there'
#      Instruction
#          Call
#              Bareword 'say'
#              Structural list [1 items]
#                  Item 0
#                      Mathematical operation
#                          String 'Length: '
#                          Addition operator (+)
#                          Call
#                              Property 'length'
#                                  Lexical variable '$list'
#      On
#          Expression ('for' parameter)
#              Lexical variable '$item'
#          Expression ('in' parameter)
#              Lexical variable '$list'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Structural list [1 items]
#                      Item 0
#                          Mathematical operation
#                              String 'item: '
#                              Addition operator (+)
#                              Lexical variable '$item'
#      Instruction
#          Assignment
#              Lexical variable '$hash'
#              Hash [1 items]
#                  Item 0
#                      Pair 'hi'
#                          String 'there'
#      Instruction
#          Call
#              Property 'setPair'
#                  Lexical variable '$hash'
#              Structural list [2 items]
#                  Item 0
#                      String 'whats'
#                  Item 1
#                      String 'up'
#      On
#          Expression ('for' parameter)
#              Structural list [2 items]
#                  Item 0
#                      Lexical variable '$key'
#                  Item 1
#                      Lexical variable '$val'
#          Expression ('in' parameter)
#              Lexical variable '$hash'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Structural list [1 items]
#                      Item 0
#                          Mathematical operation
#                              String 'pair: key='
#                              Addition operator (+)
#                              Lexical variable '$key'
#                              Addition operator (+)
#                              String '; value='
#                              Addition operator (+)
#                              Lexical variable '$val'
#      Include
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
$Ferret::tried_files{'hello18.frt.pm'}++;

use Ferret::Core::Operations qw(add str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    $scope->set_property(
        list => Ferret::List->new( $f, items => [ str( $f, "hi" ) ] ) );
    $scope->property('list')->property('push')
      ->call( [ str( $f, "there" ) ], $scope );
    $scope->property('say')->call(
        [
            add(
                $scope,
                str( $f, "Length: " ),
                $scope->property('list')->property('length')->call( {}, $scope )
            )
        ],
        $scope
    );
    foreach ( $scope->property('list')->iterate ) {
        my $scope = Ferret::Scope->new( $f, parent => $scope );
        $scope->set_property( item => $_ );

        $scope->property('say')
          ->call(
            [ add( $scope, str( $f, "item: " ), $scope->property('item') ) ],
            $scope );
    }
    $scope->set_property(
        hash => Ferret::Hash->new( $f, pairs => { hi => str( $f, "there" ) } )
    );
    $scope->property('hash')->property('setPair')
      ->call( [ str( $f, "whats" ), str( $f, "up" ) ], $scope );
    foreach ( $scope->property('hash')->iterate ) {
        my $scope = Ferret::Scope->new( $f, parent => $scope );
        $scope->set_property( key => $_->[0] );
        $scope->set_property( val => $_->[1] );

        $scope->property('say')->call(
            [
                add(
                    $scope,                  str( $f, "pair: key=" ),
                    $scope->property('key'), str( $f, "; value=" ),
                    $scope->property('val')
                )
            ],
            $scope
        );
    }
}

Ferret::runtime();
