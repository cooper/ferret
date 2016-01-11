# Copyright 2015, Mitchell Cooper
package F::For;

use warnings;
use strict;
use parent 'F::Closure';

use Scalar::Util 'weaken';

sub new {
    my ($class, %opts) = @_;
    my $for = $class->SUPER::new(%opts);

    # create 'for' parameter.
    my $exp = F::new('ForParameter');
    weaken($for->{param_exp} = $exp);
    $for->adopt($exp);

    # create 'in' parameter.
    $exp = F::new('InParameter');
    weaken($for->{in_param_exp} = $exp);
    $for->adopt($exp);

    # create the body.
    my $body = F::new('ForBody');
    weaken($for->{body} = $body);
    $for->adopt($body);

    return $for;
}

sub close : method {
    my $for = shift;
    my ($e) = $for->handle_vars;
    return $e if $e;
    return $for->SUPER::close(@_);
}

sub desc { 'for ('.shift->for_type.')' }

# returns one of the following:
#
#   loop        loop indefinitely
#   while       loop while a condition is true
#   pairs       iteration over key/value pairs
#   values      iteration over a value list
#
sub for_type {
    my $for = shift;

    # if the 'in' parameter was closed, this is an iteration.
    if ($for->in_param_exp->{close_pos}) {
        my (undef, undef, $var2) = $for->handle_vars;
        return $var2 ? 'pairs' : 'values';
    }

    # if the 'for' parameter has children, it's a while.
    return 'while' if scalar $for->param_exp->children;

    # otherwise, it's an infinite loop.
    return 'loop';

}

sub perl_fmt {
    my ($for) = @_;
    my $type = $for->for_type;
    my $content = $for->body->body_fmt_do;

    # infinite loop.
    if ($type eq 'loop') {
        return for_loop => {
            body    => $content,
            pos     => $for->{create_pos}
        };
    }

    # while loop.
    if ($type eq 'while') {
        return for_while => {
            condition   => $for->param_exp->perl_fmt_do,
            body        => $content,
            pos         => $for->{create_pos}
        };
    }

    # iteration.
    my (undef, $var1, $var2, $collection) = $for->handle_vars;
    return $var2 ? 'for_pairs' : 'for_values' => {
        collection  => $collection->perl_fmt_do,
        var1_name   => $var1->{var_name},
        var2_name   => $var2->{var_name},
        body        => $content,
        pos         => $for->{create_pos}
    };

}

# returns ($err, $var1, $var2, $collection)
sub handle_vars {
    my $for = shift;
    my ($var_exp, $collection) = $for->children;
    my $var1 = $var_exp->first_child;
    my $var2;

    # there's no 'in'; therefore there are no variables.
    return if !$for->in_param_exp->{close_pos};

    # if it's a structural list, it's like a key-value type deal.
    my $list_maybe = $var1;
    if ($list_maybe->type eq 'List') {
        ($var1, $var2) = map $_->item, $list_maybe->children;
        $var1 && $var2 or return $list_maybe->unexpected(
            "inside 'for' parameter ".
            'where two list items (key and value variables) expected'
        );
        $var2->type eq 'LexicalVariable' or return $var2->unexpected(
            "inside 'for' parameter ".
            'where lexical variable expected'
        );
    }

    # this is temporary.
    $var1->type eq 'LexicalVariable' or return $var1->unexpected(
        "inside 'for' parameter ".
        'where lexical variable expected'
    );

    # store the variables.
    $for->{value_var} = $var2 || $var1;
    $for->{key_var}   = $var1 if $var2;

    return (undef, $var1, $var2, $collection);
}

sub value_var { shift->{value_var} }
sub key_var   { shift->{key_var}   }

sub hold_instr   { 1 }
sub body         { shift->{body}         }
sub param_exp    { shift->{param_exp}    }
sub in_param_exp { shift->{in_param_exp} }
sub is_closure   { 1 }

1
