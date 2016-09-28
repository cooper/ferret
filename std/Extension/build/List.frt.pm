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
#                  Instruction
#                      Assignment
#                          Lexical variable '$new'
#                          Value list [0 items]
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$el'
#                      Expression ('in' parameter)
#                          Special variable '*self'
#                      Body ('for' scope)
#                          Instruction
#                              Call
#                                  Property 'push'
#                                      Lexical variable '$new'
#                                  Argument list [1 items]
#                                      Item 0
#                                          Call
#                                              Lexical variable '$code'
#                                              Argument list [1 items]
#                                                  Item 0
#                                                      Lexical variable '$el'
#                  Instruction
#                      Return
#                          Lexical variable '$new'
#          Method 'grep'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$code'
#                  Instruction
#                      Assignment
#                          Lexical variable '$new'
#                          Value list [0 items]
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
#                                      Call
#                                          Property 'push'
#                                              Lexical variable '$new'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  Lexical variable '$el'
#                  Instruction
#                      Return
#                          Lexical variable '$new'
#          Method 'first'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$code'
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

FF::before_content('List.frt');

use Ferret::Core::Operations qw(bool);
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
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'code', 12.2 ) or return;
                FF::lex_assign(
                    $scope,
                    new => FF::create_list( $f, [] ),
                    $file_scope, 13.2
                );
                {
                    my $loop_ret = FF::iterate(
                        $f, $scope,
                        ${ $scope->{special} }->{'self'},
                        'el',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            ${ $$scope->{'new'} }->{'push'}->(
                                [
                                    $$scope->{'code'}->(
                                        [ $$scope->{'el'} ], $scope,
                                        undef,               15.25
                                    )
                                ],
                                $scope, undef, 15.15
                            );
                        },
                        14.1
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret_func->( $$scope->{'new'} );
                return $ret;
            }
        );

        # Method event 'grep' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'grep',
            [
                {
                    name     => 'code',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'code', 21.2 ) or return;
                FF::lex_assign(
                    $scope,
                    new => FF::create_list( $f, [] ),
                    $file_scope, 22.2
                );
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
                                        undef,               24.15
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                ${ $$scope->{'new'} }->{'push'}->(
                                    [ $$scope->{'el'} ],
                                    $scope, undef, 24.45
                                );
                            }
                        },
                        23.1
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret_func->( $$scope->{'new'} );
                return $ret;
            }
        );

        # Method event 'first' definition
        my $method_2 = FF::method_event_def(
            $f, $scope, 'first',
            [
                {
                    name     => 'code',
                    type     => undef,
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'code', 31.2 ) or return;
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
                                        undef,               33.15
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                return $ret_func->( $$scope->{'el'} );
                            }
                        },
                        32.1
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                return $ret_func->($undefined);
                return $ret;
            }
        );
        $method_0->inside_scope( map  => $scope, $proto, $class, undef, undef );
        $method_1->inside_scope( grep => $scope, $proto, $class, undef, undef );
        $method_2->inside_scope(
            first => $scope,
            $proto, $class, undef, undef
        );
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
};

FF::after_content();
