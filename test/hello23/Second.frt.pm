# === Document Model ===
#  Document './test/hello23/Second.frt'
#      Instruction
#          Assignment (lexical variable '$x')
#              Object [0 items]
#      Instruction
#          Weaken modifier
#              Lexical variable '$x'
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

FF::before_content('Second.frt');

use Ferret::Core::Operations qw();
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    $scope->set_property_ow(
        $context,
        x => FF::create_object( $f, {} ),
        1.11111111111111
    );
    $scope->weaken_property( 'x', 2.66666666666667 );
};

FF::after_content();
