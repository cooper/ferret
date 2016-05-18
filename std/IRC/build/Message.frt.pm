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
#                          Lexical variable '$got_tags'
#                  Instruction
#                      Local variable declaration
#                          Lexical variable '$got_source'
#                  Instruction
#                      Local variable declaration
#                          Lexical variable '$got_command'
#                  Instruction
#                      Local variable declaration
#                          Lexical variable '$word'
#                  Instruction
#                      Local variable declaration
#                          Lexical variable '$last_word'
#                  Instruction
#                      Assignment
#                          Lexical variable '$params'
#                          Value list [0 items]
#                  Instruction
#                      Assignment
#                          Lexical variable '$word_i'
#                          Number '0'
#                  Instruction
#                      Assignment
#                          Lexical variable '$word_n'
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
#                                          Lexical variable '$got_source'
#                                          Logical and operator (&&)
#                                          Negation
#                                              Operation
#                                                  Lexical variable '$got_tags'
#                                                  Logical and operator (&&)
#                                                  Lexical variable '$word_i'
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
#                                          Lexical variable '$got_tags'
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
#                                          Lexical variable '$got_command'
#                                          Logical and operator (&&)
#                                          Negation
#                                              Operation
#                                                  Lexical variable '$got_source'
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
#                                          Lexical variable '$got_source'
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
#                                                              Lexical variable '$word_n'
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
                $scope->set_property( got_tags    => Ferret::undefined, );
                $scope->set_property( got_source  => Ferret::undefined, );
                $scope->set_property( got_command => Ferret::undefined, );
                $scope->set_property( word        => Ferret::undefined, );
                $scope->set_property( last_word   => Ferret::undefined, );
                FF::lex_assign(
                    $scope,
                    params => FF::create_list( $f, [] ),
                    $file_scope, 25.2
                );
                FF::lex_assign(
                    $scope,
                    word_i => num( $f, "0" ),
                    $file_scope, 26.2
                );
                FF::lex_assign(
                    $scope,
                    word_n => num( $f, "0" ),
                    $file_scope, 27.2
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
                                            sub { $$scope->{'got_source'} },
                                            sub {
                                                _not(
                                                    all_true(
                                                        $scope,
                                                        sub {
                                                            $$scope->{
                                                                'got_tags'};
                                                        },
                                                        sub {
                                                            equal(
                                                                $scope,
                                                                $$scope->{
                                                                    'word_i'},
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
                                                                32.7
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
                                    33.3 );
                                FF::lex_assign(
                                    $scope,
                                    tags => FF::create_hash( $f, {} ),
                                    $file_scope, 34.2
                                );
                                {
                                    my $loop_ret = FF::iterate(
                                        $f, $scope,
                                        ${ $$scope->{'word'} }->{'split'}->(
                                            [ str( $f, ";" ) ], $scope,
                                            undef, 37.3
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
                                                    40.25
                                                  ),
                                                $file_scope,
                                                40.1
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
                                                            42.2
                                                          )
                                                    ],
                                                    $$scope->{'tagParts'}
                                                      ->get_index_value(
                                                        [ num( $f, "1" ) ],
                                                        $scope, 42.5
                                                      ),
                                                    $scope, 42.4
                                                  );
                                                return 'next';
                                            }
                                            $$scope->{'tags'}->set_index_value(
                                                [ $$scope->{'tag'} ],
                                                $true, $scope, 47.5 );
                                        },
                                        37.05
                                    );
                                    return $ret_func->($loop_ret) if $loop_ret;
                                }
                                FF::lex_assign(
                                    $scope,
                                    got_tags => $true,
                                    $file_scope, 52.2
                                );
                                $self->set_property(
                                    tags => $$scope->{'tags'},
                                    53.2
                                );
                                return 'next';
                            }
                            if (
                                bool(
                                    _not(
                                        all_true(
                                            $scope,
                                            sub { $$scope->{'got_command'} },
                                            sub {
                                                _not(
                                                    all_true(
                                                        $scope,
                                                        sub {
                                                            $$scope->{
                                                                'got_source'};
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
                                                                60.5
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
                                  ->( [ str( $f, ":" ) ], $scope, undef, 61.3 );
                                FF::lex_assign(
                                    $scope,
                                    got_source => $true,
                                    $file_scope, 62.2
                                );
                                $self->set_property(
                                    source => $$scope->{'word'},
                                    63.2
                                );
                                return 'next';
                            }
                            if (
                                bool(
                                    ${ $$scope->{'word'} }->{'hasPrefix'}->(
                                        [ str( $f, ":" ) ], $scope,
                                        undef, 73.4
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                ${ $$scope->{'params'} }->{'push'}->(
                                    [
                                        $$self->{'_rest'}->get_index_value(
                                            [ $$scope->{'word_n'} ], $scope,
                                            74.25
                                        )
                                    ],
                                    $scope, undef, 74.15
                                );
                                return 'last';
                            }
                            ${ $$self->{'params'} }->{'push'}
                              ->( [ $$scope->{'word'} ], $scope, undef, 79.3 );
                        },
                        29.1
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                $self->set_property( params => $$scope->{'params'}, 90.2 );
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
