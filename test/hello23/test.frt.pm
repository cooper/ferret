# === Tokenization ===
#         VAR_LEX |                            "x" | 1.14286
#       OP_ASSIGN |                                | 1.28571
#         PAREN_S |                                | 1.42857
#        OP_VALUE |                                | 1.57143
#         PAREN_E |                                | 1.71429
#         OP_SEMI |                                | 1.85714
#  KEYWORD_DELETE |                                | 2.25
#         VAR_LEX |                            "x" | 2.5
#         OP_SEMI |                                | 2.75
#        BAREWORD |                       "Second" | 3.33333
#         OP_SEMI |                                | 3.66667
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
    $scope->set_property_ow(
        $context,
        x => FF::create_object( $f, {} ),
        1.28571
    );
    $scope->delete_property( 'x', 2.25 );
    $scope->property_u('Second');
};

FF::after_content();
