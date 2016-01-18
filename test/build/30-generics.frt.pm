# === Document Model ===
#  Document './test/30-generics.frt'
#      Class 'Stack' <Element>
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Assignment
#                          Instance variable '@items'
#                          Value list [0 items]
#          Method 'push'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$item'
#                          Argument type
#                              Bareword 'Element'
#                  Instruction
#                      Return
#                          Call
#                              Property 'push'
#                                  Instance variable '@items'
#                              Argument list [1 items]
#                                  Item 0
#                                      Lexical variable '$item'
#          Method 'unshift'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$item'
#                          Argument type
#                              Bareword 'Element'
#                  Instruction
#                      Return
#                          Call
#                              Property 'unshift'
#                                  Instance variable '@items'
#                              Argument list [1 items]
#                                  Item 0
#                                      Lexical variable '$item'
#          Method 'shift'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Property 'shift'
#                                  Instance variable '@items'
#                              Argument list [0 items]
#          Method 'pop'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Property 'pop'
#                                  Instance variable '@items'
#                              Argument list [0 items]
#          Method 'description'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Operation
#                              String 'Stack '
#                              Addition operator (+)
#                              Special property '*description'
#                                  Instance variable '@items'
#      Instruction
#          Assignment
#              Lexical variable '$stack'
#              Call
#                  Bareword 'Stack'
#                  Argument list [0 items]
#          Catch
#              Expression ('catch' parameter)
#                  Lexical variable '$e'
#              Body ('catch' scope)
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      String 'Error! '
#                                      Addition operator (+)
#                                      Lexical variable '$e'
#      Instruction
#          Assignment
#              Lexical variable '$numstack'
#              Call
#                  Class name with generics
#                      Bareword 'Stack'
#                      Bareword 'Num'
#                  Argument list [0 items]
#      Instruction
#          Call
#              Property 'push'
#                  Lexical variable '$numstack'
#              Argument list [1 items]
#                  Item 0
#                      Number '1'
#      Instruction
#          Call
#              Property 'push'
#                  Lexical variable '$numstack'
#              Argument list [1 items]
#                  Item 0
#                      String 'this shoul...'
#      Instruction
#          Call
#              Property 'push'
#                  Lexical variable '$numstack'
#              Argument list [1 items]
#                  Item 0
#                      Number '2'
#      Instruction
#          Call
#              Bareword 'inspect'
#              Argument list [1 items]
#                  Item 0
#                      Lexical variable '$numstack'
#      Include (Element, Num, Stack)
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

my $self;
my $f = FF::get_ferret();
my ( $true, $false, $undefined ) = FF::get_constant_objects($f);

FF::before_content('30-generics.frt');

use Ferret::Core::Operations qw(add num str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Class 'Stack'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Stack', undef,
            ['Element'] );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'initializer__',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $self->set_property( items => FF::create_list( $f, [] ), 4.2 );
                return $ret;
            }
        );

        # Method event 'push' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'push',
            [
                {
                    name     => 'item',
                    type     => 'Element',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'item', 8.2 ) or return;
                return ${ $$self->{'items'} }->{'push'}
                  ->( [ $$scope->{'item'} ], $scope, undef, 9.4 );
                return $ret;
            }
        );

        # Method event 'unshift' definition
        my $method_2 = FF::method_event_def(
            $f, $scope,
            'unshift',
            [
                {
                    name     => 'item',
                    type     => 'Element',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'item', 13.2 ) or return;
                return ${ $$self->{'items'} }->{'unshift'}
                  ->( [ $$scope->{'item'} ], $scope, undef, 14.4 );
                return $ret;
            }
        );

        # Method event 'shift' definition
        my $method_3 = FF::method_event_def(
            $f, $scope, 'shift',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                return ${ $$self->{'items'} }->{'shift'}
                  ->( {}, $scope, undef, 18.4 );
                return $ret;
            }
        );

        # Method event 'pop' definition
        my $method_4 = FF::method_event_def(
            $f, $scope, 'pop',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                return ${ $$self->{'items'} }->{'pop'}
                  ->( {}, $scope, undef, 22.4 );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $method_5 = FF::method_event_def(
            $f, $scope,
            'description',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                return add(
                    $scope,
                    str( $f, "Stack " ),
                    ${ $$self->{'items'} }->{'*description'}
                );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope( push => $scope, $proto, $class, undef, undef );
        $method_2->inside_scope(
            unshift => $scope,
            $proto, $class, undef, undef
        );
        $method_3->inside_scope(
            shift => $scope,
            $proto, $class, undef, undef
        );
        $method_4->inside_scope( pop => $scope, $proto, $class, undef, undef );
        $method_5->inside_scope(
            description => $scope,
            $proto, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Element Num Stack) );
    FF::try_catch(
        $f, $scope,
        sub {
            FF::lex_assign(
                $scope,
                stack => $$scope->{'Stack'}->( {}, $scope, undef, 32.4 ),
                undef, 32.2
            );
        },
        sub {
            my ($scope) = @_;
            $$scope->{'say'}->(
                [ add( $scope, str( $f, "Error! " ), $$scope->{'e'} ) ],
                $scope, undef, 33.2
            );
        },
        'e'
    );
    FF::lex_assign(
        $scope,
        numstack => FF::type_with_generics( $f, $scope, $$scope->{'Stack'},
            [ $$scope->{'Num'} ] )->( {}, $scope, undef, 36.35 ),
        undef,
        36.1
    );
    ${ $$scope->{'numstack'} }->{'push'}
      ->( [ num( $f, "1" ) ], $scope, undef, 38.3 );
    ${ $$scope->{'numstack'} }->{'push'}
      ->( [ str( $f, "this should be ignored" ) ], $scope, undef, 39.3 );
    ${ $$scope->{'numstack'} }->{'push'}
      ->( [ num( $f, "2" ) ], $scope, undef, 40.3 );
    $$scope->{'inspect'}->( [ $$scope->{'numstack'} ], $scope, undef, 42.2 );
};

FF::after_content();
