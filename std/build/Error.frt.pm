# === Document Model ===
#  Document './std/Error.frt'
#      Class 'Error' version 1.0
#          Class method 'initializer__' { $type:Sym $msg:Str ?$hints:List ?$subError:Error ?$fatal }
#              Function body
#                  Instruction
#                      Need
#                          Instance variable '@type'
#                          Argument type
#                              Bareword 'Sym'
#                  Instruction
#                      Need
#                          Instance variable '@msg'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Want
#                          Instance variable '@hints'
#                          Argument type
#                              Bareword 'List'
#                          Argument value
#                              Value list [0 items]
#                  Instruction
#                      Want
#                          Instance variable '@subError'
#                          Argument type
#                              Bareword 'Error'
#                  Instruction
#                      Want
#                          Instance variable '@fatal'
#                          Argument value
#                              Boolean false
#                  Instruction
#                      Call
#                          Property 'bless'
#                              Bareword 'NATIVE'
#                          Argument list [2 items]
#                              Item 0
#                                  Special variable '*self'
#                              Item 1
#                                  String 'Ferret::Error'
#          Method 'setPosition' { $file:Str $line:Num }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$file'
#                          Argument type
#                              Bareword 'Str'
#                  Instruction
#                      Need
#                          Lexical variable '$line'
#                          Argument type
#                              Bareword 'Num'
#                  Instruction
#                      Call
#                          Property 'push'
#                              Instance variable '@hints'
#                          Argument list [4 items]
#                              Item 0
#                                  String 'File'
#                              Item 1
#                                  Lexical variable '$file'
#                              Item 2
#                                  String 'Line'
#                              Item 3
#                                  Lexical variable '$line'
#          Method 'description' { -> $result }
#              Function body
#                  Instruction
#                      Assignment
#                          Lexical variable '$desc'
#                          Operation
#                              String '['
#                              Addition operator (+)
#                              Property 'name'
#                                  Instance variable '@type'
#                              Addition operator (+)
#                              String '] '
#                              Addition operator (+)
#                              Instance variable '@msg'
#                  If
#                      Expression ('if' parameter)
#                          Negation
#                              Property 'empty'
#                                  Instance variable '@hints'
#                      If body
#                          Instruction
#                              Addition assignment
#                                  Lexical variable '$desc'
#                                  Call
#                                      Bareword '_prettyHints'
#                                      Argument list [1 item]
#                                          Item 0
#                                              Instance variable '@hints'
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@subError'
#                      If body
#                          Instruction
#                              Addition assignment
#                                  Lexical variable '$desc'
#                                  Operation
#                                      String ' ->'
#                                      Addition operator (+)
#                                      Special property '*description'
#                                          Instance variable '@subError'
#                  Instruction
#                      Return
#                          Lexical variable '$desc'
#          Function '_prettyHints' { $list:List -> $result }
#              Function body
#                  Instruction
#                      Need
#                          Lexical variable '$list'
#                          Argument type
#                              Bareword 'List'
#                  Instruction
#                      Assignment
#                          Lexical variable '$str'
#                          String '␤'
#                  For (pairs)
#                      Expression ('for' parameter)
#                          Set [2 items]
#                              Item 0
#                                  Lexical variable '$i'
#                              Item 1
#                                  Lexical variable '$el'
#                      Expression ('in' parameter)
#                          Lexical variable '$list'
#                      For body
#                          If
#                              Expression ('if' parameter)
#                                  Property 'even'
#                                      Lexical variable '$i'
#                              If body
#                                  Instruction
#                                      Addition assignment
#                                          Lexical variable '$str'
#                                          Operation
#                                              String '    '
#                                              Addition operator (+)
#                                              Lexical variable '$el'
#                                              Addition operator (+)
#                                              String ': '
#                          Else
#                              Else body
#                                  Instruction
#                                      Addition assignment
#                                          Lexical variable '$str'
#                                          Operation
#                                              Lexical variable '$el'
#                                              Addition operator (+)
#                                              String '␤'
#                  Instruction
#                      Return
#                          Lexical variable '$str'
#      Include (Error, List, NATIVE, Num, Str, Sym)
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

my $pos = before_content( 'Error.frt', './std/Error.frt' );

