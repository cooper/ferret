# === Document Model ===
#  Document './test/hello13.frt'
#      Instruction
#          Call
#              Bareword 'say'
#              Structural list [1 items]
#                  Item 0
#                      String 'hello'
#      On
#          Expression ('on' parameter)
#              Property 'expire'
#                  Call
#                      Property 'once'
#                          Call
#                              Bareword 'Timer'
#                              Structural list [1 items]
#                                  Item 0
#                                      Number '5'
#          Function 'callback'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Structural list [1 items]
#                          Item 0
#                              String 'five secon...'
#      Instruction
#          Assignment
#              Lexical variable '$t2'
#              Call
#                  Bareword 'Timer'
#                  Structural list [1 items]
#                      Item 0
#                          Number '2'
#      On
#          Expression ('on' parameter)
#              Property 'expire'
#                  Call
#                      Property 'once'
#                          Lexical variable '$t2'
#          Function 'callback'
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Structural list [1 items]
#                          Item 0
#                              String 'this shoul...'
#      Instruction
#          Call
#              Property 'cancel'
#                  Lexical variable '$t2'
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
$Ferret::tried_files{'hello13.frt.pm'}++;

use Ferret::Core::Operations qw(num str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    # Anonymous function definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, anonymous => 1 );

        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property('say')
              ->call( [ str( $f, "five seconds up" ) ], $scope );
            return $return;
        };
    }

    # Anonymous function definition
    {
        my $func = $funcs[1] = Ferret::Function->new( $f, anonymous => 1 );

        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property('say')
              ->call( [ str( $f, "this shouldn't be said" ) ], $scope );
            return $return;
        };
    }
    Ferret::space( $context, $_ ) for qw(Timer);
    $scope->property('say')->call( [ str( $f, "hello" ) ], $scope );

    # On
    {
        my $on_func = $funcs[0]->inside_scope( +undef => $scope, $scope );
        $scope->property('Timer')->call( [ num( $f, 5 ) ], $scope )
          ->property('once')->call( {}, $scope )->property('expire')
          ->add_function_with_self_and_scope( $self, $scope, $on_func );
    }
    $scope->set_property_ow( $context,
        t2 => $scope->property('Timer')->call( [ num( $f, 2 ) ], $scope ) );

    # On
    {
        my $on_func = $funcs[1]->inside_scope( +undef => $scope, $scope );
        $scope->property('t2')->property('once')->call( {}, $scope )
          ->property('expire')
          ->add_function_with_self_and_scope( $self, $scope, $on_func );
    }
    $scope->property('t2')->property('cancel')->call( {}, $scope );
};

Ferret::runtime();
