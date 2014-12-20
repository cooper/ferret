# Copyright (c) 2014 Mitchell Cooper
package F::Element;

use warnings;
use strict;
use 5.010;

use Scalar::Util 'blessed';

sub new {
    my ($class, %opts) = @_;
    $opts{create_line} = $Ferret::Lexer::Constructor::current->{line};
    return bless \%opts, $class;
}

sub parent      { shift->{parent} }                 # parent element
sub type        { shift->{type} || 'Element' }      # element type
sub desc        { shift->type }                     # description string
sub fake        { shift->{fake} }
sub is_node     { }                                 # isn't a node
sub type_or_tok { shift->type }
sub t           { shift->type_or_tok }
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
    die ${ Ferret::Lexer::Constructor::unexpected($c) }."\n";
    # FIXME: this is just ridiculous
}

sub first_self_or_parent {
    my ($el, $type) = @_;
    do {
        return $el if $el->type eq $type;
    } while $el = $el->{parent};
    return;
}

sub document { first_self_or_parent(shift, 'Document') }
sub class    { first_self_or_parent(shift, 'Class')    }

sub replace_with {
    my ($el, $rep) = @_;
    my $sibs = $el->{parent}{children};
    for my $i (0..$#$sibs) {
        next unless $el == $sibs->[$i];
        delete $el->{parent};
        $sibs->[$i] = $rep;
        last;
    }
    return $rep;
}

1
