# Copyright (c) 2014 Mitchell Cooper
package F::Bareword;

use warnings;
use strict;
use 5.010;
use parent 'F::Element';

sub type { 'Bareword' }
sub desc {
    my $el = shift;
    my $desc  = "Bareword '$$el{bareword_value}'";
    return $desc;
}

sub perl_fmt {
    my $el  = shift;
    my $val = $el->{bareword_value};

    # if it starts with a capital letter, it's a class or namespace.
    if (ucfirst $val eq $val) {
        my $doc = $el->document;
        $doc->{required_spaces}{$val} = 1; # do not increment
    }

    # otherwise, it's a function or something.
    return lexical_var => { name => $el->{bareword_value} };

}

1
