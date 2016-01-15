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
    if ($req->{req_type} eq 'can') {
        my $var = $req->first_child->function;
        return $var->unexpected([
            "in interface method requirement ('can')",
            "Only method requirements are permitted, using the syntax: ".
            "can .methodName(arguments)"
        ]) if $var->type ne 'PropertyVariable';
    }

    return;
}

sub perl_fmt_do {
    my $req    = shift;
    my $type   = $req->{req_type};
    my $fmt_do = $req->first_child->perl_fmt_do;

    # for can, pass it on to the InterfaceMethod.
    return $fmt_do if $type eq 'can';

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
    $condition //= "requirement determined at runtime";
    return type_req => {
        type      => $type,
        condition => dot_trim($condition)
    };
}

1
