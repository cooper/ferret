# === Document Model ===
#  File './std/Stack.frt'
#      Package 'main'
#          Class 'Stack' <T>
#              Class method 'initializer__' { ?$items:T... }
#                  Function body
#                      Instruction
#                          Want (...)
#                              Instance variable '@items'
#                              Argument type
#                                  Bareword 'T'
#              Method 'push' { $item:T }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$item'
#                              Argument type
#                                  Bareword 'T'
#                      Instruction
#                          Call
#                              Property 'push'
#                                  Instance variable '@items'
#                              Argument list [1 item]
#                                  Item 0
#                                      Lexical variable '$item'
#              Method 'pop' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Call
#                                  Property 'pop'
#                                      Instance variable '@items'
#                                  Argument list [0 items]
#              Method 'description' { -> $result }
#                  Function body
#                      Instruction
#                          Assignment
#                              Lexical variable '$name'
#                              Property 'name'
#                                  Bareword 'T'
#                      Instruction
#                          Return
#                              Operation
#                                  String 'Stack<'
#                                  Addition operator (+)
#                                  Lexical variable '$name'
#                                  Addition operator (+)
#                                  String '> '
#                                  Addition operator (+)
#                                  Special property '*description'
#                                      Instance variable '@items'
#          Include (T)
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
use Ferret::Core::Operations qw(add str);

my ( $self, $ins );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $file_name = './std/Stack.frt';
my $pos = before_content( 'Stack.frt', $file_name );
my $result;

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'Stack'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Stack', undef, [ \'T' ] );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [ { name => 'items', type => 'T', optional => 1, more => 1 } ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                want( $self, $args, 'items', 4.2 );
                return $ret;
            }
        );

        # Method event 'push' definition
        my $func_1 = method_event_def(
            $f, $scope, 'push',
            [
                {
                    name     => 'item',
                    type     => 'T',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'item', 8.2 ) || return $ret_func->();
                $$self->{'items'}->property_u( 'push', $pos->(9.2) )
                  ->( [ $$scope->{'item'} ], $scope, undef, $pos->(9.3) );
                return $ret;
            }
        );

        # Method event 'pop' definition
        my $func_2 = method_event_def(
            $f, $scope, 'pop', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$self->{'items'}->property_u( 'pop', $pos->(13.3) )
                      ->( [ undef, [] ], $scope, undef, $pos->(13.4) ) );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $func_3 = method_event_def(
            $f, $scope,
            'description',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var(
                    $scope,
                    name => $$scope->{'T'}->property_u( 'name', $pos->(17.4) ),
                    $file_scope, $pos->(17.2)
                );
                return $ret_func->(
                    add(
                        $scope,
                        $pos->(18.15),
                        str( $f, "Stack<" ),
                        $$scope->{'name'},
                        str( $f, "> " ),
                        $$self->{'items'}
                          ->property_u( '*description', $pos->(18.45) )
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
            push => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_2->inside_scope(
            pop => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, $file_name, qw(T) );
};

after_content($file_name);
