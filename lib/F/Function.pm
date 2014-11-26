# Copyright 2014 Mitchell Cooper
package F::Function;

use warnings;
use strict;
use 5.010;
use parent 'F::Statement';

sub type { 'Function' }
sub desc { "Function '$_[0]{name}'" }
sub is_closure { 1 }

sub perl_fmt {
    my $func = shift;
    my ($content, $arguments) = ('', '');

    foreach my $child ($func->ordered_children) {
        $content .= $child->perl_fmt_do."\n";

        # wants or needs would be the first child of a child
        # because the child is likely an instruction.
        my $wn = ($child->ordered_children)[0];

        # add needs.
        if ($wn && $wn->type eq 'Need') {
            $arguments .= $func->get_format(func_arg_need => {
                name => $_
            }).";\n" foreach map { $_->{var_name} } $wn->variables;
        }

        # add wants.


    }

    my $info = {
        id         => $func->document->{function_cid}++,
        name       => $func->{name},
        statements => $content,
        arguments  => $arguments
    };

    # add the function definition.
    push @{ $func->document->{function_defs} }, $info;

    return function => $info;
}

1
