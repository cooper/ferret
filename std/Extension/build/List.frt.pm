# === Document Model ===
#  Document './std/Extension/List.frt'
#      Class 'List' <T>
#          Type definition ('Pairs')
#              Body ('type' scope)
#                  Instruction
#                      Isa
#                          Special variable '*class'
#                  Instruction
#                      Satisfies
#                          Property 'even'
#                              Property variable '.length'
#          Computed property 'empty'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Operation
#                              Instance variable '@length'
#                              Equality operator (==)
#                              Number '0'
#          Method 'map'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$code'
#                          Argument type
#                              Bareword 'Code'
#                  Instruction
#                      Return
#                          Gather
#                              Body ('gather' scope)
#                                  For (values)
#                                      Expression ('for' parameter)
#                                          Lexical variable '$el'
#                                      Expression ('in' parameter)
#                                          Special variable '*self'
#                                      Body ('for' scope)
#                                          Instruction
#                                              Take
#                                                  Call
#                                                      Lexical variable '$code'
#                                                      Argument list [1 item]
#                                                          Item 0
#                                                              Lexical variable '$el'
#          Method 'grep'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$code'
#                          Argument type
#                              Bareword 'Code'
#                  Instruction
#                      Return
#                          Gather
#                              Body ('gather' scope)
#                                  For (values)
#                                      Expression ('for' parameter)
#                                          Lexical variable '$el'
#                                      Expression ('in' parameter)
#                                          Special variable '*self'
#                                      Body ('for' scope)
#                                          If
#                                              Expression ('if' parameter)
#                                                  Call
#                                                      Lexical variable '$code'
#                                                      Argument list [1 item]
#                                                          Item 0
#                                                              Lexical variable '$el'
#                                              Body ('if' scope)
#                                                  Instruction
#                                                      Take
#                                                          Lexical variable '$el'
#          Method 'withoutAll'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$what'
#                  Instruction
#                      Return
#                          Call
#                              Instance variable '@grep'
#                              Argument list [1 item]
#                                  Item 0
#                                      Anonymous function
#                                          Body ('function' scope)
#                                              Instruction
#                                                  Return
#                                                      Operation
#                                                          Lexical variable '$what'
#                                                          Negated equality operator (!=)
#                                                          Topic variable '$_'
#          Method 'without'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$what'
#                  Instruction
#                      Local variable declaration
#                          Lexical variable '$found'
#                  Instruction
#                      Return
#                          Gather
#                              Body ('gather' scope)
#                                  For (pairs)
#                                      Expression ('for' parameter)
#                                          Set [2 items]
#                                              Item 0
#                                                  Lexical variable '$i'
#                                              Item 1
#                                                  Lexical variable '$el'
#                                      Expression ('in' parameter)
#                                          Special variable '*self'
#                                      Body ('for' scope)
#                                          If
#                                              Expression ('if' parameter)
#                                                  Operation
#                                                      Negation
#                                                          Lexical variable '$found'
#                                                      Logical and operator (&&)
#                                                      Lexical variable '$what'
#                                                      Equality operator (==)
#                                                      Lexical variable '$el'
#                                              Body ('if' scope)
#                                                  Instruction
#                                                      Assignment
#                                                          Lexical variable '$found'
#                                                          Boolean true
#                                                  Instruction
#                                                      Next
#                                          Instruction
#                                              Take
#                                                  Lexical variable '$el'
#          Method 'remove'
#              Body ('method' scope)
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
#                      Body ('for' scope)
#                          If
#                              Expression ('if' parameter)
#                                  Operation
#                                      Lexical variable '$what'
#                                      Negated equality operator (!=)
#                                      Lexical variable '$el'
#                              Body ('if' scope)
#                                  Instruction
#                                      Next
#                          Instruction
#                              Return pair 'found'
#                                  Lexical variable '$el'
#                          Instruction
#                              Return pair 'removed'
#                                  Boolean true
#                          Instruction
#                              Last
#          Method 'removeAll'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$what'
#                  Instruction
#                      Assignment
#                          Lexical variable '$found'
#                          Gather
#                              Body ('gather' scope)
#                                  For (pairs)
#                                      Expression ('for' parameter)
#                                          Set [2 items]
#                                              Item 0
#                                                  Lexical variable '$i'
#                                              Item 1
#                                                  Lexical variable '$el'
#                                      Expression ('in' parameter)
#                                          Special variable '*self'
#                                      Body ('for' scope)
#                                          If
#                                              Expression ('if' parameter)
#                                                  Operation
#                                                      Lexical variable '$what'
#                                                      Negated equality operator (!=)
#                                                      Lexical variable '$el'
#                                              Body ('if' scope)
#                                                  Instruction
#                                                      Next
#                                          Instruction
#                                              Take
#                                                  Lexical variable '$el'
#                  Instruction
#                      Return pair 'found'
#                          Lexical variable '$found'
#                  Instruction
#                      Return pair 'removed'
#                          Property 'length'
#                              Lexical variable '$found'
#          Method 'first'
#              Body ('method' scope)
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
#                      Body ('for' scope)
#                          If
#                              Expression ('if' parameter)
#                                  Call
#                                      Lexical variable '$code'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Lexical variable '$el'
#                              Body ('if' scope)
#                                  Instruction
#                                      Return
#                                          Lexical variable '$el'
#                  Instruction
#                      Return
#                          Undefined
#          Method 'any'
#              Body ('method' scope)
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
#                      Body ('for' scope)
#                          If
#                              Expression ('if' parameter)
#                                  Call
#                                      Lexical variable '$code'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Lexical variable '$el'
#                              Body ('if' scope)
#                                  Instruction
#                                      Return
#                                          Boolean true
#                  Instruction
#                      Return
#                          Boolean false
#          Method 'all'
#              Body ('method' scope)
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
#                      Body ('for' scope)
#                          If
#                              Expression ('if' parameter)
#                                  Negation
#                                      Call
#                                          Lexical variable '$code'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  Lexical variable '$el'
#                              Body ('if' scope)
#                                  Instruction
#                                      Return
#                                          Boolean false
#                  Instruction
#                      Return
#                          Boolean true
#          Computed property 'sum'
#              Body ('method' scope)
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@empty'
#                      Body ('if' scope)
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
#                      Body ('for' scope)
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
#          Computed property 'sum0'
#              Body ('method' scope)
#                  Instruction
#                      Assignment
#                          Lexical variable '$c'
#                          Number '0'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$el'
#                      Expression ('in' parameter)
#                          Special variable '*self'
#                      Body ('for' scope)
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
#          Computed property 'iterator'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Call
#                              Bareword 'ListIterator'
#                              Argument list [1 item]
#                                  Item 0
#                                      Special variable '*self'
#      Include (Code, ListIterator, T)
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
    my $func_0 = function_def(
        $f, undef, undef,
        [ { name => '_' } ],
        [ { name => 'result', type => '(none)' } ],
        sub {
            my ( $scope, $self, $this, undef, $args, $ret ) = &args_v1;
            my $ins = $args->{_};
            return $ret_func->( nequal( $scope, $$scope->{'what'}, $ins ) );
            return $ret;
        }
    );

    # Class 'List'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'List', undef, [ \'T' ] );

        # Method event 'empty' definition
        my $method_0 = method_event_def(
            $f, $scope, 'empty',
            [],
            [ { name => 'result', type => '(none)' } ],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    equal( $scope, $$self->{'length'}, num( $f, "0" ) ) );
                return $ret;
            }
        );

        # Method event 'map' definition
        my $method_1 = method_event_def(
            $f, $scope, 'map',
            [
                {
                    name     => 'code',
                    type     => 'Code',
                    optional => undef,
                    more     => undef
                }
            ],
            [ { name => 'result', type => '(none)' } ],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'code', 18.2 ) or return;
                return $ret_func->(
                    do {
                        my ( $gather_status, $gather_ret ) = gather(
                            $f, $scope,
                            sub {
                                my ( $scope, $take, $ret_func ) = @_;
                                {
                                    my $loop_ret = iterate(
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
                                    return $ret_func->($loop_ret) if $loop_ret;
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
        my $method_2 = method_event_def(
            $f, $scope, 'grep',
            [
                {
                    name     => 'code',
                    type     => 'Code',
                    optional => undef,
                    more     => undef
                }
            ],
            [ { name => 'result', type => '(none)' } ],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'code', 26.2 ) or return;
                return $ret_func->(
                    do {
                        my ( $gather_status, $gather_ret ) = gather(
                            $f, $scope,
                            sub {
                                my ( $scope, $take, $ret_func ) = @_;
                                {
                                    my $loop_ret = iterate(
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
                                    return $ret_func->($loop_ret) if $loop_ret;
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
        my $method_3 = method_event_def(
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
            [ { name => 'result', type => '(none)' } ],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'what', 34.2 ) or return;
                return $ret_func->(
                    $$self->{'grep'}->(
                        [
                            $func_0->inside_scope(
                                (undef) => $scope,
                                undef, $class, $ins, undef, undef
                            )
                        ],
                        $scope, undef,
                        $pos->(35.15)
                    )
                );
                return $ret;
            }
        );

        # Method event 'without' definition
        my $method_4 = method_event_def(
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
            [ { name => 'result', type => '(none)' } ],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'what', 41.2 ) or return;
                $scope->set_property(
                    found => Ferret::undefined,
                    $pos->(42.2)
                );
                return $ret_func->(
                    do {
                        my ( $gather_status, $gather_ret ) = gather(
                            $f, $scope,
                            sub {
                                my ( $scope, $take, $ret_func ) = @_;
                                {
                                    my $loop_ret = iterate_pair(
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
                                                    $file_scope, $pos->(45.2)
                                                );
                                                return 'next';
                                            }
                                            $take->( $$scope->{'el'} );
                                        },
                                        $pos->(43.1)
                                    );
                                    return $ret_func->($loop_ret) if $loop_ret;
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
        my $method_5 = method_event_def(
            $f, $scope, 'remove',
            [
                {
                    name     => 'what',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            [
                { name => 'found',   type => '(none)' },
                { name => 'removed', type => '(none)' }
            ],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'what', 54.2 ) or return;
                $ret->set_property( removed => $false, $pos->(55.2) );
                {
                    my $loop_ret = iterate_pair(
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
                            $ret->set_property(
                                found => $$scope->{'el'},
                                $pos->(60.2)
                            );
                            $ret->set_property(
                                removed => $true,
                                $pos->(61.2)
                            );
                            return 'last';
                        },
                        $pos->(56.05)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret;
            }
        );

        # Method event 'removeAll' definition
        my $method_6 = method_event_def(
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
            [
                { name => 'removed', type => '(none)' },
                { name => 'found',   type => '(none)' }
            ],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'what', 68.2 ) or return;
                var(
                    $scope,
                    found => do {
                        my ( $gather_status, $gather_ret ) = gather(
                            $f, $scope,
                            sub {
                                my ( $scope, $take, $ret_func ) = @_;
                                {
                                    my $loop_ret = iterate_pair(
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
                                            $take->( $$scope->{'el'} );
                                        },
                                        $pos->(69.15)
                                    );
                                    return $ret_func->($loop_ret) if $loop_ret;
                                }
                            }
                        );
                        return $ret_func->($gather_ret)
                          if $gather_status eq 'return';
                        $gather_ret;
                    },
                    $file_scope,
                    $pos->(69.1)
                );
                $ret->set_property( found => $$scope->{'found'}, $pos->(75.2) );
                $ret->set_property(
                    removed =>
                      $$scope->{'found'}->property_u( 'length', $pos->(76.4) ),
                    $pos->(76.2)
                );
                return $ret;
            }
        );

        # Method event 'first' definition
        my $method_7 = method_event_def(
            $f, $scope, 'first',
            [
                {
                    name     => 'code',
                    type     => 'Code',
                    optional => undef,
                    more     => undef
                }
            ],
            [ { name => 'result', type => '(none)' } ],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'code', 81.2 ) or return;
                {
                    my $loop_ret = iterate(
                        $f, $scope,
                        ${ $scope->{special} }->{'self'},
                        'el',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            if (
                                bool(
                                    $$scope->{'code'}->(
                                        [ $$scope->{'el'} ], $scope,
                                        undef,               $pos->(83.15)
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                return $ret_func->( $$scope->{'el'} );
                            }
                        },
                        $pos->(82.1)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret_func->($undefined);
                return $ret;
            }
        );

        # Method event 'any' definition
        my $method_8 = method_event_def(
            $f, $scope, 'any',
            [
                {
                    name     => 'code',
                    type     => 'Code',
                    optional => undef,
                    more     => undef
                }
            ],
            [ { name => 'result', type => '(none)' } ],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'code', 90.2 ) or return;
                {
                    my $loop_ret = iterate(
                        $f, $scope,
                        ${ $scope->{special} }->{'self'},
                        'el',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            if (
                                bool(
                                    $$scope->{'code'}->(
                                        [ $$scope->{'el'} ], $scope,
                                        undef,               $pos->(92.15)
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                return $ret_func->($true);
                            }
                        },
                        $pos->(91.1)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret_func->($false);
                return $ret;
            }
        );

        # Method event 'all' definition
        my $method_9 = method_event_def(
            $f, $scope, 'all',
            [
                {
                    name     => 'code',
                    type     => 'Code',
                    optional => undef,
                    more     => undef
                }
            ],
            [ { name => 'result', type => '(none)' } ],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'code', 99.2 ) or return;
                {
                    my $loop_ret = iterate(
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
                                            $pos->(101.2)
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
                        $pos->(100.1)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret_func->($true);
                return $ret;
            }
        );

        # Method event 'sum' definition
        my $method_10 = method_event_def(
            $f, $scope, 'sum',
            [],
            [ { name => 'result', type => '(none)' } ],
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
                        $scope, $pos->(111.4)
                    ),
                    $file_scope,
                    $pos->(111.2)
                );
                {
                    my $loop_ret = iterate(
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
                                        $pos->(113.3)
                                      )
                                ),
                                $file_scope,
                                $pos->(113.1)
                            );
                        },
                        $pos->(112.1)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret_func->( $$scope->{'c'} );
                return $ret;
            }
        );

        # Method event 'sum0' definition
        my $method_11 = method_event_def(
            $f, $scope, 'sum0',
            [],
            [ { name => 'result', type => '(none)' } ],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var( $scope, c => num( $f, "0" ), $file_scope, $pos->(121.2) );
                {
                    my $loop_ret = iterate(
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
                                $pos->(123.2)
                            );
                        },
                        $pos->(122.1)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret_func->( $$scope->{'c'} );
                return $ret;
            }
        );

        # Method event 'iterator' definition
        my $method_12 = method_event_def(
            $f, $scope,
            'iterator',
            [],
            [ { name => 'result', type => '(none)' } ],
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->(
                    $$scope->{'ListIterator'}->(
                        [ ${ $scope->{special} }->{'self'} ], $scope,
                        undef,                                $pos->(129.3)
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
            map => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_2->inside_scope(
            grep => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_3->inside_scope(
            withoutAll => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_4->inside_scope(
            without => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_5->inside_scope(
            remove => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_6->inside_scope(
            removeAll => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_7->inside_scope(
            first => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_8->inside_scope(
            any => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_9->inside_scope(
            all => $scope,
            $proto, $class, $ins, undef, undef
        );
        $method_10->inside_scope(
            sum => $scope,
            $proto, $class, $ins, 1, undef
        );
        $method_11->inside_scope(
            sum0 => $scope,
            $proto, $class, $ins, 1, undef
        );
        $method_12->inside_scope(
            iterator => $scope,
            $proto, $class, $ins, 1, undef
        );
        typedef(
            $scope, $class, 'Pairs',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                typedef_check(
                    $scope, $scope, $ins,
                    conditions => [
                        $ins->fits_type_u( ${ $scope->{special} }->{'class'} ),
                        $$ins->{'length'}->property_u( 'even', $pos->(7.3) )
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            },
            undef
        );
    }
    load_namespaces( $context, qw(Code ListIterator T) );
};

after_content();
