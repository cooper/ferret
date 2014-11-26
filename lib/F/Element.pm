# Copyright (c) 2014 Mitchell Cooper
package F::Element;

use warnings;
use strict;
use 5.010;

sub new {
    my ($class, %opts) = @_;
    return bless \%opts, $class;
}

sub parent      { shift->{parent} }                 # parent element
sub type        { shift->{type} || 'Element' }      # element type
sub desc        { shift->type }                     # description string
sub fake        { shift->{fake} }
sub is_node     { }                                 # isn't a node
sub type_or_tok { shift->type }
sub perl_fmt    { }
sub perl_fmt_do {
    my @args = shift->perl_fmt;
    my @fmts;
    while (my @a = splice @args, 0, 2) {
        push @fmts, Ferret::Perl::get_format(@a);
    }
    return join ";\n", @fmts;
}

sub get_format { Ferret::Perl::get_format(@_[1..$#_]) }
sub unexpected {
    my $el = shift;
    my $c = $Ferret::Lexer::Constructor::current;
    return Ferret::Lexer::Constructor::unexpected($c);
}

sub document {
    my $el = shift;
    while ($el = $el->parent) {
        return $el if $el->type eq 'Document';
    }
    return $el;
}

1
