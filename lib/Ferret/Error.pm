# Copyright (c) 2015, Mitchell Cooper
package Ferret::Error;

use warnings;
use strict;
use utf8;
use 5.010;

use parent 'Ferret::Object';
use Ferret::Core::Conversion qw(
    FUNC_V1 FUNC_SELF FUNC_ARGS FUNC_RET
    fstring fnumber flist perlize
);

my @methods = (
    setPosition => {
        need => '$file:Str $line:Num',
        code => \&_setPosition
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
    $err->set_property($_ => $args->{$_})
        for qw(type msg hints subError fatal);
    $err->set_property(hints => flist()) if !$err->has_property('hints');
    return $err;
}

sub _setPosition {
    my ($err, $args, $ret) = @_[FUNC_SELF, FUNC_ARGS, FUNC_RET];
    $err->property('hints')->call_prop(push => [
        fstring("File") => $args->{file},
        fstring("Line") => $args->{line}
    ]);
    return $ret;
}

sub update_position {
    my ($err, $pos) = @_;
    return if !defined $pos;
    $err->call_prop(setPosition => [ fstring("$pos"), fnumber(int $pos) ]);
}

sub description {
    my ($err) = &FUNC_V1;
    my ($type, $msg) = map $err->pstring($_), qw(type msg);
    my $fmt = "[$type] $msg";

    # error hints
    my $hints = perlize($err->property('hints'), 1);
    if (ref $hints eq 'ARRAY') {
        $fmt .= "\n";
        while (my ($hint, $val) = splice @$hints, 0, 2) {
            $fmt .= "    $hint: $val\n";
        }
    }

    # sub error
    if (my $sub_err = $err->property('subError')) {
        return "$fmt -> ".$sub_err->description;
    }

    return $fmt;
}

1
