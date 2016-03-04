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
    my $config = $ENV{FERRET_CONFIG} || '/etc/ferret.conf';
    do $config or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined, $ret_func ) = FF::get_constant_objects($f);

FF::before_content('test.frt');

use Ferret::Core::Operations qw();
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    FF::load_namespaces( $context, qw(Second) );
    FF::lex_assign( $scope, x => FF::create_object( $f, {} ), undef, 1.2 );
    $scope->delete_property( 'x', 2.1 );
    $$scope->{'Second'};
};

FF::after_content();
