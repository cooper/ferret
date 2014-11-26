# Copyright 2014 Mitchell Cooper
package F::If;

use warnings;
use strict;
use parent 'F::Closure';

use Scalar::Util 'weaken';

sub new {
    my ($class, %opts) = @_;
    my $if = $class->SUPER::new(%opts);

    # create an expression.
    # the expression is marked as the parameter to the if keyword.
    # it is also marked as generated, so we know it can be terminated
    # automatically by certain tokens.
    my $exp = F::Expression->new(
        parameter_for        => 'if',
        generated_expression => 1
    );
    $if->adopt($exp);
    weaken($if->{param_exp} = $exp);

    return $if;
}

sub param_exp { shift->{param_exp} }
sub is_closure { 1 }
sub type { 'If' }


1
