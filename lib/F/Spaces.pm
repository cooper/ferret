# Copyright 2014 Mitchell Cooper
package F::Spaces;

use warnings;
use strict;
use parent qw(F::Element);

sub fake { 1 }
sub type { 'Spaces' }
sub desc {
    my $spaces = join ', ', shift->spaces;
    my $desc   = 'Include';
    $desc .= " ($spaces)" if length $spaces;
    return $desc;
}

sub spaces {
    my $doc = shift->document;
    return keys %{ $doc->{required_spaces} };
}

sub perl_fmt {
    my @spaces = shift->spaces;
    return if !@spaces;
    return spaces => { spaces => join ' ', @spaces };
}

1