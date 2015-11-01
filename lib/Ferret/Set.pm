# Copyright (c) 2015, Mitchell Cooper
package Ferret::Set;

use warnings;
use strict;
use utf8;

use parent 'Ferret::Object';
use Ferret::Core::Conversion qw(perl_description ferret_list perl_list);

*new = *Ferret::bind_constructor;

my @methods = (
    methods => {
        code => \&_methods
    },
    toList => {
        code => \&_to_list
    }
);

Ferret::bind_class(
    name    => 'Set',
    desc    => \&description,
    methods => \@methods,
    init    => \&init
);

sub init {
    my $set = shift;
    $set->set_property_weak(class => $set->{set_class});
    $set->{set_done} = 1;
}

sub _property {
    my ($set, $prop_name) = @_;

    # find function
    my $set_class = $set->{set_class} or return;
    my $real_func = $set_class->property($prop_name);

    # special property or not found in class
    return $set->SUPER::_property($prop_name)
        if index($prop_name, '*') != -1 || !$real_func;

    # return function
    my $func = Ferret::Function->new($set->f, name => $prop_name);
    $func->{code} = sub {
        #my (undef, $arguments) = @_;
        #my @args = perl_list($arguments->{args});
        return $real_func->call(
            [ @{ $set->{all_objs} } ], # make a copy
            $set->{set_scope} # scope where set was created. good enough.
        );
    };
    #$func->add_argument(name => 'args', optional => 1, more => 1);

    return ($func, $set);
}

sub set_property {
    my $set = shift;
    # probably just raise an error.
    die if $set->{set_done}; # FIXME
    return $set->SUPER::set_property(@_);
}

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

sub _to_list {
    my $set = shift;
    ferret_list(@{ $set->{all_objs} });
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
