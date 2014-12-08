# Copyright (c) 2014 Mitchell Cooper
package F::Node;

use warnings;
use strict;
use 5.010;
use parent 'F::Element';

use Scalar::Util 'weaken';

sub new {
    my ($class, %opts) = @_;
    return $class->SUPER::new(
        children => [],
        %opts
    );
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

sub ordered_children {
    my $node = shift;
    my (@functions, @others);
    foreach my $child ($node->children) {
        if ($child->type eq 'Function' || $child->type eq 'Method') {
            push @functions, $child;
            next;
        }
        push @others, $child;
    }
    return (@functions, @others);
}

sub filter_children {
    my ($node, %rules) = @_;
    my @children = $node->children;
    my %ignore  = map { $_ => 1 } split /\s+/, $rules{ignore} || '';
    my %types   = map { $_ => 1 } split /\s+/, $rules{type}   || '';
    my @order   =                 split /\s+/, $rules{order}  || '';
    my %order   = map { $_ => 1 } @order;

    # separate by types for ordering.
    my (%ordered, @ordered);
    foreach my $child (@children) {
        my $type    = $child->type;
        my $fc_type = $child->first_child        ?
            $type.'.'.$child->first_child->type : '';

        # ignored.
        next if $ignore{$type} || $ignore{$fc_type};

        # not the right type.
        next if keys %types && !$types{$type} && !$types{$fc_type};

        # add to accepted.
        if ($order{$type}) { push @{ $ordered{$type} ||= [] }, $child }
        else               { push @ordered, $child                    }

    }

    # put them in order.
    my @final;
    @order = 'rest' if !@order;
    foreach my $type (@order) {

        # rest.
        if ($type eq 'rest') {
            push @final, @ordered;
            next;
        }

        push @final, @{ $ordered{$type} || [] };
    }

    return @final;
}

sub close : method {
    # this can be overriden and ->SUPER'd for stuff.
    # like lists, for instance, delete empty items on termination.
    # ex: $c->{node} = $c->{node}->close;
    return shift->{parent};
}


sub type        { shift->{type} || 'Node' } # element type
sub is_node     { 1                       } # is a node
sub is_closure  {                         } # isn't a closure
sub children    { @{ shift->{children} }  } # all child elements
sub children_c  { shift->children         } # closure children (all)
sub first_child { (shift->children)[0]    } # first child

1