# Copyright 2015, Mitchell Cooper
package F::Body;

use warnings;
use strict;
use 5.010;
use parent 'F::ScopeOwner';

sub type { 'Body'  }
sub desc {
    my $t = lcfirst shift->parent->type;
    return "body ('$t' scope)";
}

sub hold_instr { 1 }
sub is_closure { 1 }

sub body_fmt_do {
    my ($body, $content, @arguments) = (shift, '');

    foreach my $child ($body->ordered_children) {
        $content .= $child->perl_fmt_do."\n";

        # wants or needs would be the first child of a child
        # because the child is likely an instruction.
        my $wn = ($child->ordered_children)[0];

        # add wants/needs.
        next unless $wn && $wn->type eq 'WantNeed';
        foreach my $var ($wn->variables) {
            push @arguments, $body->get_format(func_arg => {
                name => $var->{var_name},
                want => $wn->{arg_type} eq 'want' ? '1' : 'undef',
                type => $wn->type_string,
                more => $wn->{ellipsis} ? '1' : 'undef'
            });
        }

    }
    return wantarray ? ($content, @arguments) : $content;
}

1
