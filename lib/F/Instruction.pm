# Copyright 2015, Mitchell Cooper
package F::Instruction;

use warnings;
use strict;
use parent qw(F::Node F::MaybeOwner);


sub detail {
    my $instr = shift;
    my $child = $instr->first_child;
    return $child ? $child->desc.' instruction' : 'instruction';
}

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

sub perl_fmt {
    my $node = shift;
    return $node->maybe_fmt if $node->{maybes};
    return $node->simple_fmt;
}

1
