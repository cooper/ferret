# === Document Model ===
#  Document './std/Iterator.frt'
#      Type definition ('Iterator')
#          Body ('type' scope)
#              Instruction
#                  Can
#                      Property variable '.more'
#              Instruction
#                  Can
#                      Property variable '.nextElement'
#              Instruction
#                  Can
#                      Property variable '.iterator'
#      Type definition ('Iterable')
#          Body ('type' scope)
#              Instruction
#                  Can
#                      Property variable '.iterator'
#      Class 'ListIterator'
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$list'
#                          Argument type
#                              Bareword 'List'
#                  Instruction
#                      Assignment
#                          Instance variable '@list'
#                          Call
#                              Property 'copy'
#                                  Lexical variable '$list'
#                              Argument list [0 items]
#                  Instruction
#                      Assignment
#                          Instance variable '@i'
#                          Operation
#                              Constant zero
#                              Negation operator (-)
#                              Number '1'
#          Computed property 'more'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Operation
#                              Instance variable '@i'
#                              Negated equality operator (!=)
#                              Property 'lastIndex'
#                                  Instance variable '@list'
#          Computed property 'nextElement'
#              Body ('method' scope)
#                  Instruction
#                      Addition assignment
#                          Instance variable '@i'
#                          Number '1'
#                  Instruction
#                      Return
#                          Index
#                              Instance variable '@list'
#                              Index list [1 items]
#                                  Item 0
#                                      Instance variable '@i'
#          Computed property 'iterator'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Special variable '*self'
#      Include (List)
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

my $pos = before_content( 'Iterator.frt', './std/Iterator.frt' );

use Ferret::Core::Operations qw(_sub add nequal num);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'ListIterator'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'ListIterator', undef, undef );

        # Method event 'initializer__' definition
        my $method_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'list',
                    type     => 'List',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'list', 17.2 ) or return;
                $self->set_property(
                    list =>
                      $$scope->{'list'}->property_u( 'copy', $pos->(18.4) )
                      ->( [ undef, [] ], $scope, undef, $pos->(18.5) ),
                    $pos->(18.2)
                );
                $self->set_property(
                    i => _sub( $scope, $f->zero, num( $f, "1" ) ),
                    $pos->(19.2)
                );
                return $ret;
            }
        );

        # Method event 'more' definition
        my $method_1 = method_event_def(
            $f, $scope, 'more',
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    nequal(
                        $scope,
                        $$self->{'i'},
                        $$self->{'list'}
                          ->property_u( 'lastIndex', $pos->(23.5) )
                    )
                );
                return $ret;
            }
        );

        # Method event 'nextElement' definition
        my $method_2 = method_event_def(
            $f, $scope,
            'nextElement',
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                $self->set_property(
                    i => add( $scope, $$self->{'i'}, num( $f, "1" ) ),
                    $pos->(27.2)
                );
                return $ret_func->(
                    $$self->{'list'}->get_index_value(
                        [ $$self->{'i'} ],
                        $scope, $pos->(28.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'iterator' definition
        my $method_3 = method_event_def(
            $f, $scope,
            'iterator',
            [],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->( ${ $scope->{special} }->{'self'} );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $method_1->inside_scope(
            more => $scope,
            $proto, $class, $ins, 1, undef
        );
        $method_2->inside_scope(
            nextElement => $scope,
            $proto, $class, $ins, 1, undef
        );
        $method_3->inside_scope(
            iterator => $scope,
            $proto, $class, $ins, 1, undef
        );
    }
    load_namespaces( $context, qw(List) );
    typedef(
        $scope, $context,
        'Iterator',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            typedef_check(
                $scope, $scope, $ins,
                conditions => [
                    $create_can->( 'more',        undef, $ins )->(),
                    $create_can->( 'nextElement', undef, $ins )->(),
                    $create_can->( 'iterator',    undef, $ins )->()
                ],
                equal_to => undef
            ) ? $ins : undef;
        },
        undef
    );
    typedef(
        $scope, $context,
        'Iterable',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            typedef_check(
                $scope, $scope, $ins,
                conditions => [ $create_can->( 'iterator', undef, $ins )->() ],
                equal_to   => undef
            ) ? $ins : undef;
        },
        undef
    );
};

after_content();
