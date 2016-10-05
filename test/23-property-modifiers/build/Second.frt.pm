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
    my $config = $ENV{FERRET_CONFIG} || '/etc/ferret.conf';
    do $config or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined, $ret_func ) = FF::get_constant_objects($f);

my $pos =
  FF::before_content( 'Second.frt', './test/23-property-modifiers/Second.frt' );

use Ferret::Core::Operations qw();
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    FF::lex_assign(
        $scope,
        x => FF::create_object( $f, [] ),
        undef, $pos->(1.2)
    );
    $scope->weaken_property( 'x', $pos->(2.1) );
};

FF::after_content();
