# Copyright (c) 2015, Mitchell Cooper
package Ferret::Symbol;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Scalar::Util qw(weaken);
use Ferret::Core::Conversion qw(pstring fstring);

my @methods = (
    hashValue => {
        code => \&_hash_value
    }
);

Ferret::bind_class(
    name      => 'Symbol',
    alias     => 'Sym',
    init      => \&init,
    init_want => '$from',
    desc      => \&description,
    methods   => \@methods
);

*new = *Ferret::bind_constructor;

sub init {
    my ($sym, $args) = @_;
    $sym->{ro_properties} = 1;

    # from another value
    if (my $from = $args->{from}) {
        $sym->{sym_value} = pstring($from);
    }

    # this isn't one of the "real" true or false objects,
    # so force init to return one of them.
    $sym->{override_init_obj} = $sym->get_sym;

}

# symbols are hashable by nature.
sub _hash_value {
    my $sym = shift;
    return $sym;
}

sub get_sym {
    my $sym  = shift;
    my $f    = $sym->f;
    my $name = $sym->{sym_value};
    return $f->{symbols}{$name} if $f->{symbols}{$name};
    weaken($f->{symbols}{$name} = $sym);
    return $sym;
}

sub description {
    return ':'.(shift->{sym_value});
}

1
