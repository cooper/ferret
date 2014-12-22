# Copyright 2014 Mitchell Cooper
package F::WantNeed;

use warnings;
use strict;
use parent 'F::Statement';

sub type { 'WantNeed' }
sub desc { shift->{arg_type} || 'argument declaration' }

sub variables {
    grep {
        $_->type eq 'LexicalVariable' || $_->type eq 'InstanceVariable'
    } shift->children;
}

sub perl_fmt {
    my ($arg, @fmt) = shift;

    # set the variable for each function argument.
    foreach my $var ($arg->variables) {
        my $sfx = $var->type eq 'InstanceVariable' ? '_ivar': '';
        push @fmt, $arg->{arg_type}.$sfx => { var_name => $var->{var_name} };
    }

    return @fmt;
}

1
