# === Document Model ===
#  Document './std/Extension/List.frt'
#      Class 'List'
#          Type definition ('Pairs')
#              Body ('type' scope)
#                  Instruction
#                      Isa
#                          Special variable '*class'
#                  Instruction
#                      Satisfies
#                          Property 'even'
#                              Property variable '.length'
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
#      Include (Code)
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

use Ferret::Core::Operations qw(_not bool);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Class 'List'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'List', undef, undef );

        # Method event 'map' definition
        my $method_0 = FF::method_event_def(
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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'code', 12.2 ) or return;
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
                                                    $pos->(14.3)
                                                )
                                            );
                                        },
                                        $pos->(13.2)
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
        my $method_1 = FF::method_event_def(
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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'code', 20.2 ) or return;
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
                                                        $pos->(22.15)
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
                                        $pos->(21.2)
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
        my $method_2 = FF::method_event_def(
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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'code', 28.2 ) or return;
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
                                        undef,               $pos->(30.15)
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                return $ret_func->( $$scope->{'el'} );
                            }
                        },
                        $pos->(29.1)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret_func->($undefined);
                return $ret;
            }
        );

        # Method event 'any' definition
        my $method_3 = FF::method_event_def(
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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'code', 37.2 ) or return;
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
                                        undef,               $pos->(39.15)
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                return $ret_func->($true);
                            }
                        },
                        $pos->(38.1)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret_func->($false);
                return $ret;
            }
        );

        # Method event 'all' definition
        my $method_4 = FF::method_event_def(
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
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'code', 46.2 ) or return;
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
                                            undef,               $pos->(48.2)
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
                        $pos->(47.1)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret_func->($true);
                return $ret;
            }
        );
        $method_0->inside_scope( map  => $scope, $proto, $class, undef, undef );
        $method_1->inside_scope( grep => $scope, $proto, $class, undef, undef );
        $method_2->inside_scope(
            first => $scope,
            $proto, $class, undef, undef
        );
        $method_3->inside_scope( any => $scope, $proto, $class, undef, undef );
        $method_4->inside_scope( all => $scope, $proto, $class, undef, undef );
        FF::typedef(
            $scope, $class, 'Pairs',
            sub {
                my ( $ins, $create_can, $transform ) = @_;
                FF::typedef_check(
                    $scope, $scope, $ins,
                    conditions => [
                        $ins->fits_type_u( ${ $scope->{special} }->{'class'} ),
                        ${ $$ins->{'length'} }->{'even'}
                    ],
                    equal_to => undef
                ) ? $ins : undef;
            },
            undef
        );
    }
    FF::load_namespaces( $context, qw(Code) );
};

FF::after_content();
