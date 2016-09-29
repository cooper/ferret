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
#                              Want
#                                  Lexical variable '$incN'
#                                  Argument type
#                                      Bareword 'Bool'
#                          Instruction
#                              Assignment
#                                  Lexical variable '$wordI'
#                                  Operation
#                                      Lexical variable '$wordI'
#                                      Addition operator (+)
#                                      Number '1'
#                          If
#                              Expression ('if' parameter)
#                                  Lexical variable '$incN'
#                              Body ('if' scope)
#                                  Instruction
#                                      Assignment
#                                          Lexical variable '$wordN'
#                                          Operation
#                                              Lexical variable '$wordN'
#                                              Addition operator (+)
#                                              Number '1'
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
#                                      Call
#                                          Bareword 'updateWord'
#                                          Argument list [0 items]
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
#                                      Assignment
#                                          Lexical variable '$rest'
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
#                                  Instruction
#                                      Call
#                                          Property 'push'
#                                              Lexical variable '$params'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  Lexical variable '$rest'
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
#                                  Argument list [1 items]
#                                      Item 0
#                                          Boolean true
#                  Instruction
#                      Assignment
#                          Instance variable '@params'
#                          Lexical variable '$params'
#      Include (Bool, Str, Str::NE)
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

use Ferret::Core::Operations qw(_not add all_true bool equal gr8r num rgx str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'IRC' );
    my $scope = $file_scope;
    FF::load_core('IRC');

    # Function event 'updateWord' definition
    my $func_0 = FF::function_event_def(
        $f, $scope,
        'updateWord',
        undef,
        [ { name => 'incN', type => 'Bool', optional => 1, more => undef } ],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            FF::want( $scope, $args, 'incN', 24.2 );
            FF::lex_assign(
                $scope,
                wordI => add( $scope, $$scope->{'wordI'}, num( $f, "1" ) ),
                $file_scope, 25.2
            );
            if ( bool( $$scope->{'incN'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                FF::lex_assign(
                    $scope,
                    wordN => add( $scope, $$scope->{'wordN'}, num( $f, "1" ) ),
                    $file_scope, 27.2
                );
            }
            FF::lex_assign(
                $scope,
                lastWord => $$scope->{'word'},
                $file_scope, 28.2
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
                if ( bool( $$scope->{'data'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $$self->{'parse'}
                      ->( [ $$scope->{'data'} ], $scope, undef, 10.2 );
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
                FF::need( $scope, $args, 'data', 14.2 ) or return;
                FF::lex_assign(
                    $scope,
                    words => ${ $$scope->{'data'} }->{'split'}->(
                        [ rgx( $f, undef, "\\s+", undef ) ], $scope,
                        undef, 15.5
                    ),
                    $file_scope,
                    15.2
                );
                $scope->set_property( gotTags    => Ferret::undefined, 18.1 );
                $scope->set_property( gotSource  => Ferret::undefined, 18.2 );
                $scope->set_property( gotCommand => Ferret::undefined, 18.3 );
                $scope->set_property( word       => Ferret::undefined, 18.4 );
                $scope->set_property( lastWord   => Ferret::undefined, 18.5 );
                FF::lex_assign(
                    $scope,
                    params => FF::create_list( $f, [] ),
                    $file_scope, 19.2
                );
                FF::lex_assign(
                    $scope,
                    wordI => num( $f, "0" ),
                    $file_scope, 20.2
                );
                FF::lex_assign(
                    $scope,
                    wordN => num( $f, "0" ),
                    $file_scope, 21.2
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
                                                $scope, undef, 34.7
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
                                        undef, 35.5
                                      ),
                                    $file_scope,
                                    35.2
                                );
                                FF::lex_assign(
                                    $scope,
                                    tags => FF::create_hash( $f, {} ),
                                    $file_scope, 36.2
                                );
                                {
                                    my $loop_ret = FF::iterate(
                                        $f, $scope,
                                        ${ $$scope->{'word'} }->{'split'}->(
                                            [ str( $f, ";" ) ], $scope,
                                            undef, 39.3
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
                                                    42.25
                                                  ),
                                                $file_scope,
                                                42.1
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
                                                            44.2
                                                          )
                                                    ],
                                                    $$scope->{'tagParts'}
                                                      ->get_index_value(
                                                        [ num( $f, "1" ) ],
                                                        $scope, 44.5
                                                      ),
                                                    $scope, 44.4
                                                  );
                                                return 'next';
                                            }
                                            $$scope->{'tags'}->set_index_value(
                                                [ $$scope->{'tag'} ],
                                                $true, $scope, 49.5 );
                                        },
                                        39.05
                                    );
                                    return $ret_func->($loop_ret) if $loop_ret;
                                }
                                FF::lex_assign(
                                    $scope,
                                    gotTags => $true,
                                    $file_scope, 54.2
                                );
                                $self->set_property(
                                    tags => $$scope->{'tags'},
                                    55.2
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
                                $$scope->{'updateWord'}
                                  ->( {}, $scope, undef, 67.2 );
                                return 'next';
                            }
                            if ( bool( _not( $$scope->{'gotCommand'} ) ) ) {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                FF::lex_assign(
                                    $scope,
                                    gotCommand => $true,
                                    $file_scope, 73.2
                                );
                                $self->set_property(
                                    command => $$scope->{'word'},
                                    74.2
                                );
                                $$scope->{'updateWord'}
                                  ->( {}, $scope, undef, 76.2 );
                                return 'next';
                            }
                            if (
                                bool(
                                    ${ $$scope->{'word'} }->{'hasPrefix'}->(
                                        [ str( $f, ":" ) ], $scope,
                                        undef, 81.4
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                FF::lex_assign(
                                    $scope,
                                    rest => ${
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
                                            $scope, undef, 82.16667
                                          )->get_index_value(
                                            [ $$scope->{'wordI'} ], $scope,
                                            82.43333
                                          )
                                      }->{'trimPrefix'}->(
                                        [ str( $f, ":" ) ], $scope,
                                        undef, 82.56667
                                      ),
                                    $file_scope,
                                    82.06667
                                );
                                ${ $$scope->{'params'} }->{'push'}->(
                                    [ $$scope->{'rest'} ],
                                    $scope, undef, 83.3
                                );
                                return 'last';
                            }
                            ${ $$scope->{'params'} }->{'push'}
                              ->( [ $$scope->{'word'} ], $scope, undef, 88.3 );
                            $$scope->{'updateWord'}
                              ->( [$true], $scope, undef, 90.2 );
                        },
                        31.1
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                $self->set_property( params => $$scope->{'params'}, 93.2 );
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
    FF::load_namespaces( $context, qw(Bool Str Str::NE) );
};

FF::after_content();
