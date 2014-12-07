# Copyright 2014 Mitchell Cooper
package F::Method;

use warnings;
use strict;
use 5.010;
use parent 'F::Statement';

sub type { 'Method' }
sub desc { 'M'.($_[0]{main} ? 'ain m' : '')."ethod '$_[0]{name}'" }
sub is_closure { 1 }

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
            my $var_name = $var->{var_name};
            my $fmt = "func_arg_$$wn{arg_type}";
            $arguments .= $method->get_format($fmt => {
                name => $var_name
            }).";\n";
        }

    }

    my $class = $method->class;
    my $info = {
        id         => $class->{method_cid}++,
        name       => $method->{name},
        statements => $content,
        arguments  => $arguments,
        owner      => $method->{main} ? 'class' : 'proto'
    };

    # add the method definition.
    push @{ $class->{method_defs} }, $info;

    return method => $info;
}

1
