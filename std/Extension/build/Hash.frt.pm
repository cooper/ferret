# === Document Model ===
#  Document './std/Extension/Hash.frt'
#      Class 'Hash' <K, V>
#          Computed property 'empty'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Operation
#                              Instance variable '@length'
#                              Equality operator (==)
#                              Number '0'
#      Class 'OrderedHash' <K, V>
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Assignment
#                          Instance variable '@orderedKeys'
#                          Value list [0 items]
#                  Instruction
#                      Call
#                          Call
#                              Property 'init'
#                                  Class name with generics
#                                      Bareword 'Hash'
#                                      Bareword 'K'
#                                      Bareword 'V'
#                              Argument list [1 items]
#                                  Item 0
#                                      Special variable '*self'
#                          Argument list [0 items]
#          Computed property 'keys'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Instance variable '@orderedKeys'
#          Method 'pushPair'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$key'
#                          Argument type
#                              Bareword 'K'
#                  Instruction
#                      Need
#                          Lexical variable '$value'
#                          Argument type
#                              Bareword 'V'
#                  If
#                      Expression ('if' parameter)
#                          Property 'removed'
#                              Call
#                                  Property 'remove'
#                                      Instance variable '@orderedKeys'
#                                  Argument list [1 items]
#                                      Item 0
#                                          Lexical variable '$key'
#                      Body ('if' scope)
#                          Instruction
#                              Return pair 'overwritten'
#                                  Boolean true
#                  Instruction
#                      Assignment
#                          Index
#                              Special variable '*self'
#                              Index list [1 items]
#                                  Item 0
#                                      Lexical variable '$key'
#                          Lexical variable '$value'
#                  Instruction
#                      Call
#                          Property 'push'
#                              Instance variable '@orderedKeys'
#                          Argument list [1 items]
#                              Item 0
#                                  Lexical variable '$key'
#      Include (Hash, K, V)
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

my $pos = FF::before_content( 'Hash.frt', './std/Extension/Hash.frt' );

use Ferret::Core::Operations qw(bool equal num);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Class 'Hash'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Hash', undef,
            [ \'K', \'V' ] );

        # Method event 'empty' definition
        my $method_0 = FF::method_event_def(
            $f, $scope, 'empty',
            [],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                return $ret_func->(
                    equal( $scope, $$self->{'length'}, num( $f, "0" ) ) );
                return $ret;
            }
        );
        $method_0->inside_scope( empty => $scope, $proto, $class, 1, undef );
    }

    # Class 'OrderedHash'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'OrderedHash', undef,
            [ \'K', \'V' ] );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'initializer__',
            [],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                $self->set_property(
                    orderedKeys => FF::create_list( $f, [] ),
                    $pos->(10.2)
                );
                FF::type_with_generics( $f, $scope, $$scope->{'Hash'},
                    [ $$scope->{'K'}, $$scope->{'V'} ] )
                  ->property_u( 'init', $pos->(13.35) )->(
                    [ ${ $scope->{special} }->{'self'} ],
                    $scope, undef, $pos->(13.4)
                  )->( [ undef, [] ], $scope, undef, $pos->(13.55) );
                return $ret;
            }
        );

        # Method event 'keys' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'keys',
            [],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                return $ret_func->( $$self->{'orderedKeys'} );
                return $ret;
            }
        );

        # Method event 'pushPair' definition
        my $method_2 = FF::method_event_def(
            $f, $scope,
            'pushPair',
            [
                {
                    name     => 'key',
                    type     => 'K',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'value',
                    type     => 'V',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                FF::need( $scope, $args, 'key',   21.1 ) or return;
                FF::need( $scope, $args, 'value', 21.3 ) or return;
                if (
                    bool(
                        $$self->{'orderedKeys'}
                          ->property_u( 'remove', $pos->(24.3) )->(
                            [ $$scope->{'key'} ], $scope,
                            undef,                $pos->(24.4)
                          )->property_u( 'removed', $pos->(24.7) )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $ret->set_property( overwritten => $true, $pos->(25.2) );
                }
                ${ $scope->{special} }->{'self'}
                  ->set_index_value( [ $$scope->{'key'} ],
                    $$scope->{'value'}, $scope, $pos->(27.5) );
                $$self->{'orderedKeys'}->property_u( 'push', $pos->(28.2) )
                  ->( [ $$scope->{'key'} ], $scope, undef, $pos->(28.3) );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope( keys => $scope, $proto, $class, 1, undef );
        $method_2->inside_scope(
            pushPair => $scope,
            $proto, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Hash K V) );
};

FF::after_content();
