package F::TypedClass;

use warnings;
use strict;
use parent qw(F::NodeExpression);

use Scalar::Util qw(weaken);

sub desc { 'class name with generics' }

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

sub add_maybe {
    my ($tc, $maybe) = @_;
    push @{ $tc->{maybes} ||= [] }, $maybe;
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

sub perl_fmt {
    my $tc = shift;
    my ($main_bw, @others) = $tc->children;
    my @barewords = map $_->perl_fmt_do,
        grep $_->type eq 'Bareword', @others;
    return typed_class => {
        bareword_exp => $main_bw->perl_fmt_do,
        generics     => join(', ', @barewords)
    };
}

1
