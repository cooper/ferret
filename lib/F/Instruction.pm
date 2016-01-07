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

    # instruction with 'catch' following.
    my $catch = ($instr->children)[1];
    if ($catch) {
        my $var_name = $catch->var_name;
        return instruction_catch => {
            instruction      => $code,
            catch_statements => $catch->body->body_fmt_do,
            var_name         => defined $var_name ? "'$var_name'" : 'undef'
        };
    }

    # simple instruction.
    return instruction => { instruction => $code };

}

sub perl_fmt {
    my $node = shift;
    return $node->maybe_fmt if $node->{maybes};
    return $node->simple_fmt;
}

1
