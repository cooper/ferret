# Copyright (c) 2015, Mitchell Cooper
package Ferret::Symbol;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Ferret::Core::Conversion qw(perl_string);

Ferret::bind_class(
    name      => 'Symbol',
    alias     => 'Sym',
    init      => \&init,
    init_want => '$from',
    desc      => \&description
);

*new = *Ferret::bind_constructor;

sub init {
    my ($sym, $arguments) = @_;
    $sym->{ro_properties} = 1;

    # from another value
    if (my $from = $arguments->{from}) {
        $sym->{sym_value} = perl_string($from);
    }

    # this isn't one of the "real" true or false objects,
    # so force init to return one of them.
    $sym->{override_init_obj} = $sym->get_sym;

}

sub get_sym {
    my $sym  = shift;
    my $f    = $sym->f;
    my $name = $sym->{sym_value};
    return $f->{symbols}{ $name } ||= $sym;
}

sub description {
    return '~'.(shift->{sym_value});
}

1
