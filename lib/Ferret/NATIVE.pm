# Copyright (c) 2016, Mitchell Cooper
package Ferret::NATIVE;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Ferret::Core::Conversion qw(fnumber fbool FUNC_ARGS);

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

1
