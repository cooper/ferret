# Copyright 2015, Mitchell Cooper
package F::Spaces;

use warnings;
use strict;
use parent qw(F::Element);

sub fake { 1 }

sub desc {
    my $spaces = join ', ', shift->spaces;
    my $desc   = 'Include';
    $desc .= " ($spaces)" if length $spaces;
    return $desc;
}

sub spaces {
    my $spaces = shift;
    return @{ $spaces->{spaces} } if $spaces->{spaces};
    my @spaces;
    for my $bw ($spaces->document->filter_descendants(type => 'Bareword')) {
        my $val = $bw->{bareword_value};

        # if it starts with a capital letter, it's a class or namespace.
        my @parts;
        foreach my $part (split /::/, $val) {
            if ($part =~ m/^[A-Z]/) {
                push @parts, $part;
                next;
            }
            last;
        }

        $val = join '::', @parts;
        push @spaces, $val;
    }
    my %seen;
    @spaces = grep { length && !$seen{$_}++ } @spaces;
    @spaces = sort @spaces;
    $spaces->{spaces} = \@spaces;
    return @spaces;
}

sub after_adopt {
    my $spaces = shift;
    my @spaces = $spaces->spaces;
    $spaces->parent->abandon($spaces) if !@spaces;
}

sub perl_fmt {
    my $spaces = shift;
    my @spaces = $spaces->spaces;
    return if !@spaces;
    return spaces => { spaces => join ' ', @spaces };
}

1
