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
#          Computed property 'iterator'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'HashIterator'
#                              Argument list [1 item]
#                                  Item 0
#                                      Special variable '*self'
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
#                              Argument list [1 item]
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
#                                  Argument list [1 item]
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
#                              Index list [1 item]
#                                  Item 0
#                                      Lexical variable '$key'
#                          Lexical variable '$value'
#                  Instruction
#                      Call
#                          Property 'push'
#                              Instance variable '@orderedKeys'
#                          Argument list [1 item]
#                              Item 0
#                                  Lexical variable '$key'
#      Include (Hash, HashIterator, K, V)
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

my $pos = before_content( 'Hash.frt', './std/Extension/Hash.frt' );

use Ferret::Core::Operations qw(bool equal num);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'Hash'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Hash', undef, [ \'K', \'V' ] );

        # Method event 'empty' definition
        my $method_0 = method_event_def(
            $f, $scope, 'empty',
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    equal( $scope, $$self->{'length'}, num( $f, "0" ) ) );
                return $ret;
            }
        );

        # Method event 'iterator' definition
        my $method_1 = method_event_def(
            $f, $scope,
            'iterator',
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$scope->{'HashIterator'}->(
                        [ ${ $scope->{special} }->{'self'} ], $scope,
                        undef,                                $pos->(8.3)
                    )
                );
                return $ret;
            }
        );
        $method_0->inside_scope(
            empty => $scope,
            $proto, $class, $ins, 1, undef
        );
        $method_1->inside_scope(
            iterator => $scope,
            $proto, $class, $ins, 1, undef
        );
    }

    # Class 'OrderedHash'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'OrderedHash', undef,
            [ \'K', \'V' ] );

        # Method event 'initializer__' definition
        my $method_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                $self->set_property(
                    orderedKeys => create_list( $f, [] ),
                    $pos->(14.2)
                );
                type_with_generics( $f, $scope, $$scope->{'Hash'},
                    [ $$scope->{'K'}, $$scope->{'V'} ] )
                  ->property_u( 'init', $pos->(17.35) )->(
                    [ ${ $scope->{special} }->{'self'} ],
                    $scope, undef, $pos->(17.4)
                  )->( [ undef, [] ], $scope, undef, $pos->(17.55) );
                return $ret;
            }
        );

        # Method event 'keys' definition
        my $method_1 = method_event_def(
            $f, $scope, 'keys',
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->( $$self->{'orderedKeys'} );
                return $ret;
            }
        );

        # Method event 'pushPair' definition
        my $method_2 = method_event_def(
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
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'key',   25.1 ) or return;
                need( $scope, $args, 'value', 25.3 ) or return;
                if (
                    bool(
                        $$self->{'orderedKeys'}
                          ->property_u( 'remove', $pos->(28.3) )->(
                            [ $$scope->{'key'} ], $scope,
                            undef,                $pos->(28.4)
                          )->property_u( 'removed', $pos->(28.7) )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $ret->set_property( overwritten => $true, $pos->(29.2) );
                }
                ${ $scope->{special} }->{'self'}
                  ->set_index_value( [ $$scope->{'key'} ],
                    $$scope->{'value'}, $scope, $pos->(31.5) );
                $$self->{'orderedKeys'}->property_u( 'push', $pos->(32.2) )
                  ->( [ $$scope->{'key'} ], $scope, undef, $pos->(32.3) );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $method_1->inside_scope(
            keys => $scope,
            $proto, $class, $ins, 1, undef
        );
        $method_2->inside_scope(
            pushPair => $scope,
            $proto, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Hash HashIterator K V) );
};

after_content();
