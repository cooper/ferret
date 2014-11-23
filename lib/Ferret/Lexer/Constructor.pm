# Copyright (c) 2014 Mitchell Cooper
package Ferret::Lexer::Constructor;

use warnings;
use strict;
use 5.010;

use Scalar::Util qw(blessed);

my $fatal = \0;

sub construct {
    my @elements;
    my $main_node = shift;
    my $current   = {
        main_node => $main_node,
        node      => $main_node,
        elements  => \@elements,
        upcoming  => \@_,
        # package
        # class
        # clos_cap      something that intends tp capture an upcoming closure
        # closure       the node capturing a closure currently
        # list          the innermost list
    };
    while (my ($label, $value, $line) = @{ shift || [] }) {
        my $last_element = ($current->{node}->children)[-1] || $current->{node};

        # current info.
        @$current{ qw(label value line next_tok last_element) } = (
            $label, $value,
            $line,  $_[0],
            $last_element
        );

        # call a handler if one exists.
        if (my $code = __PACKAGE__->can("c_$label")) {
            my $el = $code->($current, $value);
            if (blessed $el) {
                return $$el if $el->isa('Ferret::Lexer::Error');
                push @elements, $el;
            }
            next;
        }

        # otherwise, throw in an unknown element.
        my $e = Ferret::Lexer::Unknown->new(
            token_label => $label,
            token_value => $value
        );
        $current->{node}->adopt($e);

    }
}

sub c_PKG_DEC {
    my ($c, $value) = @_;

    # must be in global scope.
    unexpected($c, 'in non-global scope')
        unless $c->{node}->type eq 'Document';

    my $pkg = Ferret::Lexer::Statement::Package->new(%$value);
    $c->{node}->adopt($pkg);
    $c->{package} = $pkg;
    return $pkg;
}

sub c_CLASS_DEC {
    my ($c, $value) = @_;

    # must be in global scope.
    unexpected($c, 'in non-global scope')
        unless $c->{node}->type eq 'Document';

    my $class = Ferret::Lexer::Statement::Class->new(%$value);
    $c->{node}->adopt($class);
    $c->{class} = $class;
    return $class;
}

sub c_METHOD {
    my ($c, $value) = @_;
    my $method = Ferret::Lexer::Statement::Method->new(%$value);
    $c->{node}->adopt($method);
    @$c{ qw(node clos_cap) } = ($method) x 2;
    return $method;
}

# start of a closure
sub c_CLOSURE_S {
    my ($c, $value) = @_;

    # there's nothing to capture the closure.
    return unexpected($c) unless $c->{clos_cap};

    # a closure can terminate a generated expression.
    # for instance, inside $something {}. the expression $something ends there.
    if ($c->{node}{generated_expression}) {
        $c->{node} = $c->{node}{parent};
    }

    # remember which closure this is inside; if any.
    # then, set this node as the current closure.
    $c->{clos_cap}{containing_closure} = $c->{closure};
    $c->{closure} = delete $c->{clos_cap};

    return;
}

# end of a closure
sub c_CLOSURE_E {
    my ($c, $value) = @_;

    # no closure is open...
    return unexpected($c) unless $c->{closure};
    return unexpected($c) unless $c->{node} == $c->{closure};

    # close the closure and the node.
    $c->{closure} = delete $c->{closure}{containing_closure};
    $c->{node} = $c->{node}{parent};

    return;
}

sub c_KEYWORD_INSIDE {
    my ($c, $value) = @_;

    # create a closure to be opened soon.
    my $inside = Ferret::Lexer::Node->new(type => 'Inside');
    $c->{clos_cap} = $c->{node}->adopt($inside);

    # create an expression.
    # the expression is marked as the parameter to the inside keyword.
    # it is also marked as generated, so we know it can be terminated
    # automatically by certain tokens.
    my $exp = Ferret::Lexer::Expression->new(
        parameter_for        => 'inside',
        generated_expression => 1
    );
    $inside->adopt($exp);
    $c->{node} = $exp;

    return $inside;
}

sub c_KEYWORD_IF {
    my ($c, $value) = @_;

    # create an if statement which expects a closure to be opened soon.
    my $if = Ferret::Lexer::Statement::If->new(type => 'If');
    $c->{node}->adopt($if);
    $c->{clos_cap} = $if;

    # set the current node to the conditional expression.
    $c->{node} = $if->param_exp;

    return $if;
}

sub c_KEYWORD_THEN {
    my ($c, $value) = @_;
    my $then = Ferret::Lexer::Node->new(type => 'Then');
    $c->{node}->adopt($then);
    @$c{ qw(node clos_cap) } = ($then) x 2;
    return $then;
}

