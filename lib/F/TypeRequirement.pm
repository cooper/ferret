# Copyright 2015, Mitchell Cooper
package F::TypeRequirement;

use warnings;
use strict;
use parent 'F::Node';

use Ferret::Shared::Utils qw(type_link dot_trim);

sub desc {
    my $req  = shift;
    my $type = $req->{req_type};
    return $type;
}

sub req_error {
    my $req = shift;

    # if this is a can,
    # the function being 'called' must be a VAR_PROP.
    my $child = $req->first_child;
    if ($req->{req_type} eq 'can' && $child->can('function')) {
        my $var = $child->function;
        return $var->unexpected([
            "in interface method requirement ('can')",
            "Only method requirements are permitted, using the syntax: ".
            "can .methodName(arguments)"
        ]) if $var->type ne 'PropertyVariable';
    }

    return;
}

sub returns_fmt_do {
    my $req = shift;
    my $ret = ($req->children)[1];
    return 'undef' if !$ret || !$req->{has_return};

    # list or return keys and types
    if ($ret->type eq 'List') {
        my $arg_string = '';
        foreach my $child (map $_->first_child, $ret->children) {
            my ($key, $value) =
                ($child->key_name, $child->value->{bareword_value});
            $key = "'$key'" if $key =~ m/^\d/;
            $arg_string .= ', ' if length $arg_string;
            $arg_string .= "$key => '$value'";
        }
        return "[ $arg_string ]";
    }

    # bareword return type
    return "[ result => '$$ret{bareword_value}' ]";
}

sub perl_fmt_do {
    my $req    = shift;
    my $type   = $req->{req_type};
    my $ch     = $req->first_child;
    my $fmt_do = $ch->perl_fmt_do;

    # for can, pass it on to the InterfaceMethod.
    if ($type eq 'can') {

        # if it's a property, use undef for arg list.
        my $name = $ch->{var_name} if $ch->type eq 'PropertyVariable';
        return F::get_perl_fmt(can => {
            name        => $name,
            arguments   => 'undef',
            returns     => $req->returns_fmt_do,
        }) if length $name;

        return $fmt_do;
    }

    # for satisfies, the condition is simply the expression.
    return $fmt_do if $type eq 'satisfies';

    # transform.
    return F::get_perl_fmt(transform => { expression => $fmt_do })
        if $type eq 'transform';

    # isa.
    return F::get_perl_fmt(isa => { expression => $fmt_do })
        if $type eq 'isa';

    return '';
}

sub markdown_fmt {
    my $req  = shift;
    my $type = $req->{req_type};
    my $condition;

    # TODO: return types

    # for barewords in isa, we can say the type maybe.
    my $child = $req->first_child;
    if ($type eq 'isa' && $child && $child->type eq 'Bareword') {
        my $bw_value = $child->{bareword_value};
        $condition = 'Must be an instance of '.type_link($bw_value);
    }

    # for special variable *class in isa, find the class name.
    if ($type eq 'isa' && $child && $child->type eq 'SpecialVariable' &&
      $child->{var_name} eq 'class') {
        my $class = $req->first_self_or_parent('Class');
        my $class_name = $class ? $class->{name} : 'the current class';
        $condition = 'Must be an instance of '.type_link($class_name);
    }

    $condition //= $req->find_doc_comment;
    $condition //= 'determined at runtime; see code';
    return type_req => {
        n         => $req->{markdown_req_n},
        type      => $type,
        condition => dot_trim($condition)
    };
}

1
