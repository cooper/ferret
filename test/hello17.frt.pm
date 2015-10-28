# === Document Model ===
#  Document './test/hello17.frt'
#      Instruction
#          Assignment (lexical variable '$obj')
#              Object [0 items]
#      Instruction
#          Call
#              Call
#                  Property 'init'
#                      Bareword 'Timer'
#                  Single value [1 items]
#                      Item 0
#                          Lexical variable '$obj'
#              Single value [1 items]
#                  Item 0
#                      Number '5'
#      On
#          Expression ('on' parameter)
#              Property 'expire'
#                  Call
#                      Property 'once'
#                          Lexical variable '$obj'
#                      Structural list [0 items]
#          Anonymous function
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Single value [1 items]
#                          Item 0
#                              String 'it works!'
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
$Ferret::tried_files{'hello17.frt.pm'}++;

use Ferret::Core::Operations qw(num on str);
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
              ->call_u( [ str( $f, "it works!" ) ], $scope );
            return $return;
        };
    }
    Ferret::space( $context, $_ ) for qw(Timer);
    $scope->set_property_ow( $context,
        obj => Ferret::Object->new( $f, initial_props => {} ) );
    $scope->property_u('Timer')->property_u('init')
      ->call_u( [ $scope->property_u('obj') ], $scope )
      ->call_u( [ num( $f, 5 ) ], $scope );
    on(
        $scope->property_u('obj')->property_u('once')->call_u( {}, $scope ),
        'expire',
        $self,
        $scope,
        $funcs[0]->inside_scope( (undef) => $scope, $scope )
    );
};

Ferret::runtime();
