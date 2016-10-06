# === Document Model ===
#  Document './test/14-callbacks.frt'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      String 'test'
#      Instruction
#          Assignment
#              Lexical variable '$str'
#              String 'hi'
#      On
#          Expression ('on' parameter)
#              Property 'length'
#                  Lexical variable '$str'
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      String 'found ''
#                                      Addition operator (+)
#                                      Special variable '*this'
#                                      Addition operator (+)
#                                      String '' length t...'
#                                      Addition operator (+)
#                                      Property 'result'
#                                          Special variable '*return'
#      Instruction
#          Call
#              Property 'length'
#                  Lexical variable '$str'
#              Argument list [0 items]
#      Instruction
#          Call
#              Property 'length'
#                  String 'hello'
#              Argument list [0 items]
#      On
#          Expression ('on' parameter)
#              Property 'length'
#                  Property 'proto'
#                      Bareword 'String'
#          Anonymous function
#              Body ('function' scope)
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Argument list [1 items]
#                              Item 0
#                                  Operation
#                                      String 'found ''
#                                      Addition operator (+)
#                                      Special variable '*this'
#                                      Addition operator (+)
#                                      String '' length t...'
#                                      Addition operator (+)
#                                      Property 'result'
#                                          Special variable '*return'
#      Instruction
#          Call
#              Property 'length'
#                  String 'hello'
#              Argument list [0 items]
#      Include (String)
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

my $pos = FF::before_content( '14-callbacks.frt', './test/14-callbacks.frt' );

use Ferret::Core::Operations qw(add str);
my $result = do {
    my ( $file_scope, $context ) = FF::get_context( $f, 'main' );
    my $scope = $file_scope;
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, undef, undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $$scope->{'say'}->(
                [
                    add(
                        $scope,
                        str( $f, "found '" ),
                        ${ $scope->{special} }->{'this'},
                        str( $f, "' length to be " ),
                        ${ ${ $scope->{special} }->{'return'} }->{'result'}
                    )
                ],
                $scope, undef,
                $pos->(11.1)
            );
            return $ret;
        }
    );

    # Anonymous function definition
    my $func_1 = FF::function_def(
        $f, undef, undef,
        [],
        sub {
            my ( $_self, $args, $call_scope, $scope, $ret ) = @_;
            my $self = $_self || $self;
            $$scope->{'say'}->(
                [
                    add(
                        $scope,
                        str( $f, "found '" ),
                        ${ $scope->{special} }->{'this'},
                        str( $f, "' length to be " ),
                        ${ ${ $scope->{special} }->{'return'} }->{'result'}
                    )
                ],
                $scope, undef,
                $pos->(22.1)
            );
            return $ret;
        }
    );
    FF::load_namespaces( $context, qw(String) );
    $$scope->{'say'}->( [ str( $f, "test" ) ], $scope, undef, $pos->(1.2) );
    FF::lex_assign( $scope, str => str( $f, "hi" ), undef, $pos->(3.2) );
    FF::on(
        $$scope->{'str'},
        'length',
        $self,
        $scope,
        $func_0->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    ${ $$scope->{'str'} }->{'length'}
      ->( [ undef, [] ], $scope, undef, $pos->(14.3) );
    ${ str( $f, "hello" ) }->{'length'}
      ->( [ undef, [] ], $scope, undef, $pos->(16.3) );
    FF::on(
        ${ $$scope->{'String'} }->{'proto'},
        'length',
        $self,
        $scope,
        $func_1->inside_scope( (undef) => $scope, undef, undef, undef, undef ),
        {}
    );
    ${ str( $f, "hello" ) }->{'length'}
      ->( [ undef, [] ], $scope, undef, $pos->(25.3) );
};

FF::after_content();
