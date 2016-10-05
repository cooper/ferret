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
    my $tc = shift;
    $tc->{main_class}->set_generics($tc->{other_types});
    my $ret = $tc->{main_class}->call(@_);
    $tc->{main_class}->reset_generics;
    return $ret;
}

sub _property {
    my $tc = shift;
    $tc->{main_class}->set_generics($tc->{other_types});
    my $ret = $tc->SUPER::_property(@_);
    $tc->{main_class}->reset_generics;
    return $ret;
}

sub description {
    my $tc = shift;
    return $tc->{main_class}->description;
}

1
