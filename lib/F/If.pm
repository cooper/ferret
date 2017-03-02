# Copyright 2015, Mitchell Cooper
package F::If;

use warnings;
use strict;
use parent qw(F::Closure F::MaybeOwner);

use Scalar::Util 'weaken';

sub new {
    my ($class, %opts) = @_;
    my $if = $class->SUPER::new(%opts);

    # create an expression.
    # the expression is marked as the parameter to the if keyword.
    # it is also marked as generated, so we know it can be terminated
    # automatically by certain tokens.
    my $exp = F::new('IfParameter');
    $if->adopt($exp);
    weaken($if->{param_exp} = $exp);

    # body.
    my $body = F::new('Body');
    weaken($if->{body} = $body);
    $if->adopt($body);

    return $if;
}

sub simple_fmt {
    my $if = shift;
    $if->main->{required_operations}{bool}++;

    # get content.
    my $content = $if->body->body_fmt_do;

    return if => {
        type      => $if->{if_type},
        condition => $if->{param_exp}->perl_fmt_do,
        content   => $content
    };
}

sub perl_fmt {
    my $node = shift;
    return $node->maybe_fmt if $node->{maybes};
    return $node->simple_fmt;
}

sub param_exp  { shift->{param_exp} }
sub body       { shift->{body}      }
sub is_closure { 1 }
sub hold_instr { 1 }

1
