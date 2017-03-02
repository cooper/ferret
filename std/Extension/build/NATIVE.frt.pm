# === Document Model ===
#  File './std/Extension/NATIVE.frt'
#      Package 'main'
#          Class 'NATIVE'
#              Instruction
#                  Load
#                      Bareword 'NATIVE::PerlObject'
#              Instruction
#                  Shared variable declaration
#                      Lazy assignment
#                          Lexical variable '$ferret'
#                          Call
#                              Property 'wrapPackageVariable'
#                                  Bareword 'PerlObject'
#                              Argument list [2 items]
#                                  Item 0
#                                      String 'Ferret'
#                                  Item 1
#                                      String '$ferret'
#              Instruction
#                  Shared variable declaration
#                      Lazy assignment
#                          Lexical variable '$coreContext'
#                          Call
#                              Property 'core_context'
#                                  Lexical variable '$ferret'
#                              Argument list [0 items]
#              Instruction
#                  Shared variable declaration
#                      Lazy assignment
#                          Lexical variable '$mainContext'
#                          Call
#                              Property 'main_context'
#                                  Lexical variable '$ferret'
#                              Argument list [0 items]
#          Include (NATIVE::PerlObject, PerlObject)
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
use Ferret::Core::Operations qw(str);

my ( $self, $ins );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $file_name = './std/Extension/NATIVE.frt';
my $pos = before_content( 'NATIVE.frt', $file_name );
my $result;

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'NATIVE'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'NATIVE', undef, undef );

        var(
            $class,
            ferret => [
                sub {
                    $$scope->{'PerlObject'}
                      ->property_u( 'wrapPackageVariable', $pos->(5.25) )->(
                        [ str( $f, "Ferret" ), str( $f, "\$ferret" ) ],
                        $scope, undef, $pos->(5.3)
                      );
                }
            ],
            undef,
            $pos->(5.15)
        );
        var(
            $class,
            coreContext => [
                sub {
                    $$scope->{'ferret'}
                      ->property_u( 'core_context', $pos->(6.5) )
                      ->( [ undef, [] ], $scope, undef, $pos->(6.6) );
                }
            ],
            undef,
            $pos->(6.3)
        );
        var(
            $class,
            mainContext => [
                sub {
                    $$scope->{'ferret'}
                      ->property_u( 'main_context', $pos->(7.5) )
                      ->( [ undef, [] ], $scope, undef, $pos->(7.6) );
                }
            ],
            undef,
            $pos->(7.3)
        );
    }
    load_namespaces( $context, $file_name, qw(NATIVE::PerlObject PerlObject) );
};

after_content($file_name);
