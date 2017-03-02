# === Document Model ===
#  File './std/IRC/Massage.frt'
#      Package 'IRC'
#          Class 'Massage'
#              Class method 'initializer__' { ?$data:Str::NE ?$connection:Connection }
#                  Function body
#                      Instruction
#                          Want
#                              Lexical variable '$data'
#                              Argument type
#                                  Bareword 'Str::NE'
#                      If
#                          Expression ('if' parameter)
#                              Lexical variable '$data'
#                          If body
#                              Instruction
#                                  Call
#                                      Instance variable '@parse'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Lexical variable '$data'
#                      Instruction
#                          Want
#                              Instance variable '@connection'
#                              Argument type
#                                  Bareword 'Connection'
#                      Instruction
#                          Weaken modifier
#                              Instance variable '@connection'
#              Method 'parse' { $data:Str::NE }
#                  Function body
#                      Instruction
#                          Need
#                              Lexical variable '$data'
#                              Argument type
#                                  Bareword 'Str::NE'
#                      Instruction
#                          Assignment
#                              Lexical variable '$words'
#                              Call
#                                  Property 'split'
#                                      Lexical variable '$data'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Regex /\s+/
#                      Instruction
#                          Local variable declaration
#                              Lexical variable '$gotTags'
#                      Instruction
#                          Local variable declaration
#                              Lexical variable '$gotSource'
#                      Instruction
#                          Local variable declaration
#                              Lexical variable '$gotCommand'
#                      Instruction
#                          Local variable declaration
#                              Lexical variable '$word'
#                      Instruction
#                          Local variable declaration
#                              Lexical variable '$lastWord'
#                      Instruction
#                          Assignment
#                              Lexical variable '$params'
#                              Value list [0 items]
#                      Instruction
#                          Assignment
#                              Lexical variable '$wordI'
#                              Number '0'
#                      Instruction
#                          Assignment
#                              Lexical variable '$wordN'
#                              Number '0'
#                      Function 'updateWord' { ?$incN:Bool }
#                          Function body
#                              Instruction
#                                  Want
#                                      Lexical variable '$incN'
#                                      Argument type
#                                          Bareword 'Bool'
#                              Instruction
#                                  Addition assignment
#                                      Lexical variable '$wordI'
#                                      Number '1'
#                              If
#                                  Expression ('if' parameter)
#                                      Lexical variable '$incN'
#                                  If body
#                                      Instruction
#                                          Addition assignment
#                                              Lexical variable '$wordN'
#                                              Number '1'
#                              Instruction
#                                  Assignment
#                                      Lexical variable '$lastWord'
#                                      Lexical variable '$word'
#                      For (values)
#                          Expression ('for' parameter)
#                              Lexical variable '$word'
#                          Expression ('in' parameter)
#                              Lexical variable '$words'
#                          For body
#                              If
#                                  Expression ('if' parameter)
#                                      Operation
#                                          Negation
#                                              Lexical variable '$gotSource'
#                                          Logical and operator (&&)
#                                          Negation
#                                              Lexical variable '$gotTags'
#                                          Logical and operator (&&)
#                                          Lexical variable '$wordI'
#                                          Equality operator (==)
#                                          Number '0'
#                                          Logical and operator (&&)
#                                          Call
#                                              Property 'hasPrefix'
#                                                  Lexical variable '$word'
#                                              Argument list [1 item]
#                                                  Item 0
#                                                      String '@'
#                                  If body
#                                      Instruction
#                                          Assignment
#                                              Lexical variable '$word'
#                                              Call
#                                                  Property 'trimPrefix'
#                                                      Lexical variable '$word'
#                                                  Argument list [1 item]
#                                                      Item 0
#                                                          String '@'
#                                      Instruction
#                                          Assignment
#                                              Lexical variable '$tags'
#                                              Hash [0 items]
#                                      For (values)
#                                          Expression ('for' parameter)
#                                              Lexical variable '$tag'
#                                          Expression ('in' parameter)
#                                              Call
#                                                  Property 'split'
#                                                      Lexical variable '$word'
#                                                  Argument list [1 item]
#                                                      Item 0
#                                                          String ';'
#                                          For body
#                                              Instruction
#                                                  Assignment
#                                                      Lexical variable '$tagParts'
#                                                      Call
#                                                          Property 'split'
#                                                              Lexical variable '$tag'
#                                                          Mixed argument list [2 items]
#                                                              Item 0
#                                                                  String '='
#                                                              Item 1
#                                                                  Pair 'limit'
#                                                                      Number '2'
#                                              If
#                                                  Expression ('if' parameter)
#                                                      Operation
#                                                          Property 'length'
#                                                              Lexical variable '$tagParts'
#                                                          Greater than operator (>)
#                                                          Number '1'
#                                                  If body
#                                                      Instruction
#                                                          Assignment
#                                                              Index
#                                                                  Lexical variable '$tags'
#                                                                  Index list [1 item]
#                                                                      Item 0
#                                                                          Index
#                                                                              Lexical variable '$tagParts'
#                                                                              Index list [1 item]
#                                                                                  Item 0
#                                                                                      Number '0'
#                                                              Index
#                                                                  Lexical variable '$tagParts'
#                                                                  Index list [1 item]
#                                                                      Item 0
#                                                                          Number '1'
#                                                      Instruction
#                                                          Next
#                                              Instruction
#                                                  Assignment
#                                                      Index
#                                                          Lexical variable '$tags'
#                                                          Index list [1 item]
#                                                              Item 0
#                                                                  Lexical variable '$tag'
#                                                      Boolean true
#                                      Instruction
#                                          Assignment
#                                              Lexical variable '$gotTags'
#                                              Boolean true
#                                      Instruction
#                                          Assignment
#                                              Instance variable '@tags'
#                                              Lexical variable '$tags'
#                                      Instruction
#                                          Call
#                                              Bareword 'updateWord'
#                                              Argument list [0 items]
#                                      Instruction
#                                          Next
#                              If
#                                  Expression ('if' parameter)
#                                      Operation
#                                          Negation
#                                              Lexical variable '$gotCommand'
#                                          Logical and operator (&&)
#                                          Negation
#                                              Lexical variable '$gotSource'
#                                          Logical and operator (&&)
#                                          Call
#                                              Property 'hasPrefix'
#                                                  Lexical variable '$word'
#                                              Argument list [1 item]
#                                                  Item 0
#                                                      String ':'
#                                  If body
#                                      Instruction
#                                          Assignment
#                                              Lexical variable '$word'
#                                              Call
#                                                  Property 'trimPrefix'
#                                                      Lexical variable '$word'
#                                                  Argument list [1 item]
#                                                      Item 0
#                                                          String ':'
#                                      Instruction
#                                          Assignment
#                                              Lexical variable '$gotSource'
#                                              Boolean true
#                                      Instruction
#                                          Assignment
#                                              Instance variable '@source'
#                                              Lexical variable '$word'
#                                      Instruction
#                                          Call
#                                              Bareword 'updateWord'
#                                              Argument list [0 items]
#                                      Instruction
#                                          Next
#                              If
#                                  Expression ('if' parameter)
#                                      Negation
#                                          Lexical variable '$gotCommand'
#                                  If body
#                                      Instruction
#                                          Assignment
#                                              Lexical variable '$gotCommand'
#                                              Boolean true
#                                      Instruction
#                                          Assignment
#                                              Instance variable '@command'
#                                              Property 'uppercase'
#                                                  Lexical variable '$word'
#                                      Instruction
#                                          Call
#                                              Bareword 'updateWord'
#                                              Argument list [0 items]
#                                      Instruction
#                                          Next
#                              If
#                                  Expression ('if' parameter)
#                                      Call
#                                          Property 'hasPrefix'
#                                              Lexical variable '$word'
#                                          Argument list [1 item]
#                                              Item 0
#                                                  String ':'
#                                  If body
#                                      Instruction
#                                          Assignment
#                                              Lexical variable '$rest'
#                                              Call
#                                                  Property 'trimPrefix'
#                                                      Index
#                                                          Call
#                                                              Property 'split'
#                                                                  Lexical variable '$data'
#                                                              Mixed argument list [2 items]
#                                                                  Item 0
#                                                                      Regex /\s+/
#                                                                  Item 1
#                                                                      Pair 'limit'
#                                                                          Operation
#                                                                              Lexical variable '$wordI'
#                                                                              Addition operator (+)
#                                                                              Number '1'
#                                                          Index list [1 item]
#                                                              Item 0
#                                                                  Lexical variable '$wordI'
#                                                  Argument list [1 item]
#                                                      Item 0
#                                                          String ':'
#                                      Instruction
#                                          Call
#                                              Property 'push'
#                                                  Lexical variable '$params'
#                                              Argument list [1 item]
#                                                  Item 0
#                                                      Lexical variable '$rest'
#                                      Instruction
#                                          Last
#                              Instruction
#                                  Call
#                                      Property 'push'
#                                          Lexical variable '$params'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Lexical variable '$word'
#                              Instruction
#                                  Call
#                                      Bareword 'updateWord'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Boolean true
#                      Instruction
#                          Assignment
#                              Instance variable '@params'
#                              Lexical variable '$params'
#              Computed property 'target' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Call
#                                  Property 'getTarget'
#                                      Maybe
#                                          Instance variable '@connection'
#                                  Argument list [1 item]
#                                      Item 0
#                                          Index
#                                              Instance variable '@params'
#                                              Index list [1 item]
#                                                  Item 0
#                                                      Number '0'
#              Computed property '_parsedSource' (lazy) { -> $result $nick $user $host }
#                  Function body
#                      If
#                          Expression ('if' parameter)
#                              Negation
#                                  Instance variable '@source'
#                          If body
#                              Instruction
#                                  Return
#                      If
#                          Expression ('if' parameter)
#                              Operation
#                                  Instance variable '@source'
#                                  Similarity operator (=~)
#                                  Regex /^(.+)!(.+).../
#                          If body
#                              Instruction
#                                  Return pair 'nick'
#                                      Lexical variable '$1'
#                              Instruction
#                                  Return pair 'user'
#                                      Lexical variable '$2'
#                              Instruction
#                                  Return pair 'host'
#                                      Lexical variable '$3'
#              Computed property 'nick' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Property 'nick'
#                                  Instance variable '@_parsedSource'
#              Computed property 'user' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Property 'user'
#                                  Instance variable '@_parsedSource'
#              Computed property 'host' { -> $result }
#                  Function body
#                      Instruction
#                          Return
#                              Property 'host'
#                                  Instance variable '@_parsedSource'
#          Include (Bool, Connection, Str::NE)
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
use Ferret::Core::Operations
  qw(_not add all_true bool equal gr8r num rgx sim str);

