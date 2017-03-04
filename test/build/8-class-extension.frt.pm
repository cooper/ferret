# === Document Model ===
#  File './test/8-class-extension.frt'
#      Package 'main'
#          Class 'String'
#              Method 'doubledLength' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Operation
#                                  Call
#                                      Instance variable '@length'
#                                  Multiplication operator (*)
#                                  Number '2'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Argument list [1 item]
#                      Item 0
#                          Operation
#                              String 'Length tim...'
#                              Addition operator (+)
#                              Call
#                                  Property 'doubledLength'
#                                      String 'hi there'
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
use Ferret::Core::Operations qw(add mul num str);

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) =
  before_content( '8-class-extension.frt', './test/8-class-extension.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main', 1.1 );
    my $scope = $file_scope;
    load_core('main');

    # Class 'String'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'String', undef, undef );

        # Method event 'doubledLength' definition
        my $func_0 = method_event_def(
            $f, $scope,
            'doubledLength',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    mul(
                        $scope,
                        $pos->(4.4),
                        $$self->{'length'}
                          ->( [ undef, [] ], $scope, undef, $pos->(4.3) ),
                        num( $f, "2" )
                    )
                );
                return $ret;
            }
        );
        $func_0->inside_scope(
            doubledLength => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    provides_namespaces( $context, $file_name, $pos->(9.45), qw(String) );
    load_namespaces( $context, $file_name, $pos->(9.45), qw() );
    $$scope->{'say'}->(
        [
            add(
                $scope,
                $pos->(9.2),
                str( $f, "Length times two: " ),
                str( $f, "hi there" )
                  ->property_u( 'doubledLength', $pos->(9.3) )
                  ->( [ undef, [] ], $scope, undef, $pos->(9.35) )
            )
        ],
        $scope, undef,
        $pos->(9.1)
    );
};

after_content($file_name);
