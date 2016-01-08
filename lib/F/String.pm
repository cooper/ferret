# Copyright 2015, Mitchell Cooper
package F::String;

use warnings;
use strict;
use parent 'F::Expression';

use Data::Dump qw(quote);


sub desc {
    my $str = shift;
    my $first = length $str->{value} > 13  ?
        substr($str->{value}, 0, 10).'...' :
        $str->{value};
    return "string '$first'";
}

sub perl_fmt {
    my $str = shift;
    my $doc = $str->document;
    $doc->{required_operations}{str}++;
    return string => { string => quote($str->{value}) };
}

sub markdown_fmt {
    my $str = shift;
    return string => { string => quote($str->{value}) };
}

1
