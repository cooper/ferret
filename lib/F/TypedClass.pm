package F::TypedClass;

use warnings;
use strict;
use parent qw(F::NodeExpression);

use Scalar::Util qw(weaken);

sub set_tc_class {
    my ($tc, $class) = @_;
    $tc->{parent_fake} = 1;
    weaken($tc->{parent} = $class);
    weaken($tc->{tc_class} = $class);
    return $class;
}

sub adopt {
    my ($tc, $bw) = (shift, @_);

    # there was no comma.
    # I don't like this, but it works.
    if (!$tc->{ready_for_another}) {
        return $bw->unexpected([
            'inside type generic <...>',
            'Separate bareword generic types by the comma (,)'
        ]);
    }

    $tc->{ready_for_another}--;
    return $tc->SUPER::adopt(@_);
}

sub close : method {
    my $tc = shift;

    # if we have a class, add this type to it.
    if ($tc->tc_class && !$tc->{added}) {
        $tc->tc_class->add_generic($tc);
        $tc->{added}++;
    }

    return $tc->SUPER::close(@_);
}

sub tc_class { shift->{tc_class} }

1
