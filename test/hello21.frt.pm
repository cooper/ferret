# === Document Model ===
#  Document './test/hello21.frt'
#      Instruction
#          Assignment (lexical variable '$parts')
#              Call
#                  Property 'split'
#                      String 's p a m'
#                  Structural list [1 items]
#                      Item 0
#                          String ' '
#      For
#          Expression ('for' parameter)
#              Structural list [2 items]
#                  Item 0
#                      Lexical variable '$i'
#                  Item 1
#                      Lexical variable '$part'
#          Expression ('in' parameter)
#              Lexical variable '$parts'
#          On
#              Expression ('on' parameter)
#                  Property 'expire'
#                      Call
#                          Property 'once'
#                              Call
#                                  Bareword 'Timer'
#                                  Structural list [1 items]
#                                      Item 0
#                                          Lexical variable '$i'
#                          Structural list [0 items]
#              Function 'callback'
#                  Instruction
#                      Call
#                          Bareword 'say'
#                          Structural list [1 items]
#                              Item 0
#                                  Operation
#                                      String '('
#                                      Addition operator (+)
#                                      Lexical variable '$i'
#                                      Addition operator (+)
#                                      String ') '
#                                      Addition operator (+)
#                                      Lexical variable '$part'
#      For
#          Expression ('for' parameter)
#              Lexical variable '$part'
#          Expression ('in' parameter)
#              Value list [3 items]
#                  Item 0
#                      Number '1'
#                  Item 1
#                      Number '2'
#                  Item 2
#                      Number '3'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Structural list [1 items]
#                      Item 0
#                          Lexical variable '$part'
#      Include (Timer)
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
$Ferret::tried_files{'hello21.frt.pm'}++;

use Ferret::Core::Operations qw(U add num str);
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
            U(
                $scope->property_u('say')->call(
                    [
                        add(
                            $scope,                  str( $f, "(" ),
                            $scope->property_u('i'), str( $f, ") " ),
                            $scope->property_u('part')
                        )
                    ],
                    $scope
                )
            );
            return $return;
        };
    }
    Ferret::space( $context, $_ ) for qw(Timer);
    $scope->set_property_ow(
        $context,
        parts => U(
            str( $f, "s p a m" )->property_u('split')
              ->call( [ str( $f, " " ) ], $scope )
        )
    );
    foreach ( $scope->property_u('parts')->iterate_pair ) {
        my $scope = Ferret::Scope->new( $f, parent => $scope );
        $scope->set_property( i    => $_->[0] );
        $scope->set_property( part => $_->[1] );

        # On
        {
            my $on_func = $funcs[0]->inside_scope( (undef) => $scope, $scope );
            U(
                U(
                    $scope->property_u('Timer')
                      ->call( [ $scope->property_u('i') ], $scope )
                )->property_u('once')->call( {}, $scope )
              )->property_u('expire')
              ->add_function_with_self_and_scope( $self, $scope, $on_func );
        }
    }
    foreach (
        Ferret::List->new( $f,
            items => [ num( $f, 1 ), num( $f, 2 ), num( $f, 3 ) ] )->iterate
      )
    {
        my $scope = Ferret::Scope->new( $f, parent => $scope );
        $scope->set_property( part => $_ );

        U( $scope->property_u('say')
              ->call( [ $scope->property_u('part') ], $scope ) );
    }
};

Ferret::runtime();
