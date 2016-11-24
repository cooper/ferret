# Copyright 2015, Mitchell Cooper
package F::Body;

use warnings;
use strict;
use 5.010;
use parent 'F::ScopeOwner';


sub desc {
    my $t = lcfirst shift->parent->type;
    return "$t body";
}

sub hold_instr { 1 }
sub is_closure { 1 }

sub body_arguments {
    my ($body, @arguments) = shift;
    if ($body->parent->can('arguments')) {
        foreach my $wn ($body->parent->arguments) {
            push @arguments, F::get_perl_fmt(func_arg => {
                name => $wn->variable->{var_name},
                want => $wn->{arg_type} eq 'want' ? '1' : 'undef',
                type => $wn->type_string,
                more => $wn->{ellipsis} ? '1' : 'undef'
            });
        }
    }
    return @arguments;
}

sub body_fmt_do {
    my ($body, $content) = (shift, '');

    foreach my $child ($body->ordered_children) {
        $content .= $child->perl_fmt_do."\n";
    }

    # add wants and needs.
    my @arguments = $body->body_arguments;

    return wantarray ? ($content, @arguments) : $content;
}

1
