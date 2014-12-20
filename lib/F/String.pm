# Copyright 2014 Mitchell Cooper
package F::String;

use warnings;
use strict;
use parent 'F::Expression';

use Data::Dump qw(dump);

sub type { 'String' }
sub desc {
    my $str = shift;
    my $first = length $str->{value} > 13  ?
        substr($str->{value}, 0, 10).'...' :
        $str->{value};
    return "string '$first'";
}

sub perl_fmt {
    my $str = shift;
    $str->document->{required_operations}{str}++;
    return string => { string => dump($str->{value}) };
}

1
