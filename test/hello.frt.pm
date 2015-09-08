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

my $f = $Ferret::ferret ||= Ferret->new;
$Ferret::tried_files{'hello.frt.pm'}++;

use Ferret::Core::Operations qw(str);
{
    my @funcs;
    my $scope = my $context = $f->get_context('main');

    $scope->property('say')->call( [ str( $f, "Hello World!" ) ], $scope );
}
