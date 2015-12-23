# === Tokenization ===
#         VAR_LEX |                            "x" | 1.14286
#       OP_ASSIGN |                                | 1.28571
#         PAREN_S |                                | 1.42857
#        OP_VALUE |                                | 1.57143
#         PAREN_E |                                | 1.71429
#         OP_SEMI |                                | 1.85714
#  KEYWORD_WEAKEN |                                | 2.25
#         VAR_LEX |                            "x" | 2.5
#         OP_SEMI |                                | 2.75
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
    do '/etc/ferret.conf' or die "config error: " . ( $@ || $! );
}

use Ferret;

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('Second.frt');

use Ferret::Core::Operations qw();
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    $scope->set_property_ow(
        $context,
        x => FF::create_object( $f, {} ),
        1.28571
    );
    $scope->weaken_property( 'x', 2.25 );
};

FF::after_content();
