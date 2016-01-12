# Copyright (c) 2015, Mitchell Cooper
package Ferret::String;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Scalar::Util qw(blessed looks_like_number);
use Ferret::Core::Conversion qw(
    pstring pnumber phashref plist
    fstring flist fbool fnumber fsym
);

my @methods = (
    opAdd => {
        need => '$other',
        code => \&op_add
    },
    opSim => {
        need => '$other:Rgx',
        code => \&op_sim
    },
    length => {
        code => \&_length,
        prop => 1
    },
    split => {
        want => '$separator:Str|Rgx $limit:Num',
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
    uppercase => {
        prop => 1,
        code => \&_uppercase
    },
    lowercase => {
        prop => 1,
        code => \&_lowercase
    },
    match => {
        need => '$rgx:Rgx',
        code => \&_match
    },
    hashValue => {
        code => \&_hash_value
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
    my ($str, $args) = @_;
    if ($args->has('from')) {
        $str->{str_value} = $args->pstring('from');
    }
    $str->{str_value} = '' if !defined $str->{str_value};
}

# string plus string
sub op_add {
    my ($str, $args) = @_;
    my $other = $args->{other};
    my $new_value = pstring($str).pstring($other);
    return fstring($new_value);
}

sub op_sim {
    my ($str, $args, $call_scope) = @_;
    my $rgx = $args->{other};
    my $crt = $str->call_prop(match => [ $rgx ]);

    # FIXME: the below is temporary
    $call_scope->{special}->set_property(match => $crt->property('parts'));
    my @captures = plist($crt->property('parts'));
    $call_scope->set_property($_ + 1 => $captures[$_]) for 0..$#captures;

    return $crt->property('matched');
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
    my ($str, $args) = @_;
    my $limit = $args->pnumber('limit', 0);

    # default separator (characters).
    my $sep = qr//;

    # regex separator.
    if ($args->{separator} && $args->{separator}->isa('Ferret::Regex')) {
        $sep = $args->pregex('separator');
    }

    # string separator.
    elsif ($args->{separator}) {
        $sep = $args->pstring('separator');
        $sep = qr/\Q$sep\E/;
    }

    my @strings = split $sep, $str->{str_value}, $limit;
    return flist(map fstring($_), @strings);
}

sub hasPrefix {
    my ($str, $prefix) = @_;
    my $pfx = \substr($str->{str_value}, 0, length $prefix);
    return $$pfx eq $prefix;
}

sub _hasPrefix {
    my ($str, $args) = @_;
    my $pfx = $args->pstring('prefix');
    return fbool($str->hasPrefix($pfx));
}

sub trimPrefix {
    my ($str, $prefix) = @_;
    my $s   = $str->{str_value}; # make a copy
    my $pfx = \substr($s, 0, length $prefix);
    $$pfx   = '' if $$pfx eq $prefix;
    return fstring($s);
}

sub _trimPrefix {
    my ($str, $args) = @_;
    my $pfx = $args->pstring('prefix');
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

    return fstring($s);
}

sub _fill {
    my ($str, $args) = @_;
    my %info;
    if (my $hash = $args->{valueHash}) {
        %info = %{ phashref($hash, 1) };
    }
    else {
        %info = map { $_ => $args->pstring($_) } keys %$args;
    }
    return $str->fill(\%info);
}

sub _uppercase {
    my $str = shift;
    return fstring(uc $str->{str_value});
}

sub _lowercase {
    my $str = shift;
    return fstring(lc $str->{str_value});
}

sub _hash_value {
    my $str = shift;
    return fsym($str->{str_value});
}

sub _to_number {
    my $str = shift;
    return fnumber($str->{str_value} + 0)
        if looks_like_number($str->{str_value});
    return fnumber(0);
}

# consider: "hello".match(/anything/) will always be true.
# if only there were a way for the return object to be false,
# without fail. fail without an error? hmm...
sub _match {
    my ($str, $args, undef, undef, $ret) = @_;
    my $rgx = $args->pregex('rgx');
    my (@parts) = $str->{str_value} =~ m/$rgx/;
    $ret->set_property(matched => fbool(scalar @parts));
    $ret->set_property(parts   => flist(@parts)) if @parts;
    return $ret;
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
    return fstring($str->{str_value});
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
    my (undef, $args) = @_;
    my ($first_str, @rest_strs) = $args->plist('strs');
    foreach (@rest_strs) {
        return Ferret::false if !$first_str->equal($_);
    }
    return Ferret::true;
}

sub _join {
    my (undef, $args) = @_;
    my $list = flist(delete $args->{strs});
    return fstring($list->join(''));
}

1
