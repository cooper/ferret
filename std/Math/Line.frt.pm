# --- DOM ---
#  Document './std/Math/Line.frt'
#      Package 'Math'
#      Class 'Line'
#      Include
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
$Ferret::tried_files{'Line.frt.pm'}++;

use Ferret::Core::Operations qw();
{
    my @funcs;
    my $scope = my $context = $f->get_context('Math');

    # Class 'Line'
    {
        my @methods;
        my ( $class, $self );
        if ( $context->has_property('Line') ) {
            $class = $self = $context->property('Line');
        }
        else {
            $class = $self = Ferret::Class->new(
                $f,
                name    => 'Line',
                version => undef
            );
            $context->set_property( Line => $class );
        }
        my $proto = $class->prototype;

    }
}
