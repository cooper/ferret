# Copyright 2015, Mitchell Cooper
package F::Spaces;

use warnings;
use strict;
use parent qw(F::Element);

sub fake { 1 }

sub desc {
    my $spaces = join ', ', shift->requires;
    my $desc   = 'Include';
    $desc .= " ($spaces)" if length $spaces;
    return $desc;
}

# required spaces
sub requires {
    my $spaces = shift;
    return @{ $spaces->{requires} } if $spaces->{requires};
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

    # make consistent across builds
    my %seen;
    @spaces = grep { length && !$seen{$_}++ } @spaces;
    @spaces = sort @spaces;

    $spaces->{requires} = \@spaces;
    return @spaces;
}

# provided spaces
sub provides {
    my $spaces = shift;
    return @{ $spaces->{provides} } if $spaces->{provides};
    my @spaces;

    my @types = qw(Class Type Document);
    foreach my $thing ($spaces->document->filter_descendants(type => "@types")) {
        my $name = $thing->provides_name;

        # ignore main package
        next if $name eq 'main';

        # ignore things that aren't capitalized
        next if $name !~ m/^[A-Z]/;

        push @spaces, $name;
    }

    # make consistent across builds
    my %seen;
    @spaces = grep { length && !$seen{$_}++ } @spaces;
    @spaces = sort @spaces;

    $spaces->{provides} = \@spaces;
    return @spaces;
}

# provides and requires combined
sub provides_requires {
    my $spaces = shift;
    return ($spaces->provides, $spaces->requires);
}

# on adopt, abandon if there are no spaces
sub after_adopt {
    my $spaces = shift;
    my @spaces = $spaces->provides_requires;
    $spaces->parent->abandon($spaces) if !@spaces;
}

sub perl_fmt {
    my $spaces = shift;
    my @provides = $spaces->provides;
    my @requires = $spaces->requires;
    return if !@provides && !@requires;
    return spaces => {
        provides => join(' ', @provides),
        requires => join(' ', @requires)
    };
}

1
