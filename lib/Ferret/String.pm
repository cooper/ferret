# Copyright (c) 2014, Mitchell Cooper
package Ferret::String;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

my @methods = (
    op_add => {
        code => \&op_add,
        need => '$other:Str'
    }
);

*new = *Ferret::bind_constructor;
Ferret::bind_class(
  # package   => 'Some::Package',   # e.g. Math
  # parent    => 'Object',          # space-separated list (default: Object)
    name      => 'String',
    alias     => 'Str',             # space-separated list
  # functions => \@functions,
    methods   => \@methods          # added as callbacks. do not overwrite each other.
);

# string plus string
sub op_add {
    my ($str, $arguments) = @_;
    my $other = $arguments->{other};
    my $new_value = $str->{value}.$other->{value};
    return Ferret::String->new($str->ferret, value => $new_value);
}

1
