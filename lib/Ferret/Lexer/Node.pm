# Copyright (c) 2014 Mitchell Cooper
package Ferret::Lexer::Node;

use warnings;
use strict;
use 5.010;
use parent 'Ferret::Lexer::Element';

use Scalar::Util 'weaken';

sub new {
    my ($class, %opts) = @_;
    return bless { children => [], %opts }, $class;
}

sub adopt {
    my ($node, $el) = @_;

    # remove from the previous parent.
    $el->{parent}->abandon($el) if $el->{parent};

    # adopt.
    weaken($el->{parent} = $node);
    push @{ $node->{children} }, $el;

    return $el;
}

sub abandon {
    my ($node, $el) = @_;
    delete $el->{parent};
    $node->{children} = [ grep { $_ != $el } @{ $node->{children} } ];
    return $el;
}

sub type        { shift->{type} || 'Node' }         # element type
sub is_node     { 1 }                               # is a node
sub is_closure  { }                                 # isn't a closure
sub children    { @{ shift->{children} } }          # all child elements
sub children_c  { shift->children }                 # closure children (all)

1
