# === Document Model ===
#  Document './test/23-property-modifiers/test.frt'
#      Instruction
#          Assignment
#              Lexical variable '$x'
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
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('test.frt');

use Ferret::Core::Operations qw();
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    FF::load_namespaces( $context, qw(Second) );
    $$context->set_property( x => FF::create_object( $f, {} ), 1.2 );
    $scope->delete_property( 'x', 2.1 );
    $scope->property_u('Second');
};

FF::after_content();
