# Copyright 2014 Mitchell Cooper
package F::WantNeed;

use warnings;
use strict;
use parent 'F::Statement';

sub type { 'WantNeed' }
sub desc { shift->{arg_type} || 'argument declaration' }

sub variables {
    grep { $_->type eq 'LexicalVariable' } shift->children;
}

sub perl_fmt {
    my ($arg, @fmt) = shift;
    foreach my $var ($arg->variables) {
        push @fmt, $arg->{arg_type} => { var_name => $var->{var_name} };
    }
    return @fmt;
}

1
