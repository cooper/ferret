# --- Tokens ---
#         PAREN_S | 
#         PAREN_S | 
#        BAREWORD | "say"
#         PAREN_E | 
#      PAREN_CALL | 
#          STRING | ["Hello World!"]
#         PAREN_E | 
#         PAREN_E | 
# --- DOM ---
#  Document './hello2.frt'
#      Instruction
#          Structural list [1 items]
#              Item 0
#                  Call
#                      Structural list [1 items]
#                          Item 0
#                              Bareword 'say'
#                      Structural list [1 items]
#                          Item 0
#                              String 'Hello World!'
#!/usr/bin/perl

use warnings;
use strict;
use 5.010;
use lib 'lib';
use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello2.frt.pm'}++;

use Ferret::Core::Operations qw();
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    Ferret::spaces( $context, qw() );

    $scope->property('say')
      ->call( [ Ferret::String->new( $f, value => "Hello World!" ) ], $scope );
}
