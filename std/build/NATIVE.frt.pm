# === Document Model ===
#  Document './std/NATIVE.frt'
#      Package 'NATIVE'
#      Instruction
#          Shared variable declaration
#              Lazy assignment
#                  Lexical variable '$ferret'
#                  Call
#                      Property 'wrapPackageVariable'
#                          Bareword 'PerlObject'
#                      Argument list [2 items]
#                          Item 0
#                              String 'Ferret'
#                          Item 1
#                              String '$ferret'
#      Instruction
#          Shared variable declaration
#              Lazy assignment
#                  Lexical variable '$coreContext'
#                  Call
#                      Property 'core_context'
#                          Lexical variable '$ferret'
#                      Argument list [0 items]
#      Instruction
#          Shared variable declaration
#              Lazy assignment
#                  Lexical variable '$mainContext'
#                  Call
#                      Property 'main_context'
#                          Lexical variable '$ferret'
#                      Argument list [0 items]
#      Include (PerlObject)
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

FF::before_content('NATIVE.frt');

use Ferret::Core::Operations qw(str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'NATIVE' );
    my $scope = $file_scope;
    FF::load_core('NATIVE');

    FF::load_namespaces( $context, qw(PerlObject) );

    my $lv_ferret = FF::lex_assign(
        $context,
        ferret => [
            sub {
                ${ $$scope->{'PerlObject'} }->{'wrapPackageVariable'}->(
                    [ str( $f, "Ferret" ), str( $f, "\$ferret" ) ],
                    $scope, undef, 3.3
                );
            }
        ],
        undef,
        3.15
    );
    my $lv_coreContext = FF::lex_assign(
        $context,
        coreContext => [
            sub {
                ${ $$scope->{'ferret'} }->{'core_context'}
                  ->( {}, $scope, undef, 4.6 );
            }
        ],
        undef,
        4.3
    );
    my $lv_mainContext = FF::lex_assign(
        $context,
        mainContext => [
            sub {
                ${ $$scope->{'ferret'} }->{'main_context'}
                  ->( {}, $scope, undef, 5.6 );
            }
        ],
        undef,
        5.3
    );
};

FF::after_content();
