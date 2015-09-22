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
    my $var1 = $var_exp->first_child;
    my $var2;

    # if it's a structural list, it's like a key-value type deal.
    if ($var1->type eq 'List') {
        ($var1, $var2) = map $_->item, $var1->children;
        $var1 && $var2 or die;
        $var2->type eq 'LexicalVariable' or die;
    }

    # this is temporary.
    $var1->type eq 'LexicalVariable' or die;

    # get content.
    my $content = '';
    foreach my $child ($for->ordered_children) {
        next if $child == $var_exp || $child == $collection;
        $content .= $child->perl_fmt_do."\n";
    }

    return $var2 ? 'for_each_hash' : 'for_each_list' => {
        collection  => $collection->perl_fmt_do,
        var1_name   => $var1->{var_name},
        var2_name   => $var2->{var_name},
        body        => $content
    };
}

sub param_exp    { shift->{param_exp} }
sub in_param_exp { shift->{in_param_exp} }
sub is_closure   { 1 }
sub type         { 'For' }


1
