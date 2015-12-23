# === Tokenization ===
#         PAREN_S |                                | 1.1
#         PAREN_S |                                | 1.2
#        BAREWORD |                          "say" | 1.3
#         PAREN_E |                                | 1.4
#      PAREN_CALL |                                | 1.5
#          STRING |               ["Hello World!"] | 1.6
#         PAREN_E |                                | 1.7
#         PAREN_E |                                | 1.8
#         OP_SEMI |                                | 1.9
# === Document Model ===
#  Document './test/hello2.frt'
#      Instruction
#          Single value [1 items]
#              Item 0
#                  Call
#                      Argument list [1 items]
#                          Item 0
#                              Bareword 'say'
#                      Argument list [1 items]
#                          Item 0
#                              String 'Hello World!'
use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('hello2.frt');

use Ferret::Core::Operations qw(str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    $scope->property_u('say')
      ->call_u( [ str( $f, "Hello World!" ) ], $scope, undef, 1.5 );
};

FF::after_content();
