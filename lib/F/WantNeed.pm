# Copyright 2015, Mitchell Cooper
package F::WantNeed;

use warnings;
use strict;
use parent 'F::Node';

use Scalar::Util qw(weaken);
use Ferret::Shared::Utils qw(dot_trim type_link);

sub desc {
    my $wn = shift;
    my $t  = $wn->{arg_type} || 'argument declaration';
    $t    .= ' (...)' if $wn->{ellipsis};
    return $t;
}

sub variable   { shift->first_child }
sub variables  { shift->variable }

sub type_string {
    my $wn = shift;
    my $type = $wn->arg_type_exp  or return 'undef';
       $type = $type->first_child or return 'undef';
    return q(').$type->{bareword_value}.q('); # TODO: set type variables
    return 'undef';
}

sub var_type {
    my $wn = shift;
    my $type = $wn->arg_type_exp  or return;
       $type = $type->first_child or return;
    return $type->{bareword_value};
}

# argument type expression
sub arg_type_exp { shift->{arg_type_exp} }
sub create_arg_type_exp {
    my $wn = shift;
    return $wn->arg_type_exp if $wn->arg_type_exp;

    # note that we do not ->adopt here.
    # that is done in Constructor once we know
    # there is not already a WantNeedType.
    my $type = F::new('WantNeedType');
    weaken($wn->{arg_type_exp} = $type);

    return $type;
}

# fallback value expression
sub value_exp { shift->{value_exp} }
sub create_value_exp {
    my $wn = shift;
    return $wn->value_exp if $wn->value_exp;

    # note that we do not ->adopt here.
    # that is done in Constructor once we know
    # there is not already a WantNeedValue.
    my $type = F::new('WantNeedValue');
    weaken($wn->{value_exp} = $type);

    return $type;
}

sub perl_fmt {
    my $wn = shift;
    my $var = $wn->variable;

    # basic info for all WantNeeds.
    my $info = {
        var_name => $var->{var_name},
        var_pos  => $var->{create_pos},
        arg_pos  => $wn->{create_pos}
    };

    # if we have a value expression, set that.
    my $value_exp = $wn->value_exp;
    $info->{value} = $value_exp->perl_fmt_do if $value_exp;

    # determine format name.
    my $typ = $var->type eq 'InstanceVariable' ? '_ivar': '';
    my $val = $value_exp ? '_val' : '';

    return $wn->{arg_type}.$typ.$val => $info;
}

sub markdown_fmt {
    my $arg  = shift;
    my $name = $arg->variable->{var_name};
    my $desc = dot_trim($arg->parent->find_doc_comment);  # might be on instruction
    my $type = $arg->var_type;

    return argument => {
        opt  => $arg->{arg_type} eq 'want' ? '*optional* ' : '',
        name => $name,
        desc => $desc,
        type => type_link(length $type ? $type : 'Any'),
        hyph => length $desc ? '-' : ''
    };
}

1
