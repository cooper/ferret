# Copyright 2015, Mitchell Cooper
package F::TypeRequirement;

use warnings;
use strict;
use parent 'F::Statement';

sub type { 'TypeRequirement' }
sub desc {
    my $req  = shift;
    my $type = $req->{req_type};
    return $type;
}

1
