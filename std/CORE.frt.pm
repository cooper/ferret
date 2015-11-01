# === Document Model ===
#  Document './std/CORE.frt'
#      Package 'CORE'
#      Function 'say2'
#          Instruction
#              Need
#                  Lexical variable '$msg'
#                  Bareword 'Str'
#          Instruction
#              Call
#                  Bareword 'say'
#                  Single value [1 items]
#                      Item 0
#                          Lexical variable '$msg'
#      Include (Str)
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
$Ferret::tried_files{'CORE.frt.pm'}++;

use Ferret::Core::Operations qw();
my $result = do {
    my @funcs;
    my $scope = my $context = $f->get_context('CORE');
    do 'CORE.frt.pm' or die "Core error: $@" unless 'CORE' eq 'CORE';
    undef;

    # Function event 'say2' callback definition
    {
        my $func = Ferret::Function->new( $f, name => 'default' );
        $func->add_argument( name => 'msg', type => 'Str', more => undef );
        $func->{code} = sub {
            my ( $_self, $arguments, $call_scope, $scope, $return ) = @_;
            my $self = $_self || $self;
            do {
                return unless defined $arguments->{msg};
                $scope->set_property( msg => $arguments->{msg} );
            };
            $scope->property_u('say')
              ->call_u( [ $scope->property_u('msg') ], $scope );
            return $return;
        };
        $funcs[0] = Ferret::Event->new(
            $f,
            name         => 'say2',
            default_func => [ undef, $func ]
        );
    }
    $funcs[0]->inside_scope( say2 => $scope, $scope );
    Ferret::space( $context, $_ ) for qw(CORE::Str Str);
};

Ferret::runtime();
