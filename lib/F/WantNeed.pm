# Copyright 2014 Mitchell Cooper
package F::WantNeed;

use warnings;
use strict;
use parent 'F::Statement';

sub type { 'WantNeed' }
sub desc { shift->{arg_type} || 'argument declaration' }

sub variables { shift->first_child }
sub var_type  { shift->{bareword_type}{bareword_value} }

sub adopt {
    my ($wn, $child) = @_;
    my @children = $wn->children;

    # this is the first arg.
    # it must be a variable.
    if (@children == 0) {
        return $child->unexpected()           if
            $child->type ne 'LexicalVariable' &&
            $child->type ne 'InstanceVariable';
        return $wn->SUPER::adopt($child);
    }

    # if we're inside the type, this must be a bareword.
    # we don't actually insert the bareword.
    # just remember its value for later.
    if ($wn->{inside_type}) {
        return $child->unexpected() unless $child->type eq 'Bareword';
        $wn->{bareword_type} = $child;
        delete $wn->{inside_type};
        return $child;
    }

    # this is the second arg.
    # it may be a colon, prefixing a type,
    # or it may be an assignment operator.
    if (@children == 1) {

        # we don't actually insert the colon.
        # just remember that we're in the type now.
        if ($child->type_or_tok eq 'OP_VALUE') {
            $wn->{inside_type} = 1;
            return $child;
        }

        # we don't actually remember the equal sign.
        # just remember that we're in the value now.
        if ($child->type_or_tok eq 'OP_ASSIGN') {
            return $child->unexpected('inside type') if $wn->{inside_type};
            return $child->unexpected('inside need, use want instead')
                if $wn->{arg_type} eq 'need';
            $wn->{value_exp} =
                F::Expression->new(parameter_for => $wn->{arg_type});
            $wn->SUPER::adopt($wn->{value_exp});
            return $child;
        }

    }

    # if there are two children, they are
    # (1) the variable (2) the value expression
    # meaning that this is part of the value expression
    if (@children == 2) {
        return $wn->{value_exp}->adopt($child);
    }

    return $child->unexpected('stray');
}

sub close {
    my $wn = shift;

    # inject the type bareword if there is one.
    if (my $bw = $wn->{bareword_type}) {
        $wn->SUPER::adopt($bw);
    }

    return $wn->SUPER::close();
}

sub perl_fmt {
    my ($arg, @fmt) = shift;
    my ($var, $exp, $bw) = $arg->children;
    if ($exp && $exp->type eq 'Bareword') {
        $bw = $exp;
        undef $exp;
    }

    my $info       = { var_name => $var->{var_name} };
    $info->{type}  = $bw->{bareword_value}  if $bw;
    $info->{value} = $exp->perl_fmt_do      if $exp;

    # set the variable for each function argument.
    my $typ = $var->type eq 'InstanceVariable' ? '_ivar': '';
    my $val = $exp ? '_val' : '';
    return $arg->{arg_type}.$typ.$val => $info;

}

1
