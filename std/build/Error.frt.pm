# === Document Model ===
#  Document './std/Error.frt'
#      Class 'Error' version 1.0
#          Class method 'initializer__'
#              Body ('method' scope)
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
#                      Call
#                          Property 'bless'
#                              Bareword 'NATIVE'
#                          Argument list [2 items]
#                              Item 0
#                                  Special variable '*self'
#                              Item 1
#                                  String 'Ferret::Error'
#          Method 'setPosition'
#              Body ('method' scope)
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
#          Method 'description'
#              Body ('method' scope)
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
#                      Body ('if' scope)
#                          Instruction
#                              Addition assignment
#                                  Lexical variable '$desc'
#                                  Call
#                                      Bareword '_prettyHints'
#                                      Argument list [1 items]
#                                          Item 0
#                                              Instance variable '@hints'
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@subError'
#                      Body ('if' scope)
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
#          Function '_prettyHints'
#              Body ('function' scope)
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
#                      Body ('for' scope)
#                          If
#                              Expression ('if' parameter)
#                                  Property 'even'
#                                      Lexical variable '$i'
#                              Body ('if' scope)
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
#                              Body ('else' scope)
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

my $pos = FF::before_content( 'Error.frt', './std/Error.frt' );

use Ferret::Core::Operations qw(_not add bool str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Function event '_prettyHints' definition
    my $func_0 = FF::function_event_def(
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
        sub {
            my ( $scope, $_self, $this, $args, $ret ) = &FF::args_v1;
            my $self = $_self || $self;
            FF::need( $scope, $args, 'list', 28.2 ) or return;
            FF::lex_assign(
                $scope,
                str => str( $f, "\n" ),
                $file_scope, $pos->(29.2)
            );
            {
                my $loop_ret = FF::iterate_pair(
                    $f, $scope,
                    $$scope->{'list'},
                    'i', 'el',
                    sub {
                        my ( $scope, $ret_func ) = @_;
                        if (
                            bool(
                                $$scope->{'i'}
                                  ->property_u( 'even', $pos->(31.3) )
                            )
                          )
                        {
                            my $scope =
                              Ferret::Scope->new( $f, parent => $scope );

                            FF::lex_assign(
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
                                $pos->(32.2)
                            );
                        }
                        else {
                            FF::lex_assign(
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
                                $pos->(34.2)
                            );
                        }
                    },
                    $pos->(30.05)
                );
                return $ret_func->($loop_ret) if $loop_ret;
            }
            return $ret_func->( $$scope->{'str'} );
            return $ret;
        }
    );

    # Class 'Error'
    {
        my ( $class, $self, $proto, $scope ) =
          FF::get_class( $f, $context, $file_scope, 'Error', 1.0, undef );

        # Method event 'initializer__' definition
        my $method_0 = FF::method_event_def(
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
                }
            ],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                FF::need( $self, $args, 'type' ) or return;
                FF::need( $self, $args, 'msg' )  or return;
                FF::want( $self, $args, 'hints', 7.2,
                    FF::create_list( $f, [] ) );
                FF::want( $self, $args, 'subError', 8.2 );
                $$scope->{'NATIVE'}->property_u( 'bless', $pos->(10.2) )->(
                    [
                        ${ $scope->{special} }->{'self'},
                        str( $f, "Ferret::Error" )
                    ],
                    $scope, undef,
                    $pos->(10.3)
                );
                return $ret;
            }
        );

        # Method event 'setPosition' definition
        my $method_1 = FF::method_event_def(
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
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                FF::need( $scope, $args, 'file', 14.1 ) or return;
                FF::need( $scope, $args, 'line', 14.3 ) or return;
                $$self->{'hints'}->property_u( 'push', $pos->(15.1) )->(
                    [
                        str( $f, "File" ), $$scope->{'file'},
                        str( $f, "Line" ), $$scope->{'line'}
                    ],
                    $scope, undef,
                    $pos->(15.15)
                );
                return $ret;
            }
        );

        # Method event 'description' definition
        my $method_2 = FF::method_event_def(
            $f, $scope,
            'description',
            [],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                FF::lex_assign(
                    $scope,
                    desc => add(
                        $scope,
                        str( $f, "[" ),
                        $$self->{'type'}->property_u( 'name', $pos->(19.3) ),
                        str( $f, "] " ),
                        $$self->{'msg'}
                    ),
                    $file_scope,
                    $pos->(19.1)
                );
                if (
                    bool(
                        _not(
                            $$self->{'hints'}
                              ->property_u( 'empty', $pos->(20.4) )
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    FF::lex_assign(
                        $scope,
                        desc => add(
                            $scope,
                            $$scope->{'desc'},
                            $$scope->{'_prettyHints'}->(
                                [ $$self->{'hints'} ], $scope,
                                undef,                 $pos->(21.4)
                            )
                        ),
                        $file_scope,
                        $pos->(21.2)
                    );
                }
                if ( bool( $$self->{'subError'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    FF::lex_assign(
                        $scope,
                        desc => add(
                            $scope,
                            $$scope->{'desc'},
                            add(
                                $scope,
                                str( $f, " ->" ),
                                $$self->{'subError'}
                                  ->property_u( '*description', $pos->(23.6) )
                            )
                        ),
                        $file_scope,
                        $pos->(23.2)
                    );
                }
                return $ret_func->( $$scope->{'desc'} );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            setPosition => $scope,
            $proto, $class, undef, undef
        );
        $method_2->inside_scope(
            description => $scope,
            $proto, $class, undef, undef
        );
        $func_0->inside_scope(
            _prettyHints => $scope,
            $scope, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Error List NATIVE Num Str Sym) );
};

FF::after_content();
