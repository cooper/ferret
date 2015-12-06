# === Document Model ===
#  Document './test/hello23/test.frt'
#      Instruction
#          Assignment (lexical variable '$x')
#              Object [0 items]
#      Instruction
#          Delete modifier
#              Lexical variable '$x'
#      Instruction
#          Bareword 'Second'
#      Include (Second)
use warnings;
use strict;
use 5.010;

use utf8;
use open ':std', ':encoding(UTF-8)';

BEGIN {
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die 'config error';
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = FF::get_ferret();

FF::before_content('test.frt');

use Ferret::Core::Operations qw();
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    FF::load_namespaces( $context, qw(Second) );
    $scope->set_property_ow(
        $context,
        x => FF::create_object( $f, {} ),
        3.09090909090909
    );
    $scope->delete_property( 'x', 9.54545454545454 );
    $scope->property_u('Second');
};

FF::after_content();
