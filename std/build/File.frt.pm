# === Document Model ===
#  File './std/File.frt'
#      Package 'main'
#          Class 'File' version 1.0
#              Type definition ('Encoding')
#                  Type body
#                      Instruction
#                          Symbol :binary
#                      Instruction
#                          Symbol :utf8
#              Class method 'initializer__' { $path:Str ?$encoding:Encoding }
#                  Function body
#                      Instruction
#                          Need
#                              Instance variable '@path'
#                              Argument type
#                                  Bareword 'Str'
#                      Instruction
#                          Want
#                              Instance variable '@encoding'
#                              Argument type
#                                  Bareword 'Encoding'
#                              Argument value
#                                  Symbol :utf8
#              Method 'slurp' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Call
#                                  Property 'slurp'
#                                      Bareword 'NATIVE'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Instance variable '@path'
#                                      Item 1
#                                          Instance variable '@encoding'
#          Include (Encoding, NATIVE, Str)
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

my ( $pos, $file_name ) = before_content( 'File.frt', './std/File.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main', 1.1 );
    my $scope = $file_scope;
    load_core('main');

    # Class 'File'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'File', 1.0, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'path',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'encoding',
                    type     => 'Encoding',
                    optional => 1,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $self, $args, 'path' ) || return $ret_func->();
                want( $self, $args, 'encoding', 10.2,
                    get_symbol( $f, 'utf8' ) );
                return $ret;
            }
        );

        # Method event 'slurp' definition
        my $func_1 = method_event_def(
            $f, $scope, 'slurp', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$scope->{'NATIVE'}->property_u( 'slurp', $pos->(14.15) )
                      ->(
                        [ $$self->{'path'}, $$self->{'encoding'} ],
                        $scope, undef, $pos->(14.2)
                      )
                );
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            slurp => $scope,
            $proto, $class, $ins, undef, undef
        );
        typedef(
            $scope, $class,
            'Encoding',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                state $anchor = \0 + 0;
                typedef_check(
                    $scope, $scope, $ins, $anchor,
                    conditions => undef,
                    equal_to   => [
                        sub { get_symbol( $f, 'binary' ) },
                        sub { get_symbol( $f, 'utf8' ) }
                    ]
                ) ? $ins : undef;
            },
            undef
        );
    }
    provides_namespaces( $context, $file_name, $pos->(15.1),
        qw(Encoding File) );
    load_namespaces( $context, $file_name, $pos->(15.1),
        qw(Encoding NATIVE Str) );
};

after_content($file_name);
