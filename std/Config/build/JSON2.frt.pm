# === Document Model ===
#  File './std/Config/JSON2.frt'
#      Package 'Config'
#          Class 'JSON2'
#              Class method 'initializer__' { $filePath:Str }
#                  Function body
#                      Instruction
#                          Need
#                              Instance variable '@filePath'
#                              Argument type
#                                  Bareword 'Str'
#              Method 'parse' { -> $result }
#                  Function body
#                      Instruction
#                          Assignment
#                              Lexical variable '$jsonData'
#                              Call
#                                  Property 'slurp'
#                                      Call
#                                          Bareword 'File'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  Instance variable '@filePath'
#                      Instruction
#                          Return
#                              Property 'data'
#                                  Call
#                                      Property 'decode'
#                                          Bareword 'JSON'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Lexical variable '$jsonData'
#          Include (File, JSON, Str)
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

my ( $pos, $file_name ) =
  before_content( 'JSON2.frt', './std/Config/JSON2.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'Config', 1.1 );
    my $scope = $file_scope;
    load_core('Config');

    # Class 'JSON2'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'JSON2', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'filePath',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $self, $args, 'filePath' ) || return $ret_func->();
                return $ret;
            }
        );

        # Method event 'parse' definition
        my $func_1 = method_event_def(
            $f, $scope, 'parse', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var(
                    $scope,
                    jsonData => $$scope->{'File'}->(
                        [ $$self->{'filePath'} ], $scope, undef, $pos->(9.2)
                      )->property_u( 'slurp', $pos->(9.35) )
                      ->( [ undef, [] ], $scope, undef, $pos->(9.4) ),
                    $file_scope,
                    $pos->(9.1)
                );
                return $ret_func->(
                    $$scope->{'JSON'}->property_u( 'decode', $pos->(10.3) )->(
                        [ $$scope->{'jsonData'} ], $scope,
                        undef,                     $pos->(10.4)
                    )->property_u( 'data', $pos->(10.7) )
                );
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            parse => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    provides_namespaces( $context, $file_name, $pos->(11.1), qw(JSON2) );
    load_namespaces( $context, $file_name, $pos->(11.1), qw(File JSON Str) );
};

after_content($file_name);
