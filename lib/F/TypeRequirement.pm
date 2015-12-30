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

sub req_error {
    my $req = shift;

    # if this is a can,
    # the function being 'called' must be a VAR_PROP.
    if ($req->{req_type} eq 'can') {
        my $var = $req->first_child->function;
        return $var->unexpected([
            "in interface method requirement ('can')",
            "Only method requirements are permitted, using the syntax: ".
            "can .methodName(arguments)"
        ]) if $var->type ne 'PropertyVariable';
    }

    return;
}

1
