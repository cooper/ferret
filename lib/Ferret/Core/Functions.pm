# Copyright (c) 2014, Mitchell Cooper
package Ferret::Core::Functions;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Conversion qw(perl_string ferret_string perl_boolean);

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
        push @parents, @p if @p;

    }
    unshift @parents, $obj->{faketype} if $obj->{faketype};
    push @parents, 'Object' if !@parents;
    return uniq(@parents);
}

sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}

sub _inspect_value {
    my ($obj, $own_only) = @_;

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
        my @values = map _inspect_value($_, $own_only), @{ $obj->{list_items} };
        return "(\n    ".join("\n    ", @values)."\n)";
    }

    if ($obj->isa('Ferret::Hash')) {
        my @keys   = $obj->keys;
        my @values = map _inspect_value($_, $own_only), $obj->values;
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

    my ($skipped, $prop_str) = (0, "\n");
    my @parents = _parent_names($obj);
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

        # indiciate it's inherited
        $prop_name = "($prop_name)" if $owner != $obj;

        # indent lines
        $value     = join "\n    ", split /\n/, _inspect_value($value, $own_only);
        $prop_str .= '    '.$prop_name." = $value\n";

    }
    $prop_str .= "    $skipped more inherited\n" if $skipped;

    return sprintf '[ %s ](%s)', join(', ', @parents), $prop_str;
}

sub _inspect {
    my ($self, $arguments, $call_scope, $scope, $return) = @_;
    my $obj = $arguments->{value};

    my $str = _inspect_value($obj, perl_boolean($arguments->{ownOnly}));
    say $str unless $arguments->{quiet};

    $return->set_property(string => ferret_string($str));
    return $return;
}

1
