# === Document Model ===
#  Document './std/Math.frt'
#      Package 'Math'
#      Function 'sqrt'
#          Instruction
#              Need
#                  Lexical variable '$num'
#                  Bareword 'Num'
#          Instruction
#              Return
#                  Call
#                      Property 'sqrt'
#                          Bareword 'NATIVE::Math'
#                      Single value [1 items]
#                          Item 0
#                              Lexical variable '$num'
#      Include (NATIVE, NATIVE::Math, Num)
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
$Ferret::tried_files{'Math.frt.pm'}++;

use Ferret::Core::Operations qw();
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('Math');
    do 'CORE.frt.pm' or die "Core error: $@" unless 'Math' eq 'CORE';
    undef;

    # Function event 'sqrt' callback definition
    {
        my $func = Ferret::Function->new( $f, name => 'default' );
        $func->add_argument( name => 'num', type => 'Num', more => undef );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{num};
                $scope->set_property( num => $arguments->{num} );
            };
            return $scope->property_u('NATIVE::Math')->property_u('sqrt')
              ->call_u( [ $scope->property_u('num') ], $scope );
            return $return;
        };
        $funcs[0] = Ferret::Event->new(
            $f,
            name         => 'sqrt',
            default_func => [ undef, $func ]
        );
    }
    $funcs[0]->inside_scope( sqrt => $scope, $scope );
    Ferret::space( $context, $_ )
      for qw(Math::NATIVE Math::NATIVE::Math Math::Num NATIVE NATIVE::Math Num);
};

Ferret::runtime();
