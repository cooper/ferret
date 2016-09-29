# === Document Model ===
#  Document './std/IRC/Massage.frt'
#      Package 'IRC'
#      Class 'Massage'
#          Class method 'initializer__'
#              Body ('method' scope)
#                  Instruction
#                      Want
#                          Lexical variable '$data'
#                          Argument type
#                              Bareword 'Str::NE'
#                  Instruction
#                      Assignment
#                          Instance variable '@_rest'
#                          Value list [0 items]
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
#          Method 'parse'
#              Body ('method' scope)
#                  Instruction
#                      Need
#                          Lexical variable '$data'
#                          Argument type
#                              Bareword 'Str::NE'
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
#                  Function 'updateWord'
#                      Body ('function' scope)
#                          Instruction
#                              Assignment
#                                  Lexical variable '$wordI'
#                                  Operation
#                                      Lexical variable '$wordI'
#                                      Addition operator (+)
#                                      Number '1'
#                          Instruction
#                              Assignment
#                                  Lexical variable '$wordN'
#                                  Operation
#                                      Lexical variable '$wordN'
#                                      Addition operator (+)
#                                      Number '1'
#                          Instruction
#                              Assignment
#                                  Lexical variable '$lastWord'
#                                  Lexical variable '$word'
#                  For (values)
#                      Expression ('for' parameter)
#                          Lexical variable '$word'
#                      Expression ('in' parameter)
#                          Lexical variable '$words'
#                      Body ('for' scope)
#                          If
#                              Expression ('if' parameter)
#                                  Operation
#                                      Negation
#                                          Lexical variable '$gotSource'
#                                      Logical and operator (&&)
#                                      Negation
#                                          Lexical variable '$gotTags'
#                                      Logical and operator (&&)
#                                      Lexical variable '$wordI'
#                                      Equality operator (==)
#                                      Number '0'
#                                      Logical and operator (&&)
#                                      Call
#                                          Property 'hasPrefix'
#                                              Lexical variable '$word'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  String '@'
#                              Body ('if' scope)
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$word'
#                                          Call
#                                              Property 'trimPrefix'
#                                                  Lexical variable '$word'
#                                              Argument list [1 items]
#                                                  Item 0
#                                                      String '@'
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
#                                      Assignment
#                                          Lexical variable '$wordN'
#                                          Operation
#                                              Lexical variable '$wordN'
#                                              Subtraction operator (-)
#                                              Number '1'
#                                  Instruction
#                                      Call
#                                          Bareword 'updateWord'
#                                          Argument list [0 items]
#                                  Instruction
#                                      LoopStatement
#                          If
#                              Expression ('if' parameter)
#                                  Operation
#                                      Negation
#                                          Lexical variable '$gotCommand'
#                                      Logical and operator (&&)
#                                      Negation
#                                          Lexical variable '$gotSource'
#                                      Logical and operator (&&)
#                                      Call
#                                          Property 'hasPrefix'
#                                              Lexical variable '$word'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  String ':'
#                              Body ('if' scope)
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$word'
#                                          Call
#                                              Property 'trimPrefix'
#                                                  Lexical variable '$word'
#                                              Argument list [1 items]
#                                                  Item 0
#                                                      String ':'
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$gotSource'
#                                          Boolean true
#                                  Instruction
#                                      Assignment
#                                          Instance variable '@source'
#                                          Lexical variable '$word'
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$wordN'
#                                          Operation
#                                              Lexical variable '$wordN'
#                                              Subtraction operator (-)
#                                              Number '1'
#                                  Instruction
#                                      Call
#                                          Bareword 'updateWord'
#                                          Argument list [0 items]
#                                  Instruction
#                                      LoopStatement
#                          If
#                              Expression ('if' parameter)
#                                  Negation
#                                      Lexical variable '$gotCommand'
#                              Body ('if' scope)
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$gotCommand'
#                                          Boolean true
#                                  Instruction
#                                      Assignment
#                                          Instance variable '@command'
#                                          Lexical variable '$word'
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$wordN'
#                                          Operation
#                                              Lexical variable '$wordN'
#                                              Subtraction operator (-)
#                                              Number '1'
#                                  Instruction
#                                      Call
#                                          Bareword 'updateWord'
#                                          Argument list [0 items]
#                                  Instruction
#                                      LoopStatement
#                          If
#                              Expression ('if' parameter)
#                                  Operation
#                                      Lexical variable '$wordN'
#                                      Greater than or equal to operator (>=)
#                                      Number '0'
#                              Body ('if' scope)
#                                  Instruction
#                                      Assignment
#                                          Index
#                                              Instance variable '@_rest'
#                                              Index list [1 items]
#                                                  Item 0
#                                                      Lexical variable '$wordN'
#                                          Call
#                                              Property 'trimPrefix'
#                                                  Index
#                                                      Call
#                                                          Property 'split'
#                                                              Lexical variable '$data'
#                                                          Mixed argument list [2 items]
#                                                              Item 0
#                                                                  Regex /\s+/
#                                                              Item 1
#                                                                  Pair 'limit'
#                                                                      Operation
#                                                                          Lexical variable '$wordI'
#                                                                          Addition operator (+)
#                                                                          Number '1'
#                                                      Index list [1 items]
#                                                          Item 0
#                                                              Lexical variable '$wordI'
#                                              Argument list [1 items]
#                                                  Item 0
#                                                      String ':'
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
#                                      Lexical variable '$params'
#                                  Argument list [1 items]
#                                      Item 0
#                                          Lexical variable '$word'
#                          Instruction
#                              Call
#                                  Bareword 'updateWord'
#                                  Argument list [0 items]
#                  Instruction
#                      Assignment
#                          Instance variable '@params'
#                          Lexical variable '$params'
#      Include (Str, Str::NE)
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

