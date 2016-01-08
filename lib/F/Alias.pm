package F::Alias;

use warnings;
use strict;
use parent 'F::Node';

sub adopt {
    my ($alias, $assignment) = (shift, @_);
    $assignment->{lazy} = 1 if $alias->{lazy};
    $alias->SUPER::adopt(@_);
}

sub public      { shift->first_child->public      }
sub perl_fmt_do { shift->first_child->perl_fmt_do }

1
