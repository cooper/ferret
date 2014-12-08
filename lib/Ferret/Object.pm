# Copyright (c) 2013, Mitchell Cooper
package Ferret::Object;

use warnings;
use strict;
use utf8;

use Scalar::Util qw(blessed weaken);

# create a new object.
sub new {
    my ($class, $f, %opts) = @_;
    my $obj = bless {
        isa => [],
        %opts,
        ferret => $f
    }, $class;

    # add parents.
    $obj->add_parent($_) foreach @{
            delete $obj->{parents}    ||
            [ delete $obj->{parent} ] ||
            [ ]
    };

    # add methods.
    $obj->add_methods($obj->methods);

    return $obj;
}

##################
### PROPERTIES ###
##################

# sets a property.
# $obj->set_property(someProperty => $someValue)
#
# where $someValue is one of
#
# a) a Ferret::Object (or something that inherits from Object)
# b) a special Ferret value such as Ferret::undefined, true, false
# c) a Perl reference to code that returns a Ferret::Object or special value
#
# consider: since the addition of the ! operator, should we give up the
# concept of computed properties altogether?
#
# returns true if set successfully, false otherwise.
#
sub set_property {
    my ($obj, $prop_name, $value) = @_;

    # ensure that it is a valid Ferret value.
    if (ref $value ne 'CODE' && !Ferret::valid_value($value)) {
        return;
    }

    # store the value.
    $obj->{properties}{$prop_name} = $value;

    # good.
    return 1;

}

# deletes a property.
# $obj->delete_property('someProperty')
#
# this is different from setting a value to undefined.
# an undefined value is still a value. deleting a property makes it valueless.
# if you
#
# returns true if something was deleted, false otherwise.
#
sub delete_property {
    my ($obj, $prop_name) = @_;
    return defined delete $obj->{properties}{$prop_name};
}

# fetches a property.
# $obj->property('someProperty')
#
# if the property exists but is undefined, returns Ferret::undefined.
# if the property does not exist, returns Perl undef.
#
sub property {
    my ($obj, $prop_name, $borrow_obj) = @_;
    $borrow_obj ||= $obj; # the object inheriting the property.

    # try the local property first.
    # this is done separately first because hopefully,
    # we won't even need to generate ->parents.
    if (exists $obj->{properties}{$prop_name}) {
        my $p = $obj->{properties}{$prop_name};
        weaken($p->{last_parent} = $borrow_obj);
        return $p;
    }

    # try a different context.
    if (index($prop_name, '::') != -1) {
        my ($context, $real_prop_name) = ($prop_name =~ m/^(.+)::(.+?)$/);
        $context = $obj->ferret->get_context($context);
        return $context->property($real_prop_name);
    }

    # try inheritance.
    foreach my $o ($obj->parents) {
        my $value = $o->property($prop_name, $obj);
        return $value if defined $value;
    }

    return;
}

# has a property, either its own or inherited.
sub has_property {
    my ($obj, $prop_name) = @_;
    return defined $obj->property($prop_name);
}

# fetches a property.
# does not take inheritance into account.
#
# if the property exists but is undefined, returns Ferret::undefined.
# if the property does not exist, returns Perl undef.
#
sub own_property {
    # TODO: this needs to do the same extras as ->property.
    shift->{properties}{+shift};
}

# weaken a property.
# this only applies to local properties.
#
sub weaken_property {
    my ($obj, $prop_name) = @_;
    weaken($obj->{properties}{$prop_name});
}

# convenience method:
# sets a property, then weakens it.
#
sub set_property_weak {
    my ($obj, $prop_name, $value) = @_;
    my $res = $obj->set_property($prop_name => $value);
    $obj->weaken_property($prop_name);
    return $res;
}

##########################
### SPECIAL PROPERTIES ###
##########################

###################
### INHERITANCE ###
###################

# add an object as parent.
# typically, these objects are the prototypes of classes.
sub add_parent {
    my ($obj, $new_parent) = @_;
    return unless $new_parent;
    # TODO: if $new_parent is a Ferret array, convert to Perl array ref.
    unshift @{ $obj->{isa} }, $new_parent;
}

# returns a flattened and simplified list of parents.
sub parents {
    my $obj = shift;
    my (@parents, %done);
    my $add; $add = sub {
        foreach (@_) {
            next if $done{$_};
            $done{$_} = 1;
            if (ref $_ eq 'ARRAY') {
                $add->(@$_);
                next;
            }
            push @parents, $_;
        }
    };
    $add->(@{ $obj->{isa} });
    return @parents;
}

################
### FETCHERS ###
################

# fetch the ferret.
sub ferret {
    shift->{ferret};
}

###############
### METHODS ###
###############

sub methods { }

# this is a temporary solution.
# the real deal will be using inheritance of class prototype objects.
# then, individual Events will be created only when necessary
# (and events themselves will have some sort of inheritance mechanism)
sub add_methods {
    my $obj = shift;
    my %methods = $obj->methods;
    foreach my $name (keys %methods) {
        my $m = $methods{$name};
        my $func = Ferret::Function->new($obj->ferret,
            name => $name,
            code => $m->{code},
            is_method => 1
        );

        # needs.
        $func->add_argument(
            name   => $_->{name}
            # type => $_->{type}
        ) foreach _parse_method_args($m->{need});

        # wants.
        $func->add_argument(
            name     => $_->{name},
            # type   => $_->{type},
            optional => 1
        ) foreach _parse_method_args($m->{want});

        $obj->set_property($name => $func);
    }
}

sub _parse_method_args {
    my ($str, @args) = shift;
    return if not defined $str;
    foreach my $arg (split /\s+/, $str) {
        my ($name, $type) = split /:/, $arg, 2;
        $name =~ s/^\$//;
        push @args, {
            name => $name,
            type => $type
        };
    }
    return @args;
}

1
