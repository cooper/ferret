# Copyright (c) 2014, Mitchell Cooper
package Ferret::Class;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

sub new {
    my ($class, $f, %opts) = @_;
    $opts{prototype} ||= Ferret::Object->new($f);
    return $class->SUPER::new($f, %opts);
}

sub add_property {

}

sub prototype { shift->{prototype} }

# "calling" a class is creating an instance.
sub call {
    my ($class, $arguments) = @_;

    # create a new object, and add the prototype as a parent.
    my $obj = Ferret::Object->new($class->ferret);
    $obj->add_parent($class->prototype);

    # initialize it; return the instance.
    my $ret = $class->init($obj, $arguments);
    return $ret->property('instance');

}

# initialize an object.
sub init {
    my ($class, $obj, $arguments) = @_;

    # fetch or create return object.
    my $ret = $class->has_property('_init_') ? do {
        my $init = $class->property('_init_');
        $init->{last_parent} = $obj; # for $self ($obj instead of $class)
        $init->call($arguments, $class->{outer_scope}); # scope necessary?
    } : Ferret::Object->new($class->ferret);

    # inject instance properties.
    $ret->set_property(instance => $obj);
    $ret->set_property(lc $class->{name} => $obj);

    return $ret;
}

1
