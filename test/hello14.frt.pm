# === Document Model ===
#  Document './test/hello14.frt'
#      Instruction
#          Call
#              Bareword 'say'
#              Argument list [1 items]
#                  Item 0
#                      String 'test'
#      Instruction
#          Assignment (lexical variable '$str')
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
#                                      Special variable '*return'
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
#                                      Special variable '*return'
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
    unless ( length $Ferret::ferret_root ) {
        my $libs = do '/etc/ferret.conf';
        ref $libs eq 'ARRAY' or die 'config error';
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = FF::get_ferret();

FF::before_content('hello14.frt');

use Ferret::Core::Operations qw(add str);
my $result = do {
    my $scope = my $context = FF::get_context( $f, 'main' );
    FF::load_core('main');

    # Anonymous function definition
    my $func_0 = FF::function_def(
        $f, $scope, undef,
        [],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope,
                        str( $f, "found '" ),
                        $scope->{special}->property_u('this'),
                        str( $f, "' length to be " ),
                        $scope->{special}->property_u('return')
                    )
                ],
                $scope, undef, 11
            );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_1 = FF::function_def(
        $f, $scope, undef,
        [],
        sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property_u('say')->call_u(
                [
                    add(
                        $scope,
                        str( $f, "found '" ),
                        $scope->{special}->property_u('this'),
                        str( $f, "' length to be " ),
                        $scope->{special}->property_u('return')
                    )
                ],
                $scope, undef, 22
            );
            return $return;
        }
    );
    FF::load_namespaces( $context, qw(String) );
    $scope->property_u('say')
      ->call_u( [ str( $f, "test" ) ], $scope, undef, 1 );
    $scope->set_property_ow( $context, str => str( $f, "hi" ) );
    FF::on( $scope->property_u('str'), 'length', $self, $scope,
        $func_0->inside_scope( (undef) => $scope, $scope, undef, undef, undef )
    );
    $scope->property_u('str')->property_u('length')
      ->call_u( {}, $scope, undef, 14 );
    str( $f, "hello" )->property_u('length')->call_u( {}, $scope, undef, 19 );
    FF::on(
        $scope->property_u('String')->property_u('proto'),
        'length',
        $self,
        $scope,
        $func_1->inside_scope( (undef) => $scope, $scope, undef, undef, undef )
    );
    str( $f, "hello" )->property_u('length')->call_u( {}, $scope, undef, 25 );
};

FF::after_content();
