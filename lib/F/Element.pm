# Copyright (c) 2014 Mitchell Cooper
package F::Element;

use warnings;
use strict;
use 5.010;

use Evented::Object::Hax;
use Scalar::Util 'blessed';
use List::Util 'first';

sub new {
    my ($class, %opts) = @_;
    my $c = $Ferret::Lexer::Constructor::current;
    $opts{create_line} = $c->{line};
    $opts{create_c}    = { %$c };
    return bless \%opts, $class;
}

sub all_types {
    my ($el, $method, @types) = (shift, 'type');
    my $base = blessed $el;
    my @isa  = Evented::Object::Hax::get_symbol($base, '@ISA');
    return map $_->type, @isa;
}

sub is_type {
    my ($el, $type) = @_;
    return scalar first { $_ eq $type } $el->all_types;
}

sub parent      { shift->{parent}           }       # parent element
sub type        { 'Element'                 }       # element type
sub desc        { lcfirst shift->type       }       # description string
sub fake        { shift->{fake}             }       # is it fake
sub type_or_tok { shift->type               }       # type
sub t           { shift->type_or_tok        }       # shorthand type
sub is_node     { } # isn't a node
sub hold_instr  { } # can't hold an instruction
sub tok         { } # has no token label
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
    $c->{rule_el} = $el;
    $c->{err_caller} = [caller];
    $Ferret::Lexer::Constructor::error = $c->unexpected(@_);
    delete $c->{rule_el};
}

sub first_self_or_parent {
    my ($el, $type) = @_;
    do {
        return $el if $el->type eq $type;
    } while $el = $el->{parent};
    return;
}

# returns a list of all the types of the current element and parents.
sub types_upward {
    my ($el, $type) = @_;
    my @types;
    do { push @types, $el->type_or_tok } while $el = $el->{parent};
    return @types;
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

sub index {
    my $el = shift;
    return undef if !$el->parent;
    my @children = $el->parent->children;
    return (grep { $children[$_] == $el } 0..$#children)[0];
}

sub previous_element {
    my $el  = shift;
    my $idx = $el->index or return; # can't be first.
    return ($el->parent->children)[$el->index - 1];
}

1
