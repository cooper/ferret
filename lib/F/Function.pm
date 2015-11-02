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
    my ($content, $arguments) = ('', '');

    foreach my $child ($func->ordered_children) {
        $content .= $child->perl_fmt_do."\n";

        # wants or needs would be the first child of a child
        # because the child is likely an instruction.
        my $wn = ($child->ordered_children)[0];

        # add wants/needs.
        next unless $wn && $wn->type eq 'WantNeed';
        foreach my $var ($wn->variables) {
            my $fmt = "func_arg_$$wn{arg_type}";
            $arguments .= $func->get_format($fmt => {
                name => $var->{var_name},
                type => $wn->var_type  || '',
                more => $wn->{ellipsis} ? '1' : 'undef'
            }).";\n";
        }

    }

    my $info = {
        event_cb   => $func->{event_cb},
        id         => $func->document->{function_cid}++,
        name       => $func->{anonymous} ? '(undef)' : $func->{name},
        semi       => $func->{anonymous} ? '' : ';', # probably temporary hack
        is_prop    => $func->{is_prop} ? '1' : 'undef',
        statements => $content,
        arguments  => $arguments
    };

    # add the function definition.
    push @{ $func->document->{function_defs} }, $info;

    return function => $info;
}

1
