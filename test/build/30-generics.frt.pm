# === Document Model ===
#  File './test/30-generics.frt'
#      Package 'main'
#          Class 'Stack' <Element>
#              Class method 'initializer__'
#                  Function body
#                      Instruction
#                          Assignment
#                              Instance variable '@items'
#                              Value list [0 items]
#              Method 'push' { $item:Element -> $result }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$item'
#                              Argument type
#                                  Bareword 'Element'
#                      Instruction
#                          Return
#                              Call
#                                  Property 'push'
#                                      Instance variable '@items'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$item'
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
#                          Return
#                              Operation
#                                  String 'Stack '
#                                  Addition operator (+)
#                                  Special property '*description'
#                                      Instance variable '@items'
#          Instruction
#              Assignment
#                  Lexical variable '$stack'
#                  Call
#                      Bareword 'Stack'
#                      Argument list [0 items]
#              Catch
#                  Expression ('catch' parameter)
#                      Lexical variable '$e'
#                  Catch body
#                      Instruction
#                          Call
#                              Bareword 'say'
#                              Argument list [1 item]
#                                  Item 0
#                                      Operation
#                                          String 'Error! '
#                                          Addition operator (+)
#                                          Lexical variable '$e'
#          Instruction
#              Assignment
#                  Lexical variable '$numstack'
#                  Call
#                      Class name with generics
#                          Bareword 'Stack'
#                          Bareword 'Num'
#                      Argument list [0 items]
#          Instruction
#              Call
#                  Property 'push'
#                      Lexical variable '$numstack'
#                  Argument list [1 item]
#                      Item 0
#                          Number '1'
#          Instruction
#              Call
#                  Property 'push'
#                      Lexical variable '$numstack'
#                  Argument list [1 item]
#                      Item 0
#                          String 'this shoul...'
#          Instruction
#              Call
#                  Property 'push'
#                      Lexical variable '$numstack'
#                  Argument list [1 item]
#                      Item 0
#                          Number '2'
#          Instruction
#              Call
#                  Bareword 'inspect'
#                  Argument list [1 item]
#                      Item 0
#                          Lexical variable '$numstack'
#          Include (Element, Num, Stack)
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
use Ferret::Core::Operations qw(add num str);

my ( $self, $ins, $result );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my ( $pos, $file_name ) =
  before_content( '30-generics.frt', './test/30-generics.frt' );

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'Stack'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Stack', undef, ['Element'] );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
            $f, $scope,
            'initializer__',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                $self->set_property(
                    items => create_list( $f, [] ),
                    $pos->(4.2)
                );
                return $ret;
            }
        );

        # Method event 'push' definition
        my $func_1 = method_event_def(
            $f, $scope, 'push',
            [
                {
                    name     => 'item',
                    type     => 'Element',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'item', 8.2 ) || return $ret_func->();
                return $ret_func->(
                    $$self->{'items'}->property_u( 'push', $pos->(9.3) )
                      ->( [ $$scope->{'item'} ], $scope, undef, $pos->(9.4) ) );
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
                return $ret_func->(
                    add(
                        $scope,
                        $pos->(17.3),
                        str( $f, "Stack " ),
                        $$self->{'items'}
                          ->property_u( '*description', $pos->(17.5) )
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
    provides_namespaces( $context, $file_name, qw(Stack) );
    load_namespaces( $context, $file_name, qw(Element Num Stack) );
    try_catch(
        $f, $scope,
        sub {
            var(
                $scope,
                stack => $$scope->{'Stack'}
                  ->( [ undef, [] ], $scope, undef, $pos->(23.4) ),
                undef, $pos->(23.2)
            );
        },
        sub {
            my ($scope) = @_;
            $$scope->{'say'}->(
                [
                    add(
                        $scope, $pos->(24.4),
                        str( $f, "Error! " ), $$scope->{'e'}
                    )
                ],
                $scope, undef,
                $pos->(24.2)
            );
        },
        'e'
    );
    var(
        $scope,
        numstack => type_with_generics( $f, $scope, $$scope->{'Stack'},
            [ $$scope->{'Num'} ] )
          ->( [ undef, [] ], $scope, undef, $pos->(27.35) ),
        undef,
        $pos->(27.1)
    );
    $$scope->{'numstack'}->property_u( 'push', $pos->(29.2) )
      ->( [ num( $f, "1" ) ], $scope, undef, $pos->(29.3) );
    $$scope->{'numstack'}->property_u( 'push', $pos->(30.2) )
      ->( [ str( $f, "this should be ignored" ) ], $scope, undef,
        $pos->(30.3) );
    $$scope->{'numstack'}->property_u( 'push', $pos->(31.2) )
      ->( [ num( $f, "2" ) ], $scope, undef, $pos->(31.3) );
    $$scope->{'inspect'}
      ->( [ $$scope->{'numstack'} ], $scope, undef, $pos->(33.2) );
};

after_content($file_name);
