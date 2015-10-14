# Copyright (c) 2013, Mitchell Cooper
package Ferret::Object;

use warnings;
use strict;
use utf8;
use parent 'Evented::Object';

use Scalar::Util qw(blessed weaken);
use List::Util qw(first);

use Ferret::Core::Conversion qw(perl_description);
use Ferret::Core::Errors qw(throw);

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

    # set special, if available.
    weaken($obj->{special} = $f->{special})
        if !$obj->{special} && $f->{special};

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

    # special properties can never be assigned to from Ferret.
    if (substr($prop_name, 0, 1) eq '*') {
        # FIXME: this needs to raise a runtime error.
        die "no assignment to special variables";
    }

    # ensure that it is a valid Ferret value.
    if (ref $value ne 'CODE' && !Ferret::valid_value($value)) {
        return;
    }

    # store the value.
    $obj->{properties}{$prop_name} = $value;
    delete $obj->{properties}{$prop_name} if !defined $value;

    # good.
    return 1;

}

# set a property or overwrite an inherited property.
sub set_property_ow {
    my ($obj, $context, $prop_name, $value) = @_;
    my $owner = $obj->has_property($prop_name) || $obj;

    # if the owner is a context, but not the call context,
    # do not overwrite that value.
    #
    # for example, if you set a variable $x in the CORE context
    #
    # $x = "hi";
    #
    # then do
    #
    # package Hello
    # $x = "hello";
    #
    # $x will not overwrite the original "hi", even though
    # it would otherwise have been inherited from the main context.
    #
    if ($owner->isa('Ferret::Context') && $owner != $context) {
        $owner = $obj;
    }

    return $owner->set_property($prop_name => $value);
}

# deletes a property.
# $obj->delete_property('someProperty')
#
# this is different from setting a value to undefined.
# an undefined value is still a value. deleting a property makes it valueless.
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
sub property   { (shift->_property(@_))[0] }
sub property_u { (shift->property(@_)) || Ferret::undefined }

# this should not be used directly.
# it returns a property value and its owner.
#
# some subclasses of Object may override this function, but
# they must NOT override ->property or ->property_u, as those methods
# only rely on whichever custom implemention of ->_property exists.
#
sub _property {
    my ($obj, $prop_name, $borrow_obj) = @_;

    # if the prop name starts with asterisk, it's a special property.
    my $first = \substr($prop_name, 0, 1);
    if ($$first eq '*') {
        $$first = '';
        $borrow_obj = $obj; # pretend the property belongs to the object
        $obj = $obj->{special} or return;
    }

    $borrow_obj ||= $obj; # the object inheriting the property.

    # try the local property first.
    # this is done separately first because hopefully,
    # we won't even need to generate ->parents.
    if (defined $obj->{properties}{$prop_name}) {
        my $p = $obj->{properties}{$prop_name};
        weaken($p->{last_parent} = $borrow_obj) if blessed $p;
        $p = $p->($borrow_obj) if ref $p eq 'CODE'; # computed property
        return ($p, $obj);
    }

    # try a different context.
    if (index($prop_name, '::') != -1) {
        my ($context, $real_prop_name) = ($prop_name =~ m/^(.+)::(.+?)$/);
        $context = $obj->f->get_context($context);
        return $context->_property($real_prop_name);
    }

    # try inheritance.
    foreach my $o ($obj->parents) {
        my @v = $o->_property($prop_name, $borrow_obj);
        return (@v) if @v;
    }

    return;
}