my ( $self, $ins );
my $f = get_ferret();
my ( $true, $false, $undefined, $ret_func ) = get_constant_objects($f);

my $file_name = './std/IRC/Massage.frt';
my $pos = before_content( 'Massage.frt', $file_name );
my $result;

$result = do {
    my ( $file_scope, $context ) = get_context( $f, 'IRC' );
    my $scope = $file_scope;
    load_core('IRC');

    # Function event 'updateWord' definition
    my $func_1 = function_event_def(
        $f, $scope,
        'updateWord',
        undef,
        [ { name => 'incN', type => 'Bool', optional => 1, more => undef } ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            want( $scope, $args, 'incN', 30.2 );
            var(
                $scope,
                wordI => add(
                    $scope, $pos->(31.2),
                    $$scope->{'wordI'}, num( $f, "1" )
                ),
                $file_scope,
                $pos->(31.2)
            );
            if ( bool( $$scope->{'incN'} ) ) {
                my $scope = Ferret::Scope->new( $f, parent => $scope );

                var(
                    $scope,
                    wordN => add(
                        $scope, $pos->(33.2),
                        $$scope->{'wordN'}, num( $f, "1" )
                    ),
                    $file_scope,
                    $pos->(33.2)
                );
            }
            var(
                $scope,
                lastWord => $$scope->{'word'},
                $file_scope, $pos->(34.2)
            );
            return $ret;
        }
    );

    # Class 'Massage'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Massage', undef, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'data',
                    type     => 'Str::NE',
                    optional => 1,
                    more     => undef
                },
                {
                    name     => 'connection',
                    type     => 'Connection',
                    optional => 1,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                want( $scope, $args, 'data', 7.2 );
                if ( bool( $$scope->{'data'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $$self->{'parse'}
                      ->( [ $$scope->{'data'} ], $scope, undef, $pos->(10.2) );
                }
                want( $self, $args, 'connection', 14.2 );

                $self->weaken_property_ow( 'connection', $pos->(15.1) );
                return $ret;
            }
        );

        # Method event 'parse' definition
        my $func_2 = method_event_def(
            $f, $scope, 'parse',
            [
                {
                    name     => 'data',
                    type     => 'Str::NE',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                $func_1->inside_scope(
                    updateWord => $scope,
                    $scope, $class, $ins, undef, undef
                );
                need( $scope, $args, 'data', 20.2 ) || return $ret_func->();
                var(
                    $scope,
                    words =>
                      $$scope->{'data'}->property_u( 'split', $pos->(21.4) )->(
                        [ rgx( $f, undef, "\\s+", undef ) ], $scope,
                        undef, $pos->(21.5)
                      ),
                    $file_scope,
                    $pos->(21.2)
                );
                $scope->set_property(
                    gotTags => Ferret::undefined,
                    $pos->(24.1)
                );
                $scope->set_property(
                    gotSource => Ferret::undefined,
                    $pos->(24.2)
                );
                $scope->set_property(
                    gotCommand => Ferret::undefined,
                    $pos->(24.3)
                );
                $scope->set_property( word => Ferret::undefined, $pos->(24.4) );
                $scope->set_property(
                    lastWord => Ferret::undefined,
                    $pos->(24.5)
                );
                var(
                    $scope,
                    params => create_list( $f, [] ),
                    $file_scope, $pos->(25.2)
                );
                var(
                    $scope,
                    wordI => num( $f, "0" ),
                    $file_scope, $pos->(26.2)
                );
                var(
                    $scope,
                    wordN => num( $f, "0" ),
                    $file_scope, $pos->(27.2)
                );
                {
                    my ( $loop_status, $loop_ret ) = iterate(
                        $f, $scope,
                        $$scope->{'words'},
                        'word',
                        sub {
                            my ( $scope, $ret_func ) = @_;
                            if (
                                bool(
                                    all_true(
                                        $scope,
                                        $pos->(40.2),
                                        sub { _not( $$scope->{'gotSource'} ) },
                                        sub { _not( $$scope->{'gotTags'} ) },
                                        sub {
                                            equal( $scope, $pos->(40.2),
                                                $$scope->{'wordI'},
                                                num( $f, "0" ) );
                                        },
                                        sub {
                                            $$scope->{'word'}
                                              ->property_u( 'hasPrefix',
                                                $pos->(40.65) )->(
                                                [ str( $f, "\@" ) ],
                                                $scope, undef, $pos->(40.7)
                                                );
                                        }
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                var(
                                    $scope,
                                    word => $$scope->{'word'}->property_u(
                                        'trimPrefix', $pos->(41.4)
                                      )->(
                                        [ str( $f, "\@" ) ], $scope,
                                        undef, $pos->(41.5)
                                      ),
                                    $file_scope,
                                    $pos->(41.2)
                                );
                                var(
                                    $scope,
                                    tags => create_hash( $f, [] ),
                                    $file_scope, $pos->(42.2)
                                );
                                {
                                    my ( $loop_status, $loop_ret ) = iterate(
                                        $f, $scope,
                                        $$scope->{'word'}->property_u(
                                            'split', $pos->(45.25)
                                          )->(
                                            [ str( $f, ";" ) ], $scope,
                                            undef, $pos->(45.3)
                                          ),
                                        'tag',
                                        sub {
                                            my ( $scope, $ret_func ) = @_;
                                            var(
                                                $scope,
                                                tagParts => $$scope->{'tag'}
                                                  ->property_u( 'split',
                                                    $pos->(49.2) )->(
                                                    [
                                                        str( $f, "=" ),
                                                        [
                                                            limit =>
                                                              num( $f, "2" )
                                                        ]
                                                    ],
                                                    $scope, undef,
                                                    $pos->(49.25)
                                                    ),
                                                $file_scope,
                                                $pos->(49.1)
                                            );
                                            if (
                                                bool(
                                                    gr8r(
                                                        $scope,
                                                        $pos->(50.4),
                                                        $$scope->{'tagParts'}
                                                          ->property_u(
                                                            'length',
                                                            $pos->(50.3)
                                                          ),
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
                                                            $pos->(51.2)
                                                          )
                                                    ],
                                                    $$scope->{'tagParts'}
                                                      ->get_index_value(
                                                        [ num( $f, "1" ) ],
                                                        $scope,
                                                        $pos->(51.5)
                                                      ),
                                                    $scope,
                                                    $pos->(51.4)
                                                  );
                                                return 'next';
                                            }
                                            $$scope->{'tags'}->set_index_value(
                                                [ $$scope->{'tag'} ],
                                                $true, $scope, $pos->(56.5) );
                                        },
                                        $pos->(45.05)
                                    );
                                    return $ret_func->($loop_ret)
                                      if $loop_status eq 'return';
                                }
                                var(
                                    $scope,
                                    gotTags => $true,
                                    $file_scope, $pos->(61.2)
                                );
                                $self->set_property(
                                    tags => $$scope->{'tags'},
                                    $pos->(62.2)
                                );
                                $$scope->{'updateWord'}->(
                                    [ undef, [] ],
                                    $scope, undef, $pos->(64.2)
                                );
                                return 'next';
                            }
                            if (
                                bool(
                                    all_true(
                                        $scope,
                                        $pos->(69.2),
                                        sub { _not( $$scope->{'gotCommand'} ) },
                                        sub { _not( $$scope->{'gotSource'} ) },
                                        sub {
                                            $$scope->{'word'}
                                              ->property_u( 'hasPrefix',
                                                $pos->(69.45) )->(
                                                [ str( $f, ":" ) ],
                                                $scope, undef, $pos->(69.5)
                                                );
                                        }
                                    )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                var(
                                    $scope,
                                    word => $$scope->{'word'}->property_u(
                                        'trimPrefix', $pos->(70.4)
                                      )->(
                                        [ str( $f, ":" ) ], $scope,
                                        undef, $pos->(70.5)
                                      ),
                                    $file_scope,
                                    $pos->(70.2)
                                );
                                var(
                                    $scope,
                                    gotSource => $true,
                                    $file_scope, $pos->(71.2)
                                );
                                $self->set_property(
                                    source => $$scope->{'word'},
                                    $pos->(72.2)
                                );
                                $$scope->{'updateWord'}->(
                                    [ undef, [] ],
                                    $scope, undef, $pos->(74.2)
                                );
                                return 'next';
                            }
                            if ( bool( _not( $$scope->{'gotCommand'} ) ) ) {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                var(
                                    $scope,
                                    gotCommand => $true,
                                    $file_scope, $pos->(80.2)
                                );
                                $self->set_property(
                                    command => $$scope->{'word'}
                                      ->property_u( 'uppercase', $pos->(81.4) ),
                                    $pos->(81.2)
                                );
                                $$scope->{'updateWord'}->(
                                    [ undef, [] ],
                                    $scope, undef, $pos->(83.2)
                                );
                                return 'next';
                            }
                            if (
                                bool(
                                    $$scope->{'word'}
                                      ->property_u( 'hasPrefix', $pos->(88.3) )
                                      ->(
                                        [ str( $f, ":" ) ], $scope,
                                        undef, $pos->(88.4)
                                      )
                                )
                              )
                            {
                                my $scope =
                                  Ferret::Scope->new( $f, parent => $scope );

                                var(
                                    $scope,
                                    rest => $$scope->{'data'}
                                      ->property_u( 'split', $pos->(89.13333) )
                                      ->(
                                        [
                                            rgx( $f, undef, "\\s+", undef ),
                                            [
                                                limit => add(
                                                    $scope,
                                                    $pos->(89.33333),
                                                    $$scope->{'wordI'},
                                                    num( $f, "1" )
                                                )
                                            ]
                                        ],
                                        $scope, undef,
                                        $pos->(89.16667)
                                      )->get_index_value(
                                        [ $$scope->{'wordI'} ], $scope,
                                        $pos->(89.43333)
                                      )
                                      ->property_u( 'trimPrefix',
                                        $pos->(89.53333) )->(
                                        [ str( $f, ":" ) ], $scope,
                                        undef, $pos->(89.56667)
                                        ),
                                    $file_scope,
                                    $pos->(89.06667)
                                );
                                $$scope->{'params'}
                                  ->property_u( 'push', $pos->(90.2) )->(
                                    [ $$scope->{'rest'} ],
                                    $scope, undef, $pos->(90.3)
                                  );
                                return 'last';
                            }
                            $$scope->{'params'}
                              ->property_u( 'push', $pos->(95.2) )->(
                                [ $$scope->{'word'} ],
                                $scope, undef, $pos->(95.3)
                              );
                            $$scope->{'updateWord'}
                              ->( [$true], $scope, undef, $pos->(97.2) );
                        },
                        $pos->(37.1)
                    );
                    return $ret_func->($loop_ret) if $loop_status eq 'return';
                }
                $self->set_property(
                    params => $$scope->{'params'},
                    $pos->(100.2)
                );
                return $ret;
            }
        );

        # Method event 'target' definition
        my $func_3 = method_event_def(
            $f, $scope, 'target', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                {
                    my $maybe_0 = $$self->{'connection'};
                    if ( bool($maybe_0) ) {
                        return $ret_func->(
                            $maybe_0->property_u( 'getTarget', $pos->(105.2) )
                              ->(
                                [
                                    $$self->{'params'}->get_index_value(
                                        [ num( $f, "0" ) ], $scope,
                                        $pos->(105.35)
                                    )
                                ],
                                $scope, undef,
                                $pos->(105.25)
                              )
                        );
                    }
                }
                return $ret;
            }
        );

        # Method event '_parsedSource' definition
        my $func_4 = method_event_def(
            $f, $scope,
            '_parsedSource',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                if ( bool( _not( $$self->{'source'} ) ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->();
                }
                if (
                    bool(
                        sim(
                            $scope, $pos->(111.3), $$self->{'source'},
                            rgx( $f, undef, "^(.+)!(.+)\\\@(.+)\$", undef )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    $ret->set_property( nick => $$scope->{'1'}, $pos->(112.2) );
                    $ret->set_property( user => $$scope->{'2'}, $pos->(113.2) );
                    $ret->set_property( host => $$scope->{'3'}, $pos->(114.2) );
                }
                return $ret;
            }
        );

        # Method event 'nick' definition
        my $func_5 = method_event_def(
            $f, $scope, 'nick', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->( $$self->{'_parsedSource'}
                      ->property_u( 'nick', $pos->(118.5) ) );
                return $ret;
            }
        );

        # Method event 'user' definition
        my $func_6 = method_event_def(
            $f, $scope, 'user', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->( $$self->{'_parsedSource'}
                      ->property_u( 'user', $pos->(119.5) ) );
                return $ret;
            }
        );

        # Method event 'host' definition
        my $func_7 = method_event_def(
            $f, $scope, 'host', undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                return $ret_func->( $$self->{'_parsedSource'}
                      ->property_u( 'host', $pos->(120.5) ) );
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_2->inside_scope(
            parse => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            target => $scope,
            $proto, $class, $ins, 1, undef
        );
        $func_4->inside_scope(
            _parsedSource => $scope,
            $proto, $class, $ins, 1, 1
        );
        $func_5->inside_scope( nick => $scope, $proto, $class, $ins, 1, undef );
        $func_6->inside_scope( user => $scope, $proto, $class, $ins, 1, undef );
        $func_7->inside_scope( host => $scope, $proto, $class, $ins, 1, undef );
    }
    load_namespaces( $context, $file_name, qw(Bool Connection Str::NE) );
};

after_content($file_name);
