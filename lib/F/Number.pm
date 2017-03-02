# Copyright 2015, Mitchell Cooper
package F::Number;

use warnings;
use strict;
use parent 'F::Expression';

use Data::Dump qw(quote);
use Ferret::Shared::Utils qw(dot_trim);

sub desc {
    my $num = shift;
    return 'constant zero' if $num->{zero};
    return 'imaginary unit' if $num->{value} eq 'i';
    return "number '$$num{value}'";
}

sub perl_fmt {
    my $num = shift;
    my $main = $num->main;
    $main->{required_operations}{num}++;
    return 'zero' if $num->{zero};
    return number => { num => quote($num->{value}) };
}

sub markdown_fmt {
    my $num = shift;
    return number => {
        num     => $num->{value},
        hyph    => length $num->doc_comment ? ' - ' : '',
        comment => dot_trim($num->doc_comment)
    };
}

1
