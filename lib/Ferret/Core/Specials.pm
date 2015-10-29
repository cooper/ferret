# Copyright (c) 2015, Mitchell Cooper
package Ferret::Core::Specials;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Core::Conversion qw(
    ferret_list_wrap ferret_list ferret_boolean
    perl_string
);

my %specials = (
    self            => \&_self,
    isa             => \&_isa,
    classes         => \&_classes,
    ownProperties   => \&_ownProperties,
    allProperties   => \&_allProperties,
    instanceOf      => _function('instanceOf', '$class'),
    get             => _function('get', '$property:Str'),
    getOwn          => _function('getOwn', '$property:Str'),
    set             => _function('set', '$property:Str $value'),
    commonClass     => _function('commonClass', '$other:Object')
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
sub _isa {
    my $obj = shift;
    return $obj->{_isa_ferret} if $obj->{_isa_ferret};
    my $list = ferret_list_wrap($obj->{isa});

    # as a function, it tests whether it's an instance of a class
    $list->set_property(toFunction => Ferret::Function->new($obj->f,
        name => 'toFunction',
        code => sub { $specials{instanceOf}($obj) }
    ));

    return $obj->{_isa_ferret} = $list;
}

# returns immutable class list.
sub _classes {
    my $obj = shift;
    return ferret_list($obj->parent_classes);
}

sub _allProperties {
    my $obj = shift;
    return ferret_list($obj->properties(1));
}

sub _ownProperties {
    my $obj = shift;
    return ferret_list($obj->properties);
}

sub _instanceOf {
    my ($obj, $arguments) = @_;
    my $class = $arguments->{class};
    return ferret_boolean($obj->instance_of($class));
}

sub _get {
    my ($obj, $arguments) = @_;
    my $prop_name = perl_string($arguments->{property});
    return $obj->simple_property_u($prop_name);
}

sub _getOwn {
    my ($obj, $arguments) = @_;
    my $prop_name = perl_string($arguments->{property});
    return $obj->own_property_u($prop_name);
}

sub _set {
    my ($obj, $arguments) = @_;
    my $key   = perl_string($arguments->{property});
    my $value = $arguments->{value};
    # FIXME: check that it's not special,
    #        that it is valid,
    #        that it's not a namespace,
    #        etc.
    $obj->set_property($key => $value);
    return Ferret::true;
}

sub _commonClass {
    my ($obj, $arguments) = @_;
    my $other = $arguments->{other};
    return $obj->best_common_class($other) || $obj->f->{object_initializer};
    # note: best_common_class() will eventually return Object
}

1