# has a property, either its own or inherited.
# returns the owner of the property or Perl undef.
sub has_property {
    my ($obj, $prop_name) = @_;
    my ($value, $owner) = $obj->_property($prop_name);
    return $owner if defined $value;
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

# property names
sub properties {
    my ($obj, $include_inherited) = @_;
    my @names = keys %{ $obj->{properties} };
    if ($include_inherited) {
        push @names, $_->properties($include_inherited)
            foreach $obj->parents;
    }
    return @names;
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

# revoke an object of parenthood.
sub remove_parent {
    my ($obj, $old_parent) = @_;
    @{ $obj->{isa} } = grep { $_ != $old_parent } @{ $obj->{isa} };
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

# returns a flattened and simplified list of parent names as Perl strings.
# this should be used only for debugging. it may not be consistent or reliable.
sub parent_names {
    my $obj = shift;
    my @parents;
    foreach my $parent ($obj->parents) {

        # it's a prototype
        if ($parent->{proto_class}) {
            push @parents, $parent->{proto_class}{name};
            next;
        }

        # just an object
        my @p = grep $_ ne 'Prototype', $parent->parent_names;
        push @parents, @p if @p;

    }
    unshift @parents, $obj->{faketype} if $obj->{faketype};
    push @parents, 'Object' if !@parents;
    return _uniq(@parents);
}

sub _uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}

# returns a flattened and simplified list of parent classes.
# basically, it searches all parents. if a parent is a prototype object,
# it finds the class to which that prototype belongs.
sub parent_classes {
    my ($obj, @classes) = shift;
    foreach my $parent ($obj->parents) {
        next unless $parent->{is_proto};
        push @classes, $parent->{proto_class};
    }
    return @classes;
}

# returns the "nearest" parental class relationship between two objects.
sub best_common_class {
    my ($obj1, $obj2) = @_;
    my %found;
    my @classes_1 = $obj1->parent_classes;
    my @classes_2 = $obj2->parent_classes;

    while (@classes_1 || @classes_2) {
        my ($class_1, $class_2) = (shift @classes_1, shift @classes_2);
        $found{$class_1}++;
        return $class_2 if $found{$class_2};
    }

    return undef;
    # TODO: if ever implemented an Object prototype, return it here.
}

sub instance_of {
    my ($obj, $class_maybe) = @_;
    return if !$class_maybe;
    return defined first { $_ == $class_maybe } $obj->parent_classes;
}

#####################
### MISCELLANEOUS ###
#####################

# create an object that represents a set of objects.
sub create_set {
    my ($obj, $call_scope, @other_objs) = @_;
    return Ferret::Set->new($obj->f,
        primary_obj => $obj,
        other_objs  => \@other_objs,
        all_objs    => [ $obj, @other_objs ],
        set_class   => best_common_class($obj, @other_objs),
        set_scope   => $call_scope
    );
}

sub description {
    my ($obj, $own_only) = @_;

    return 'undefined' if Ferret::undefined($obj);
    return 'true'      if $obj == Ferret::true;
    return 'false'     if $obj == Ferret::false;

    my ($skipped, $prop_str) = (0, '');
    my @parents = $obj->parent_names;
    foreach my $prop_name ($obj->properties(1)) {
        my ($value, $owner) = $obj->_property($prop_name);

        # skip other contexts
        if ($owner != $obj && $owner->isa('Ferret::Context')) {
            $skipped++;
            next;
        }

        # skipping all inherited
        if ($owner != $obj && $own_only) {
            $skipped++;
            next;
        }

        $prop_str ||= "\n";

        # indiciate it's inherited
        $prop_name = "($prop_name)" if $owner != $obj;

        # indent lines
        $value     = join "\n    ", split /\n/, perl_description($value, $own_only);
        $prop_str .= '    '.$prop_name." = $value\n";

    }
    $prop_str .= "    $skipped more inherited\n" if $skipped;

    return sprintf '[ %s ](%s)', join(', ', @parents), $prop_str;
}

# calling a non-function.
sub call {
    my $obj = shift;

    # try to convert to a function.
    if (my $to_func = $obj->property('toFunction')) {
        return ($to_func->call || Ferret::undefined)->call(@_);
    }

    # throw an error.
    throw(CallOnNonFunction => [caller], join(', ', $obj->parent_names));

}

###############
### INDICES ###
###############

# call getValue.
sub get_index_value {
    my ($obj, $arguments, $call_scope) = @_;
    return $obj->property('getValue')->call($arguments, $call_scope);
}

# call setValue.
# because the number of indices can be variable, the value is always first.
sub set_index_value {
    my ($obj, $arguments, $value, $call_scope) = @_;
    unshift @$arguments, $value;
    return $obj->property('setValue')->call($arguments, $call_scope);
}

###############################
### EQUALITY AND INEQUALITY ###
###############################

# test object equality, return Ferret boolean
sub equal_to {
    my ($left_obj, $right_obj, $scope) = @_;

    # try normal equality first.
    # TODO: maybe check equality for each class implementing comparison?
    if (my $cmp = $left_obj->create_set($scope, $right_obj)->property('equal')) {
        return $cmp->call;
    }

    # fallback to object equality.
    return $left_obj->equal_to_exactly($right_obj, $scope);

}

# test exact object equality, return Ferret boolean
sub equal_to_exactly {
    my ($left_obj, $right_obj, $scope) = @_;
    return $left_obj == $right_obj ? Ferret::true : Ferret::false;
}

################
### FETCHERS ###
################

# fetch the ferret.
sub f {
    shift->{ferret};
}

1
