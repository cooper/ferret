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

    my $code_ref;
    if ($func->type_or_tok eq 'BAREWORD') {
        $code_ref = $func->get_format(global_event => {
            event_name => $func->{token_value}
        });
    }
    else { $code_ref = $func->perl_fmt_do }

    return call  => {
        coderef   => $code_ref,
        arguments => $arg_string
    };
}

sub function  { (shift->children)[0] }
sub func_args { (shift->children)[1]->children }

1
