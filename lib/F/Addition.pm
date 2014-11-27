# Copyright (c) 2014 Mitchell Cooper
package F::Addition;

use warnings;
use strict;
use 5.010;
use parent qw(F::Node F::Statement);

sub type { 'Addition' }

sub adopt {
    my ($add, $el) = @_;

    # if we have a left side already, this is the right side.
    # close the node.
    return if $add->right_side;
    my $c = $Ferret::Lexer::Constructor::current;
    if ($add->left_side && $c->{node} == $add) {
        $c->{node} = $add->{parent};
    }

    return $add->SUPER::adopt($el);
}

sub perl_fmt {
    my $add = shift;
    $add->document->{required_operations}{add} = 1;
    return addition => {
        left_side  => $add->left_side->perl_fmt_do,
        right_side => $add->right_side->perl_fmt_do
    }
}

sub left_side  { (shift->children)[0] }
sub right_side { (shift->children)[1] }

1
