# Copyright (c) 2015, Mitchell Cooper
package F::Node;

use warnings;
use strict;
use 5.010;
use parent 'F::Element';

use Scalar::Util qw(weaken);

sub new {
    my ($class, %opts) = @_;
    return $class->SUPER::new(
        children => [],
        %opts
    );
}

sub adopt {
    my ($node, $el) = @_;
    return $node->unexpected([
        'without child element',
        'Something is missing. That\'s all we know'
    ]) if !$el;

    # check if this makes sense.
    my $err = $node->can_adopt($el);
    return $el->unexpected($err) if $err;

    # remove from the previous parent.
    $el->{parent}->abandon($el) if $el->{parent};

    # adopt.
    weaken($el->{parent} = $node);
    push @{ $node->{children} }, $el;

    $el->after_adopt if $el->can('after_adopt');
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
        if ($child->type eq 'Function') {
            push @functions, $child;
            next;
        }
        push @others, $child;
    }
    return (@functions, @others);
}

sub filter_children {
    my ($node, %rules) = @_;
    return _filter_elements($node, [ $node->children ], %rules);
}

sub filter_descendants {
    my ($node, %rules) = @_;
    return _filter_elements($node, [ $node->descendants ], %rules);
}

sub filter_ancestors {
    my ($node, %rules) = @_;
    return _filter_elements($node, [ $node->all_ancestors ], %rules);
}

sub _filter_elements {
    my ($node, $elements, %rules) = @_;
    my @elements = @$elements;
    my %ignore   = map { $_ => 1 } split /\s+/, $rules{ignore} || '';
    my %types    = map { $_ => 1 } split /\s+/, $rules{type}   || '';
    my @order    =                 split /\s+/, $rules{order}  || '';
    my %order    = map { $_ => 1 } @order;

    # separate by types for ordering.
    my (%ordered, @ordered);
    foreach my $el (@elements) {
        my $type    = $el->type;
        my $fc_type = $el->is_node && $el->first_child ?
            $type.'.'.$el->first_child->type : '';

        # ignored.
        next if $ignore{$type} || $ignore{$fc_type};

        # not the right type.
        next if keys %types && !$types{$type} && !$types{$fc_type};

        # not public.
        next if $rules{public} && !$el->public;

        # add to accepted.
        if ($order{$type}) { push @{ $ordered{$type} ||= [] }, $el  }
        else               { push @ordered, $el                     }

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

sub open : method {
    my $node = shift;

    # the FIRST position at which the node was opened.
    $node->{open_pos} ||= $Ferret::Lexer::Constructor::current->{position};

    return $node;
}

sub close : method {
    my $node = shift;

    # the LAST position at which the node was closed.
    $node->{close_pos} = $Ferret::Lexer::Constructor::current->{position};

    # check if this makes sense.
    my $err = $node->can_close;
    return $node->last_child->unexpected($err) if $err;

    # this can be overriden and ->SUPER'd for stuff.
    # like lists, for instance, delete empty items on termination.
    # ex: $c->{node} = $c->{node}->close;

    return $node->{return_on_close} || $node->{parent};
}

sub descendants {
    my ($node, @children) = shift;
    my $add; $add = sub {
        my $el = shift;
        push @children, $el unless $el == $node;
        return unless $el->is_type('Node');
        $add->($_) foreach $el->children;
    };
    $add->($node);
    return @children;
}

sub has_descendant {
    my ($node, $descendant) = @_;
    return $descendant->somewhere_inside($node);
}

# find the first doc comment we can.
sub find_doc_comment {
    my $do; $do = sub {
        my $el = shift;
        return $el->doc_comment
            if length $el->doc_comment;
        return if !$el->is_node;
        for ($el->children) {
            my $yes = $do->($_);
            return $yes if length $yes;
        }
        return;
    };
    return $do->(shift);
}

sub is_node     { 1                       } # is a node
sub is_closure  {                         } # isn't a closure
sub children    { @{ shift->{children} }  } # all child elements
sub children_c  { shift->children         } # closure children (all)
sub first_child { (shift->children)[0]    } # first child
sub last_child  { (shift->children)[-1]   } # last child

1
