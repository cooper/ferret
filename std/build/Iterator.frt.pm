# === Document Model ===
#  Document './std/Iterator.frt'
#      Type definition ('Iterator')
#          Type body
#              Instruction
#                  Can
#                      Property variable '.more'
#              Instruction
#                  Can
#                      Property variable '.nextElement'
#              Instruction
#                  Can
#                      Property variable '.iterator'
#      Type definition ('MultiIterator')
#          Type body
#              Instruction
#                  Isa
#                      Bareword 'Iterator'
#              Instruction
#                  Can
#                      Property variable '.nextElements'
#      Type definition ('Iterable')
#          Type body
#              Instruction
#                  Can
#                      Property variable '.iterator'
#                      Bareword 'Iterator'
#      Class 'ListIterator'
#          Class method 'initializer__'
#              Function body
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
#              Function body
#                  Instruction
#                      Return
#                          Operation
#                              Instance variable '@i'
#                              Negated equality operator (!=)
#                              Single value [1 item]
#                                  Item 0
#                                      Operation
#                                          Property 'lastIndex'
#                                              Instance variable '@list'
#                                          Logical or operator (||)
#                                          Constant zero
#                                          Negation operator (-)
#                                          Number '1'
#          Computed property 'nextElement'
#              Function body
#                  Instruction
#                      Addition assignment
#                          Instance variable '@i'
#                          Number '1'
#                  Instruction
#                      Return
#                          Index
#                              Instance variable '@list'
#                              Index list [1 item]
#                                  Item 0
#                                      Instance variable '@i'
#          Computed property 'nextElements'
#              Function body
#                  Instruction
#                      Addition assignment
#                          Instance variable '@i'
#                          Number '1'
#                  Instruction
#                      Return
#                          Value list [2 items]
#                              Item 0
#                                  Instance variable '@i'
#                              Item 1
#                                  Index
#                                      Instance variable '@list'
#                                      Index list [1 item]
#                                          Item 0
#                                              Instance variable '@i'
#          Computed property 'iterator'
#              Function body
#                  Instruction
#                      Return
#                          Special variable '*self'
#                          Bareword 'Iterator'
#      Class 'HashIterator'
#          Class method 'initializer__'
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$hash'
#                          Argument type
#                              Bareword 'Hash'
#                  Instruction
#                      Assignment
#                          Instance variable '@hash'
#                          Call
#                              Property 'copy'
#                                  Lexical variable '$hash'
#                              Argument list [0 items]
#                  Instruction
#                      Assignment
#                          Instance variable '@keysLeft'
#                          Property 'keys'
#                              Lexical variable '$hash'
#          Computed property 'more'
#              Function body
#                  Instruction
#                      Return
#                          Negation
#                              Property 'empty'
#                                  Instance variable '@keysLeft'
#          Computed property 'nextElement'
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$key'
#                          Call
#                              Property 'pop'
#                                  Instance variable '@keysLeft'
#                              Argument list [0 items]
#                  Instruction
#                      Return
#                          Index
#                              Instance variable '@hash'
#                              Index list [1 item]
#                                  Item 0
#                                      Lexical variable '$key'
#          Computed property 'nextElements'
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$key'
#                          Call
#                              Property 'pop'
#                                  Instance variable '@keysLeft'
#                              Argument list [0 items]
#                  Instruction
#                      Return
#                          Value list [2 items]
#                              Item 0
#                                  Lexical variable '$key'
#                              Item 1
#                                  Index
#                                      Instance variable '@hash'
#                                      Index list [1 item]
#                                          Item 0
#                                              Lexical variable '$key'
#          Computed property 'iterator'
#              Function body
#                  Instruction
#                      Return
#                          Special variable '*self'
#                          Bareword 'Iterator'
#      Include (Hash, Iterator, List)
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

