package F::Load;

use warnings;
use strict;
use parent 'F::Node';

sub type { 'Load' }

sub new {
    my ($class, %opts) = @_;
    return $class->SUPER::new(
        no_instructions => 1,
        %opts
    );
}

1
