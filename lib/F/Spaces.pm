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
    return sort keys %{ $doc->{required_spaces} };
}

sub after_adopt {
    my $spaces = shift;
    my @spaces = $spaces->spaces;
    $spaces->parent->abandon($spaces) if !@spaces;
}

sub perl_fmt {
    my $spaces = shift;
    my @spaces = $spaces->spaces;

    # e.g. Point -> Math::Point
    foreach my $pkg ($spaces->document->filter_children(type => 'Package')) {
        my $pkg = $pkg->{pkg_name};
        my @map =
            map  { $pkg.'::'.$_ }
            grep { $pkg ne $_ && !/^\Q$pkg\E::/ } @spaces;
        @spaces = (@map, @spaces);
    }

    return if !@spaces;
    return spaces => { spaces => join ' ', @spaces };
}

1
