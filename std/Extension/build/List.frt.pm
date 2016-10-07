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
#                                                      Argument list [1 items]
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
#                                                      Argument list [1 items]
#                                                          Item 0
#                                                              Lexical variable '$el'
#                                              Body ('if' scope)
#                                                  Instruction
#                                                      Take
#                                                          Lexical variable '$el'
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
#                                      Argument list [1 items]
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
#                                      Argument list [1 items]
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
#                                          Argument list [1 items]
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
#                              Index list [1 items]
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
#                                          Index list [1 items]
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
#      Include (Code, T)
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

my $pos = FF::before_content( 'List.frt', './std/Extension/List.frt' );

use Ferret::Core::Operations qw(_not add bool equal num range);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Class 'List'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'List', undef, [ \'T' ] );

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

        # Method event 'map' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'map',
            [
                {
                    name     => 'code',
                    type     => 'Code',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                FF::need( $scope, $args, 'code', 17.2 ) or return;
                return $ret_func->(
                    do {
                        my ( $gather_status, $gather_ret ) = FF::gather(
                            $f, $scope,
                            sub {
                                my ( $scope, $take, $ret_func ) = @_;
                                {
                                    my $loop_ret = FF::iterate(
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
                                                    $pos->(19.3)
                                                )
                                            );
                                        },
                                        $pos->(18.2)
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
        my $method_2 = FF::method_event_def(
            $f, $scope, 'grep',
            [
                {
                    name     => 'code',
                    type     => 'Code',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                FF::need( $scope, $args, 'code', 25.2 ) or return;
                return $ret_func->(
                    do {
                        my ( $gather_status, $gather_ret ) = FF::gather(
                            $f, $scope,
                            sub {
                                my ( $scope, $take, $ret_func ) = @_;
                                {
                                    my $loop_ret = FF::iterate(
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
                                                        $pos->(27.15)
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
                                        $pos->(26.2)
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

        # Method event 'first' definition
        my $method_3 = FF::method_event_def(
            $f, $scope, 'first',
            [
                {
                    name     => 'code',
                    type     => 'Code',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                FF::need( $scope, $args, 'code', 33.2 ) or return;
                {
                    my $loop_ret = FF::iterate(
                        $f, $scope,
                        ${ $scope->{special} }->{'self'},
                        'el',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            if (
                                bool(
                                    $$scope->{'code'}->(
                                        [ $$scope->{'el'} ], $scope,
                                        undef,               $pos->(35.15)
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                return $ret_func->( $$scope->{'el'} );
                            }
                        },
                        $pos->(34.1)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret_func->($undefined);
                return $ret;
            }
        );

        # Method event 'any' definition
        my $method_4 = FF::method_event_def(
            $f, $scope, 'any',
            [
                {
                    name     => 'code',
                    type     => 'Code',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                FF::need( $scope, $args, 'code', 42.2 ) or return;
                {
                    my $loop_ret = FF::iterate(
                        $f, $scope,
                        ${ $scope->{special} }->{'self'},
                        'el',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            if (
                                bool(
                                    $$scope->{'code'}->(
                                        [ $$scope->{'el'} ], $scope,
                                        undef,               $pos->(44.15)
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                return $ret_func->($true);
                            }
                        },
                        $pos->(43.1)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret_func->($false);
                return $ret;
            }
        );

        # Method event 'all' definition
        my $method_5 = FF::method_event_def(
            $f, $scope, 'all',
            [
                {
                    name     => 'code',
                    type     => 'Code',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                FF::need( $scope, $args, 'code', 51.2 ) or return;
                {
                    my $loop_ret = FF::iterate(
                        $f, $scope,
                        ${ $scope->{special} }->{'self'},
                        'el',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            if (
                                bool(
                                    _not(
                                        $$scope->{'code'}->(
                                            [ $$scope->{'el'} ], $scope,
                                            undef,               $pos->(53.2)
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
                        $pos->(52.1)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret_func->($true);
                return $ret;
            }
        );

        # Method event 'sum' definition
        my $method_6 = FF::method_event_def(
            $f, $scope, 'sum',
            [],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                if ( bool( $$self->{'empty'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->($undefined);
                }
                FF::lex_assign(
                    $scope,
                    c => ${ $scope->{special} }->{'self'}->get_index_value(
                        [ num( $f, "0" ) ],
                        $scope, $pos->(63.4)
                    ),
                    $file_scope,
                    $pos->(63.2)
                );
                {
                    my $loop_ret = FF::iterate(
                        $f, $scope,
                        range( $scope, num( $f, "1" ), $$self->{'lastIndex'} ),
                        'i',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            FF::lex_assign(
                                $scope,
                                c => add(
                                    $scope,
                                    $$scope->{'c'},
                                    ${ $scope->{special} }->{'self'}
                                      ->get_index_value(
                                        [ $$scope->{'i'} ], $scope,
                                        $pos->(65.3)
                                      )
                                ),
                                $file_scope,
                                $pos->(65.1)
                            );
                        },
                        $pos->(64.1)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret_func->( $$scope->{'c'} );
                return $ret;
            }
        );

        # Method event 'sum0' definition
        my $method_7 = FF::method_event_def(
            $f, $scope, 'sum0',
            [],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                FF::lex_assign(
                    $scope,
                    c => num( $f, "0" ),
                    $file_scope, $pos->(73.2)
                );
                {
                    my $loop_ret = FF::iterate(
                        $f, $scope,
                        ${ $scope->{special} }->{'self'},
                        'el',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            FF::lex_assign(
                                $scope,
                                c => add(
                                    $scope, $$scope->{'c'}, $$scope->{'el'}
                                ),
                                $file_scope,
                                $pos->(75.2)
                            );
                        },
                        $pos->(74.1)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret_func->( $$scope->{'c'} );
                return $ret;
            }
        );
        $method_0->inside_scope( empty => $scope, $proto, $class, 1, undef );
        $method_1->inside_scope( map  => $scope, $proto, $class, undef, undef );
        $method_2->inside_scope( grep => $scope, $proto, $class, undef, undef );
        $method_3->inside_scope(
            first => $scope,
            $proto, $class, undef, undef
        );
        $method_4->inside_scope( any  => $scope, $proto, $class, undef, undef );
        $method_5->inside_scope( all  => $scope, $proto, $class, undef, undef );
        $method_6->inside_scope( sum  => $scope, $proto, $class, 1,     undef );
        $method_7->inside_scope( sum0 => $scope, $proto, $class, 1,     undef );
        FF::typedef(
            $scope, $class, 'Pairs',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                FF::typedef_check(
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
    FF::load_namespaces( $context, qw(Code T) );
};

FF::after_content();
