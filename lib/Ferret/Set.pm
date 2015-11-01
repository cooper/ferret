# Copyright (c) 2013, Mitchell Cooper
package Ferret::Set;

use warnings;
use strict;
use utf8;

use parent 'Ferret::Object';
use Ferret::Core::Conversion qw(perl_description ferret_list);

*new = *Ferret::bind_constructor;

Ferret::bind_class(
    name => 'Set',
    desc => \&description
);

sub _methods {
    my $set = shift;
    my @props = $set->{set_class} ? $set->{set_class}->properties(1) : ();
    my @good;

    # filter out the good methods.
    PROP: foreach my $prop_name (@props) {
        my $func = $set->{set_class}->property($prop_name);

        # only functions.
        $func = $func->default_func if $func->isa('Ferret::Event');
        $func->isa('Ferret::Function') or next;

        # check that all the types in the signature work.
        SIGN: foreach my $sig (@{ $func->{signatures} }) {
            my $type = $sig->{type} or next PROP;

            # it works.
            next if $func->obj_type_works($set->{primary_obj}, $type);

            # it does not work.
            next PROP;

        }

        push @good, $prop_name;
    }

    return ferret_list(@good);
}

sub _property {
    my ($set, $prop_name) = @_;

    return $set->_methods if $prop_name eq 'methods';

    # find function
    my $set_class = $set->{set_class} or return;
    my $real_func = $set_class->property($prop_name) or return;

    # return function
    my $func = Ferret::Function->new($set->f, name => $prop_name);
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
    die; # FIXME
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
