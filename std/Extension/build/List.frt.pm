# === Document Model ===
#  Document './std/Extension/List.frt'
#      Class 'List' <T>
#          Type definition ('Pairs')
#              Type body
#                  Instruction
#                      Isa
#                          Special variable '*class'
#                  Instruction
#                      Satisfies
#                          Property 'even'
#                              Property variable '.length'
#          Computed property 'empty' { -> $result }
#              Function body
#                  Instruction
#                      Return
#                          Operation
#                              Instance variable '@length'
#                              Equality operator (==)
#                              Number '0'
#          Method 'map' { $code:Code -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$code'
#                          Argument type
#                              Bareword 'Code'
#                  Instruction
#                      Return
#                          Gather
#                              Gather body
#                                  For (values)
#                                      Expression ('for' parameter)
#                                          Lexical variable '$el'
#                                      Expression ('in' parameter)
#                                          Special variable '*self'
#                                      For body
#                                          Instruction
#                                              Take
#                                                  Call
#                                                      Lexical variable '$code'
#                                                      Argument list [1 item]
#                                                          Item 0
#                                                              Lexical variable '$el'
#          Method 'grep' { $code:Code -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$code'
#                          Argument type
#                              Bareword 'Code'
#                  Instruction
#                      Return
#                          Gather
#                              Gather body
#                                  For (values)
#                                      Expression ('for' parameter)
#                                          Lexical variable '$el'
#                                      Expression ('in' parameter)
#                                          Special variable '*self'
#                                      For body
#                                          If
#                                              Expression ('if' parameter)
#                                                  Call
#                                                      Lexical variable '$code'
#                                                      Argument list [1 item]
#                                                          Item 0
#                                                              Lexical variable '$el'
#                                              If body
#                                                  Instruction
#                                                      Take
#                                                          Lexical variable '$el'
#          Method 'flatten' { -> $result }
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$new'
#                          Value list [0 items]
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$el'
#                      Expression ('in' parameter)
#                          Special variable '*self'
#                      For body
#                          If
#                              Expression ('if' parameter)
#                                  Call
#                                      Special property '*instanceOf'
#                                          Lexical variable '$el'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Bareword 'List'
#                              If body
#                                  Instruction
#                                      Call
#                                          Property 'push'
#                                              Lexical variable '$new'
#                                          Named argument list [1 item]
#                                              Item 0
#                                                  Pair 'items'
#                                                      Call
#                                                          Property 'flatten'
#                                                              Lexical variable '$el'
#                                                          Argument list [0 items]
#                          Else
#                              Else body
#                                  Instruction
#                                      Call
#                                          Property 'push'
#                                              Lexical variable '$new'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  Lexical variable '$el'
#                  Instruction
#                      Return
#                          Lexical variable '$new'
#          Method 'reverse' { -> $result }
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$new'
#                          Value list [0 items]
#                  Instruction
#                      Return
#                          Gather
#                              Gather body
#                                  For (values)
#                                      Expression ('for' parameter)
#                                          Lexical variable '$i'
#                                      Expression ('in' parameter)
#                                          Operation
#                                              Instance variable '@lastIndex'
#                                              Range operator (..)
#                                              Number '0'
#                                      For body
#                                          Instruction
#                                              Take
#                                                  Index
#                                                      Special variable '*self'
#                                                      Index list [1 item]
#                                                          Item 0
#                                                              Lexical variable '$i'
#          Method 'withoutAll' { $what -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$what'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@grep'
#                              Argument list [1 item]
#                                  Item 0
#                                      Anonymous function { -> $result }
#                                          Function body
#                                              Instruction
#                                                  Return
#                                                      Operation
#                                                          Lexical variable '$what'
#                                                          Negated equality operator (!=)
#                                                          Topic variable '$_'
#          Method 'without' { $what -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$what'
#                  Instruction
#                      Local variable declaration
#                          Lexical variable '$found'
#                  Instruction
#                      Return
#                          Gather
#                              Gather body
#                                  For (pairs)
#                                      Expression ('for' parameter)
#                                          Set [2 items]
#                                              Item 0
#                                                  Lexical variable '$i'
#                                              Item 1
#                                                  Lexical variable '$el'
#                                      Expression ('in' parameter)
#                                          Special variable '*self'
#                                      For body
#                                          If
#                                              Expression ('if' parameter)
#                                                  Operation
#                                                      Negation
#                                                          Lexical variable '$found'
#                                                      Logical and operator (&&)
#                                                      Lexical variable '$what'
#                                                      Equality operator (==)
#                                                      Lexical variable '$el'
#                                              If body
#                                                  Instruction
#                                                      Assignment
#                                                          Lexical variable '$found'
#                                                          Boolean true
#                                                  Instruction
#                                                      Next
#                                          Instruction
#                                              Take
#                                                  Lexical variable '$el'
#          Method 'remove' { $what -> $removed $removed }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$what'
#                  Instruction
#                      Return pair 'removed'
#                          Boolean false
#                  For (pairs)
#                      Expression ('for' parameter)
#                          Set [2 items]
#                              Item 0
#                                  Lexical variable '$i'
#                              Item 1
#                                  Lexical variable '$el'
#                      Expression ('in' parameter)
#                          Special variable '*self'
#                      For body
#                          If
#                              Expression ('if' parameter)
#                                  Operation
#                                      Lexical variable '$what'
#                                      Negated equality operator (!=)
#                                      Lexical variable '$el'
#                              If body
#                                  Instruction
#                                      Next
#                          Instruction
#                              Call
#                                  Instance variable '@splice'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Lexical variable '$i'
#                                      Item 1
#                                          Number '1'
#                          Instruction
#                              Return pair 'removed'
#                                  Boolean true
#                          Instruction
#                              Last
#          Method 'removeAll' { $what -> $removed }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$what'
#                  Instruction
#                      Assignment
#                          Lexical variable '$indices'
#                          Gather
#                              Gather body
#                                  For (pairs)
#                                      Expression ('for' parameter)
#                                          Set [2 items]
#                                              Item 0
#                                                  Lexical variable '$i'
#                                              Item 1
#                                                  Lexical variable '$el'
#                                      Expression ('in' parameter)
#                                          Special variable '*self'
#                                      For body
#                                          If
#                                              Expression ('if' parameter)
#                                                  Operation
#                                                      Lexical variable '$what'
#                                                      Negated equality operator (!=)
#                                                      Lexical variable '$el'
#                                              If body
#                                                  Instruction
#                                                      Next
#                                          Instruction
#                                              Take
#                                                  Lexical variable '$i'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$i'
#                      Expression ('in' parameter)
#                          Call
#                              Property 'reverse'
#                                  Lexical variable '$indices'
#                      For body
#                          Instruction
#                              Call
#                                  Instance variable '@splice'
#                                  Argument list [2 items]
#                                      Item 0
#                                          Lexical variable '$i'
#                                      Item 1
#                                          Number '1'
#                  Instruction
#                      Return pair 'removed'
#                          Property 'length'
#                              Lexical variable '$indices'
#          Method 'contains' { $what -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$what'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@any'
#                              Argument list [1 item]
#                                  Item 0
#                                      Anonymous function { -> $result }
#                                          Function body
#                                              Instruction
#                                                  Return
#                                                      Operation
#                                                          Lexical variable '$what'
#                                                          Equality operator (==)
#                                                          Topic variable '$_'
#          Method 'first' { $code:Code -> $result $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$code'
#                          Argument type
#                              Bareword 'Code'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$el'
#                      Expression ('in' parameter)
#                          Special variable '*self'
#                      For body
#                          If
#                              Expression ('if' parameter)
#                                  Call
#                                      Lexical variable '$code'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Lexical variable '$el'
#                              If body
#                                  Instruction
#                                      Return
#                                          Lexical variable '$el'
#                  Instruction
#                      Return
#                          Undefined
#          Method 'any' { $code:Code -> $result $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$code'
#                          Argument type
#                              Bareword 'Code'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$el'
#                      Expression ('in' parameter)
#                          Special variable '*self'
#                      For body
#                          If
#                              Expression ('if' parameter)
#                                  Call
#                                      Lexical variable '$code'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Lexical variable '$el'
#                              If body
#                                  Instruction
#                                      Return
#                                          Boolean true
#                  Instruction
#                      Return
#                          Boolean false
#          Method 'all' { $code:Code -> $result $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$code'
#                          Argument type
#                              Bareword 'Code'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$el'
#                      Expression ('in' parameter)
#                          Special variable '*self'
#                      For body
#                          If
#                              Expression ('if' parameter)
#                                  Negation
#                                      Call
#                                          Lexical variable '$code'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  Lexical variable '$el'
#                              If body
#                                  Instruction
#                                      Return
#                                          Boolean false
#                  Instruction
#                      Return
#                          Boolean true
#          Computed property 'sum' { -> $result $result }
#              Function body
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@empty'
#                      If body
#                          Instruction
#                              Return
#                                  Undefined
#                  Instruction
#                      Assignment
#                          Lexical variable '$c'
#                          Index
#                              Special variable '*self'
#                              Index list [1 item]
#                                  Item 0
#                                      Number '0'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$i'
#                      Expression ('in' parameter)
#                          Operation
#                              Number '1'
#                              Range operator (..)
#                              Instance variable '@lastIndex'
#                      For body
#                          Instruction
#                              Assignment
#                                  Lexical variable '$c'
#                                  Operation
#                                      Lexical variable '$c'
#                                      Addition operator (+)
#                                      Index
#                                          Special variable '*self'
#                                          Index list [1 item]
#                                              Item 0
#                                                  Lexical variable '$i'
#                  Instruction
#                      Return
#                          Lexical variable '$c'
#          Computed property 'sum0' { -> $result }
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$c'
#                          Number '0'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$el'
#                      Expression ('in' parameter)
#                          Special variable '*self'
#                      For body
#                          Instruction
#                              Assignment
#                                  Lexical variable '$c'
#                                  Operation
#                                      Lexical variable '$c'
#                                      Addition operator (+)
#                                      Lexical variable '$el'
#                  Instruction
#                      Return
#                          Lexical variable '$c'
#          Computed property 'iterator' { -> Iterator }
#              Function body
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'ListIterator'
#                              Argument list [1 item]
#                                  Item 0
#                                      Special variable '*self'
#                          Bareword 'Iterator'
#          Method 'opAdd' { $rhs:List -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$rhs'
#                          Argument type
#                              Bareword 'List'
#                  Instruction
#                      Assignment
#                          Lexical variable '$new'
#                          Call
#                              Instance variable '@copy'
#                              Argument list [0 items]
#                  Instruction
#                      Call
#                          Property 'push'
#                              Lexical variable '$new'
#                          Named argument list [1 item]
#                              Item 0
#                                  Pair 'items'
#                                      Lexical variable '$rhs'
#                  Instruction
#                      Return
#                          Lexical variable '$new'
#          Method 'opSub' { $rhs:List -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$rhs'
#                          Argument type
#                              Bareword 'List'
#                  Instruction
#                      Assignment
#                          Lexical variable '$new'
#                          Call
#                              Instance variable '@copy'
#                              Argument list [0 items]
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$remove'
#                      Expression ('in' parameter)
#                          Lexical variable '$rhs'
#                      For body
#                          Instruction
#                              Call
#                                  Property 'removeAll'
#                                      Lexical variable '$new'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Lexical variable '$remove'
#                  Instruction
#                      Return
#                          Lexical variable '$new'
#      Include (Code, Iterator, List, ListIterator, T)
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

