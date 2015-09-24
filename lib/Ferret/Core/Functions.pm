# Copyright (c) 2014, Mitchell Cooper
package Ferret::Core::Functions;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Conversion qw(perl_string ferret_string);

sub _say {
    my ($self, $arguments, $call_scope, $scope, $return) = @_;
    say perl_string($arguments->{message});
    return $return;
}

sub _parent_names {
    my $obj = shift;
    my @parents;
    foreach my $parent ($obj->parents) {

        # it's a prototype
        if ($parent->{proto_class}) {
            push @parents, $parent->{proto_class}{name};
            next;
        }

        # just an object
        push @parents, join('|', _parent_names($parent));

    }
    push @parents, 'Object' if !@parents;
    return @parents;
}

sub _inspect_value {
    my $value = shift;
    if ($value->isa('Ferret::String')) {
        $value = q(").$value->{value}.q(");
        $value =~ s/\r\n|\r|\n/\x{2424}/g;
        return $value;
    }
    if ($value->isa('Ferret::List')) {
        my @values = map _inspect_value($_), @{ $value->{list_items} };
        return "(\n    ".join("\n    ", @values)."\n)";
    }
    if ($value->isa('Ferret::Hash')) {
        my @keys   = $value->keys;
        my @values = map _inspect_value($_), $value->values;
        my $i = 0;
        foreach my $key (@keys) {
            $values[$i] = "$key: ".$values[$i];
            $i++;
        }
        return "(\n    ".join("\n    ", @values)."\n)";
    }
    if ($value->isa('Ferret::Event')) {
        return "Event '$$value{name}'";
    }
    if ($value->isa('Ferret::Function')) {
        return "Function '$$value{name}'"
    }
    return perl_string($value);
}

sub _inspect {
    my ($self, $arguments, $call_scope, $scope, $return) = @_;
    my $obj = $arguments->{value};
    my @parents = _parent_names($obj);

    # find properties
    my $prop_str = "\n";
    foreach my $prop_name ($obj->properties(1)) {
        my ($value, $owner) = $obj->_property($prop_name);

        # indiciate it's inherited
        $prop_name = "($prop_name)" if $owner != $obj;

        # indent lines
        $value = join "\n    ", split /\n/, _inspect_value($value);

        $prop_str .= '    '.$prop_name." = $value\n";
    }

    # create the string
    my $str = sprintf '[ %s ](%s)', join(', ', @parents), $prop_str;
    say $str unless $arguments->{quiet};

    $return->{string} = ferret_string($str);
    return $return;
}

1
