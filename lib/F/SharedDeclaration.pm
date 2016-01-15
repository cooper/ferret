# Copyright 2015, Mitchell Cooper
package F::SharedDeclaration;

use warnings;
use strict;
use parent qw(F::Node);

use Ferret::Shared::Utils qw(dot_trim);

sub desc { 'shared variable declaration' }

sub variable {
    my $child = shift->first_child;
    return $child->assign_to if $child->type eq 'Assignment';
    return $child;
}

sub perl_fmt {
    my $share = shift;
    my $child = $share->first_child;
    my $var   = $share->variable;

    # if it's not an assignment, assign to undef if no value is already there.
    $child->type eq 'Assignment' or return share_lexical_var => {
        name => $var->{var_name},
        pos  => $var->{create_pos}
    };

    $child->{var1_declaration} = $share->{var1_declaration};
    return $child->perl_fmt;
}

sub markdown_fmt {
    my $share   = shift;
    my $var     = $share->variable;
    my $head    = $share->get_markdown_heading($var->{var_name});
    my $comment = $share->parent->find_doc_comment;

    # create an example.
    # later: when outside a class, show PackageName.varName.
    my $example;
    my $class = $share->first_self_or_parent('Class');
    if ($class) {
        $example = $class->{name}.'.'.$var->{var_name};
    }

    return share_lexical_var => {
        name    => $var->{var_name},
        example => $example,
        comment => dot_trim($comment)
    };
}

1
