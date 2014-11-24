# Copyright 2014 Mitchell Cooper
package Ferret::Lexer::Expression::String;

use warnings;
use strict;
use parent 'Ferret::Lexer::Expression';

use Data::Dump qw(dump);

sub type { 'String' }
sub desc {
    my $str = shift;
    my $first = length $str->{value} > 13  ?
        substr($str->{value}, 0, 10).'...' :
        $str->{value};
    return "String '$first'";
}

sub perl_fmt {
    string => { string => dump(shift->{value}) };
}

1
