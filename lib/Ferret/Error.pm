# Copyright (c) 2015, Mitchell Cooper
package Ferret::Error;

use warnings;
use strict;
use utf8;
use 5.010;

use parent 'Ferret::Object';
use Ferret::Core::Conversion qw(
    FUNC_V1 FUNC_SELF FUNC_ARGS FUNC_RET
    fstring fnumber fhash_fromref plist perlize
);

my @methods = (
    setPosition => {
        need => '$file:Str $line:Num',
        code => \&_setPosition
    },
    setHint => {
        need => '$key:Str $value:Str',
        code => \&_setHint
    }
);

Ferret::bind_class(
    name      => 'Error',
    methods   => \@methods,
    init      => \&init,
    init_need => '$type:Sym $msg:Str',
    init_want => '$hints:List $subError:Error $fatal:Bool',
    desc      => \&description
);

*new = *Ferret::bind_constructor;

sub init {
    my ($err, $args) = &FUNC_V1;
    $err->{hints} = {};
    $err->{hint_keys} = [];
    $err->set_property($_ => $args->{$_})
        for qw(type msg subError fatal);
    
    # hints passed to constructor as a list
    my @hints = plist($args->{hints});
    while (my ($key, $val) = splice @hints, 0, 2) {
        $err->set_hint($key, $val);
    }
        
    $err->set_property(hints => fhash_fromref($err->{hints}));
    return $err;
}

sub _setPosition {
    my ($err, $args, $ret) = @_[FUNC_SELF, FUNC_ARGS, FUNC_RET];
    $err->set_hint(File => $args->{file});
    $err->set_hint(Line => $args->{line});
    return $ret;
}

sub _setHint {
    my ($err, $args, $ret) = @_[FUNC_SELF, FUNC_ARGS, FUNC_RET];
    $err->set_hint(@$args{'key', 'value'});
    return $ret;
}

sub update_position {
    my ($err, $pos) = @_;
    return if !defined $pos;
    $err->call_prop(setPosition => [ fstring("$pos"), fnumber(int $pos) ]);
}

sub set_hint {
    my ($err, $key, $value) = @_;
    ($key, $value) = map perlize($_), $key, $value;
    if (!exists $err->{hints}{$key}) {
        push @{ $err->{hint_keys} }, $key;
    }
    $err->{hints}{$key} = $value;
}

sub description {
    my ($err, %opts) = @_;
    my ($type, $msg) = map $err->pstring($_), qw(type msg);
    my $fmt = "[$type] $msg";

    # error hints
    my @hint_keys = @{ $err->{hint_keys} };
    $fmt .= "\n" if @hint_keys;
    foreach my $key (@hint_keys) {
        my $val = $err->{hints}{$key};
        $fmt .= "    $key: $val\n";
    }

    return $fmt;
}

1
