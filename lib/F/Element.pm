# Copyright (c) 2015, Mitchell Cooper
package F::Element;

use warnings;
use strict;
use 5.010;

use Evented::Object::Hax;
use Ferret::Shared::Utils qw(trim_lines);
use Scalar::Util qw(blessed);
use List::Util qw(any);

sub new {
    my ($class, %opts) = @_;
    my $c = $Ferret::Lexer::Constructor::current;
    $opts{create_line} = $c->{line};
    $opts{create_pos}  = $c->{position};
    $opts{create_c}    = { %$c };
    $opts{type}        = $class->type;
    return bless \%opts, $class;
}

sub type {
    my $el = shift;
    return $el->{type} if ref $el;
    return ($el =~ m/^F::(.*)/)[0];
}

sub all_types {
    my $el = shift;
    return _all_types(blessed $el);
}

sub _all_types {
    my $base = shift;
    my @isa  = Evented::Object::Hax::get_symbol($base, '@ISA');
    return map($_->type, $base, @isa), map(_all_types($_), @isa);
}

sub is_type {
    my ($el, $types) = @_;
    foreach my $type (split /\s+/, $types) {
        return 1 if any { $_ eq $type } $el->all_types;
        if (my $code = $el->can("is_$type")) {
            return $code->($el);
        }
    }
    return;
}

sub parent      { shift->{parent}           }       # parent element
sub desc        { lcfirst shift->type       }       # description string
sub detail      { shift->desc               }       # detailed description
sub fake        { shift->{fake}             }       # is it fake
sub type_or_tok { shift->type               }       # type
sub t           { shift->type_or_tok        }       # shorthand type
sub owner_str   { (shift->owner)[1]         }       # owner string
sub owner       { }     # no owner
sub is_node     { }     # isn't a node
sub hold_instr  { }     # can't hold an instruction
sub tok         { }     # has no token label

sub unexpected {
    my $el = shift;
    my $c = $Ferret::Lexer::Constructor::current;
    $c->{rule_el} = $el;
    $c->{err_caller} = [caller];
    $Ferret::Lexer::Constructor::error = $c->unexpected(shift, $el);
    delete $c->{rule_el};
}

sub throw {
    my $el = shift;
    my $c = $Ferret::Lexer::Constructor::current;
    $c->{rule_el} = $el;
    $c->{err_caller} = [caller];
    $Ferret::Lexer::Constructor::error = $c->throw($el, @_);
    delete $c->{rule_el};
}

sub first_parent {
    my ($el, $type) = @_;
    while ($el = $el->{parent}) {
        return $el if _check_type($el, $type);
    }
    return;
}

sub first_self_or_parent {
    my ($el, $types) = @_;
    my @types = split /\s+/, $types;
    do {
        for (@types) {
            return $el if _check_type($el, $_);
        }
    } while $el = $el->{parent};
    return;
}

sub _check_type {
    my ($el, $type) = @_;
    my $use_isa;

    # if it starts with @, it's a class, so use ->is_type
    my $first = \substr($type, 0, 1);
    if ($$first eq '@') {
        $use_isa = 1;
        $$first = '';
    }

    return $el->is_type($type) if $use_isa;
    return $el->type eq $type;
    return;
}

sub first_upper_scope {
    my $el = shift;
    my $owner_el = $el->first_parent('@ScopeOwner') or return;
    return $owner_el->scope;
}

# returns a list of all the types of the current element and parents.
sub types_upward {
    my ($el, $type) = @_;
    my @types;
    do { push @types, $el->type_or_tok } while $el = $el->{parent};
    return @types;
}

sub all_ancestors {
    my $el = shift;
    my @ancestors;
    while (my $p = $el->parent) {
        push @ancestors, $p;
        $el = $p;
    }
    return @ancestors;
}

sub main     { first_self_or_parent(shift, 'Main')     }
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
    return undef if !$el->parent || $el->{parent_fake};
    my @children = $el->parent->children;
    return (grep { $children[$_] == $el } 0..$#children)[0];
}

sub previous_element {
    my $el  = shift;
    my $idx = $el->index or return; # can't be first.
    return ($el->parent->children)[$idx - 1];
}

sub next_element {
    my $el  = shift;
    my $idx = $el->index;
    return if !defined $idx;
    return ($el->parent->children)[$idx + 1];
}

sub somewhere_inside {
    my ($el, $ancestor) = @_;
    while ($el = $el->parent) {
        return 1 if $el == $ancestor;
    }
    return;
}

sub doc_comment { trim_lines(shift->{doc_comment}) }

1