use Ferret::Core::Operations qw(_not add bool str);
my $result = do {
    my ( $file_scope, $context ) = get_context( $f, 'main' );
    my $scope = $file_scope;
    load_core('main');

    # Function event '_prettyHints' definition
    my $func_3 = function_event_def(
        $f, $scope,
        '_prettyHints',
        undef,
        [
            {
                name     => 'list',
                type     => 'List',
                optional => undef,
                more     => undef
            }
        ],
        undef,
        sub {
            my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
            need( $scope, $args, 'list', 29.2 ) || return $ret_func->();
            var( $scope, str => str( $f, "\n" ), $file_scope, $pos->(30.2) );
            {
                my ( $loop_status, $loop_ret ) = iterate_pair(
                    $f, $scope,
                    $$scope->{'list'},
                    'i', 'el',
                    sub {
                        my ( $scope, $ret_func ) = @_;
                        if (
                            bool(
                                $$scope->{'i'}
                                  ->property_u( 'even', $pos->(32.3) )
                            )
                          )
                        {
                            my $scope =
                              Ferret::Scope->new( $f, parent => $scope );

                            var(
                                $scope,
                                str => add(
                                    $scope,
                                    $$scope->{'str'},
                                    add(
                                        $scope,          str( $f, "    " ),
                                        $$scope->{'el'}, str( $f, ": " )
                                    )
                                ),
                                $file_scope,
                                $pos->(33.2)
                            );
                        }
                        else {
                            var(
                                $scope,
                                str => add(
                                    $scope,
                                    $$scope->{'str'},
                                    add(
                                        $scope, $$scope->{'el'},
                                        str( $f, "\n" )
                                    )
                                ),
                                $file_scope,
                                $pos->(35.2)
                            );
                        }
                    },
                    $pos->(31.05)
                );
                return $ret_func->($loop_ret) if $loop_status eq 'return';
            }
            return $ret_func->( $$scope->{'str'} );
            return $ret;
        }
    );

    # Class 'Error'
    {
        my ( $class, $self, $proto, $scope ) =
          get_class( $f, $context, $file_scope, 'Error', 1.0, undef );

        # Method event 'initializer__' definition
        my $func_0 = method_event_def(
            $f, $scope,
            'initializer__',
            [
                {
                    name     => 'type',
                    type     => 'Sym',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'msg',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'hints',
                    type     => 'List',
                    optional => 1,
                    more     => undef
                },
                {
                    name     => 'subError',
                    type     => 'Error',
                    optional => 1,
                    more     => undef
                },
                {
                    name     => 'fatal',
                    type     => undef,
                    optional => 1,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $self, $args, 'type' ) || return $ret_func->();
                need( $self, $args, 'msg' )  || return $ret_func->();
                want( $self, $args, 'hints', 7.2, create_list( $f, [] ) );
                want( $self, $args, 'subError', 8.2 );
                want( $self, $args, 'fatal', 9.2, $false );
                $$scope->{'NATIVE'}->property_u( 'bless', $pos->(11.2) )->(
                    [
                        ${ $scope->{special} }->{'self'},
                        str( $f, "Ferret::Error" )
                    ],
                    $scope, undef,
                    $pos->(11.3)
                );
                return $ret;
            }
        );

        # Method event 'setPosition' definition
        my $func_1 = method_event_def(
            $f, $scope,
            'setPosition',
            [
                {
                    name     => 'file',
                    type     => 'Str',
                    optional => undef,
                    more     => undef
                },
                {
                    name     => 'line',
                    type     => 'Num',
                    optional => undef,
                    more     => undef
                }
            ],
            undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                need( $scope, $args, 'file', 15.1 ) || return $ret_func->();
                need( $scope, $args, 'line', 15.3 ) || return $ret_func->();
                $$self->{'hints'}->property_u( 'push', $pos->(16.1) )->(
                    [
                        str( $f, "File" ), $$scope->{'file'},
                        str( $f, "Line" ), $$scope->{'line'}
                    ],
                    $scope, undef,
                    $pos->(16.15)
                );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $func_2 = method_event_def(
            $f, $scope,
            'description',
            undef, undef,
            sub {
                my ( $scope, $self, $this, $ins, $args, $ret ) = &args_v1;
                var(
                    $scope,
                    desc => add(
                        $scope,
                        str( $f, "[" ),
                        $$self->{'type'}->property_u( 'name', $pos->(20.3) ),
                        str( $f, "] " ),
                        $$self->{'msg'}
                    ),
                    $file_scope,
                    $pos->(20.1)
                );
                if (
                    bool(
                        _not(
                            $$self->{'hints'}
                              ->property_u( 'empty', $pos->(21.4) )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    var(
                        $scope,
                        desc => add(
                            $scope,
                            $$scope->{'desc'},
                            $$scope->{'_prettyHints'}->(
                                [ $$self->{'hints'} ], $scope,
                                undef,                 $pos->(22.4)
                            )
                        ),
                        $file_scope,
                        $pos->(22.2)
                    );
                }
                if ( bool( $$self->{'subError'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    var(
                        $scope,
                        desc => add(
                            $scope,
                            $$scope->{'desc'},
                            add(
                                $scope,
                                str( $f, " ->" ),
                                $$self->{'subError'}
                                  ->property_u( '*description', $pos->(24.6) )
                            )
                        ),
                        $file_scope,
                        $pos->(24.2)
                    );
                }
                return $ret_func->( $$scope->{'desc'} );
                return $ret;
            }
        );
        $func_0->inside_scope(
            initializer__ => $scope,
            $class, $class, $ins, undef, undef
        );
        $func_1->inside_scope(
            setPosition => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_2->inside_scope(
            description => $scope,
            $proto, $class, $ins, undef, undef
        );
        $func_3->inside_scope(
            _prettyHints => $scope,
            $scope, $class, $ins, undef, undef
        );
    }
    load_namespaces( $context, qw(Error List NATIVE Num Str Sym) );
};

after_content();
