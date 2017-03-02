# Copyright 2015, Mitchell Cooper
package F::Regex;

use warnings;
use strict;
use parent 'F::Expression';

use Data::Dump qw(quote);
use Ferret::Shared::Utils qw(dot_trim);

# returns the regex scope of interest.
sub regex_scope {
    my $rgx = shift;
    my $ifp = $rgx->first_self_or_parent('IfParameter');
    my $soi = $rgx->first_upper_scope;

    # if we have an if parameter, and the first upper scope
    # is the same as the if parameter's first upper scope,
    # we have something like if $blah =~ // { ... }.
    # in this case, we only want the regex available within the { }.
    if ($ifp && $ifp->first_upper_scope == $soi) {
        return $ifp->parent->body->scope;
    }

    return $soi;
}

sub desc {
    my $rgx = shift;
    my $first = length $rgx->{value} > 13  ?
        substr($rgx->{value}, 0, 10).'...' :
        $rgx->{value};
    return "regex /$first/";
}

sub perl_fmt {
    my $rgx = shift;
    my $main = $rgx->main;
    $main->{required_operations}{rgx}++;
    return regex => {
        regex => quote($rgx->{value}),
        id    => 'undef',
        mods  => length $rgx->{mods} ? quote($rgx->{mods}) : 'undef'
    };
}

1
