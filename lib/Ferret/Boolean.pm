# Copyright (c) 2015, Mitchell Cooper
package Ferret::Boolean;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Ferret::Conversion qw(perl_boolean);

Ferret::bind_class(
    name      => 'Boolean',
    alias     => 'Bool',
    init      => \&init,
    init_want => '$from',
    desc      => \&description
);

sub init {
    my ($bool, $arguments) = @_;

    # from another value
    if (my $from = $arguments->{from}) {
        $bool->{bool_value} = perl_boolean($from);
    }

    return $bool if $bool->{real};

    # this isn't one of the "real" true or false objects,
    # so force init to return one of them.
    $bool->{override_init_obj} = $bool->{bool_value} ? Ferret::true : Ferret::false;

}

sub description {
    return shift->{bool_value} ? 'true' : 'false';
}

1
