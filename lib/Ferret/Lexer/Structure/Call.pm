# Copyright 2014 Mitchell Cooper
package Ferret::Lexer::Structure::Call;

use warnings;
use strict;
use parent qw(Ferret::Lexer::Structure Ferret::Lexer::Expression);

sub type { 'Call' }
sub fake { 1 }

sub perl_fmt {
    my $call = shift;
    my $func = $call->function;

    # find the pairs in the arguments.
    my @pairs = grep {
        $_ && $_->type eq 'Pair'
    } map { ($_->children)[0] }$call->func_args;


    # if there are any pairs, all of the args MUST be pairs.
    # (except eventually when we have variable # of arguments)
    if (@pairs && @pairs != $call->func_args) {
        # TODO: ERROR!
        return;
    }

    my $arg_string = '';

    # unnamed.
    if (!@pairs) {
        $arg_string = join ', ',
            grep length,
            map $_->perl_fmt_do,
            $call->func_args;
    }

    # named.
    else {
        foreach my $pair (@pairs) {
            $arg_string .= ', ' if length $arg_string;
            my ($key, $value) = ($pair->key, $pair->value->perl_fmt_do);
            $arg_string .= "$key => $value";
        }
    }

    return (@pairs ? 'call_named' : 'call') => {
        coderef   => $func->perl_fmt_do,
        arguments => $arg_string
    };
}

sub function  { (shift->children)[0] }
sub func_args { (shift->children)[1]->children }

1
