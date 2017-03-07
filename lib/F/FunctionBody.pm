# Copyright (c) 2015, Mitchell Cooper
package F::FunctionBody;

use warnings;
use strict;
use utf8;
use 5.010;

use parent 'F::Body';

sub desc {
    my $func = shift->parent;
    my $func_type = $func->desc_type;
    return 'on body'
        if $func->parent->type eq 'On';
    return "$func_type body";
}

1
