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
        generated_expression => 1,
        no_instructions      => 1
    );
    $if->adopt($exp);
    weaken($if->{param_exp} = $exp);

    # body.
    my $body = F::FunctionBody->new;
    weaken($if->{body} = $body);
    $if->adopt($body);

    return $if;
}

sub perl_fmt {
    my $if = shift;
    $if->document->{required_operations}{bool}++;

    # get content.
    my $content = $if->body->body_fmt_do;
    
    return if => {
        condition => $if->{param_exp}->perl_fmt_do,
        content   => $content
    };
}

sub param_exp  { shift->{param_exp} }
sub body       { shift->{body}      }
sub is_closure { 1 }
sub hold_instr { 1 }
sub type       { 'If' }


1
