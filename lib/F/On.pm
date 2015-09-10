# Copyright 2015 Mitchell Cooper
package F::On;

use warnings;
use strict;
use parent 'F::Closure';

use Scalar::Util 'weaken';

sub new {
    my ($class, %opts) = @_;
    my $on = $class->SUPER::new(%opts);

    # create an expression.
    # the expression is marked as the parameter to the on keyword.
    # it is also marked as generated, so we know it can be terminated
    # automatically by certain tokens.
    my $exp = F::Expression->new(
        parameter_for        => 'on',
        generated_expression => 1,
        no_instructions      => 1
    );
    $on->adopt($exp);
    weaken($on->{param_exp} = $exp);
    
    # create a function.
    my $func = F::Function->new(
        name      => 'callback',
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

sub perl_fmt {
    my $on = shift;
    
    return on => {
        expression => $on->{param_exp}->perl_fmt_do,
        function   => $on->{function}->perl_fmt_do
    };
}

sub function  { shift->{function}  }
sub param_exp { shift->{param_exp} }
sub is_closure { 1 }
sub type { 'On' }


1