my $pos = before_content( 'List.frt', './std/Extension/List.frt' );

use Ferret::Core::Operations qw(_not add all_true bool equal nequal num range);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Anonymous function definition with topicalizer
    my $func_5 = function_def(
        $f, undef, undef,
        [ { name => '_' } ],
        undef,
        sub {
            my ( $scope, $self, $this, undef, $args, $ret ) = &args_v1;
            my $ins = $args->{_};
            return $ret_func->( nequal( $scope, $$scope->{'what'}, $ins ) );
            return $ret;
        }
    );

    # Anonymous function definition with topicalizer
    my $func_10 = function_def(
        $f, undef, undef,
        [ { name => '_' } ],
        undef,
        sub {
            my ( $scope, $self, $this, undef, $args, $ret ) = &args_v1;
            my $ins = $args->{_};
            return $ret_func->( equal( $scope, $$scope->{'what'}, $ins ) );
            return $ret;
        }
    );

    # Class 'List'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'List', undef, [ \'T' ] );

        # Method event 'empty' definition
        my $func_0 = method_event_def(
            $f, $scope, 'empty', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    equal( $scope, $$self->{'length'}, num( $f, "0" ) ) );
                return $ret;
            }
        );

        # Method event 'map' definition
        my $func_1 = method_event_def(
            $f, $scope, 'map',
            [
                {
                    name     => 'code',
                    type     => 'Code',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'code', 18.2 ) || return $ret_func->();
                return $ret_func->(
                    do {
                        my ( $gather_status, $gather_ret ) = gather(
                            $f, $scope,
                            sub {
                                my ( $scope, $take, $ret_func ) = @_;
                                {
                                    my ( $loop_status, $loop_ret ) = iterate(
                                        $f, $scope,
                                        ${ $scope->{special} }->{'self'},
                                        'el',
                                        sub {
                                            my ( $scope, $ret_func ) = @_;
                                            $take->(
                                                $$scope->{'code'}->(
                                                    [ $$scope->{'el'} ],
                                                    $scope,
                                                    undef,
                                                    $pos->(20.3)
                                                )
                                            );
                                        },
                                        $pos->(19.2)
                                    );
                                    return $ret_func->($loop_ret)
                                      if $loop_status eq 'return';
                                }
                            }
                        );
                        return $ret_func->($gather_ret)
                          if $gather_status eq 'return';
                        $gather_ret;
                      }
                );
                return $ret;
            }
        );

        # Method event 'grep' definition
        my $func_2 = method_event_def(
            $f, $scope, 'grep',
            [
                {
                    name     => 'code',
                    type     => 'Code',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'code', 26.2 ) || return $ret_func->();
                return $ret_func->(
                    do {
                        my ( $gather_status, $gather_ret ) = gather(
                            $f, $scope,
                            sub {
                                my ( $scope, $take, $ret_func ) = @_;
                                {
                                    my ( $loop_status, $loop_ret ) = iterate(
                                        $f, $scope,
                                        ${ $scope->{special} }->{'self'},
                                        'el',
                                        sub {
                                            my ( $scope, $ret_func ) = @_;
                                            if (
                                                bool(
                                                    $$scope->{'code'}->(
                                                        [ $$scope->{'el'} ],
                                                        $scope,
                                                        undef,
                                                        $pos->(28.15)
                                                    )
                                                )
                                              )
                                            {
                                                my $scope =
                                                  Ferret::Scope->new( $f,
                                                    parent => $scope );

                                                $take->( $$scope->{'el'} );
                                            }
                                        },
                                        $pos->(27.2)
                                    );
                                    return $ret_func->($loop_ret)
                                      if $loop_status eq 'return';
                                }
                            }
                        );
                        return $ret_func->($gather_ret)
                          if $gather_status eq 'return';
                        $gather_ret;
                      }
                );
                return $ret;
            }
        );

        # Method event 'flatten' definition
        my $func_3 = method_event_def(
            $f, $scope,
            'flatten',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var(
                    $scope,
                    new => create_list( $f, [] ),
                    $file_scope, $pos->(34.2)
                );
                {
                    my ( $loop_status, $loop_ret ) = iterate(
                        $f, $scope,
                        ${ $scope->{special} }->{'self'},
                        'el',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            if (
                                bool(
                                    $$scope->{'el'}->property_u( '*instanceOf',
                                        $pos->(36.3) )->(
                                        [ $$scope->{'List'} ], $scope,
                                        undef,                 $pos->(36.4)
                                        )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                $$scope->{'new'}
                                  ->property_u( 'push', $pos->(37.1) )->(
                                    [
                                        undef,
                                        [
                                            items => $$scope->{'el'}
                                              ->property_u( 'flatten',
                                                $pos->(37.3) )->(
                                                [ undef, [] ], $scope,
                                                undef, $pos->(37.35)
                                                )
                                        ]
                                    ],
                                    $scope, undef,
                                    $pos->(37.15)
                                  );
                            }
                            else {
                                $$scope->{'new'}
                                  ->property_u( 'push', $pos->(39.2) )->(
                                    [ $$scope->{'el'} ],
                                    $scope, undef, $pos->(39.3)
                                  );
                            }
                        },
                        $pos->(35.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret_func->( $$scope->{'new'} );
                return $ret;
            }
        );

        # Method event 'reverse' definition
        my $func_4 = method_event_def(
            $f, $scope,
            'reverse',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var(
                    $scope,
                    new => create_list( $f, [] ),
                    $file_scope, $pos->(46.2)
                );
                return $ret_func->(
                    do {
                        my ( $gather_status, $gather_ret ) = gather(
                            $f, $scope,
                            sub {
                                my ( $scope, $take, $ret_func ) = @_;
                                {
                                    my ( $loop_status, $loop_ret ) = iterate(
                                        $f, $scope,
                                        range(
                                            $scope,
                                            $$self->{'lastIndex'},
                                            num( $f, "0" )
                                        ),
                                        'i',
                                        sub {
                                            my ( $scope, $ret_func ) = @_;
                                            $take->(
                                                ${ $scope->{special} }
                                                  ->{'self'}->get_index_value(
                                                    [ $$scope->{'i'} ],
                                                    $scope,
                                                    $pos->(48.3)
                                                  )
                                            );
                                        },
                                        $pos->(47.2)
                                    );
                                    return $ret_func->($loop_ret)
                                      if $loop_status eq 'return';
                                }
                            }
                        );
                        return $ret_func->($gather_ret)
                          if $gather_status eq 'return';
                        $gather_ret;
                      }
                );
                return $ret;
            }
        );

        # Method event 'withoutAll' definition
        my $func_6 = method_event_def(
            $f, $scope,
            'withoutAll',
            [
                {
                    name     => 'what',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'what', 53.2 ) || return $ret_func->();
                return $ret_func->(
                    $$self->{'grep'}->(
                        [
                            $func_5->inside_scope(
                                (undef) => $scope,
                                undef, $class, $ins, undef, undef
                            )
                        ],
                        $scope, undef,
                        $pos->(54.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'without' definition
        my $func_7 = method_event_def(
            $f, $scope,
            'without',
            [
                {
                    name     => 'what',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'what', 60.2 ) || return $ret_func->();
                $scope->set_property(
                    found => Ferret::undefined,
                    $pos->(61.2)
                );
                return $ret_func->(
                    do {
                        my ( $gather_status, $gather_ret ) = gather(
                            $f, $scope,
                            sub {
                                my ( $scope, $take, $ret_func ) = @_;
                                {
                                    my ( $loop_status, $loop_ret ) =
                                      iterate_pair(
                                        $f, $scope,
                                        ${ $scope->{special} }->{'self'},
                                        'i', 'el',
                                        sub {
                                            my ( $scope, $ret_func ) = @_;
                                            if (
                                                bool(
                                                    all_true(
                                                        $scope,
                                                        sub {
                                                            _not(
                                                                $$scope->{
                                                                    'found'} );
                                                        },
                                                        sub {
                                                            equal(
                                                                $scope,
                                                                $$scope->{
                                                                    'what'},
                                                                $$scope->{'el'}
                                                            );
                                                        }
                                                    )
                                                )
                                              )
                                            {
                                                my $scope =
                                                  Ferret::Scope->new( $f,
                                                    parent => $scope );

                                                var(
                                                    $scope,
                                                    found => $true,
                                                    $file_scope, $pos->(64.2)
                                                );
                                                return 'next';
                                            }
                                            $take->( $$scope->{'el'} );
                                        },
                                        $pos->(62.1)
                                      );
                                    return $ret_func->($loop_ret)
                                      if $loop_status eq 'return';
                                }
                            }
                        );
                        return $ret_func->($gather_ret)
                          if $gather_status eq 'return';
                        $gather_ret;
                      }
                );
                return $ret;
            }
        );

        # Method event 'remove' definition
        my $func_8 = method_event_def(
            $f, $scope, 'remove',
            [
                {
                    name     => 'what',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'what', 73.2 ) || return $ret_func->();
                $ret->set_property( removed => $false, $pos->(74.2) );
                {
                    my ( $loop_status, $loop_ret ) = iterate_pair(
                        $f, $scope,
                        ${ $scope->{special} }->{'self'},
                        'i', 'el',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            if (
                                bool(
                                    nequal(
                                        $scope, $$scope->{'what'},
                                        $$scope->{'el'}
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                return 'next';
                            }
                            $$self->{'splice'}->(
                                [ $$scope->{'i'}, num( $f, "1" ) ],
                                $scope, undef, $pos->(78.2)
                            );
                            $ret->set_property(
                                removed => $true,
                                $pos->(79.2)
                            );
                            return 'last';
                        },
                        $pos->(75.05)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret;
            }
        );

        # Method event 'removeAll' definition
        my $func_9 = method_event_def(
            $f, $scope,
            'removeAll',
            [
                {
                    name     => 'what',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'what', 86.2 ) || return $ret_func->();
                var(
                    $scope,
                    indices => do {
                        my ( $gather_status, $gather_ret ) = gather(
                            $f, $scope,
                            sub {
                                my ( $scope, $take, $ret_func ) = @_;
                                {
                                    my ( $loop_status, $loop_ret ) =
                                      iterate_pair(
                                        $f, $scope,
                                        ${ $scope->{special} }->{'self'},
                                        'i', 'el',
                                        sub {
                                            my ( $scope, $ret_func ) = @_;
                                            if (
                                                bool(
                                                    nequal(
                                                        $scope,
                                                        $$scope->{'what'},
                                                        $$scope->{'el'}
                                                    )
                                                )
                                              )
                                            {
                                                my $scope =
                                                  Ferret::Scope->new( $f,
                                                    parent => $scope );

                                                return 'next';
                                            }
                                            $take->( $$scope->{'i'} );
                                        },
                                        $pos->(89.15)
                                      );
                                    return $ret_func->($loop_ret)
                                      if $loop_status eq 'return';
                                }
                            }
                        );
                        return $ret_func->($gather_ret)
                          if $gather_status eq 'return';
                        $gather_ret;
                    },
                    $file_scope,
                    $pos->(89.1)
                );
                {
                    my ( $loop_status, $loop_ret ) = iterate(
                        $f, $scope,
                        $$scope->{'indices'}
                          ->property_u( 'reverse', $pos->(96.5) )
                          ->( [ undef, [] ], $scope, undef, $pos->(96.6) ),
                        'i',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            $$self->{'splice'}->(
                                [ $$scope->{'i'}, num( $f, "1" ) ],
                                $scope, undef, $pos->(97.2)
                            );
                        },
                        $pos->(96.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                $ret->set_property(
                    removed => $$scope->{'indices'}
                      ->property_u( 'length', $pos->(99.4) ),
                    $pos->(99.2)
                );
                return $ret;
            }
        );

        # Method event 'contains' definition
        my $func_11 = method_event_def(
            $f, $scope,
            'contains',
            [
                {
                    name     => 'what',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'what', 105.2 ) || return $ret_func->();
                return $ret_func->(
                    $$self->{'any'}->(
                        [
                            $func_10->inside_scope(
                                (undef) => $scope,
                                undef, $class, $ins, undef, undef
                            )
                        ],
                        $scope, undef,
                        $pos->(106.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'first' definition
        my $func_12 = method_event_def(
            $f, $scope, 'first',
            [
                {
                    name     => 'code',
                    type     => 'Code',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'code', 111.2 ) || return $ret_func->();
                {
                    my ( $loop_status, $loop_ret ) = iterate(
                        $f, $scope,
                        ${ $scope->{special} }->{'self'},
                        'el',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            if (
                                bool(
                                    $$scope->{'code'}->(
                                        [ $$scope->{'el'} ], $scope,
                                        undef,               $pos->(113.15)
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                return $ret_func->( $$scope->{'el'} );
                            }
                        },
                        $pos->(112.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret_func->($undefined);
                return $ret;
            }
        );

        # Method event 'any' definition
        my $func_13 = method_event_def(
            $f, $scope, 'any',
            [
                {
                    name     => 'code',
                    type     => 'Code',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'code', 120.2 ) || return $ret_func->();
                {
                    my ( $loop_status, $loop_ret ) = iterate(
                        $f, $scope,
                        ${ $scope->{special} }->{'self'},
                        'el',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            if (
                                bool(
                                    $$scope->{'code'}->(
                                        [ $$scope->{'el'} ], $scope,
                                        undef,               $pos->(122.15)
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                return $ret_func->($true);
                            }
                        },
                        $pos->(121.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret_func->($false);
                return $ret;
            }
        );

        # Method event 'all' definition
        my $func_14 = method_event_def(
            $f, $scope, 'all',
            [
                {
                    name     => 'code',
                    type     => 'Code',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'code', 129.2 ) || return $ret_func->();
                {
                    my ( $loop_status, $loop_ret ) = iterate(
                        $f, $scope,
                        ${ $scope->{special} }->{'self'},
                        'el',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            if (
                                bool(
                                    _not(
                                        $$scope->{'code'}->(
                                            [ $$scope->{'el'} ],
                                            $scope,
                                            undef,
                                            $pos->(131.2)
                                        )
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                return $ret_func->($false);
                            }
                        },
                        $pos->(130.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret_func->($true);
                return $ret;
            }
        );

        # Method event 'sum' definition
        my $func_15 = method_event_def(
            $f, $scope, 'sum', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                if ( bool( $$self->{'empty'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->($undefined);
                }
                var(
                    $scope,
                    c => ${ $scope->{special} }->{'self'}->get_index_value(
                        [ num( $f, "0" ) ],
                        $scope, $pos->(141.4)
                    ),
                    $file_scope,
                    $pos->(141.2)
                );
                {
                    my ( $loop_status, $loop_ret ) = iterate(
                        $f, $scope,
                        range( $scope, num( $f, "1" ), $$self->{'lastIndex'} ),
                        'i',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            var(
                                $scope,
                                c => add(
                                    $scope,
                                    $$scope->{'c'},
                                    ${ $scope->{special} }->{'self'}
                                      ->get_index_value(
                                        [ $$scope->{'i'} ], $scope,
                                        $pos->(143.3)
                                      )
                                ),
                                $file_scope,
                                $pos->(143.1)
                            );
                        },
                        $pos->(142.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret_func->( $$scope->{'c'} );
                return $ret;
            }
        );

        # Method event 'sum0' definition
        my $func_16 = method_event_def(
            $f, $scope, 'sum0', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var( $scope, c => num( $f, "0" ), $file_scope, $pos->(151.2) );
                {
                    my ( $loop_status, $loop_ret ) = iterate(
                        $f, $scope,
                        ${ $scope->{special} }->{'self'},
                        'el',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            var(
                                $scope,
                                c => add(
                                    $scope, $$scope->{'c'}, $$scope->{'el'}
                                ),
                                $file_scope,
                                $pos->(153.2)
                            );
                        },
                        $pos->(152.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret_func->( $$scope->{'c'} );
                return $ret;
            }
        );

        # Method event 'iterator' definition
        my $func_17 = method_event_def(
            $f, $scope,
            'iterator',
            undef,
            [ { name => 'result', type => 'Iterator' } ],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$scope->{'ListIterator'}->(
                        [ ${ $scope->{special} }->{'self'} ], $scope,
                        undef,                                $pos->(160.3)
                    )
                );
                return $ret;
            }
        );

        # Method event 'opAdd' definition
        my $func_18 = method_event_def(
            $f, $scope, 'opAdd',
            [
                {
                    name     => 'rhs',
                    type     => 'List',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'rhs', 165.2 ) || return $ret_func->();
                var(
                    $scope,
                    new => $$self->{'copy'}
                      ->( [ undef, [] ], $scope, undef, $pos->(166.4) ),
                    $file_scope, $pos->(166.2)
                );
                $$scope->{'new'}->property_u( 'push', $pos->(167.2) )->(
                    [ undef, [ items => $$scope->{'rhs'} ] ],
                    $scope, undef, $pos->(167.3)
                );
                return $ret_func->( $$scope->{'new'} );
                return $ret;
            }
        );

        # Method event 'opSub' definition
        my $func_19 = method_event_def(
            $f, $scope, 'opSub',
            [
                {
                    name     => 'rhs',
                    type     => 'List',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'rhs', 174.2 ) || return $ret_func->();
                var(
                    $scope,
                    new => $$self->{'copy'}
                      ->( [ undef, [] ], $scope, undef, $pos->(175.4) ),
                    $file_scope, $pos->(175.2)
                );
                {
                    my ( $loop_status, $loop_ret ) = iterate(
                        $f, $scope,
                        $$scope->{'rhs'},
                        'remove',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            $$scope->{'new'}
                              ->property_u( 'removeAll', $pos->(177.2) )->(
                                [ $$scope->{'remove'} ],
                                $scope, undef, $pos->(177.3)
                              );
                        },
                        $pos->(176.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                return $ret_func->( $$scope->{'new'} );
                return $ret;
            }
        );
        $func_0->inside_scope(
            empty => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_1->inside_scope(
            map => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_2->inside_scope(
            grep => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            flatten => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_4->inside_scope(
            reverse => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_6->inside_scope(
            withoutAll => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_7->inside_scope(
            without => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_8->inside_scope(
            remove => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_9->inside_scope(
            removeAll => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_11->inside_scope(
            contains => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_12->inside_scope(
            first => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_13->inside_scope(
            any => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_14->inside_scope(
            all => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_15->inside_scope( sum => $scope, $proto, $class, $ins, 1, undef );
        $func_16->inside_scope(
            sum0 => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_17->inside_scope(
            iterator => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_18->inside_scope(
            opAdd => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_19->inside_scope(
            opSub => $scope,
            $proto, $class, $ins, undef, undef
        );
        typedef(
            $scope, $class, 'Pairs',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                state $anchor = \0 + 0;
                typedef_check(
                    $scope, $scope, $ins, $anchor,
                    conditions => [
                        sub {
                            $ins->fits_type_u(
                                ${ $scope->{special} }->{'class'} );
                        },
                        sub {
                            $$ins->{'length'}
                              ->property_u( 'even', $pos->(7.3) );
                        }
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            },
            undef
        );
    }
    load_namespaces( $context, qw(Code Iterator List ListIterator T) );
};

after_content();
