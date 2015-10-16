# Copyright (c) 2014 Mitchell Cooper
package F::Bareword;

use warnings;
use strict;
use 5.010;
use parent qw(F::Expression F::Assignable);

sub type { 'Bareword' }
sub desc {
    my $el = shift;
    my $desc = "bareword '$$el{bareword_value}'";
    return $desc;
}

sub after_adopt {
    my $el = shift;
    my $val = $el->{bareword_value};

    # if it starts with a capital letter, it's a class or namespace.
    my @parts;
    foreach my $part (split /::/, $val) {
        if ($part =~ m/^[A-Z]/) {
            push @parts, $part;
            next;
        }
        last;
    }

    $val = join '::', @parts;
    my $doc = $el->document;
    $doc->{required_spaces}{$val} = 1 if $val; # do not increment

}

sub perl_fmt {
    return lexical_var => { name => shift->{bareword_value} };
}

1
