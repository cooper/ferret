# Copyright (c) 2015, Mitchell Cooper
package Ferret::Core::Specials;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Conversion qw(ferret_list_wrap ferret_list);

my %specials = (
    self            => \&_self,
    isa             => \&_isa,
    classes         => \&_classes,
    ownProperties   => \&_own_properties,
    allProperties   => \&_all_properties,
    instanceOf      => _function('instanceOf', '$class:Class')
);

@Ferret::specials{keys %specials} = values %specials;

sub _function {
    my ($name, $need, $want) = @_;
    return sub {
        my $obj = shift;
        my $f   = $obj->f;
        my $func = $f->{_specials}{$name};
        if (!$func) {
            $func = $f->{_specials}{$name} = Ferret::Function->new($f,
                name => $name,
                code => __PACKAGE__->can("_$name")
            );

            # add needs
            $func->add_argument(
                name => $_->{name},
                # type   => $_->{type}, TODO
            ) foreach Ferret::Class::_parse_method_args($need);

            # add wants.
            $func->add_argument(
                name     => $_->{name},
                # type   => $_->{type}, TODO
                optional => 1
            ) foreach Ferret::Class::_parse_method_args($want);

        }
        $f->{_specials}{$name}{force_self} = $obj;
        return $f->{_specials}{$name};
    };
}

sub _self {
    my $obj = shift;
    return $obj;
}

# returns mutable ISA list.
sub _isa {
    my $obj = shift;
    return ferret_list_wrap($obj->{isa});
}

# returns immutable class list.
sub _classes {
    my $obj = shift;
    return ferret_list($obj->parent_classes);
}

sub _all_properties {
    my $obj = shift;
    return ferret_list($obj->properties(1));
}

sub _own_properties {
    my $obj = shift;
    return ferret_list($obj->properties);
}

sub _instanceOf {
    my ($obj, $arguments) = @_;
    my $class = $arguments->{class};
    foreach my $c ($obj->parent_classes) {
        return Ferret::true if $class == $c;
    }
    return Ferret::false;
}

1
