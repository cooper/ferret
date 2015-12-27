# Copyright 2015, Mitchell Cooper
package F::On;

use warnings;
use strict;
use parent 'F::Closure';

use Scalar::Util 'weaken';

sub type        { 'On' }
sub function    { shift->{function}  }
sub param_exp   { shift->{param_exp} }
sub is_closure  { 1 }
sub desc        {
    my $on = shift;
    my $name = $on->{cb_name};
    return length $name ? "on ('$name' callback)" : 'on';
}

sub new {
    my ($class, %opts) = @_;
    my $on = $class->SUPER::new(
        befores => [],
        afters  => [],
        %opts
    );

    # create an expression.
    # the expression is marked as the parameter to the on keyword.
    # it is also marked as generated, so we know it can be terminated
    # automatically by certain tokens.
    my $exp = F::OnExpression->new;
    $on->adopt($exp);
    weaken($on->{param_exp} = $exp);

    # create a function.
    my $func = F::Function->new(
        anonymous => 1
    );
    $on->adopt($func);
    weaken($on->{function} = $func);

    # return the function on close of the expression.
    # this makes the function the current node after
    # the expression closes, rather than the On.
    weaken($exp->{return_on_close} = $func);

    return $on;
}

sub event_object {
    my $on = shift;
    my $c  = $on->param_exp->first_child;
    return '$scope' if $c->type eq 'LexicalVariable';
    return '$scope' if $c->type eq 'Bareword';
    return '$self'  if $c->type eq 'InstanceVariable';
    return $c->left if $c->type eq 'Property';
    die;
}

sub event_name {
    my $on = shift;
    my $c  = $on->param_exp->first_child;
    return $c->{var_name}       if substr($c->type, -8) eq 'Variable';
    return $c->{bareword_value} if $c->type eq 'Bareword';
    return $c->prop_name        if $c->type eq 'Property';
    die;
}

sub opts_string {
    my $on  = shift;
    my $str = '';

    # add befores.
    my @befores = @{ $on->{befores} };
    if (@befores) {
        my $s = join ' ,', map { "'$_'" } @befores;
        $str .= "before => [ $s ]";
    }

    # add afters.
    my @afters = @{ $on->{afters} };
    if (@afters) {
        my $s = join ', ', map { "'$_'" } @afters;
        $str .= ', ' if length $str;
        $str .= "after => [ $s ]";
    }

    return $str;
}

sub set_cb_name {
    my ($on, $name) = @_;
    $on->{cb_name} = $name;
    $on->function->{name} = $name;
}

sub add_before_clause {
    my ($on, $name) = @_;
    push @{ $on->{befores} }, $name;
}

sub add_after_clause {
    my ($on, $name) = @_;
    push @{ $on->{afters} }, $name;
}

sub perl_fmt {
    my $on = shift;
    return on => {
        event_name => $on->event_name,
        object     => $on->event_object,
        function   => $on->function->perl_fmt_do,
        opts       => $on->opts_string
    };
}

package F::OnExpression;

use warnings;
use strict;
use parent 'F::Expression';

sub type { 'OnExpression' }

sub new {
    my ($class, %opts) = @_;
    return $class->SUPER::new(
        parameter_for        => 'on',
        generated_expression => 1,
        %opts
    );
}

1
