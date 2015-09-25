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

sub _dump {
    my ($self, $arguments, $call_scope, $scope, $return) = @_;
    my $obj     = $arguments->{value};
    my @parents = map $_->{proto_class}{name}, $obj->parents;
    my $type    = join(',', @parents);

    require Data::Dumper;
    Data::Dumper->import('Dumper');
    $Data::Dumper::Maxdepth = 1;
    $Data::Dumper::Terse = 1;

    print Dumper($obj), " = [ $type ] $obj\n";
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
        my @p = grep $_ ne 'Prototype', _parent_names($parent);
        push @parents, join('|', @p) if @p;

    }
    push @parents, ($obj->{faketype} // 'Object') if !@parents;
    return @parents;
}

sub _inspect_value {
    my $obj = shift;

    return 'undefined' if Ferret::undefined($obj);
    return 'true'      if $obj == Ferret::true;
    return 'false'     if $obj == Ferret::false;

    if ($obj->isa('Ferret::String')) {
        $obj = q(").$obj->{value}.q(");
        $obj =~ s/\r\n|\r|\n/\x{2424}/g;
        return $obj;
    }

    if ($obj->isa('Ferret::Number')) {
        return $obj->{value};
    }

    if ($obj->isa('Ferret::List')) {
        my @values = map _inspect_value($_), @{ $obj->{list_items} };
        return "(\n    ".join("\n    ", @values)."\n)";
    }

    if ($obj->isa('Ferret::Hash')) {
        my @keys   = $obj->keys;
        my @values = map _inspect_value($_), $obj->values;
        my $i = 0;
        foreach my $key (@keys) {
            $values[$i] = "$key: ".$values[$i];
            $i++;
        }
        return "(\n    ".join("\n    ", @values)."\n)";
    }

    if ($obj->isa('Ferret::Event')) {
        return "Event '$$obj{name}'";
    }

    if ($obj->isa('Ferret::Function')) {
        return "Function" if !length $obj->{name};
        return "Function '$$obj{name}'";
    }

    my $prop_str = "\n";
    my @parents = _parent_names($obj);
    foreach my $prop_name ($obj->properties(1)) {
        my ($value, $owner) = $obj->_property($prop_name);

        # indiciate it's inherited
        $prop_name = "($prop_name)" if $owner != $obj;

        # indent lines
        $value     = join "\n    ", split /\n/, _inspect_value($value);
        $prop_str .= '    '.$prop_name." = $value\n";

    }

    return sprintf '[ %s ](%s)', join(', ', @parents), $prop_str;
}

sub _inspect {
    my ($self, $arguments, $call_scope, $scope, $return) = @_;
    my $obj = $arguments->{value};

    my $str = _inspect_value($obj);
    say $str unless $arguments->{quiet};

    $return->set_property(string => ferret_string($str));
    return $return;
}

1
