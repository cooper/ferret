# Copyright 2015, Mitchell Cooper
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
    my $exp = F::IfParameter->new;
    $if->adopt($exp);
    weaken($if->{param_exp} = $exp);

    # body.
    my $body = F::Body->new;
    weaken($if->{body} = $body);
    $if->adopt($body);

    return $if;
}

sub simple_fmt {
    my $if = shift;
    $if->document->{required_operations}{bool}++;

    # get content.
    my $content = $if->body->body_fmt_do;

    return if => {
        type      => $if->{if_type},
        condition => $if->{param_exp}->perl_fmt_do,
        content   => $content
    };
}

sub maybe_fmt {
    my ($if, $maybe_n) = (shift, 0);
    my @maybes = @{ $if->{maybes} };
    my $doc = $if->document;

    # my $maybe...
    my $definitions = '';
    foreach my $maybe (@maybes) {
        $doc->{required_operations}{bool}++;
        $maybe->{n} = $maybe_n++;
        $definitions .= sprintf "my %s = %s;\n",
            $maybe->perl_fmt_do,
            $maybe->exp_fmt_do;
    }

    # if ($maybe...)
    my $conditionals = join ' && ', map { $_->perl_fmt_do } @maybes;

    return maybe_owner => {
        definitions  => $definitions,
        conditionals => $conditionals,
        format       => $if->get_format($if->simple_fmt)
    };
}

sub perl_fmt {
    my $if = shift;
    return $if->maybe_fmt if $if->{maybes};
    return $if->simple_fmt;
}


sub param_exp  { shift->{param_exp} }
sub body       { shift->{body}      }
sub is_closure { 1 }
sub hold_instr { 1 }


package F::IfParameter;

use parent qw(F::NodeExpression);

sub new {
    my ($class, %opts) = @_;
    return $class->SUPER::new(
        parameter_for        => 'if',
        generated_expression => 1
    );
}

sub add_maybe {
    my ($exp, $maybe) = @_;
    my $if = $exp->parent;
    push @{ $if->{maybes} ||= [] }, $maybe;
}

1
