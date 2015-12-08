# Copyright 2014 Mitchell Cooper
package F::Call;

use warnings;
use strict;
use parent qw(F::Node F::Expression);

sub type { 'Call' }
sub fake { 1 }

sub perl_fmt {
    my $call = shift;
    my $func = $call->function;
    my $arg_string = '';

    # named.
    if ($call->named_args) {
        foreach my $pair (map $_->first_child, $call->func_args) {
            $arg_string .= ', ' if length $arg_string;
            my ($key, $value) = ($pair->key, $pair->value->perl_fmt_do);
            $arg_string .= "$key => $value";
        }
    }

    # unnamed.
    else {
        $arg_string = join ', ',
            grep length,
            map $_->perl_fmt_do,
            $call->func_args;
    }

    my $fmt = !length $arg_string || $call->named_args ? 'call_named' : 'call';
    return $fmt => {
        coderef   => $func->perl_fmt_do,
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
        $do->($_) foreach $el->children;
    };
    $do->($calling);

    return $yes;
}

sub function   { shift->first_child   }
sub arg_list   { (shift->children)[1] }
sub func_args  { my $l = shift->arg_list; $l ? $l->ordered_children : () }
sub named_args { my $l = shift->arg_list; $l ? $l->is_hash : undef       }

1
