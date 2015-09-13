# Copyright 2014 Mitchell Cooper
package F::Function;

use warnings;
use strict;
use 5.010;
use parent 'F::Statement';

sub type { 'Function' }
sub desc { "function '$_[0]{name}'" }
sub is_closure { 1 }
sub anonymous { shift->{anonymous} }

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
            my $var_name = $var->{var_name};
            my $fmt = "func_arg_$$wn{arg_type}";
            $arguments .= $func->get_format($fmt => {
                name => $var_name
            }).";\n";
        }

    }

    my $info = {
        event_cb   => $func->{event_cb},
        id         => $func->document->{function_cid}++,
        name       => $func->{anonymous} ? '+undef' : $func->{name},
        statements => $content,
        arguments  => $arguments
    };

    # add the function definition.
    push @{ $func->document->{function_defs} }, $info;

    return function => $info;
}

1
