# Copyright (c) 2015, Mitchell Cooper
package Ferret::Core::Specials;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Core::Conversion qw(ferret_list_wrap ferret_list ferret_boolean);

my %specials = (
    self            => \&_self,
    isa             => \&_isa,
    classes         => \&_classes,
    ownProperties   => \&_ownProperties,
    allProperties   => \&_allProperties,
    instanceOf      => _function('instanceOf', '$class:Class')
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

1
