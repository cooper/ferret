# === Document Model ===
#  Document './test/hello14.frt'
#      Instruction
#          Call
#              Bareword 'say'
#              Single value [1 items]
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
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Single value [1 items]
#                          Item 0
#                              Operation
#                                  String 'found ''
#                                  Addition operator (+)
#                                  Special variable '*this'
#                                  Addition operator (+)
#                                  String '' length t...'
#                                  Addition operator (+)
#                                  Special variable '*return'
#      Instruction
#          Call
#              Property 'length'
#                  Lexical variable '$str'
#              Structural list [0 items]
#      Instruction
#          Call
#              Property 'length'
#                  String 'hello'
#              Structural list [0 items]
#      On
#          Expression ('on' parameter)
#              Property 'length'
#                  Property 'proto'
#                      Bareword 'String'
#          Anonymous function
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Single value [1 items]
#                          Item 0
#                              Operation
#                                  String 'found ''
#                                  Addition operator (+)
#                                  Special variable '*this'
#                                  Addition operator (+)
#                                  String '' length t...'
#                                  Addition operator (+)
#                                  Special variable '*return'
#      Instruction
#          Call
#              Property 'length'
#                  String 'hello'
#              Structural list [0 items]
#      Include (String)
use warnings;
use strict;
use utf8;
use 5.010;

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
        $f, $scope,
        '(undef)',
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
                $scope
            );
            return $return;
        }
    );

    # Anonymous function definition
    my $func_1 = FF::function_def(
        $f, $scope,
        '(undef)',
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
                $scope
            );
            return $return;
        }
    );
    FF::load_namespaces( $context, qw(String) );
    $scope->property_u('say')->call_u( [ str( $f, "test" ) ], $scope );
    $scope->set_property_ow( $context, str => str( $f, "hi" ) );
    FF::on( $scope->property_u('str'), 'length', $self, $scope,
        $func_0->inside_scope( (undef) => $scope, $scope, undef, undef, undef )
    );
    $scope->property_u('str')->property_u('length')->call_u( {}, $scope );
    str( $f, "hello" )->property_u('length')->call_u( {}, $scope );
    FF::on(
        $scope->property_u('String')->property_u('proto'),
        'length',
        $self,
        $scope,
        $func_1->inside_scope( (undef) => $scope, $scope, undef, undef, undef )
    );
    str( $f, "hello" )->property_u('length')->call_u( {}, $scope );
};

FF::after_content();
