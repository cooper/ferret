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
    foreach (sort_precedence(@nodes)) {
        next unless $_ eq $c->node->type;
        $c->close_node;
        $count++;
    }
    return $count;
}

################
### CLOSURES ###
################

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

##################
### PRECEDENCE ###
##################

# Nodes terminated by instructions
# ================================
#
#   WantNeed
#
#       need $x;
#
#       WantNeeds cannot contain anything special to terminate.
#
#   PropertyModifier
#
#       delete $x.prop;
#
#       PropertyModifiers cannot contain special to terminate.
#
#   List with Pair
#
#       (hi: 10 == 5 + !5)
#
#       Close in order
#       1. Negation     (!)
#       2. Operation    (+)
#       3. Equality     (==)
#       4. Pair         (:)
#       5. List item
#       6. List
#
#
#   Return
#
#       return 10 == 5 + !5;
#
#       Close in order
#       1. Negation     (!)
#       2. Operation    (+)
#       3. Equality     (==)
#       4. Return
#
#   ReturnPair
#
#       x -> 10 == 5 + !5;
#
#       Same as Return above.
#
# Node groups
# ================================
#
#   1. Special nodes that have their own specific rules.
#   2. Normal nodes, usually expressions.
#   3. Statement nodes which are direct descendants of instructions.
#
my (@closes, %precedence);
{
    @closes = (
        qw( WantNeed PropertyModifier ),                                # 1
        qw( Negation Operation Equality Pair ListItem List Call ),      # 2
        qw( Assignment Return ReturnPair ),                             # 3
        qw( SharedDeclaration LocalDeclaration ),
        qw( Instruction )
    );
    my $i = 0;
    %precedence = map { $_ => $i++ } @closes;
}

sub sort_precedence {
    my @types = @_;

    # find the others and sort.
    my @orders = sort { $a <=> $b } map $precedence{$_}, @types;

    # return the names.
    return map $closes[$_], @orders;

}

##############
### ERRORS ###
##############

sub fatal {
    my ($c, $err, $el, %opts) = @_;

    # use the "current" info if no element is provided.
    my ($parent, $last_el, $line) = ($c->node, $c->elements->[-1], $c->{line});

    # if we actually have an element, we can use its real position.
    if ($el && $el->parent) {
        $line    = $el->{create_line};
        $parent  = $el->parent;
        $last_el = $el->previous_element || $parent;
    }

    # if $last_el is not defined at this point, we are at the beginning.
    my $near = $last_el ? $last_el->desc : 'beginning of file';
    $parent  = $parent->parent while $parent->type eq 'Instruction';

    my @caller = @{ delete $c->{err_caller} || [caller] };
    $err .= "\n     Error   -> $opts{err_type}" if length $opts{err_type};
    $err .= "\n     File    -> $$c{file}";
    $err .= "\n     Line    -> $line";
    $err .= "\n     Element -> $opts{el_desc}"  if length $opts{el_desc};
    $err .= "\n     Near    -> $near";
    $err .= "\n     Parent  -> ".$parent->desc  if $parent;
    $err .= "\n\nException raised by $caller[0] line $caller[2].";

    return Ferret::Lexer::fatal($err);
}

sub expected {
    my ($c, $what, $where) = @_;
    $c->{err_caller} ||= [caller];
    $where //= '';
    fatal($c, "Expected $what $where.");
}

sub unexpected {
    my ($c, $reason, $el) = @_;
    $c->{err_caller} ||= [caller];

    # if it's an arrayref, it's from a rule with a description.
    my $err_desc;
    ($reason, $err_desc) = @$reason if ref $reason eq 'ARRAY';
    $err_desc = length $err_desc ? "\n$err_desc." : '';
    $reason   = length $reason   ? " $reason"     : '';

    # if we're processing element rules, use the actual element if possible.
    # otherwise, use the pretty representation of the token.
    my $what = $c->rule_el ?
        $c->rule_el->desc  :
        Ferret::Lexer::pretty_token($c->label);

    fatal($c, "Unexpected $what$reason.$err_desc", $el);
}

sub throw {
    my ($c, $el, $type, @args) = @_;
    $c->{err_caller} ||= [caller];

    # hints provided.
    my @hints;
    if (ref $type && ref $type eq 'ARRAY') {
        @hints = @$type;
        $type = shift @args;
    }

    # if we're processing element rules, use the actual element if possible.
    # otherwise, use the pretty representation of the token.
    my $what = $c->rule_el ?
        $c->rule_el->desc  :
        Ferret::Lexer::pretty_token($c->label);

    # stringify.
    my $err_string = Ferret::Lexer::Verifier::error_string(
        $el, $type, \@hints, @args
    );

    fatal($c, "$err_string.", $el,
        err_type => $type,
        el_desc  => $el->desc
    );
}

1
