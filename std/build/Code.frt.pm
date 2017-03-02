# === Document Model ===
#  Document './std/Code.frt'
#      Package 'CORE'
#      Instruction
#          Load
#              Bareword 'Error'
#      Instruction
#          Load
#              Bareword 'Signal'
#      Instruction
#          Load
#              Bareword 'Complex'
#      Instruction
#          Load
#              Bareword 'Char'
#      Instruction
#          Load
#              Bareword 'Extension::NATIVE'
#      Instruction
#          Load
#              Bareword 'Extension::Number'
#      Instruction
#          Load
#              Bareword 'Extension::String'
#      Instruction
#          Load
#              Bareword 'Extension::List'
#      Instruction
#          Load
#              Bareword 'Extension::Hash'
#      Instruction
#          Load
#              Bareword 'Iterator'
#      Instruction
#          Load
#              Bareword 'EventSet'
#      Instruction
#          Load
#              Bareword 'Indexed'
#      Type definition ('Any')
#          Type body
#      Type definition ('Code')
#          Type body
#              Instruction
#                  Satisfies
#                      Property variable '.name'
#              Instruction
#                  Satisfies
#                      Property variable '.signature'
#      Include (Char, Complex, Error, EventSet, Extension::Hash, Extension::List, Extension::NATIVE, Extension::Number, Extension::String, Indexed, Iterator, Signal)
package FF;

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

my ( $self, $ins );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $file_name = './std/Code.frt';
my $pos = before_content( 'Code.frt', $file_name );

use Ferret::Core::Operations qw();
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'CORE' );
    my $scope = $file_scope;
    load_core('CORE');

    load_namespaces( $context, $file_name,
        qw(Char Complex Error EventSet Extension::Hash Extension::List Extension::NATIVE Extension::Number Extension::String Indexed Iterator Signal)
    );

    typedef(
        $scope, $context, 'Any',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            state $anchor = \0 + 0;
            typedef_check(
                $scope, $scope, $ins, $anchor,
                conditions => undef,
                equal_to   => undef
            ) ? $ins : undef;
        },
        undef
    );
    typedef(
        $scope, $context, 'Code',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            state $anchor = \0 + 0;
            typedef_check(
                $scope, $scope, $ins, $anchor,
                conditions =>
                  [ sub { $$ins->{'name'} }, sub { $$ins->{'signature'} } ],
                equal_to => undef
            ) ? $ins : undef;
        },
        undef
    );
};

after_content($file_name);
