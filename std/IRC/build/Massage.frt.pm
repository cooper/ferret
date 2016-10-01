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
#                                          Property 'uppercase'
#                                              Lexical variable '$word'
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
#          Computed property '_parsedSource' (lazy)
#              Body ('method' scope)
#                  If
#                      Expression ('if' parameter)
#                          Negation
#                              Instance variable '@source'
#                      Body ('if' scope)
#                          Instruction
#                              Return
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Instance variable '@source'
#                              Similarity operator (=~)
#                              Regex /^(.+)!(.+).../
#                      Body ('if' scope)
#                          Instruction
#                              Return pair 'nick'
#                                  Lexical variable '$1'
#                          Instruction
#                              Return pair 'ident'
#                                  Lexical variable '$2'
#                          Instruction
#                              Return pair 'host'
#                                  Lexical variable '$3'
#          Computed property 'nick'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Property 'nick'
#                              Instance variable '@_parsedSource'
#          Computed property 'ident'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Property 'ident'
#                              Instance variable '@_parsedSource'
#          Computed property 'host'
#              Body ('method' scope)
#                  Instruction
#                      Return
#                          Property 'host'
#                              Instance variable '@_parsedSource'
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

my $pos = FF::before_content( 'Massage.frt', './std/IRC/Massage.frt' );

