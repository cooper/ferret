# === Document Model ===
#  Document './std/Stack.frt'
#      Class 'Stack' <T>
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Want (...)
#                          Instance variable '@items'
#                          Argument type
#                              Bareword 'T'
#          Method 'push'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$item'
#                          Argument type
#                              Bareword 'T'
#                  Instruction
#                      Call
#                          Property 'push'
#                              Instance variable '@items'
#                          Argument list [1 items]
#                              Item 0
#                                  Lexical variable '$item'
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
#                      Assignment
#                          Lexical variable '$name'
#                          Property 'name'
#                              Bareword 'T'
#                  Instruction
#                      Return
#                          Operation
#                              String 'Stack<'
#                              Addition operator (+)
#                              Lexical variable '$name'
#                              Addition operator (+)
#                              String '> '
#                              Addition operator (+)
#                              Special property '*description'
#                                  Instance variable '@items'
#      Include (T)
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
my ( $true, $false, $undefined, $ret_func ) = FF::get_constant_objects($f);

my $pos = FF::before_content( 'Stack.frt', './std/Stack.frt' );

use Ferret::Core::Operations qw(add str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Class 'Stack'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Stack', undef, [ \'T' ] );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'initializer__',
            [ { name => 'items', type => 'T', optional => 1, more => 1 } ],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                FF::want( $self, $args, 'items', 4.2 );
                return $ret;
            }
        );

        # Method event 'push' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'push',
            [
                {
                    name     => 'item',
                    type     => 'T',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                FF::need( $scope, $args, 'item', 8.2 ) or return;
                $$self->{'items'}->property_u( 'push', $pos->(9.2) )
                  ->( [ $$scope->{'item'} ], $scope, undef, $pos->(9.3) );
                return $ret;
            }
        );

        # Method event 'pop' definition
        my $method_2 = FF::method_event_def(
            $f, $scope, 'pop',
            [],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                return $ret_func->(
                    $$self->{'items'}->property_u( 'pop', $pos->(13.3) )
                      ->( [ undef, [] ], $scope, undef, $pos->(13.4) ) );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $method_3 = FF::method_event_def(
            $f, $scope,
            'description',
            [],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                FF::lex_assign(
                    $scope,
                    name => $$scope->{'T'}->property_u( 'name', $pos->(17.4) ),
                    $file_scope, $pos->(17.2)
                );
                return $ret_func->(
                    add(
                        $scope,
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
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope( push => $scope, $proto, $class, undef, undef );
        $method_2->inside_scope( pop  => $scope, $proto, $class, undef, undef );
        $method_3->inside_scope(
            description => $scope,
            $proto, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(T) );
};

FF::after_content();
