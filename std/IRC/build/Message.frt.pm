# === Document Model ===
#  Document './std/IRC/Message.frt'
#      Package 'IRC'
#      Class 'Message'
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Lexical variable '$data'
#                          Argument type
#                              Bareword 'Str::NonEmpty'
#                  If
#                      Expression ('if' parameter)
#                          Lexical variable '$data'
#                      Body ('if' scope)
#                          Instruction
#                              Call
#                                  Instance variable '@parse'
#                                  Argument list [1 items]
#                                      Item 0
#                                          Lexical variable '$data'
#                  Instruction
#                      Assignment
#                          Instance variable '@_rest'
#                          Value list [0 items]
#          Method 'parse'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$data'
#                          Argument type
#                              Bareword 'Str::NonEmpty'
#                  Instruction
#                      Assignment
#                          Lexical variable '$words'
#                          Call
#                              Property 'split'
#                                  Lexical variable '$data'
#                              Argument list [1 items]
#                                  Item 0
#                                      Regex /\s+/
#                  Instruction
#                      Local variable declaration
#                          Lexical variable '$gotTags'
#                  Instruction
#                      Local variable declaration
#                          Lexical variable '$gotSource'
#                  Instruction
#                      Local variable declaration
#                          Lexical variable '$gotCommand'
#                  Instruction
#                      Local variable declaration
#                          Lexical variable '$word'
#                  Instruction
#                      Local variable declaration
#                          Lexical variable '$lastWord'
#                  Instruction
#                      Assignment
#                          Lexical variable '$params'
#                          Value list [0 items]
#                  Instruction
#                      Assignment
#                          Lexical variable '$wordI'
#                          Number '0'
#                  Instruction
#                      Assignment
#                          Lexical variable '$wordN'
#                          Number '0'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$word'
#                      Expression ('in' parameter)
#                          Lexical variable '$words'
#                      Body ('for' scope)
#                          If
#                              Expression ('if' parameter)
#                                  Negation
#                                      Operation
#                                          Lexical variable '$gotSource'
#                                          Logical and operator (&&)
#                                          Negation
#                                              Operation
#                                                  Lexical variable '$gotTags'
#                                                  Logical and operator (&&)
#                                                  Lexical variable '$wordI'
#                                                  Equality operator (==)
#                                                  Number '0'
#                                                  Logical and operator (&&)
#                                                  Call
#                                                      Property 'hasPrefix'
#                                                          Lexical variable '$word'
#                                                      Argument list [1 items]
#                                                          Item 0
#                                                              String '@'
#                              Body ('if' scope)
#                                  Instruction
#                                      Call
#                                          Property 'trimPrefix'
#                                              Lexical variable '$word'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  String '@'
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$tags'
#                                          Hash [0 items]
#                                  For (values)
#                                      Expression ('for' parameter)
#                                          Lexical variable '$tag'
#                                      Expression ('in' parameter)
#                                          Call
#                                              Property 'split'
#                                                  Lexical variable '$word'
#                                              Argument list [1 items]
#                                                  Item 0
#                                                      String ';'
#                                      Body ('for' scope)
#                                          Instruction
#                                              Assignment
#                                                  Lexical variable '$tagParts'
#                                                  Call
#                                                      Property 'split'
#                                                          Lexical variable '$tag'
#                                                      Mixed argument list [2 items]
#                                                          Item 0
#                                                              String '='
#                                                          Item 1
#                                                              Pair 'limit'
#                                                                  Number '2'
#                                          If
#                                              Expression ('if' parameter)
#                                                  Operation
#                                                      Property 'length'
#                                                          Lexical variable '$tagParts'
#                                                      Greater than operator (>)
#                                                      Number '1'
#                                              Body ('if' scope)
#                                                  Instruction
#                                                      Assignment
#                                                          Index
#                                                              Lexical variable '$tags'
#                                                              Index list [1 items]
#                                                                  Item 0
#                                                                      Index
#                                                                          Lexical variable '$tagParts'
#                                                                          Index list [1 items]
#                                                                              Item 0
#                                                                                  Number '0'
#                                                          Index
#                                                              Lexical variable '$tagParts'
#                                                              Index list [1 items]
#                                                                  Item 0
#                                                                      Number '1'
#                                                  Instruction
#                                                      LoopStatement
#                                          Instruction
#                                              Assignment
#                                                  Index
#                                                      Lexical variable '$tags'
#                                                      Index list [1 items]
#                                                          Item 0
#                                                              Lexical variable '$tag'
#                                                  Boolean true
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$gotTags'
#                                          Boolean true
#                                  Instruction
#                                      Assignment
#                                          Instance variable '@tags'
#                                          Lexical variable '$tags'
#                                  Instruction
#                                      LoopStatement
#                          If
#                              Expression ('if' parameter)
#                                  Negation
#                                      Operation
#                                          Lexical variable '$gotCommand'
#                                          Logical and operator (&&)
#                                          Negation
#                                              Operation
#                                                  Lexical variable '$gotSource'
#                                                  Logical and operator (&&)
#                                                  Call
#                                                      Property 'hasPrefix'
#                                                          Lexical variable '$word'
#                                                      Argument list [1 items]
#                                                          Item 0
#                                                              String ':'
#                              Body ('if' scope)
#                                  Instruction
#                                      Call
#                                          Property 'trimPrefix'
#                                              Lexical variable '$word'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  String ':'
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$gotSource'
#                                          Boolean true
#                                  Instruction
#                                      Assignment
#                                          Instance variable '@source'
#                                          Lexical variable '$word'
#                                  Instruction
#                                      LoopStatement
#                          If
#                              Expression ('if' parameter)
#                                  Call
#                                      Property 'hasPrefix'
#                                          Lexical variable '$word'
#                                      Argument list [1 items]
#                                          Item 0
#                                              String ':'
#                              Body ('if' scope)
#                                  Instruction
#                                      Call
#                                          Property 'push'
#                                              Lexical variable '$params'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  Index
#                                                      Instance variable '@_rest'
#                                                      Index list [1 items]
#                                                          Item 0
#                                                              Lexical variable '$wordN'
#                                  Instruction
#                                      LoopStatement
#                          Instruction
#                              Call
#                                  Property 'push'
#                                      Instance variable '@params'
#                                  Argument list [1 items]
#                                      Item 0
#                                          Lexical variable '$word'
#                  Instruction
#                      Assignment
#                          Instance variable '@params'
#                          Lexical variable '$params'
#      Include (Str, Str::NonEmpty)
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

