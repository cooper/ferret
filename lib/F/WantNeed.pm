# Copyright 2014 Mitchell Cooper
package F::WantNeed;

use warnings;
use strict;
use parent 'F::Statement';

sub type { 'WantNeed' }
sub desc {
    my $wn = shift;
    my $t  = $wn->{arg_type} || 'argument declaration';
    $t    .= ' (...)' if $wn->{ellipsis};
    return $t;
}

sub variable  { shift->first_child }
sub variables { shift->variable }
sub var_type  { shift->{bareword_type}{bareword_value} }

sub type_string {
    my $wn = shift;
    my ($a, $b) = @$wn{'bareword_type', 'set_type_var'};
    return q/'/.$a->{bareword_value}.q/'/   if $a;
    return $b->perl_fmt_do                  if $b;
    return 'undef';
}

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

    # if we've already gotten an ellipsis,
    # no other elements can be contained past it.
    return $child->unexpected() if $wn->{ellipsis};

    # if we're inside the type, this must be a bareword or set type var.
    # we don't actually insert the bareword.
    # just remember its value for later.
    if ($wn->{inside_type}) {

        # bareword.
        if ($child->type eq 'Bareword') {
            $wn->{bareword_type} = $child;
            delete $wn->{inside_type};
            return $child;
        }

        # set type variable.
        elsif ($child->type eq 'SetTypeVariable') {
            $wn->{set_type_var} = $child;
            delete $wn->{inside_type};
            return $child;
        }

        # neither.
        else {
            return $child->unexpected();
        }

    }

    # this is the second arg.
    #
    # it may be a colon, prefixing a type,
    # it may be an ellipsis, suffixing a variable,
    # or it may be an assignment operator.
    #
    if (@children == 1) {

        # we don't actually insert the colon.
        # just remember that we're in the type now.
        if ($child->type_or_tok eq 'OP_VALUE') {
            $wn->{inside_type} = 1;
            return $child;
        }

        # we don't actually insert the ellipsis.
        # just remember that this want need is complete.
        if ($child->type_or_tok eq 'OP_ELLIP') {
            $wn->{ellipsis} = 1;
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
    #
    # (1) the variable
    # (2) the value expression
    #
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
    if ($exp and $exp->type eq 'Bareword' || $exp->type eq 'SetTypeVariable') {
        $bw = $exp;
        undef $exp;
    }

    my $info = { var_name => $var->{var_name} };
    $info->{value} = $exp->perl_fmt_do if $exp;

    # set the variable for each function argument.
    my $typ = $var->type eq 'InstanceVariable' ? '_ivar': '';
    my $val = $exp ? '_val' : '';
    return $arg->{arg_type}.$typ.$val => $info;

}

1
