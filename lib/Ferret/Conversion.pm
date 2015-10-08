# Copyright (c) 2015, Mitchell Cooper
package Ferret::Conversion;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Core::Operations 'import';
use Scalar::Util qw(blessed looks_like_number);

# return a ferret string object.
sub ferret_string {
    my $val = shift;
    my $f = $Ferret::ferret;

    # not blessed.
    if (!blessed $val) {
        return Ferret::String->new($f, value => $val);
    }

    # already a blessed string.
    if ($val->isa('Ferret::String')) {
        return $val;
    }

    if ($val->isa('Ferret::Object')) {

        # it's an object with a string converter.
        if (my $to_str = $val->property('toString')) {
            return $to_str->call;
        }

        # maybe an unblessed string object.
        if (defined $val->{value}) {
            return $val;
        }

        # it's an object with a description converter.
        if ($val->can('description')) {
            return ferret_string($val->description);
        }
        if (my $to_desc = $val->property('description')) {
            return $to_desc->call;
        }

    }

    return "$val";
}

# return a perl string value.
sub perl_string {
    my $val = shift;
    return ''   if !defined $val;
    return $val if !blessed $val;
    return ferret_string($val)->{value} // '';
}

# return a perl object description.
sub perl_description {
    my ($val, $own_only) = @_;
    return $val->description($own_only) if $val->can('description');
    return perl_string($val);
}

# return a ferret number object.
sub ferret_number {
    my $val = shift;
    my $f = $Ferret::ferret;

    # not blessed.
    if (!blessed $val) {
        $val = 0 if !looks_like_number($val);
        return Ferret::Number->new($f, value => $val);
    }

    # already a blessed number.
    if ($val->isa('Ferret::Number')) {
        return $val;
    }

    if ($val->isa('Ferret::Object')) {

        # maybe an unblessed number object.
        if (defined $val->{value}) {
            return $val;
        }

        # it's an object with a number converter.
        if (my $to_num = $val->property('toNumber')) {
            return $to_num->call;
        }

    }

    # it's an object with no number value.
    my $addr = $val + 0;
    return Ferret::Number->new($f, value => $addr);

}

# return a perl string value.
sub perl_number {
    my $val = shift;
    return $val if !blessed $val;
    return ferret_number($val)->{value} // 0;
}

# return a ferret list object.
# if @vals are not ferret objects, they will be ferretized.
sub ferret_list {
    my @vals = @_;

    # already an object, probably a list.
    if (@vals == 1 && blessed $vals[0] && exists $vals[0]{list_items}) {
        return $vals[0] if $vals[0];
    }

    # array ref.
    if (@vals == 1 && ref $vals[0] eq 'ARRAY') {
        @vals = @{ $vals[0] };
    }

    @vals = map ferretize($_), @vals;
    return Ferret::List->new($Ferret::ferret, values => \@vals);
}

sub perl_listref {
    return [ ];
    # TODO
}

sub ferret_hash {
    return ferret_string("hash conversion not yet implemented");
    # TODO
}

# $recursive indicates whether to perlize values.
sub perl_hashref {
    my ($hash, $recursive) = @_;

    # can't do anything with this.
    return { } if !blessed $hash || !$hash->{hash_values};

    my %hash;
    foreach my $key (keys %{ $hash->{hash_values} }) {
        my $value = $hash->{hash_values}{$key};
        $hash{$key} = $recursive ? perlize($value) : $value;
    }

    return \%hash;
}

sub ferret_boolean {
    my $truth = !!shift;
    return $truth ? Ferret::true : Ferret::false;
}

sub perl_boolean {
    return Ferret::truth(@_);
}

sub ferretize {
    my $val = shift;
    return $val if blessed $val && $val->isa('Ferret::Object');
    if (ref $val eq 'ARRAY') {
        return ferret_list(@$val);
    }
    if (ref $val eq 'HASH') {
        return ferret_hash(%$val);
    }
    if (looks_like_number($val)) {
        return ferret_number($val);
    }
    return ferret_string($val);
}

# for lists and hashes, references are returned.
sub perlize {
    my $val = shift;
    return $val if !blessed $val || !$val->isa('Ferret::Object');
    return perl_listef($val)    if $val->{list_items};
    return perl_hashref($val)   if $val->{hash_values};
    return $val->{value}        if defined $val->{value};
    return perl_string($val);
}

1
