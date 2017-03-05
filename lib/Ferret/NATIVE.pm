# Copyright (c) 2016, Mitchell Cooper
package Ferret::NATIVE;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Ferret::Core::Conversion qw(fnumber fstring fbool FUNC_ARGS);
use File::Slurp qw(slurp);

my @functions = (
    isa => {
        need => '$obj $class:Str',
        code => \&_isa
    },
    bless => {
        need => '$obj $class:Str',
        code => \&_bless
    },
    ord => {
        need => '$char:Char',
        code => \&_ord
    },
    slurp => {
        need => '$filePath:Str $encoding:File::Encoding',
        code => \&_slurp
    }
);

Ferret::bind_class(
    name      => 'NATIVE',
    functions => \@functions
);

*new = *Ferret::bind_constructor;

sub _isa {
    my $args = $_[FUNC_ARGS];
    my $class = $args->pstring('class');
    return fbool($args->{obj}->isa($class));
}

sub _bless {
    my $args = $_[FUNC_ARGS];
    bless $args->{obj}, $args->pstring('class');
    return Ferret::true;
}

sub _ord {
    my $args = $_[FUNC_ARGS];
    return fnumber(ord $args->pstring('char'));
}

my %encoding = (
    ':binary'   => ':raw',
    ':utf8'     => ':utf8'
);

sub _slurp {
    my $args = $_[FUNC_ARGS];
    my $slurped = slurp(
        $args->pstring('filePath'),
        binmode => $args->pstring('encoding')
    );
    # FIXME, if binary, use something other than normal string, since normal
    # strings are encoded in UTF-8
    return fstring($slurped);
}

1