sub c_KEYWORD_FOR {
    my ($c, $value) = @_;

    # create a closure to be opened soon.
    my $for = Ferret::Lexer::Node->new(type => 'For');
    $c->{node}->adopt($for);
    $c->{clos_cap} = $for;

    # create an expression.
    # the expression is marked as the parameter to the for keyword.
    # it is also marked as generated, so we know it can be terminated
    # automatically by certain tokens.
    my $exp = Ferret::Lexer::Expression->new(
        parameter_for        => 'for',
        generated_expression => 1
    );
    $for->adopt($exp);
    $c->{node} = $exp;

    return $for;
}

sub c_KEYWORD_IN {
    my ($c, $value) = @_;

    # 'in' must terminate a generated expression for 'for'.
    return unexpected($c, "(where is 'for'?)") unless
        $c->{node}{parameter_for} && $c->{node}{parameter_for} eq 'for';
        # FIXME: if wrapped in parentheses, this will fail.
    $c->{node} = $c->{node}{parent};

    # create an expression.
    # the expression is marked as the parameter to the in keyword.
    # it is also marked as generated, so we know it can be terminated
    # automatically by certain tokens.
    my $exp = Ferret::Lexer::Expression->new(
        parameter_for        => 'in',
        generated_expression => 1
    );
    $c->{node} = $c->{node}->adopt($exp);

    return $exp;
}

sub c_PAREN_S {
    my ($c, $value) = @_;
    my $list = start_paren(@_);
    return $list;
}

sub c_PAREN_CALL {
    my ($c, $value) = @_;

    # a call can only come after one of:
    #   a one-element list
    #   an expression
    #   a bareword
    #   a variable
    my %allowed = map { $_ => 1 } qw(
        List Expression
        BAREWORD VAR_LEX VAR_THIS VAR_SPEC
    );

    my $last_el = $c->{last_element};
    return unexpected($c) unless $allowed{ $last_el->type_or_tok };

    # if this is a list, it can only have one item.
    if ($last_el->isa('Ferret::Lexer::Structure::List')
    && $last_el->children > 1) {
        return expected($c, 'single-element list', 'before');
    }

    # create a function call, adopting the last element.
    my $call = $c->{node}->adopt(Ferret::Lexer::Structure::Call->new);
    $call->adopt($last_el);

    # handle the list, then adopt it.
    my $list = start_paren(@_);
    $list->{is_call} = 1;
    $call->adopt($list);

    return $call;
}

sub start_paren {
    my ($c, $value) = @_;

    # for any of PAREN_S, PAREN_CALL, ... create a list.
    my $list = Ferret::Lexer::Structure::List->new;
    $list->{parent_list} = $c->{list};

    # set the current list and the current node to the list's first item.
    $c->{list} = $c->{node}->adopt($list);
    $c->{node} = $list->new_item;

    return $list;
}

sub c_PAREN_E {
    my ($c, $value) = @_;

    # the current node must be a list.
    return unexpected($c) if !$c->{list};

    # close the list.
    #
    # the current node becomes
    # the current node (list item)'s parent (list)'s parent
    #
    $c->{node} = $c->{node}{parent}{parent};

    # as a special case, close function calls here as well, since they are
    # terminated by the end of their argument list.
    $c->{node} = $c->{node}{parent} if $c->{node}->type eq 'Call';

    # finally, the current list becomes the next list up in the tree.
    $c->{list} = $c->{list}{parent_list};

    return $c->{list};
}

sub c_STRING {
    my ($c, $value) = @_;

    # create the string...
    my $string = Ferret::Lexer::Expression::String->new(value => $value);

    # add to the current node.
    $c->{node}->adopt($string);

    return $string;
}

sub c_OP_COMMA {
    my ($c, $value) = @_;

    # must be in a list.
    # TODO: we could also be inside of a want/need.
    return unexpected($c, 'outside of list') if !$c->{list};

    # set the current node to a new list item.
    $c->{node} = $c->{list}->new_item;

    return $c->{node};
}

sub fatal {
    my ($c, $err) = @_;
    return Ferret::Lexer::fatal("$err on line $$c{line}.");
}

sub expected {
    my ($c, $what, $where) = @_;
    my $n = $what =~ m/^[aeiou]/ ? 'n' : '';
    fatal($c, "Expected a$n $what $where $$c{label}");
}

sub unexpected {
    my $c = shift;
    my $reason  = shift;
        $reason = length $reason ? " $reason" : '';
    my $token   = Ferret::Lexer::pretty_token($c->{label});
    my $last_el = lcfirst $c->{elements}[-1]->desc;
    fatal($c, "Unexpected $token$reason after $last_el");
}

1
