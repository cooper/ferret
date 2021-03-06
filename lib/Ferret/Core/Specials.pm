# Copyright (c) 2015, Mitchell Cooper
package Ferret::Core::Specials;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Core::Conversion qw(
    flist_wrap fhash_fromref flist fbool
    pdescription pstring fnumber fstring
);

my %specials = (
    self            => \&_self,
    ISA             => \&_ISA,
    classes         => \&_classes,
    ownProperties   => \&_ownProperties,
    allProperties   => \&_allProperties,
    instanceOfClass => _function('instanceOfClass', '$class'),
    isa             => _function('isa', '$type'),
    get             => _function('get', '$property:Str'),
    getOwn          => _function('getOwn', '$property:Str'),
    set             => _function('set', '$property:Str $value'),
    commonClass     => _function('commonClass', '$other:Object'),
    fullName        => _function('fullName', '$property:Str'),
    description     => \&_description,
    addr            => \&_addr,
    addParent       => _function('addParent', '$object'),
    addListener     => _function('addListener', '$object'),
    generics        => \&_generics
);

@Ferret::specials{keys %specials} = values %specials;

sub _function {
    my ($name, $need, $want) = @_;
    return sub {
        my $obj  = shift;
        my $f    = $obj->f;
        my $func = $f->{_specials}{$name};
        if (!$func) {
            $func = $f->{_specials}{$name} = Ferret::Function->new($f,
                name => $name,
                need => $need,
                want => $want,
                code => __PACKAGE__->can("_$name")
            );
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
sub _ISA {
    my $obj = shift;
    return $obj->{_isa_ferret} if $obj->{_isa_ferret};
    my $list = flist_wrap($obj->{isa});
    return $obj->{_isa_ferret} = $list;
}

# returns mutable ISA list.
sub _generics {
    my $obj = shift;
    return $obj->{_generics_ferret} if $obj->{_generics_ferret};
    my $list = fhash_fromref($obj->{generics});
    return $obj->{_generics_ferret} = $list;
}

# returns immutable class list.
sub _classes {
    my $obj = shift;
    return flist($obj->parent_classes);
}

sub _allProperties {
    my $obj = shift;
    return flist($obj->properties(1));
}

sub _ownProperties {
    my $obj = shift;
    return flist($obj->properties);
}

sub _instanceOfClass {
    my ($obj, $args) = @_;
    my $class = $args->{class};
    return fbool($obj->instance_of($class));
}

sub _isa {
    my ($obj, $args) = @_;
    my $class_or_func = $args->{type};
    return $obj->fits_type_u($class_or_func);
}

sub _get {
    my ($obj, $args) = @_;
    my $prop_name = $args->pstring('property');
    return $obj->property_uncomputed($prop_name);
}

sub _getOwn {
    my ($obj, $args) = @_;
    my $prop_name = $args->pstring('property');
    return $obj->own_property_uncomputed($prop_name);
}

sub _set {
    my ($obj, $args) = @_;
    my $key   = $args->pstring('property');
    my $value = $args->{value};
    # FIXME: check that it's not special,
    #        that it is valid,
    #        that it's not a namespace,
    #        etc.
    $obj->set_property($key => $value);
    return Ferret::true;
}

sub _commonClass {
    my ($obj, $args) = @_;
    my $other = $args->{other};
    return $obj->best_common_class($other);
}

sub _description {
    my $desc = pdescription(shift);
    return fstring($desc);
}

sub _addr {
    my $obj = shift;
    return fnumber($obj + 0);
}

sub _fullName {
    my ($obj, $args) = @_;
    my $prop_name = pstring($args->{property});
    return fstring($obj->full_name($prop_name));
}

sub _addParent {
    my ($obj, $args) = @_;
    $obj->add_parent($args->{object});
    return _ISA($obj);
}

sub _addListener {
    my ($obj, $args) = @_;
    my $listener = delete $args->{object};
    $obj->add_parent($listener);
    $obj->add_listener($listener, $args);
}

1
