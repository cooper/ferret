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
        ref $libs eq 'ARRAY' or die "config error";
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello14.frt.pm'}++;

use Ferret::Core::Operations qw(add str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    undef;

    # Anonymous function definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, anonymous => 1 );

        $func->{code} = sub {
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
        };
    }

    # Anonymous function definition
    {
        my $func = $funcs[1] = Ferret::Function->new( $f, anonymous => 1 );

        $func->{code} = sub {
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
        };
    }
    Ferret::space( $context, $_ ) for qw(String);
    $scope->property_u('say')->call_u( [ str( $f, "test" ) ], $scope );
    $scope->set_property_ow( $context, str => str( $f, "hi" ) );

    # On
    {
        my $on_func = $funcs[0]->inside_scope( (undef) => $scope, $scope );
        $scope->property_u('str')->property_u('length')
          ->add_function_with_self_and_scope( $self, $scope, $on_func );
    }
    $scope->property_u('str')->property_u('length')->call_u( {}, $scope );
    str( $f, "hello" )->property_u('length')->call_u( {}, $scope );

    # On
    {
        my $on_func = $funcs[1]->inside_scope( (undef) => $scope, $scope );
        $scope->property_u('String')->property_u('proto')->property_u('length')
          ->add_function_with_self_and_scope( $self, $scope, $on_func );
    }
    str( $f, "hello" )->property_u('length')->call_u( {}, $scope );
};

Ferret::runtime();
