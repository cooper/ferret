# Copyright (c) 2015, Mitchell Cooper
package Ferret::String;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Scalar::Util qw(blessed looks_like_number);
use Ferret::Core::Conversion qw(
    pstring pnumber phashref plist flist_fromref
    fstring flist fbool fnumber fsym
    FUNC_SELF FUNC_ARGS FUNC_RET
);

my @methods = (
    opAdd => {
        need => '$rhs',
        code => \&op_add
    },
    opSim => {
        need => '$rhs:Rgx',
        code => \&op_sim
    },
    opEqual => {
        need => '$rhs:Str',
        code => \&op_equal
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
    hasSuffix => {
        need => '$suffix:Str',
        code => \&_hasSuffix
    },
    trimSuffix => {
        need => '$suffix:Str',
        code => \&_trimSuffix
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
        code => \&_hash_value,
        prop => 1
    },
    getValue => {
        need => '$index:Num',
        code => \&_get_value
    },
    copy => {
        code => \&_copy
    }
);

Ferret::bind_class(
    name      => 'String',
    alias     => 'Str',
    methods   => \@methods,
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

##################
### OPERATIONS ###
##################

# string plus string.
sub op_add {
    my ($str, $args) = @_;
    my $rhs = $args->{rhs};
    my $new_value = pstring($str).pstring($rhs);
    return fstring($new_value);
}

# string similar to regex.
sub op_sim {
    my ($str, $args, $call_scope) = @_;
    my $rgx = $args->{rhs};
    my $crt = $str->call_prop(match => [ $rgx ]);

    # FIXME: the below is temporary
    $call_scope->{special}->set_property(match => $crt->property('parts'));
    my @captures = plist($crt->property('parts'));
    $call_scope->set_property($_ + 1 => $captures[$_]) for 0..$#captures;

    return $crt->property('matched');
}

##################
### PROPERTIES ###
##################

# string length.
sub _length {
    my $str = shift;
    return Ferret::Number->new($str->f, num_value => length $str->{str_value});
}

# uppercase copy.
sub _uppercase {
    my $str = shift;
    return fstring(uc $str->{str_value});
}

# lowercase copy.
sub _lowercase {
    my $str = shift;
    return fstring(lc $str->{str_value});
}

###############
### METHODS ###
###############

# split into substrings either by a string or regex separator.
# returns a list of strings.
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

# true if string starts with something.
sub _hasPrefix {
    my ($str, $args) = @_;
    my $prefix = $args->pstring('prefix');
    my $pfx = \substr($str->{str_value}, 0, length $prefix);
    return fbool($$pfx eq $prefix);
}

# remove something from beginning of string.
sub _trimPrefix {
    my ($str, $args, $ret) = @_[FUNC_SELF, FUNC_ARGS, FUNC_RET];
    my $prefix = $args->pstring('prefix');
    my $s = $str->{str_value}; # make a copy

    # trim the prefix
    my $trimmed;
    my $pfx = \substr($s, 0, length $prefix);
    if ($$pfx eq $prefix) {
        $$pfx = '';
        $trimmed++;
    }

    # store whether we did trim it
    $ret->set_property(trimmed => fbool($trimmed));

    return fstring($s);
}

# true if string ends with something.
sub _hasSuffix {
    my ($str, $args) = @_;
    my $suffix = $args->pstring('suffix');
    my $sfx = \substr($str->{str_value}, -length $suffix);
    return fbool($$sfx eq $suffix);
}

# remove something from end of string.
sub _trimSuffix {
    my ($str, $args, $ret) = @_[FUNC_SELF, FUNC_ARGS, FUNC_RET];
    my $suffix = $args->pstring('suffix');
    my $s = $str->{str_value}; # make a copy

    # trim the suffix
    my $trimmed;
    my $sfx = \substr($s, -length $suffix);
    if ($$sfx eq $suffix) {
        $$sfx = '';
        $trimmed++;
    }

    # store whether we did trim it
    $ret->set_property(trimmed => fbool($trimmed));

    return fstring($s);
}

# return a copy with <<placeholders>> replaced with values.
sub _fill {
    my ($str, $args) = @_;

    # find the values.
    my %info;
    if (my $hash = $args->{valueHash}) {
        %info = %{ phashref($hash, 1) };
    }
    else {
        %info = map { $_ => $args->pstring($_) } keys %$args;
    }

    # fill.
    my @lines;
    foreach my $line (split /\n/, $str->{str_value}) {
        chomp $line;

        # determine the indent.
        my ($indent) = ($line =~ m/^(\s*).*$/);

        # add the indent, if necessary.
        my $add_indent = sub {
            defined(my $key = $info{+shift}) or return;

            # because we split by newline, if the fill info itself
            # is a newline, @lines will be empty. this fixes that.
            return $key if $key eq "\n";

            # split into lines; add indents.
            my @lines = split "\n", $key;
            return join "\n$indent", @lines;

        };

        # replace each occurrence with the indented version of the
        # corresponding value.
        $line =~ s/<<\s*(\w+)\s*>>/@{[ $add_indent->($1) ]}/g;
        push @lines, $line;

    }

    # join.
    my $s = join "\n", @lines; # make a copy

    return fstring($s);
}

# match a regex.
#
# consider: "hello".match(/anything/) will always be true.
# if only there were a way for the return object to be false,
# without fail. fail without an error? hmm...
#
sub _match {
    my ($str, $args, undef, undef, $ret) = @_;
    my $rgx = $args->pregex('rgx');
    my (@parts) = $str->{str_value} =~ m/$rgx/;
    $ret->set_property(matched => fbool(scalar @parts));
    $ret->set_property(parts   => flist(@parts)) if @parts;
    return $ret;
}

# strings are hashable in nature.
sub _hash_value {
    my $str = shift;
    return fsym($str->{str_value});
}

# convert to number. force Perl numeric context.
sub _to_number {
    my $str = shift;
    return fnumber($str->{str_value} + 0)
        if looks_like_number($str->{str_value});
    return fnumber(0);
}

# get substring
sub _get_value {
    my ($str, $args) = @_;
    my $index = $args->pnumber('index');
    return fstring(substr $str->{str_value}, $index, 1);
}

# return a copy of the string.
# TODO: copy will eventually be an Object method.
sub _copy {
    my $str = shift;
    return fstring($str->{str_value});
}

# string surrounded by double quotes.
sub description {
    my ($str, $own_only) = @_;
    $str = q(").$str->{str_value}.q(");
    $str =~ s/\r\n|\r|\n/\x{2424}/g;
    return $str;
}

# any of these work:
#
# Ferret::String->equal($str1, $str2)
# $str1->equal($str2)
# equal($str1, $str2)
#
sub equal {
    shift if !blessed $_[0];
    my ($str1, $str2) = @_;
    return $str1->{str_value} eq $str2->{str_value};
}

sub op_equal {
    my ($str, $args) = @_;
    return fbool($str->equal($args->{rhs}));
}

1
