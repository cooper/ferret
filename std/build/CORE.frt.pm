# === Document Model ===
#  File './std/CORE.frt'
#      Package 'CORE'
#          Type definition ('Any')
#              Type body
#          Type definition ('Code')
#              Type body
#                  Instruction
#                      Satisfies
#                          Property variable '.name'
#                  Instruction
#                      Satisfies
#                          Property variable '.signature'
#          Instruction
#              Load
#                  Bareword 'Signal'
#          Instruction
#              Load
#                  Bareword 'Complex'
#          Instruction
#              Load
#                  Bareword 'Character'
#          Instruction
#              Load
#                  Bareword 'Extension::NATIVE'
#          Instruction
#              Load
#                  Bareword 'Extension::Number'
#          Instruction
#              Load
#                  Bareword 'Extension::String'
#          Instruction
#              Load
#                  Bareword 'Extension::List'
#          Instruction
#              Load
#                  Bareword 'Extension::Hash'
#          Instruction
#              Load
#                  Bareword 'Iterator'
#          Instruction
#              Load
#                  Bareword 'EventSet'
#          Instruction
#              Load
#                  Bareword 'Indexed'
#          Include
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
use Ferret::Core::Operations qw();

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) = before_content( 'CORE.frt', './std/CORE.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'CORE', 1.1 );
    my $scope = $file_scope;
    load_core('CORE');

    provides_namespaces( $context, $file_name, $pos->(25.3), qw(Any Code) );
    load_namespaces( $context, $file_name, $pos->(25.3), qw() );
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
    load_namespaces( $context, $file_name, $pos->(13.1), 'Signal' );
    load_namespaces( $context, $file_name, $pos->(14.1), 'Complex' );
    load_namespaces( $context, $file_name, $pos->(15.1), 'Character' );
    load_namespaces( $context, $file_name, $pos->(17.1), 'Extension::NATIVE' );
    load_namespaces( $context, $file_name, $pos->(18.1), 'Extension::Number' );
    load_namespaces( $context, $file_name, $pos->(19.1), 'Extension::String' );
    load_namespaces( $context, $file_name, $pos->(20.1), 'Extension::List' );
    load_namespaces( $context, $file_name, $pos->(21.1), 'Extension::Hash' );
    load_namespaces( $context, $file_name, $pos->(23.1), 'Iterator' );
    load_namespaces( $context, $file_name, $pos->(24.1), 'EventSet' );
    load_namespaces( $context, $file_name, $pos->(25.1), 'Indexed' );
};

after_content($file_name);
