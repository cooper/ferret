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
    my $arg_string = join ', ', map $_->perl_fmt_do, $call->func_args;

    return call  => {
        coderef   => $func->perl_fmt_do,
        arguments => $arg_string
    };
}

sub function  { (shift->children)[0] }
sub func_args { (shift->children)[1]->children }

1
