# Copyright (c) 2015, Mitchell Cooper
package Ferret::TypedClass;

use warnings;
use strict;
use utf8;
use parent 'Ferret::Object';

use Scalar::Util qw(weaken);
use Ferret::Core::Conversion qw(pdescription flist fnumber plist);

*new = *Ferret::bind_constructor;

Ferret::bind_class(
    name  => 'TypedClass',
    desc  => \&description,
    init  => \&init
);

sub init {
    my ($tc, undef, undef, undef, $ret) = @_;

    # these are required.
    if (!$tc->{main_class} || !$tc->{other_types}) {
        return $ret->fail('TypedClass cannot be created directly');
    }

    # hold weak references to the class and other types.
    weaken($tc->{main_class});
    weaken($tc->{other_types}[$_]) for 0..$#{ $tc->{other_types} };

    # make the typed class inherit from the real class.
    $tc->add_parent($tc->{main_class});

}

sub call {
    my ($tc, $args) = (shift, @_);
    my $class = $tc->{main_class};

    # if passed an instance, return the instance.
    if (ref $args eq 'ARRAY' && @$args == 1 &&
    $args->[0]->instance_of($class)) {
        my $obj  = $args->[0];
        my $gens = $obj->{generics}{$class} or return Ferret::undefined;
        my $i    =  -1;

        # make sure the generics are compatible. see issue #23.
        foreach my $type (@{ $tc->{other_types} }) { $i++;

            # find the name of the generic.
            my $name = $class->{generic_letters}[$i];
            $name = $$name if ref $name;

            # ensure the object exists and is equal.
            next if $gens->{$name} && $gens->{$name} == $type;
            return Ferret::undefined;
        }

        return $obj;
    }

    $class->set_generics($tc->{other_types});
    my $ret = $class->call(@_);
    $class->reset_generics;
    return $ret;
}

sub _property {
    my $tc = shift;
    $tc->{main_class}->set_generics($tc->{other_types});
    my @ret = $tc->{main_class}->_property(@_);
    $tc->{main_class}->reset_generics;
    return @ret;
}

sub description {
    my $tc    = shift;
    my $class = $tc->{main_class};
    my $gen   = join ', ', map $_->{name}, @{ $tc->{other_types} };
    my $sig   = $class->signature_string;
    my $desc  = "TypedClass '$$class{name}'";
    $desc    .= " $$class{version}" if $class->{version};
    $desc    .= " <$gen>"           if length $gen;
    $desc    .= " { $sig }"         if length $sig;
    return $desc;
}

1
