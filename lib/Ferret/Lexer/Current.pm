# Copyright (c) 2015, Mitchell Cooper
package Ferret::Lexer::Current;

use warnings;
use strict;
use 5.010;

sub new {
    my ($class, %opts) = @_;
    return bless \%opts, $class;
}

sub unknown_el      { shift->{unknown_el}           }
sub last_el         { shift->{last_el}              }
sub rule_el         { shift->{rule_el}              }
sub label           { shift->{label}                }
sub line            { shift->{line}                 }
sub redo            { shift->{redo} = 1             }
sub elements        { shift->{elements}             }
sub should_redo     { delete shift->{redo}          }
sub next_tok        { shift->{next_tok}[shift || 0] }

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

# close nodes in the proper order.
sub close_nodes {
    my ($c, @nodes) = @_;
    my $count = 0;
    foreach (Ferret::Lexer::Constructor::sort_precedence(@nodes)) {
        next unless $_ eq $c->node->type;
        $c->close_node;
        $count++;
    }
    return $count;
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

#############
### LISTS ###
#############

sub list { shift->{list} }

# used for both parenthesis and bracket lists.
sub start_list {
    my ($c, $terminator) = @_;

    # for any of PAREN_S, PAREN_CALL, ... create a list.
    my $list = F::List->new;
    $list->{parent_list} = $c->{list};
    $list->{list_terminator} = $terminator;
    $list->{no_instructions} = 1;

    # set the current list and the current node to the list's first item.
    $c->{list} = $list;
    $c->node->adopt($list);
    $c->set_node($list->new_item);

    return $list;
}

sub close_list {
    my $c = shift;
    return $c->{list} = $c->{list}{parent_list};
}

####################
### INSTRUCTIONS ###
####################

sub instruction { shift->{instruction} }

sub set_instruction {
    my ($c, $instr) = @_;
    $instr->{parent_instruction} = $c->{instruction};
    return $c->{instruction} = $instr;
}

sub close_instruction {
    my $c = shift;
    return $c->{instruction} = $c->{instruction}{parent_instruction};
}

############################
### PACKAGES AND CLASSES ###
############################

sub package { shift->{package} }
sub class   { shift->{class}   }
sub end_cap { shift->{end_cap} }

sub set_package {
    my ($c, $pkg) = @_;

    # capture end.
    $pkg->{parent_end_cap} = $c->{end_cap};
    $c->{end_cap} = $pkg;

    return $c->{package} = $pkg;
}

sub set_class {
    my ($c, $class) = @_;

    # close the previous class without end keyword.
    $c->{end_cap} = $c->{end_cap}{parent_end_cap} if $c->{end_cap};

    # capture end.
    $class->{parent_end_cap} = $c->{end_cap};
    $c->{end_cap} = $class;

    return $c->{class} = $class;
}

sub close_class {
    my $c = shift;
    return delete $c->{class};
}

sub close_end_cap {
    my $c = shift;
    $c->{end_cap} = $c->{end_cap}{parent_end_cap};
}

1
