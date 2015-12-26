# Copyright 2014 Mitchell Cooper
package F::Instruction;

use warnings;
use strict;
use parent qw(F::Statement);

sub type { 'Instruction' }

sub add_maybe {
    my ($instr, $maybe) = @_;
    push @{ $instr->{maybes} ||= [] }, $maybe;
}

sub simple_fmt {
    my $instr = shift;
    my $code  = join('', map $_->perl_fmt_do, $instr->children);
    return unless length $code;
    return instruction => { instruction => $code };
}

sub maybe_fmt {
    my ($instr, $maybe_n) = (shift, 0);
    my @maybes = @{ $instr->{maybes} };
    my $doc = $instr->document;

    # my $maybe...
    my $definitions = '';
    foreach my $maybe (@maybes) {
        $doc->{required_operations}{bool}++;
        $maybe->{n} = $maybe_n++;
        $definitions .= sprintf "my %s = %s;\n",
            $maybe->perl_fmt_do,
            $maybe->exp_fmt_do;
    }

    # if ($maybe...)
    my $conditionals = join ' && ', map { $_->perl_fmt_do } @maybes;

    return instruction_maybe => {
        definitions  => $definitions,
        conditionals => $conditionals,
        instruction  => $instr->get_format($instr->simple_fmt)
    };
}

sub perl_fmt {
    my $instr = shift;
    return $instr->maybe_fmt if $instr->{maybes};
    return $instr->simple_fmt;
}

1
