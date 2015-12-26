# Copyright 2015, Mitchell Cooper
package F::Stop;

use warnings;
use strict;
use parent qw(F::Statement);

sub type { 'Stop' }

sub new {
    my ($class, %opts) = @_;
    return $class->SUPER::new(
        no_instructions => 1,
        %opts
    );
}

sub perl_fmt_do {
    return '$return->stop';
}

1
