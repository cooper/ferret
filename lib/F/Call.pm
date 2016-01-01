# Copyright 2015, Mitchell Cooper
package F::Call;

use warnings;
use strict;
use parent qw(F::NodeExpression);


sub fake { 1 }

sub perl_fmt {
    my $call = shift;
    my $func = $call->function;

    my ($list_args, $hash_args) = ('') x 2;
    foreach my $child (map $_->first_child, $call->args) {

        # pair -- add to pair string.
        if ($child->type eq 'Pair') {
            my ($key, $value) = ($child->key, $child->value->perl_fmt_do);
            $hash_args .= ', ' if length $hash_args;
            $hash_args .= "$key => $value";
            next;
        }

        # non-pairs -- add to normal string.
        $list_args .= ', ' if length $list_args;
        $list_args .= $child->perl_fmt_do;

    }

    my $arg_string =
        length $list_args && length $hash_args ?
        "[ $list_args, { $hash_args } ]"       :
        length $list_args                      ?
        "[ $list_args ]"                       :
        "{ $hash_args }"                       ;

    return call => {
        coderef   => $call->func_fmt_do,
        arguments => $arg_string,
        pos       => $call->{create_pos}
    };
}

# true if the call started an instruction.
sub started_instr {
    my $call = shift;
    my $calling = $call->function;

    # this might be easy...
    return 1 if $calling->{started_instr};

    # or it might be more difficult.
    # search children, but stop when reaching functions or methods.
    return unless $calling->is_node;

    my $yes;
    my $do; $do = sub {
        my $el = shift;
        if ($el->{started_instr}) {
            $yes = 1;
            return;
        }
        return if $el->hold_instr;
        if ($el->is_node) { $do->($_) foreach $el->children }
    };
    $do->($calling);

    return $yes;
}

sub func_fmt_do { shift->function->perl_fmt_do }

sub function { shift->first_child   }
sub arg_list { (shift->children)[1] }
sub args     { my $l = shift->arg_list; $l ? $l->ordered_children : () }

1
