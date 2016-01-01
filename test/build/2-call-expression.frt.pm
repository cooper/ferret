# === Document Model ===
#  Document './test/2-call-expression.frt'
#      Instruction
#          Single value [1 items]
#              Item 0
#                  Call
#                      Single value [1 items]
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

FF::before_content('2-call-expression.frt');

use Ferret::Core::Operations qw(str);
my $result = do {
    my ( $scope, $context ) = FF::get_context( $f, 'main' );
    FF::load_core('main');

    $scope->property_u('say')
      ->call_u( [ str( $f, "Hello World!" ) ], $scope, undef, 1.25 );
};

FF::after_content();
