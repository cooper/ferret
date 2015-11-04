# Copyright 2014 Mitchell Cooper
package F::Method;

use warnings;
use strict;
use 5.010;
use parent 'F::Statement';

sub type { 'Method' }
sub is_closure { 1 }
sub hold_instr { 1 }

sub desc {
    my $method = shift;
    my $main = $method->{main}    ? 'main '             : '';
    my $type = $method->{is_prop} ? 'computed property' : 'method';
    my $lazy = $method->{p_set}   ? ' (lazy)'           : '';
    return "$main$type '$$method{name}'$lazy";
}

sub perl_fmt {
    my $method = shift;
    my ($content, $arguments) = ('', '');

    foreach my $child ($method->ordered_children) {
        $content .= $child->perl_fmt_do."\n";

        # wants or needs would be the first child of a child
        # because the child is likely an instruction.
        my $wn = ($child->ordered_children)[0];

        # add wants/needs.
        next unless $wn && $wn->type eq 'WantNeed';
        foreach my $var ($wn->variables) {
            my $fmt = "func_arg_$$wn{arg_type}";
            $arguments .= $method->get_format($fmt => {
                name => $var->{var_name},
                type => $wn->var_type  || '',
                more => $wn->{ellipsis} ? '1' : 'undef'
            }).";\n";
        }

    }

    my $class = $method->class;
    my $info = {
        event_cb   => $method->{event_cb},
        id         => $class->{method_cid}++,
        name       => $method->{name},
        statements => $content,
        arguments  => $arguments,
        is_prop    => $method->{is_prop} ? '1' : 'undef',
        p_set      => $method->{p_set}   ? '1' : 'undef',
        owner      => $method->{main} ? 'class' : 'proto'
    };

    # add the method definition.
    push @{ $class->{method_defs} }, $info;

    return method => $info;
}

1
