# Copyright 2015 Mitchell Cooper
package F::For;

use warnings;
use strict;
use parent 'F::Closure';

use Scalar::Util 'weaken';

sub new {
    my ($class, %opts) = @_;
    my $for = $class->SUPER::new(%opts);

    # create 'for' parameter.
    my $exp = $for->{param_exp} = F::Expression->new(
        parameter_for        => 'for',
        generated_expression => 1,
        no_instructions      => 1
    );
    $for->adopt($exp);

    # create 'in' parameter.
    $exp = $for->{in_param_exp} = F::Expression->new(
        parameter_for        => 'in',
        generated_expression => 1,
        no_instructions      => 1
    );
    $for->adopt($exp);

    return $for;
}

sub perl_fmt {
    my $for = shift;
    my ($var_exp, $collection) = $for->children;
    my $var = ($var_exp->children)[0];

    # this is temporary.
    $var->type eq 'LexicalVariable' or die;

    # get content.
    my $content = '';
    foreach my $child ($for->ordered_children) {
        next if $child == $var_exp || $child == $collection;
        $content .= $child->perl_fmt_do."\n";
    }

    return for_each => {
        collection  => $collection->perl_fmt_do,
        var_name    => $var->{var_name},
        body        => $content
    };
}

sub param_exp    { shift->{param_exp} }
sub in_param_exp { shift->{in_param_exp} }
sub is_closure   { 1 }
sub type         { 'On' }


1
