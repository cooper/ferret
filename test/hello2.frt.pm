use warnings;
use strict;
use utf8;
use 5.010;
use lib 'lib';
use Ferret;

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello2.frt.pm'}++;

use Ferret::Core::Operations qw(str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');
    Ferret::space( $context, $_ ) for qw();

    $scope->property('say')->call( [ str( $f, "Hello World!" ) ], $scope );
}
