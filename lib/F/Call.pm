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

sub function   { shift->first_child   }
sub arg_list   { (shift->children)[1] }
sub func_args  { my $l = shift->arg_list; $l ? $l->ordered_children : () }
sub named_args { my $l = shift->arg_list; $l ? $l->is_hash : undef       }

1
