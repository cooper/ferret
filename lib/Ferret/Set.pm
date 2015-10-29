# Copyright (c) 2013, Mitchell Cooper
package Ferret::Set;

use warnings;
use strict;
use utf8;

use parent 'Ferret::Object';
use Ferret::Core::Conversion qw(perl_description);

*new = *Ferret::bind_constructor;

Ferret::bind_class(
    name => 'Set',
    desc => \&description
);

sub _property {
    my ($set, $prop_name) = @_;

    # find function
    my $set_class = $set->{set_class} or return;
    my $real_func = $set_class->property($prop_name) or return;

    # return function
    my $func = Ferret::Function->new($set->f, name => 'setMethod');
    $func->{code} = sub {
        # consider: perhaps it should pass additional arguments to function.
        return $real_func->call(
            [ @{ $set->{all_objs} } ], # make a copy
            $set->{set_scope} # scope where set was created. good enough.
        );
    };

    return ($func, $set);
}

sub set_property {
    # probably just raise an error.
    # or maybe use this for multiple assignment.
    # e.g. ($x, $y) = ($x + 1, $y + 1)
}

sub to_list {

}

sub description {
    my ($set, $own_only) = @_;
    my $class_name = $set->{set_class} ? $set->{set_class}{name} : 'Object';

    # handle indents
    my @values = map {
        join "\n    ", split /\n/, perl_description($_, $own_only)
    } @{ $set->{all_objs} };

    return "<$class_name>(\n    ".join("\n    ", @values)."\n)";
}

1
