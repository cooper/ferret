# === Document Model ===
#  Document './test/hello14.frt'
#      Instruction
#          Call
#              Bareword 'say'
#              Structural list [1 items]
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
#          Function 'callback'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Structural list [1 items]
#                          Item 0
#                              Mathematical operation
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
#          Function 'callback'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Structural list [1 items]
#                          Item 0
#                              Mathematical operation
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
    my $libs = do '/etc/ferret.conf';
    ref $libs eq 'ARRAY' or die "config error";
    unshift @INC, @$libs;
}

use Ferret;

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello14.frt.pm'}++;

use Ferret::Core::Operations qw(add str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    # Function '+undef' definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, name => '+undef' );

        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property('say')->call(
                [
                    add(
                        $scope,
                        str( $f, "found '" ),
                        $scope->{special}->property('this'),
                        str( $f, "' length to be " ),
                        $scope->{special}->property('return')
                    )
                ],
                $scope
            );
            return $return;
        };
    }

    # Function '+undef' definition
    {
        my $func = $funcs[1] = Ferret::Function->new( $f, name => '+undef' );

        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property('say')->call(
                [
                    add(
                        $scope,
                        str( $f, "found '" ),
                        $scope->{special}->property('this'),
                        str( $f, "' length to be " ),
                        $scope->{special}->property('return')
                    )
                ],
                $scope
            );
            return $return;
        };
    }
    Ferret::space( $context, $_ ) for qw(String);
    $scope->property('say')->call( [ str( $f, "test" ) ], $scope );
    $scope->set_property_ow( str => str( $f, "hi" ) );

    # On
    {
        my $on_func = $funcs[0]->inside_scope( +undef => $scope, $scope );
        $scope->property('str')->property('length')
          ->add_function_with_self( $self, $on_func );
    }
    $scope->property('str')->property('length')->call( {}, $scope );
    str( $f, "hello" )->property('length')->call( {}, $scope );

    # On
    {
        my $on_func = $funcs[1]->inside_scope( +undef => $scope, $scope );
        $scope->property('String')->property('proto')->property('length')
          ->add_function_with_self( $self, $on_func );
    }
    str( $f, "hello" )->property('length')->call( {}, $scope );
}

Ferret::runtime();
