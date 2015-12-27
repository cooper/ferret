# Copyright (c) 2015, Mitchell Cooper
package Ferret::Core::Conversion;

use warnings;
use strict;
use utf8;
use 5.010;

use Scalar::Util qw(blessed looks_like_number);

# special import to handle underscore prefix
sub import {
    my $this_package = shift;
    my $package = caller;
    foreach (@_) {
        my ($left, $right) = ($_) x 2;
        my $f = \substr($right, 0, 1);
        $$f = '' if $$f eq '_';
        no strict 'refs';
        *{ "${package}::$left" } = *{ "${this_package}::$right" }
    }
}

# return a ferret string object.
sub fstring {
    my $val = shift;
    my $f = $Ferret::ferret;

    # not blessed.
    if (!blessed $val) {
        return Ferret::String->new($f, str_value => $val);
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
        if (defined $val->{str_value}) {
            return $val;
        }

        # it's an object with a description converter.
        if ($val->can('description')) {
            return fstring($val->description);
        }
        if (my $to_desc = $val->property('description')) {
            return $to_desc->call;
        }

    }

    return "$val";
}

# return a perl string value.
sub pstring {
    my $val = shift;
    return ''   if !defined $val;
    return $val if !blessed $val;
    return fstring($val)->{str_value} // '';
}

# return a perl object description.
sub pdescription {
    my ($val, $own_only) = @_;
    return $val->description($own_only) if $val->can('description');
    return pstring($val);
}

# return a ferret number object.
sub fnumber {
    my $val = shift;
    my $f = $Ferret::ferret;

    # not blessed.
    if (!blessed $val) {
        $val = 0 if !looks_like_number($val);
        return Ferret::Number->new($f, num_value => $val);
    }

    # already a blessed number.
    if ($val->isa('Ferret::Number')) {
        return $val;
    }

    if ($val->isa('Ferret::Object')) {

        # maybe an unblessed number object.
        if (defined $val->{num_value}) {
            return $val;
        }

        # it's an object with a number converter.
        if (my $to_num = $val->property('toNumber')) {
            return $to_num->call;
        }

    }

    # it's an object with no number value.
    return Ferret::Number->new($f, num_value => 0);

}

# return a perl string value.
sub pnumber {
    my $val = shift;
    return $val if !blessed $val && looks_like_number($val);
    return fnumber($val)->{num_value} // 0;
}

# return a ferret list object.
# if @vals are not ferret objects, they will be ferretized.
sub flist {
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

# returns a Ferret list which updates a Perl array reference.
sub flist_wrap {
    my $ref = shift;
    return if ref $ref ne 'ARRAY';
    return Ferret::List->new($Ferret::ferret, ref_values => $ref);
}

sub plist {
    return @{ &plistref };
}

sub plistref {
    my $list = shift;
    return [ ] if !blessed $list || !$list->isa('Ferret::List');
    return [ @{ $list->{list_items} || [] } ]; # make a copy
}

sub fhash {
    my $hashref = shift;
    return unless ref $hashref eq 'HASH';
    $hashref = { %$hashref }; # make a copy
    return Ferret::Hash->new($Ferret::ferret, pairs => $hashref);
}

# $recursive indicates whether to perlize values.
sub phashref {
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

sub fbool {
    my $val = shift;
    return $val if blessed $val && defined $val->{bool_value};
    my $truth = !!$val;
    return $truth ? Ferret::true : Ferret::false;
}

sub pbool {
    return Ferret::truth(@_);
}

sub ffunction {
    my $code = shift;
    return unless ref $code eq 'CODE';
    return Ferret::Function->new($Ferret::ferret, code => $code);
}

sub fmethod {
    my $func = &ffunction;
    $func->{is_method} = 1;
    return $func;
}

sub ferretize {
    my $val = shift;
    return $val if blessed $val && $val->isa('Ferret::Object');
    if (ref $val eq 'ARRAY') {
        return flist(@$val);
    }
    if (ref $val eq 'HASH') {
        return fhash(%$val);
    }
    if (looks_like_number($val)) {
        return fnumber($val);
    }
    return fstring($val);
}

# for lists and hashes, references are returned.
sub perlize {
    my $val = shift;
    return $val if !blessed $val || !$val->isa('Ferret::Object');
    return plistef($val)    if $val->{list_items};
    return phashref($val)   if $val->{hash_values};
    return $val->{num_value}    if defined $val->{num_value};
    return pstring($val);
}

1
