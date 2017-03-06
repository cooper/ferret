# Copyright (c) 2015, Mitchell Cooper
package Ferret::Regex;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Scalar::Util qw(blessed looks_like_number);
use Ferret::Shared::Utils qw(regex_str);
use Ferret::Core::Conversion qw(
    pstring pnumber phashref plist
    fstring flist fbool fnumber
);

my @methods = (
);

my @functions = (
    equal => {
        need => '$rgxs:Rgx...',
        code => \&_equal
    }
);

Ferret::bind_class(
    name      => 'Regex',
    alias     => 'Rgx',
    methods   => \@methods,
    functions => \@functions,
    init      => \&init,
    init_need => '$rgx:Str',
    init_want => '$mods:Str'
    #desc      => \&description
);

*new = *Ferret::bind_constructor;

# in Perl 5.14+, the whole thing is wrapped with (?^:).
# the caret means d-imsx. But the group here would override that.
sub init {
    my ($rgx, $args) = @_;
    my $rgxs = $rgx->{regex_str} = $args->pstring('rgx');
    my $mods = $rgx->{mods_str}  = $args->pstring('mods');
    my $rgx_string = regex_str($rgxs, $mods);

    # TODO: error handling if it is invalid / fails to compile.
    $rgx->{rgx_value} = qr/$rgx_string/;

}

sub description {
    my $rgx = shift;
    return "$$rgx{rgx_value}";
}

# any of these work
#
# Ferret::Regex->equal($str1, $str2)
# $str1->equal($str2)
# equal($str1, $str2)
#
# but usage from Ferret is
#
# Regex.equal($rgx1, $rgx2)
# ($rgx1, $rgx2).equal()
#
sub equal {
    shift if !blessed $_[0];
    my ($rgx1, $rgx2) = @_;
    return "$$rgx1{rgx_value}" eq "$$rgx2{rgx_value}";
}

sub _equal {
    my (undef, $args) = @_;
    my ($first_rgx, @rest_rgxs) = $args->plist('rgxs');
    foreach (@rest_rgxs) {
        return Ferret::false if !$first_rgx->equal($_);
    }
    return Ferret::true;
}

1
