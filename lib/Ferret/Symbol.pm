# Copyright (c) 2015, Mitchell Cooper
package Ferret::Symbol;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Ferret::Core::Conversion qw(pstring fstring flist fnumber);

my @methods = (
    hashValue => {
        code => \&_hash_value,
        prop => 1
    },
    name => {
        code => \&_name,
        prop => 1
    }
);

my @functions = (
    all => {
        code => \&_all
    }
);

Ferret::bind_class(
    name      => 'Symbol',
    alias     => 'Sym',
    init      => \&init,
    init_want => '$from',
    desc      => \&description,
    methods   => \@methods,
    functions => \@functions
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

# the name is just Str($sym) without the colon
sub _name {
    my $sym = shift;
    return fstring($sym->{sym_value});
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
    return $f->{symbols}{$name} ||= $sym;
}

# returns a list of all symbols
sub _all {
    my $f = shift->f;
    return flist(values %{ $f->{symbols} });
}

sub description {
    return ':'.(shift->{sym_value});
}

1
