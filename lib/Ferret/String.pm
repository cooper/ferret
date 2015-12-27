# Copyright (c) 2015, Mitchell Cooper
package Ferret::String;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Scalar::Util qw(blessed looks_like_number);
use Ferret::Core::Conversion qw(
    perl_string perl_number perl_hashref perl_list
    ferret_string ferret_list ferret_boolean ferret_number
);

my @methods = (
    opAdd => {
        need => '$other',
        code => \&op_add
    },
    length => {
        code => \&_length,
        prop => 1
    },
    split => {
        want => '$separator:Str $limit:Num', # TODO: $separator:Str|Reg
        code => \&_split
    },
    hasPrefix => {
        need => '$prefix:Str',
        code => \&_hasPrefix
    },
    trimPrefix => {
        need => '$prefix:Str',
        code => \&_trimPrefix
    },
    fill => {
        # all passed parameters are placeholder values,
        # or a single hash can be passed with values.
        want => '$valueHash:Hash',
        code => \&_fill
    },
    toNumber => {
        code => \&_to_number
    },
    copy => {
        code => \&_copy
    }
);

my @functions = (
    equal => {
        need => '$strs:Str...',
        code => \&_equal
    },
    join => {
        need => '$strs:Str...',
        code => \&_join
    }
);

Ferret::bind_class(
    name      => 'String',
    alias     => 'Str',
    methods   => \@methods,
    functions => \@functions,
    init      => \&init,
    init_want => '$from',
    desc      => \&description
);

*new = *Ferret::bind_constructor;

sub init {
    my ($str, $arguments) = @_;
    if ($arguments->{from}) {
        $str->{str_value} = perl_string($arguments->{from});
    }
    $str->{str_value} = '' if !defined $str->{str_value};
}

# string plus string
sub op_add {
    my ($str, $arguments) = @_;
    my $other = $arguments->{other};
    my $new_value = perl_string($str).perl_string($other);
    return ferret_string($new_value);
}

sub length : method {
    my $str = shift;
    return length $str->{str_value};
}

sub _length {
    my $str = shift;
    return Ferret::Number->new($str->f, num_value => $str->length);
}

# for now, this only accepts strings.
sub _split {
    my ($str, $arguments) = @_;
    my $sep     = perl_string($arguments->{separator}); # undef returns ''
    my $limit   = $arguments->{limit} ? perl_number($arguments->{limit}) : 0;
    my @strings = split /\Q$sep\E/, $str->{str_value}, $limit;
    return ferret_list(map ferret_string($_), @strings);
}

sub hasPrefix {
    my ($str, $prefix) = @_;
    my $pfx = \substr($str->{str_value}, 0, length $prefix);
    return $$pfx eq $prefix;
}

sub _hasPrefix {
    my ($str, $arguments) = @_;
    my $pfx = perl_string($arguments->{prefix});
    return ferret_boolean($str->hasPrefix($pfx));
}

sub trimPrefix {
    my ($str, $prefix) = @_;
    my $s   = $str->{str_value}; # make a copy
    my $pfx = \substr($s, 0, length $prefix);
    $$pfx   = '' if $$pfx eq $prefix;
    return ferret_string($s);
}

sub _trimPrefix {
    my ($str, $arguments) = @_;
    my $pfx = perl_string($arguments->{prefix});
    return $str->trimPrefix($pfx);
}

sub fill {
    my ($str, $info) = @_;

    # fill.
    my @lines;
    foreach my $line (split /\n/, $str->{str_value}) {
        chomp $line;
        my ($indent) = ($line =~ m/^(\s*).*$/);
        my $add_indent = sub {
            defined(my $key = $info->{+shift}) or return;
            my @lines = split "\n", $key;
            return join "\n$indent", @lines;
        };
        $line =~ s/<<\s*(\w+)\s*>>/@{[ $add_indent->($1) ]}/g;
        push @lines, $line;
    }

    # join.
    my $s = join "\n", @lines; # make a copy

    return ferret_string($s);
}

sub _fill {
    my ($str, $arguments) = @_;
    my %info;
    if (my $hash = $arguments->{valueHash}) {
        %info = %{ perl_hashref($hash, 1) };
    }
    else {
        %info = map { $_ => perl_string($arguments->{$_}) } keys %$arguments;
    }
    return $str->fill(\%info);
}

sub _to_number {
    my $str = shift;
    return ferret_number($str->{str_value} + 0)
        if looks_like_number($str->{str_value});
    return ferret_number(0);
}

sub description {
    my ($str, $own_only) = @_;
    $str = q(").$str->{str_value}.q(");
    $str =~ s/\r\n|\r|\n/\x{2424}/g;
    return $str;
}

# TODO: copy will eventually be an Object method.
sub _copy {
    my $str = shift;
    return ferret_string($str->{str_value});
}

# any of these work
#
# Ferret::String->equal($str1, $str2)
# $str1->equal($str2)
# equal($str1, $str2)
#
# but usage from Ferret is
#
# String.equal($str1, $str2)
# ($str1, $str2).equal()
#
sub equal {
    shift if !blessed $_[0];
    my ($str1, $str2) = @_;
    return $str1->{str_value} eq $str2->{str_value};
}

sub _equal {
    my (undef, $arguments) = @_;
    my ($first_str, @rest_strs) = perl_list($arguments->{strs});
    foreach (@rest_strs) {
        return Ferret::false if !$first_str->equal($_);
    }
    return Ferret::true;
}

sub _join {
    my (undef, $arguments) = @_;
    my $list = ferret_list(delete $arguments->{strs});
    return ferret_string($list->join(''));
}

1
