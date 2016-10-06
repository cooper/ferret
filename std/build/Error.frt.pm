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
#          Method 'description'
#              Body ('method' scope)
#                  If
#                      Expression ('if' parameter)
#                          Instance variable '@subError'
#                      Body ('if' scope)
#                          Instruction
#                              Return
#                                  Operation
#                                      Instance variable '@msg'
#                                      Addition operator (+)
#                                      String ': '
#                                      Addition operator (+)
#                                      Call
#                                          Property 'description'
#                                              Instance variable '@subError'
#                  If
#                      Expression ('if' parameter)
#                          Operation
#                              Instance variable '@hints'
#                              Logical and operator (&&)
#                              Negation
#                                  Property 'empty'
#                                      Instance variable '@hints'
#                      Body ('if' scope)
#                          Instruction
#                              Return
#                                  Operation
#                                      Instance variable '@msg'
#                                      Addition operator (+)
#                                      Call
#                                          Bareword '_prettyHints'
#                                          Argument list [1 items]
#                                              Item 0
#                                                  Instance variable '@hints'
#                  Instruction
#                      Return
#                          Instance variable '@msg'
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
#      Include (Error, List, NATIVE, Str, Sym)
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

use Ferret::Core::Operations qw(_not add all_true bool str);
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
            FF::need( $scope, $args, 'list', 21.2 ) or return;
            FF::lex_assign(
                $scope,
                str => str( $f, "\n" ),
                $file_scope, $pos->(22.2)
            );
            {
                my $loop_ret = FF::iterate_pair(
                    $f, $scope,
                    $$scope->{'list'},
                    'i', 'el',
                    sub {
                        my ( $scope, $ret_func ) = @_;
                        if ( bool( ${ $$scope->{'i'} }->{'even'} ) ) {
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
                                $pos->(25.2)
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
                                $pos->(27.2)
                            );
                        }
                    },
                    $pos->(23.05)
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
                FF::want( $self, $args, 'hints',    7.2 );
                FF::want( $self, $args, 'subError', 8.2 );
                ${ $$scope->{'NATIVE'} }->{'bless'}->(
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

        # Method event 'description' definition
        my $method_1 = FF::method_event_def(
            $f, $scope,
            'description',
            [],
            sub {
                my ( $scope, $self, $this, $args, $ret ) = &FF::args_v1;
                if ( bool( $$self->{'subError'} ) ) {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        add(
                            $scope,
                            $$self->{'msg'},
                            str( $f, ": " ),
                            ${ $$self->{'subError'} }->{'description'}
                              ->( [ undef, [] ], $scope, undef, $pos->(15.4) )
                        )
                    );
                }
                if (
                    bool(
                        all_true(
                            $scope,
                            sub { $$self->{'hints'} },
                            sub { _not( ${ $$self->{'hints'} }->{'empty'} ) }
                        )
                    )
                  )
                {
                    my $scope = Ferret::Scope->new( $f, parent => $scope );

                    return $ret_func->(
                        add(
                            $scope,
                            $$self->{'msg'},
                            $$scope->{'_prettyHints'}->(
                                [ $$self->{'hints'} ], $scope,
                                undef,                 $pos->(17.5)
                            )
                        )
                    );
                }
                return $ret_func->( $$self->{'msg'} );
                return $ret;
            }
        );
        $method_0->inside_scope(
            initializer__ => $scope,
            $class, $class, undef, undef
        );
        $method_1->inside_scope(
            description => $scope,
            $proto, $class, undef, undef
        );
        $func_0->inside_scope(
            _prettyHints => $scope,
            $scope, $class, undef, undef
        );
    }
    FF::load_namespaces( $context, qw(Error List NATIVE Str Sym) );
};

FF::after_content();