FF::before_content('Massage.frt');

use Ferret::Core::Operations
  qw(_not _sub add all_true bool equal gr8r gr8r_e num rgx str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'IRC' );
    my $scope = $file_scope;
    FF::load_core('IRC');

    # Function event 'updateWord' definition
    my $func_0 = FF::function_event_def(
        $f, $scope,
        'updateWord',
        undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::lex_assign(
                $scope,
                wordI => add( $scope, $$scope->{'wordI'}, num( $f, "1" ) ),
                $file_scope, 25.2
            );
            FF::lex_assign(
                $scope,
                wordN => add( $scope, $$scope->{'wordN'}, num( $f, "1" ) ),
                $file_scope, 26.2
            );
            FF::lex_assign(
                $scope,
                lastWord => $$scope->{'word'},
                $file_scope, 27.2
            );
            return $ret;
        }
    );

    # Class 'Massage'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Massage', undef, undef );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'data',
                    type     => 'Str::NE',
                    optional => 1,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                FF::want( $scope, $args, 'data', 7.2 );
                $self->set_property( _rest => FF::create_list( $f, [] ), 8.2 );
                if ( bool( $$scope->{'data'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $$self->{'parse'}
                      ->( [ $$scope->{'data'} ], $scope, undef, 11.2 );
                }
                return $ret;
            }
        );

        # Method event 'parse' definition
        my $method_1 = FF::method_event_def(
            $f, $scope, 'parse',
            [
                {
                    name     => 'data',
                    type     => 'Str::NE',
                    optional => undef,
                    more     => undef
                }
            ],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                $func_0->inside_scope(
                    updateWord => $scope,
                    $scope, $class, undef, undef
                );
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
                                    all_true(
                                        $scope,
                                        sub { _not( $$scope->{'gotSource'} ) },
                                        sub { _not( $$scope->{'gotTags'} ) },
                                        sub {
                                            equal( $scope, $$scope->{'wordI'},
                                                num( $f, "0" ) );
                                        },
                                        sub {
                                            ${ $$scope->{'word'} }
                                              ->{'hasPrefix'}->(
                                                [ str( $f, "\@" ) ],
                                                $scope, undef, 33.7
                                              );
                                        }
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                FF::lex_assign(
                                    $scope,
                                    word =>
                                      ${ $$scope->{'word'} }->{'trimPrefix'}->(
                                        [ str( $f, "\@" ) ], $scope,
                                        undef, 34.5
                                      ),
                                    $file_scope,
                                    34.2
                                );
                                FF::lex_assign(
                                    $scope,
                                    tags => FF::create_hash( $f, {} ),
                                    $file_scope, 35.2
                                );
                                {
                                    my $loop_ret = FF::iterate(
                                        $f, $scope,
                                        ${ $$scope->{'word'} }->{'split'}->(
                                            [ str( $f, ";" ) ], $scope,
                                            undef, 38.3
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
                                                    41.25
                                                  ),
                                                $file_scope,
                                                41.1
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
                                                            43.2
                                                          )
                                                    ],
                                                    $$scope->{'tagParts'}
                                                      ->get_index_value(
                                                        [ num( $f, "1" ) ],
                                                        $scope, 43.5
                                                      ),
                                                    $scope, 43.4
                                                  );
                                                return 'next';
                                            }
                                            $$scope->{'tags'}->set_index_value(
                                                [ $$scope->{'tag'} ],
                                                $true, $scope, 48.5 );
                                        },
                                        38.05
                                    );
                                    return $ret_func->($loop_ret) if $loop_ret;
                                }
                                FF::lex_assign(
                                    $scope,
                                    gotTags => $true,
                                    $file_scope, 53.2
                                );
                                $self->set_property(
                                    tags => $$scope->{'tags'},
                                    54.2
                                );
                                FF::lex_assign(
                                    $scope,
                                    wordN => _sub(
                                        $scope, $$scope->{'wordN'},
                                        num( $f, "1" )
                                    ),
                                    $file_scope,
                                    56.2
                                );
                                $$scope->{'updateWord'}
                                  ->( {}, $scope, undef, 57.2 );
                                return 'next';
                            }
                            if (
                                bool(
                                    all_true(
                                        $scope,
                                        sub { _not( $$scope->{'gotCommand'} ) },
                                        sub { _not( $$scope->{'gotSource'} ) },
                                        sub {
                                            ${ $$scope->{'word'} }
                                              ->{'hasPrefix'}->(
                                                [ str( $f, ":" ) ],
                                                $scope, undef, 62.5
                                              );
                                        }
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                FF::lex_assign(
                                    $scope,
                                    word =>
                                      ${ $$scope->{'word'} }->{'trimPrefix'}->(
                                        [ str( $f, ":" ) ], $scope,
                                        undef, 63.5
                                      ),
                                    $file_scope,
                                    63.2
                                );
                                FF::lex_assign(
                                    $scope,
                                    gotSource => $true,
                                    $file_scope, 64.2
                                );
                                $self->set_property(
                                    source => $$scope->{'word'},
                                    65.2
                                );
                                FF::lex_assign(
                                    $scope,
                                    wordN => _sub(
                                        $scope, $$scope->{'wordN'},
                                        num( $f, "1" )
                                    ),
                                    $file_scope,
                                    67.2
                                );
                                $$scope->{'updateWord'}
                                  ->( {}, $scope, undef, 68.2 );
                                return 'next';
                            }
                            if ( bool( _not( $$scope->{'gotCommand'} ) ) ) {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                FF::lex_assign(
                                    $scope,
                                    gotCommand => $true,
                                    $file_scope, 74.2
                                );
                                $self->set_property(
                                    command => $$scope->{'word'},
                                    75.2
                                );
                                FF::lex_assign(
                                    $scope,
                                    wordN => _sub(
                                        $scope, $$scope->{'wordN'},
                                        num( $f, "1" )
                                    ),
                                    $file_scope,
                                    77.2
                                );
                                $$scope->{'updateWord'}
                                  ->( {}, $scope, undef, 78.2 );
                                return 'next';
                            }
                            if (
                                bool(
                                    gr8r_e(
                                        $scope, $$scope->{'wordN'},
                                        num( $f, "0" )
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                $$self->{'_rest'}->set_index_value(
                                    [ $$scope->{'wordN'} ],
                                    ${
                                        ${ $$scope->{'data'} }->{'split'}->(
                                            [
                                                rgx( $f, undef, "\\s+", undef ),
                                                {
                                                    limit => add(
                                                        $scope,
                                                        $$scope->{'wordI'},
                                                        num( $f, "1" )
                                                    )
                                                }
                                            ],
                                            $scope, undef, 84.26667
                                          )->get_index_value(
                                            [ $$scope->{'wordI'} ], $scope,
                                            84.53333
                                          )
                                      }->{'trimPrefix'}->(
                                        [ str( $f, ":" ) ], $scope,
                                        undef, 84.66667
                                      ),
                                    $scope, 84.16667
                                );
                            }
                            if (
                                bool(
                                    ${ $$scope->{'word'} }->{'hasPrefix'}->(
                                        [ str( $f, ":" ) ], $scope,
                                        undef, 87.4
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
                                            88.25
                                        )
                                    ],
                                    $scope, undef, 88.15
                                );
                                return 'last';
                            }
                            ${ $$scope->{'params'} }->{'push'}
                              ->( [ $$scope->{'word'} ], $scope, undef, 93.3 );
                            $$scope->{'updateWord'}
                              ->( {}, $scope, undef, 95.2 );
                        },
                        30.1
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                $self->set_property( params => $$scope->{'params'}, 98.2 );
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
    FF::load_namespaces( $context, qw(Str Str::NE) );
};

FF::after_content();
