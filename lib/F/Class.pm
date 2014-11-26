# Copyright 2014 Mitchell Cooper
package F::Class;

use warnings;
use strict;
use parent 'F::Statement';

sub type { 'Class' }
sub desc {
    my $class = shift;
    my $desc  = "Class '$$class{name}'";
    $desc    .= " version $$class{version}" if defined $class->{version};
    return $desc;
}
1
