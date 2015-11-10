# Copyright (c) 2015, Mitchell Cooper
package Ferret::Lexer::Current;

use warnings;
use strict;
use 5.010;

sub new {
    my ($class, %opts) = @_;
    return bless \%opts, $class;
}

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

1