use Ferret::Core::Operations qw(_not _sub add any_true nequal num);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Class 'ListIterator'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'ListIterator', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
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
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'list', 21.2 ) || return $ret_func->();
                $self->set_property(
                    list =>
                      $$scope->{'list'}->property_u( 'copy', $pos->(22.4) )
                      ->( [ undef, [] ], $scope, undef, $pos->(22.5) ),
                    $pos->(22.2)
                );
                $self->set_property(
                    i => _sub( $scope, $f->zero, num( $f, "1" ) ),
                    $pos->(23.2)
                );
                return $ret;
            }
        );

        # Method event 'more' definition
        my $func_1 = method_event_def(
            $f, $scope, 'more', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    nequal(
                        $scope,
                        $$self->{'i'},
                        any_true(
                            $scope,
                            sub {
                                $$self->{'list'}
                                  ->property_u( 'lastIndex', $pos->(27.3) );
                            },
                            sub { _sub( $scope, $f->zero, num( $f, "1" ) ) }
                        )
                    )
                );
                return $ret;
            }
        );

        # Method event 'nextElement' definition
        my $func_2 = method_event_def(
            $f, $scope,
            'nextElement',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                $self->set_property(
                    i => add( $scope, $$self->{'i'}, num( $f, "1" ) ),
                    $pos->(31.2)
                );
                return $ret_func->(
                    $$self->{'list'}->get_index_value(
                        [ $$self->{'i'} ],
                        $scope, $pos->(32.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'nextElements' definition
        my $func_3 = method_event_def(
            $f, $scope,
            'nextElements',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                $self->set_property(
                    i => add( $scope, $$self->{'i'}, num( $f, "1" ) ),
                    $pos->(36.2)
                );
                return $ret_func->(
                    create_list(
                        $f,
                        [
                            $$self->{'i'},
                            $$self->{'list'}->get_index_value(
                                [ $$self->{'i'} ],
                                $scope, $pos->(37.3)
                            )
                        ]
                    )
                );
                return $ret;
            }
        );

        # Method event 'iterator' definition
        my $func_4 = method_event_def(
            $f, $scope,
            'iterator',
            undef,
            [ { name => 'result', type => 'Iterator' } ],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->( ${ $scope->{special} }->{'self'} );
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope( more => $scope, $proto, $class, $ins, 1, undef );
        $func_2->inside_scope(
            nextElement => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_3->inside_scope(
            nextElements => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_4->inside_scope(
            iterator => $scope,
            $proto, $class, $ins, 1, undef
        );
    }

    # Class 'HashIterator'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'HashIterator', undef, undef );

        # Method event 'initializer__' definition
        my $func_5 = method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'hash',
                    type     => 'Hash',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'hash', 48.2 ) || return $ret_func->();
                $self->set_property(
                    hash =>
                      $$scope->{'hash'}->property_u( 'copy', $pos->(49.4) )
                      ->( [ undef, [] ], $scope, undef, $pos->(49.5) ),
                    $pos->(49.2)
                );
                $self->set_property(
                    keysLeft =>
                      $$scope->{'hash'}->property_u( 'keys', $pos->(50.4) ),
                    $pos->(50.2)
                );
                return $ret;
            }
        );

        # Method event 'more' definition
        my $func_6 = method_event_def(
            $f, $scope, 'more', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    _not(
                        $$self->{'keysLeft'}
                          ->property_u( 'empty', $pos->(54.4) )
                    )
                );
                return $ret;
            }
        );

        # Method event 'nextElement' definition
        my $func_7 = method_event_def(
            $f, $scope,
            'nextElement',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var(
                    $scope,
                    key =>
                      $$self->{'keysLeft'}->property_u( 'pop', $pos->(58.4) )
                      ->( [ undef, [] ], $scope, undef, $pos->(58.5) ),
                    $file_scope, $pos->(58.2)
                );
                return $ret_func->(
                    $$self->{'hash'}->get_index_value(
                        [ $$scope->{'key'} ],
                        $scope, $pos->(59.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'nextElements' definition
        my $func_8 = method_event_def(
            $f, $scope,
            'nextElements',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var(
                    $scope,
                    key =>
                      $$self->{'keysLeft'}->property_u( 'pop', $pos->(63.4) )
                      ->( [ undef, [] ], $scope, undef, $pos->(63.5) ),
                    $file_scope, $pos->(63.2)
                );
                return $ret_func->(
                    create_list(
                        $f,
                        [
                            $$scope->{'key'},
                            $$self->{'hash'}->get_index_value(
                                [ $$scope->{'key'} ],
                                $scope, $pos->(64.3)
                            )
                        ]
                    )
                );
                return $ret;
            }
        );

        # Method event 'iterator' definition
        my $func_9 = method_event_def(
            $f, $scope,
            'iterator',
            undef,
            [ { name => 'result', type => 'Iterator' } ],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->( ${ $scope->{special} }->{'self'} );
                return $ret;
            }
        );
        $func_5->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_6->inside_scope( more => $scope, $proto, $class, $ins, 1, undef );
        $func_7->inside_scope(
            nextElement => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_8->inside_scope(
            nextElements => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_9->inside_scope(
            iterator => $scope,
            $proto, $class, $ins, 1, undef
        );
    }
    load_namespaces( $context, qw(Hash Iterator List) );
    typedef(
        $scope, $context,
        'Iterator',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            state $anchor = \0 + 0;
            typedef_check(
                $scope, $scope, $ins, $anchor,
                conditions => [
                    sub { $create_can->( 'more', undef, undef, $ins )->() },
                    sub {
                        $create_can->( 'nextElement', undef, undef, $ins )->();
                    },
                    sub { $create_can->( 'iterator', undef, undef, $ins )->() }
                ],
                equal_to => undef
            ) ? $ins : undef;
        },
        undef
    );
    typedef(
        $scope, $context,
        'MultiIterator',
        sub {
            my ( $ins, $create_can, $transform ) = @_;
            state $anchor = \0 + 0;
            typedef_check(
                $scope, $scope, $ins, $anchor,
                conditions => [
                    sub { $ins->fits_type_u( $$scope->{'Iterator'} ) },
                    sub {
                        $create_can->( 'nextElements', undef, undef, $ins )->();
                    }
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
            state $anchor = \0 + 0;
            typedef_check(
                $scope, $scope, $ins, $anchor,
                conditions => [
                    sub {
                        $create_can->(
                            'iterator', undef, [ result => 'Iterator' ], $ins
                        )->();
                    }
                ],
                equal_to => undef
            ) ? $ins : undef;
        },
        undef
    );
};

after_content();
