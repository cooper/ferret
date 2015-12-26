# Copyright (c) 2014 Mitchell Cooper
package F::Equality;

use warnings;
use strict;
use 5.010;
use parent qw(F::Node F::Expression);

sub type { 'Equality' }

sub perl_fmt {
   my $eq = shift;
   my $type = $eq->{obj_equality} ? 'equality_obj' : 'equality';
   if ($eq->{negated}) {
       my $doc = $eq->document;
       $doc->{required_operations}{_not}++;
       $type .= '_neg';
   }
   return $type => {
       left_side  => $eq->left_side->perl_fmt_do,
       right_side => $eq->right_side->perl_fmt_do
   };
}

sub left_side  { shift->first_child }
sub right_side {
    my $eq = shift;
    return $eq->{right_side} if $eq->{right_side};

    my @c = $eq->children;
    my $exp = F::Expression->new(parent => $eq->parent);
    $exp->adopt($_) foreach @c[1..$#c];

    return $eq->{right_side} = $exp;
}

1