use Ferret::Core::Operations
  qw(_not add all_true bool equal gr8r num rgx sim str);
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
            FF::want( $scope, $args, 'incN', 25.2 );
            FF::lex_assign(
                $scope,
                wordI => add( $scope, $$scope->{'wordI'}, num( $f, "1" ) ),
                $file_scope, $pos->(26.2)
            );
            if ( bool( $$scope->{'incN'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                FF::lex_assign(
                    $scope,
                    wordN => add( $scope, $$scope->{'wordN'}, num( $f, "1" ) ),
                    $file_scope, $pos->(28.2)
                );
            }
            FF::lex_assign(
                $scope,
                lastWord => $$scope->{'word'},
                $file_scope, $pos->(29.2)
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
                      ->( [ $$scope->{'data'} ], $scope, undef, $pos->(10.2) );
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
                        undef, $pos->(16.5)
                    ),
                    $file_scope,
                    $pos->(16.2)
                );
                $scope->set_property(
                    gotTags => Ferret::undefined,
                    $pos->(19.1)
                );
                $scope->set_property(
                    gotSource => Ferret::undefined,
                    $pos->(19.2)
                );
                $scope->set_property(
                    gotCommand => Ferret::undefined,
                    $pos->(19.3)
                );
                $scope->set_property( word => Ferret::undefined, $pos->(19.4) );
                $scope->set_property(
                    lastWord => Ferret::undefined,
                    $pos->(19.5)
                );
                FF::lex_assign(
                    $scope,
                    params => FF::create_list( $f, [] ),
                    $file_scope, $pos->(20.2)
                );
                FF::lex_assign(
                    $scope,
                    wordI => num( $f, "0" ),
                    $file_scope, $pos->(21.2)
                );
                FF::lex_assign(
                    $scope,
                    wordN => num( $f, "0" ),
                    $file_scope, $pos->(22.2)
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
                                                $scope, undef, $pos->(35.7)
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
                                        undef, $pos->(36.5)
                                      ),
                                    $file_scope,
                                    $pos->(36.2)
                                );
                                FF::lex_assign(
                                    $scope,
                                    tags => FF::create_hash( $f, {} ),
                                    $file_scope, $pos->(37.2)
                                );
                                {
                                    my $loop_ret = FF::iterate(
                                        $f, $scope,
                                        ${ $$scope->{'word'} }->{'split'}->(
                                            [ str( $f, ";" ) ], $scope,
                                            undef, $pos->(40.3)
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
                                                    $pos->(44.25)
                                                  ),
                                                $file_scope,
                                                $pos->(44.1)
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
                                                            $pos->(46.2)
                                                          )
                                                    ],
                                                    $$scope->{'tagParts'}
                                                      ->get_index_value(
                                                        [ num( $f, "1" ) ],
                                                        $scope,
                                                        $pos->(46.5)
                                                      ),
                                                    $scope,
                                                    $pos->(46.4)
                                                  );
                                                return 'next';
                                            }
                                            $$scope->{'tags'}->set_index_value(
                                                [ $$scope->{'tag'} ],
                                                $true, $scope, $pos->(51.5) );
                                        },
                                        $pos->(40.05)
                                    );
                                    return $ret_func->($loop_ret) if $loop_ret;
                                }
                                FF::lex_assign(
                                    $scope,
                                    gotTags => $true,
                                    $file_scope, $pos->(56.2)
                                );
                                $self->set_property(
                                    tags => $$scope->{'tags'},
                                    $pos->(57.2)
                                );
                                $$scope->{'updateWord'}
                                  ->( {}, $scope, undef, $pos->(59.2) );
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
                                                $scope, undef, $pos->(64.5)
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
                                        undef, $pos->(65.5)
                                      ),
                                    $file_scope,
                                    $pos->(65.2)
                                );
                                FF::lex_assign(
                                    $scope,
                                    gotSource => $true,
                                    $file_scope, $pos->(66.2)
                                );
                                $self->set_property(
                                    source => $$scope->{'word'},
                                    $pos->(67.2)
                                );
                                $$scope->{'updateWord'}
                                  ->( {}, $scope, undef, $pos->(69.2) );
                                return 'next';
                            }
                            if ( bool( _not( $$scope->{'gotCommand'} ) ) ) {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                FF::lex_assign(
                                    $scope,
                                    gotCommand => $true,
                                    $file_scope, $pos->(75.2)
                                );
                                $self->set_property(
                                    command =>
                                      ${ $$scope->{'word'} }->{'uppercase'},
                                    $pos->(76.2)
                                );
                                $$scope->{'updateWord'}
                                  ->( {}, $scope, undef, $pos->(78.2) );
                                return 'next';
                            }
                            if (
                                bool(
                                    ${ $$scope->{'word'} }->{'hasPrefix'}->(
                                        [ str( $f, ":" ) ], $scope,
                                        undef, $pos->(83.4)
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
                                            $scope, undef,
                                            $pos->(84.16667)
                                          )->get_index_value(
                                            [ $$scope->{'wordI'} ], $scope,
                                            $pos->(84.43333)
                                          )
                                      }->{'trimPrefix'}->(
                                        [ str( $f, ":" ) ], $scope,
                                        undef, $pos->(84.56667)
                                      ),
                                    $file_scope,
                                    $pos->(84.06667)
                                );
                                ${ $$scope->{'params'} }->{'push'}->(
                                    [ $$scope->{'rest'} ],
                                    $scope, undef, $pos->(85.3)
                                );
                                return 'last';
                            }
                            ${ $$scope->{'params'} }->{'push'}->(
                                [ $$scope->{'word'} ],
                                $scope, undef, $pos->(90.3)
                            );
                            $$scope->{'updateWord'}
                              ->( [$true], $scope, undef, $pos->(92.2) );
                        },
                        $pos->(32.1)
                    );
                    return $ret_func->($loop_ret) if $loop_ret;
                }
                $self->set_property(
                    params => $$scope->{'params'},
                    $pos->(95.2)
                );
                return $ret;
            }
        );

        # Method event '_parsedSource' definition
        my $method_2 = FF::method_event_def(
            $f, $scope,
            '_parsedSource',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                if ( bool( _not( $$self->{'source'} ) ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->();
                }
                if (
                    bool(
                        sim(
                            $scope, $$self->{'source'},
                            rgx( $f, undef, "^(.+)!(.+)\\\@(.+)\$", undef )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $ret->set_property( nick => $$scope->{'1'}, $pos->(102.2) );
                    $ret->set_property(
                        ident => $$scope->{'2'},
                        $pos->(103.2)
                    );
                    $ret->set_property( host => $$scope->{'3'}, $pos->(104.2) );
                }
                return $ret;
            }
        );

        # Method event 'nick' definition
        my $method_3 = FF::method_event_def(
            $f, $scope, 'nick',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                return $ret_func->( ${ $$self->{'_parsedSource'} }->{'nick'} );
                return $ret;
            }
        );

        # Method event 'ident' definition
        my $method_4 = FF::method_event_def(
            $f, $scope, 'ident',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                return $ret_func->( ${ $$self->{'_parsedSource'} }->{'ident'} );
                return $ret;
            }
        );

        # Method event 'host' definition
        my $method_5 = FF::method_event_def(
            $f, $scope, 'host',
            [],
            sub {
                my ( $self, $args, $call_scope, $scope, $ret ) = @_;
                return $ret_func->( ${ $$self->{'_parsedSource'} }->{'host'} );
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
        $method_2->inside_scope(
            _parsedSource => $scope,
            $proto, $class, 1, 1
        );
        $method_3->inside_scope( nick  => $scope, $proto, $class, 1, undef );
        $method_4->inside_scope( ident => $scope, $proto, $class, 1, undef );
        $method_5->inside_scope( host  => $scope, $proto, $class, 1, undef );
    }
    FF::load_namespaces( $context, qw(Bool Str Str::NE) );
};

FF::after_content();
