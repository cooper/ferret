# Copyright 2015, Mitchell Cooper
package F::InterfaceMethod;

use warnings;
use strict;
use parent 'F::NodeExpression';

sub desc { 'method requirement' }

sub perl_fmt {
    my $im = shift;

    # add variable => type
    my $arg_string = '';
    my $list = ($im->children)[1];
    foreach my $child (map $_->first_child, $list->children) {
        my ($key, $value) =
            ($child->key_name, $child->value->{bareword_value});
        $key = "'$key'" if $key =~ m/^\d/;
        $arg_string .= ', ' if length $arg_string;
        $arg_string .= "$key => '$value'";
    }

    return can => {
        name      => $im->method_name,
        arguments => "[ $arg_string ]",
        returns   => $im->parent->returns_fmt_do
    };
}

sub method_name {
    my $var = (shift->children)[0];
    return $var->{var_name};
}

1
