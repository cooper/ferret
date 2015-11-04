# === Document Model ===
#  Document './test/hello13.frt'
#      Instruction
#          Call
#              Bareword 'say'
#              Single value [1 items]
#                  Item 0
#                      String 'hello'
#      On
#          Expression ('on' parameter)
#              Property 'expire'
#                  Call
#                      Property 'once'
#                          Call
#                              Bareword 'Timer'
#                              Single value [1 items]
#                                  Item 0
#                                      Number '5'
#          Anonymous function
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Single value [1 items]
#                          Item 0
#                              String 'five secon...'
#      Instruction
#          Assignment (lexical variable '$t2')
#              Call
#                  Bareword 'Timer'
#                  Single value [1 items]
#                      Item 0
#                          Number '2'
#      On
#          Expression ('on' parameter)
#              Property 'expire'
#                  Call
#                      Property 'once'
#                          Lexical variable '$t2'
#          Anonymous function
#              Instruction
#                  Call
#                      Bareword 'say'
#                      Single value [1 items]
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
        ref $libs eq 'ARRAY' or die 'config error';
        $Ferret::ferret_root = shift @$libs;
        unshift @INC, @$libs;
    }
}

use Ferret;

my $self;
my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello13.frt.pm'}++;

use Ferret::Core::Operations qw(num on str);
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    do 'CORE.frt.pm' or die "Core error: $@" unless 'main' eq 'CORE';
    undef;

    # Anonymous function definition
    {
        my $func = $funcs[0] = Ferret::Function->new( $f, anonymous => 1 );

        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property_u('say')
              ->call_u( [ str( $f, "five seconds up" ) ], $scope );
            return $return;
        };
    }

    # Anonymous function definition
    {
        my $func = $funcs[1] = Ferret::Function->new( $f, anonymous => 1 );

        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            $scope->property_u('say')
              ->call_u( [ str( $f, "this shouldn't be said" ) ], $scope );
            return $return;
        };
    }
    Ferret::space( $context, $_ ) for qw(Timer);
    $scope->property_u('say')->call_u( [ str( $f, "hello" ) ], $scope );
    on(
        $scope->property_u('Timer')->call_u( [ num( $f, 5 ) ], $scope )
          ->property_u('once')->call_u( {}, $scope ),
        'expire',
        $self,
        $scope,
        $funcs[0]
          ->inside_scope( (undef) => $scope, $scope, undef, undef, undef )
    );
    $scope->set_property_ow( $context,
        t2 => $scope->property_u('Timer')->call_u( [ num( $f, 2 ) ], $scope ) );
    on(
        $scope->property_u('t2')->property_u('once')->call_u( {}, $scope ),
        'expire',
        $self,
        $scope,
        $funcs[1]
          ->inside_scope( (undef) => $scope, $scope, undef, undef, undef )
    );
    $scope->property_u('t2')->property_u('cancel')->call_u( {}, $scope );
};

Ferret::runtime();
