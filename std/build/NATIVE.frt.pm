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
#      Function 'bless'
#          Body ('function' scope)
#              Instruction
#                  Need
#                      Lexical variable '$obj'
#              Instruction
#                  Need
#                      Lexical variable '$class'
#                      Argument type
#                          Bareword 'Str'
#              Instruction
#                  Call
#                      Bareword '_bless'
#                      Argument list [2 items]
#                          Item 0
#                              Lexical variable '$obj'
#                          Item 1
#                              Lexical variable '$class'
#      Include (PerlObject, Str)
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

my $pos = before_content( 'NATIVE.frt', './std/NATIVE.frt' );

use Ferret::Core::Operations qw(str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'NATIVE' );
    my $scope = $file_scope;
    load_core('NATIVE');

    # Function event 'bless' definition
    my $func_0 = function_event_def(
        $f, $context, 'bless', undef,
        [
            { name => 'obj', type => undef, optional => undef, more => undef },
            {
                name     => 'class',
                type     => 'Str',
                optional => undef,
                more     => undef
            }
        ],
        sub {
            my ( $scope, $_self, $this, $ins, $args, $ret ) = &args_v1;
            my $self = $_self || $self;
            need( $scope, $args, 'obj',   8.2 ) or return;
            need( $scope, $args, 'class', 8.4 ) or return;
            $$scope->{'_bless'}->(
                [ $$scope->{'obj'}, $$scope->{'class'} ],
                $scope, undef, $pos->(9.2)
            );
            return $ret;
        }
    );
    $func_0->inside_scope(
        bless => $scope,
        $context, undef, $ins, undef, undef
    );
    load_namespaces( $context, qw(PerlObject Str) );

    var(
        $context,
        ferret => [
            sub {
                $$scope->{'PerlObject'}
                  ->property_u( 'wrapPackageVariable', $pos->(3.25) )->(
                    [ str( $f, "Ferret" ), str( $f, "\$ferret" ) ],
                    $scope, undef, $pos->(3.3)
                  );
            }
        ],
        undef,
        $pos->(3.15)
    );
    var(
        $context,
        coreContext => [
            sub {
                $$scope->{'ferret'}->property_u( 'core_context', $pos->(4.5) )
                  ->( [ undef, [] ], $scope, undef, $pos->(4.6) );
            }
        ],
        undef,
        $pos->(4.3)
    );
    var(
        $context,
        mainContext => [
            sub {
                $$scope->{'ferret'}->property_u( 'main_context', $pos->(5.5) )
                  ->( [ undef, [] ], $scope, undef, $pos->(5.6) );
            }
        ],
        undef,
        $pos->(5.3)
    );
};

after_content();
