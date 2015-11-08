# Copyright 2014 Mitchell Cooper
package F::Function;

use warnings;
use strict;
use 5.010;
use parent 'F::Statement';

sub type { 'Function' }
sub is_closure { 1 }
sub hold_instr { 1 }
sub anonymous { shift->{anonymous} }

sub desc {
    my $func = shift;
    return 'anonymous function' if $func->anonymous;
    return "function '$$func{name}'";
}

sub new {
    my ($class, %opts) = @_;
    return $class->SUPER::new(name => '_anonymous_', %opts);
}

sub close : method {
    my $func = shift;

    # this may be a fake function inside an On block
    if ($func->{parent}->type eq 'On') {
        return $func->SUPER::close->close;
    }

    return $func->SUPER::close(@_);
}

sub perl_fmt {
    my $func = shift;
    my ($content, @arguments) = '';

    foreach my $child ($func->ordered_children) {
        $content .= $child->perl_fmt_do."\n";

        # wants or needs would be the first child of a child
        # because the child is likely an instruction.
        my $wn = ($child->ordered_children)[0];

        # add wants/needs.
        next unless $wn && $wn->type eq 'WantNeed';
        foreach my $var ($wn->variables) {
            push @arguments, $func->get_format(func_arg => {
                name => $var->{var_name},
                want => $wn->{arg_type} eq 'want' ? '1' : 'undef',
                type => $wn->type_string,
                more => $wn->{ellipsis} ? '1' : 'undef'
            });
        }

    }

    my $info = {
        anonymous  => $func->{anonymous},
        event_cb   => $func->{event_cb},
        id         => $func->document->{function_cid}++,
        name       => $func->{anonymous} ? '(undef)' : $func->{name},
        semi       => $func->{anonymous} ? ''        : ';', # probably temporary hack
        is_prop    => $func->{is_prop}   ? '1'       : 'undef',
        p_set      => $func->{p_set}     ? '1'       : 'undef',
        statements => $content,
        arguments  => join(', ', @arguments)
    };

    # add the function definition.
    push @{ $func->document->{function_defs} }, $info;

    return function => $info;
}

1
