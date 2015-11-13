# Copyright (c) 2015, Mitchell Cooper
package Ferret::Lexer::Current;

use warnings;
use strict;
use 5.010;

sub new {
    my ($class, %opts) = @_;
    return bless \%opts, $class;
}

#############
### NODES ###
#############

sub node { shift->{node} }

sub set_node {
    my ($c, $new) = @_;
    return $c->{node} = $new;
}

sub adopt_and_set_node {
    my ($c, $new) = @_;
    $c->node->adopt($new);
    return $c->set_node($new);
}

# close the current node or n nodes.
sub close_node {
    my ($c, $n) = (shift, shift || 1);
    $c->set_node($c->node->close) for 1..$n;
    return $c->node;
}

# close the current node if it is of a certain type.
sub close_node_maybe {
    my ($c, $node_type) = @_;
    if ($c->node->type eq $node_type) {
        return $c->close_node;
    }
    return;
}

# close nodes until the current node is the supplied one.
sub close_node_until {
    my ($c, $wanted_node) = @_;
    $c->close_node until $c->node == $wanted_node;
}

### CLOSURES ###

sub clos_cap { shift->{clos_cap} }
sub closure  { shift->{closure}  }

sub capture_closure_with {
    my ($c, $capturer) = @_;
    $capturer->{parent_clos_cap} = $c->{clos_cap};
    $c->{clos_cap} = $capturer;
}

sub get_closure {
    my $c = shift;
    my $closure = delete $c->{clos_cap};
    $c->{clos_cap} = delete $closure->{parent_clos_cap};
    return $closure;
}

sub set_closure {
    my ($c, $closure) = @_;
    $closure->{parent_closure} = $c->{closure};
    $c->{closure} = $closure;
}

sub close_closure {
    my $c = shift;
    my $closure = $c->{closure};
    $c->{closure} = delete $closure->{parent_closure};
}

1
