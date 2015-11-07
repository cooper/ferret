# Copyright (c) 2015, Mitchell Cooper
package FF;

use warnings;
use strict;
use utf8;
use 5.010;

# fetch the global Ferret.
sub get_ferret {
    return $Ferret::ferret ||= Ferret->new;
}

# fetch the current context.
sub get_context {
    my ($f, $name) = @_;
    return $f->get_context($name);
}

# load the CORE module.
sub load_core {
    my $name = shift;

    # this is the CORE module, or it's already been done.
    return if $name eq 'CORE' || $INC{'CORE.frt.pm'};

    do 'CORE.frt.pm' or die "Core error: ".($@ || $!);
    return;
}

# things to do before evaluating runtime content.
sub before_content {
    my $base = shift;

    # remember we tried this file.
    $Ferret::tried_files{"$base.pm"}++;

    return;
}

# things to do after evaluating runtime content.
sub after_content {

    # start the runtime.
    Ferret::runtime();

    # file returns true.
    return 1;

}

# load namespaces.
sub load_namespaces {
    my ($context, @namespaces) = @_;
    Ferret::space($context, $_) for @namespaces;
    return;
}

# create a simple object.
sub create_object {
    my ($f, $pairs) = @_;
    return Ferret::Object->new($f, initial_props => $pairs);
}

# create a hash.
sub create_hash {
    my ($f, $pairs) = @_;
    return Ferret::Hash->new($f, pairs => $pairs);
}

# create a list.
sub create_list {
    my ($f, $items) = @_;
    return Ferret::List->new($f, items => $items);
}

# create a set.
sub create_set {
    my ($scope, $first_item, @other_items) = @_;
    return $first_item->create_set($scope, @other_items);
}

# attach an event callback.
sub on {
    my ($obj, $event_name, $self, $scope, $on_func) = @_;
    my $event = $obj->property($event_name);

    # if $event exists and is not an event, runtime error.
    if ($event && !$event->isa('Ferret::Event')) { # TODO: proper type checking
        die; # FIXME
        throw();
    }

    # create the event if it doesn't exist.
    if (!$event) {
        $obj->set_property($event_name =>
            Ferret::Event->new($obj->f, name => $event_name)
        );
        $event = $obj->property($event_name); # set last_parent.
    }

    # add the function.
    $event->add_function_with_self_and_scope($self, $scope, $on_func);

    return;
}

# iterate over a list.
sub iterate {
    my ($f, $outer_scope, $collection, $var_name, $code) = @_;
    foreach ($collection->iterate) {
        my $scope = Ferret::Scope->new($f, parent => $outer_scope);
        $scope->set_property($var_name => $_);
        $code->($scope);
    }
    return;
}

# iterate over a hash.
sub iterate_pair {
    my ($f, $outer_scope, $collection, $var1_name, $var2_name, $code) = @_;
    foreach ($collection->iterate_pair) {
        my $scope = Ferret::Scope->new($f, parent => $outer_scope);

        # ->iterate_pair returns arrayref [key, value].
        $scope->set_property($var1_name => $_->[0]);
        $scope->set_property($var2_name => $_->[1]);

        $code->($scope);
    }
    return;
}

# set a required function argument.
# return false if failed.
sub need {
    my ($scope_or_self, $arguments, $var_name) = @_;

    # must be present.
    my $value = $arguments->{$var_name} or return;

    $scope_or_self->set_property($var_name => $value);
    return $value;
}

1
