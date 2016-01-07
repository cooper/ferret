# === Document Model ===
#  Document './test/23-property-modifiers/Second.frt'
#      Instruction
#          Assignment
#              Lexical variable '$x'
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
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('Second.frt');

use Ferret::Core::Operations qw();
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    FF::lex_assign( $scope, x => FF::create_object( $f, {} ), undef, 1.2 );
    $scope->weaken_property( 'x', 2.1 );
};

FF::after_content();
