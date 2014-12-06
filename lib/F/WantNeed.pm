# Copyright 2014 Mitchell Cooper
package F::WantNeed;

use warnings;
use strict;
use parent 'F::Statement';

sub type { 'WantNeed' }
sub desc { ucfirst(shift->{arg_type} || 'Argument declaration') }

my %allowed = qw(LexicalVariable Bareword);
sub adopt {
    my ($arg, $el) = @_;
    return $arg->SUPER::adopt($el) if $allowed{ $el->type };
    my $type = $arg->arg_type;
    return $arg->unexpected($el, "inside $$arg{arg_type}");
    return $el;
}

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
