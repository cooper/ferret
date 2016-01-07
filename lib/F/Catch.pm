# Copyright 2015, Mitchell Cooper
package F::Catch;

use warnings;
use strict;
use parent qw(F::Closure);

use Scalar::Util 'weaken';

sub new {
    my ($class, %opts) = @_;
    my $catch = $class->SUPER::new(%opts);

    # create an expression.
    # the expression is marked as the parameter to the catch keyword.
    my $exp = F::CatchParameter->new;
    $catch->adopt($exp);
    weaken($catch->{param_exp} = $exp);

    # body.
    my $body = F::CatchBody->new;
    weaken($catch->{body} = $body);
    $catch->adopt($body);

    return $catch;
}

sub var_name {
    my $var = shift->param_exp->first_child or return;
    return $var->{var_name};
}

# the catch itself should not show up in the instruction format.
sub perl_fmt { }

sub param_exp  { shift->{param_exp} }
sub body       { shift->{body}      }
sub is_closure { 1 }
sub hold_instr { 1 }


package F::CatchParameter;

use parent qw(F::NodeExpression);

sub new {
    my ($class, %opts) = @_;
    return $class->SUPER::new(
        parameter_for        => 'catch',
        generated_expression => 1
    );
}

package F::CatchBody;

use parent 'F::Body';

1
