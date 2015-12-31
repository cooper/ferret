# Copyright (c) 2015, Mitchell Cooper
package Ferret::Set;

use warnings;
use strict;
use utf8;

use parent 'Ferret::Object';
use Ferret::Core::Conversion qw(pdescription flist plist);

*new = *Ferret::bind_constructor;

my @methods = (
    methods => {
        code => \&_methods,
        prop => 1
    },
    toList => {
        code => \&_to_list
    }
);

my @functions = (
    fromList => {
        need => '$list:List',
        code => \&_from_list
    }
);

Ferret::bind_class(
    name      => 'Set',
    desc      => \&description,
    methods   => \@methods,
    functions => \@functions,
    init      => \&init,
    init_need => '$item1 $items...'
);

sub init {
    my ($set, $args, $call_scope) = @_;
    $set->{set_scope} = $call_scope;

    # add objects.
    my @others          = $args->plist('items');
    $set->{primary_obj} = delete $args->{item1};
    $set->{other_objs}  = \@others;
    $set->{all_objs}    = [ $set->{primary_obj}, @others ];

    # determine class.
    $set->{set_class} = $set->{primary_obj}->best_common_class(@others)
        if @others;

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
        return $real_func->call(
            [ @{ $set->{all_objs} } ] # make a copy
        );
    };

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

    return flist(@good);
}

sub _to_list {
    my $set = shift;
    flist(@{ $set->{all_objs} });
}

sub _from_list {
    my ($set_class, $args, $call_scope) = @_;
    my @items = $args->plist('list');
    return $set_class->call([ @items ], $call_scope);
}

sub iterate {
    my $set = shift;
    return @{ $set->{all_objs} };
}

sub iterate_pair {
    my $set = shift;
    my $i = 0;
    return map [ fnumber($i++), $_ ], @{ $set->{all_objs} };
}

sub description {
    my ($set, $own_only) = @_;
    my $class_name = $set->{set_class} ? $set->{set_class}{name} : 'Object';

    # handle indents
    my @values = map {
        join "\n    ", split /\n/, pdescription($_, $own_only)
    } @{ $set->{all_objs} };

    return "<$class_name>(\n    ".join("\n    ", @values)."\n)";
}

1
