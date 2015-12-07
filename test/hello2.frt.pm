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
    unless ( length $Ferret::ferret_root ) {
        my $libs = $Ferret::ferret_libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die 'config error';
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = FF::get_ferret();

FF::before_content('hello2.frt');

use Ferret::Core::Operations qw(str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    $scope->property_u('say')
      ->call_u( [ str( $f, "Hello World!" ) ], $scope, undef, 1.5 );
};

FF::after_content();