FF::before_content('Message.frt');

use Ferret::Core::Operations qw(_not all_true bool equal gr8r num rgx str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'IRC' );
    my $scope = $file_scope;
    FF::load_core('IRC');

    # Class 'Message'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Message', undef, undef );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'data',
                    type     => 'Str::NonEmpty',
                    optional => 1,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::want( $scope, $args, 'data', 7.2 );
                if ( bool( $$scope->{'data'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $$self->{'parse'}
                      ->( [ $$scope->{'data'} ], $scope, undef, 9.2 );
                }
                $self->set_property( _rest => FF::create_list( $f, [] ), 11.2 );
                return $ret;
            }
        );

        # Method event 'parse' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'parse',
            [
                {
                    name     => 'data',
                    type     => 'Str::NonEmpty',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::need( $scope, $args, 'data', 15.2 ) or return;
                FF::lex_assign(
                    $scope,
                    words => ${ $$scope->{'data'} }->{'split'}->(
                        [ rgx( $f, undef, "\\s+", undef ) ], $scope,
                        undef, 16.5
                    ),
                    $file_scope,
                    16.2
                );
                $scope->set_property( gotTags    => Ferret::undefined, 19.1 );
                $scope->set_property( gotSource  => Ferret::undefined, 19.2 );
                $scope->set_property( gotCommand => Ferret::undefined, 19.3 );
                $scope->set_property( word       => Ferret::undefined, 19.4 );
                $scope->set_property( lastWord   => Ferret::undefined, 19.5 );
                FF::lex_assign(
                    $scope,
                    params => FF::create_list( $f, [] ),
                    $file_scope, 20.2
                );
                FF::lex_assign(
                    $scope,
                    wordI => num( $f, "0" ),
                    $file_scope, 21.2
                );
                FF::lex_assign(
                    $scope,
                    wordN => num( $f, "0" ),
                    $file_scope, 22.2
                );
                {
                    my $loop_ret = FF::iterate(
                        $f, $scope,
                        $$scope->{'words'},
                        'word',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            if (
                                bool(
                                    _not(
                                        all_true(
                                            $scope,
                                            sub { $$scope->{'gotSource'} },
                                            sub {
                                                _not(
                                                    all_true(
                                                        $scope,
                                                        sub {
                                                            $$scope->{
                                                                'gotTags'};
                                                        },
                                                        sub {
                                                            equal(
                                                                $scope,
                                                                $$scope->{
                                                                    'wordI'},
                                                                num( $f, "0" )
                                                            );
                                                        },
                                                        sub {
                                                            ${ $$scope->{'word'}
                                                              }->{'hasPrefix'}
                                                              ->(
                                                                [
                                                                    str(
                                                                        $f,
                                                                        "\@"
                                                                    )
                                                                ],
                                                                $scope,
                                                                undef,
                                                                27.7
                                                              );
                                                        }
                                                    )
                                                );
                                            }
                                        )
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                ${ $$scope->{'word'} }->{'trimPrefix'}
                                  ->( [ str( $f, "\@" ) ], $scope, undef,
                                    28.3 );
                                FF::lex_assign(
                                    $scope,
                                    tags => FF::create_hash( $f, {} ),
                                    $file_scope, 29.2
                                );
                                {
                                    my $loop_ret = FF::iterate(
                                        $f, $scope,
                                        ${ $$scope->{'word'} }->{'split'}->(
                                            [ str( $f, ";" ) ], $scope,
                                            undef, 32.3
                                        ),
                                        'tag',
                                        sub {
                                            my ( $scope, $ret_func ) = @_;
                                            FF::lex_assign(
                                                $scope,
                                                tagParts =>
                                                  ${ $$scope->{'tag'} }
                                                  ->{'split'}->(
                                                    [
                                                        str( $f, "=" ),
                                                        {
                                                            limit =>
                                                              num( $f, "2" )
                                                        }
                                                    ],
                                                    $scope, undef,
                                                    35.25
                                                  ),
                                                $file_scope,
                                                35.1
                                            );
                                            if (
                                                bool(
                                                    gr8r(
                                                        $scope,
                                                        ${
                                                            $$scope->{
                                                                'tagParts'}
                                                          }->{'length'},
                                                        num( $f, "1" )
                                                    )
                                                )
                                              )
                                            {
                                                my $scope =
                                                  Ferret::Scope->new( $f,
                                                    parent => $scope );

                                                $$scope->{'tags'}
                                                  ->set_index_value(
                                                    [
                                                        $$scope->{'tagParts'}
                                                          ->get_index_value(
                                                            [ num( $f, "0" ) ],
                                                            $scope,
                                                            37.2
                                                          )
                                                    ],
                                                    $$scope->{'tagParts'}
                                                      ->get_index_value(
                                                        [ num( $f, "1" ) ],
                                                        $scope, 37.5
                                                      ),
                                                    $scope, 37.4
                                                  );
                                                return 'next';
                                            }
                                            $$scope->{'tags'}->set_index_value(
                                                [ $$scope->{'tag'} ],
                                                $true, $scope, 42.5 );
                                        },
                                        32.05
                                    );
                                    return $ret_func->($loop_ret) if $loop_ret;
                                }
                                FF::lex_assign(
                                    $scope,
                                    gotTags => $true,
                                    $file_scope, 47.2
                                );
                                $self->set_property(
                                    tags => $$scope->{'tags'},
                                    48.2
                                );
                                return 'next';
                            }
                            if (
                                bool(
                                    _not(
                                        all_true(
                                            $scope,
                                            sub { $$scope->{'gotCommand'} },
                                            sub {
                                                _not(
                                                    all_true(
                                                        $scope,
                                                        sub {
                                                            $$scope->{
                                                                'gotSource'};
                                                        },
                                                        sub {
                                                            ${ $$scope->{'word'}
                                                              }->{'hasPrefix'}
                                                              ->(
                                                                [
                                                                    str(
                                                                        $f,
                                                                        ":"
                                                                    )
                                                                ],
                                                                $scope,
                                                                undef,
                                                                55.5
                                                              );
                                                        }
                                                    )
                                                );
                                            }
                                        )
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                ${ $$scope->{'word'} }->{'trimPrefix'}
                                  ->( [ str( $f, ":" ) ], $scope, undef, 56.3 );
                                FF::lex_assign(
                                    $scope,
                                    gotSource => $true,
                                    $file_scope, 57.2
                                );
                                $self->set_property(
                                    source => $$scope->{'word'},
                                    58.2
                                );
                                return 'next';
                            }
                            if (
                                bool(
                                    ${ $$scope->{'word'} }->{'hasPrefix'}->(
                                        [ str( $f, ":" ) ], $scope,
                                        undef, 68.4
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                ${ $$scope->{'params'} }->{'push'}->(
                                    [
                                        $$self->{'_rest'}->get_index_value(
                                            [ $$scope->{'wordN'} ], $scope,
                                            69.25
                                        )
                                    ],
                                    $scope, undef, 69.15
                                );
                                return 'last';
                            }
                            ${ $$self->{'params'} }->{'push'}
                              ->( [ $$scope->{'word'} ], $scope, undef, 74.3 );
                        },
                        24.1
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                $self->set_property( params => $$scope->{'params'}, 85.2 );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            parse => $scope,
            $proto, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Str Str::NonEmpty) );
};

FF::after_content();
