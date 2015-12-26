# Copyright 2014 Mitchell Cooper
package F::Inside;

use warnings;
use strict;
use parent 'F::Closure';

use Scalar::Util 'weaken';

sub new {
    my ($class, %opts) = @_;
    my $ins = $class->SUPER::new(%opts);

    # create an expression.
    # the expression is marked as the parameter to the inside keyword.
    # it is also marked as generated, so we know it can be terminated
    # automatically by certain tokens.
    my $exp = F::Expression->new(
        parameter_for        => 'inside',
        generated_expression => 1
    );
    $ins->adopt($exp);
    weaken($ins->{param_exp} = $exp);

    # create the body.
    my $body = F::Body->new;
    weaken($ins->{body} = $body);
    $ins->adopt($body);

    return $ins;
}

sub perl_fmt {
    my $ins = shift;
    my $content = $ins->body->body_fmt_do;
    return inside => {
        expression => $ins->{param_exp}->perl_fmt_do,
        content    => $content
    };
}

sub param_exp  { shift->{param_exp} }
sub body       { shift->{body}      }
sub is_closure { 1 }
sub hold_instr { 1 }
sub type       { 'Inside' }


1
