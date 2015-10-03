# === Document Model ===
#  Document './test/hello17.frt'
#      Instruction
#          Assignment
#              Lexical variable '$obj'
#              Call
#                  Bareword 'Object'
#                  Structural list [0 items]
#      Instruction
#          Call
#              Call
#                  Property 'init'
#                      Bareword 'Timer'
#                  Structural list [1 items]
#                      Item 0
#                          Lexical variable '$obj'
#              Structural list [1 items]
#                  Item 0
#                      Number '5'
#      On
#          Expression ('on' parameter)
#              Property 'expire'
#                  Call
#                      Property 'once'
#                          Lexical variable '$obj'
#                      Structural list [0 items]
#          Function 'callback'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Structural list [1 items]
#                          Item 0
#                              String 'it works!'
#      Include (Object, Timer)
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
$Ferret::tried_files{'hello17.frt.pm'}++;

use Ferret::Core::Operations qw(num str);
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
            $scope->property_u('say')
              ->call( [ str( $f, "it works!" ) ], $scope );
            return $return;
        };
    }
    Ferret::space( $context, $_ ) for qw(Object Timer);
    $scope->set_property_ow( $context,
        obj => $scope->property_u('Object')->call( {}, $scope ) );
    $scope->property_u('Timer')->property_u('init')
      ->call( [ $scope->property_u('obj') ], $scope )
      ->call( [ num( $f, 5 ) ], $scope );

    # On
    {
        my $on_func = $funcs[0]->inside_scope( +undef => $scope, $scope );
        $scope->property_u('obj')->property_u('once')->call( {}, $scope )
          ->property_u('expire')
          ->add_function_with_self_and_scope( $self, $scope, $on_func );
    }
};

Ferret::runtime();
