# Copyright 2015, Mitchell Cooper
package F::For;

use warnings;
use strict;
use parent 'F::Closure';

use Scalar::Util 'weaken';

sub new {
    my ($class, %opts) = @_;
    my $for = $class->SUPER::new(%opts);

    # TODO: currently, the only 'for_type' is 'iteration'
    $for->{for_type} = 'iteration';

    # create 'for' parameter.
    my $exp = $for->{param_exp} = F::new('ForParameter');
    $for->adopt($exp);

    # create 'in' parameter.
    $exp = $for->{in_param_exp} = F::new('InParameter');
    $for->adopt($exp);

    # create the body.
    my $body = F::new('Body');
    weaken($for->{body} = $body);
    $for->adopt($body);

    return $for;
}

sub perl_fmt {
    my $for = shift;
    my ($var1, $var2, $collection) = $for->handle_vars;

    # get content.
    my $content = $for->body->body_fmt_do;

    # this is pretty ugly, but I don't know a better way.
    my @mys;
    push @mys, $var1->{var_name} if $var1;
    push @mys, $var2->{var_name} if $var2;
    my $mys = join "\n", map "my \$lv_$_ = \$scope->property_u('$_');", @mys;

    return $var2 ? 'for_each_hash' : 'for_each_list' => {
        collection  => $collection->perl_fmt_do,
        var1_name   => $var1->{var_name},
        var2_name   => $var2->{var_name},
        body        => $content,
        #mys         => $mys,
        pos         => $for->{create_pos}
    };
}

sub handle_vars {
    my $for = shift;
    my ($var_exp, $collection) = $for->children;
    my $var1 = $var_exp->first_child;
    my $var2;

    # if it's a structural list, it's like a key-value type deal.
    if ($var1->type eq 'List') {
        ($var1, $var2) = map $_->item, $var1->children;
        $var1 && $var2 or die;
        $var2->type eq 'LexicalVariable' or die; # FIXME: bad
    }

    # this is temporary.
    $var1->type eq 'LexicalVariable' or die; # FIXME: bad

    # store the variables.
    $for->{value_var} = $var2 || $var1;
    $for->{key_var}   = $var1 if $var2;

    return ($var1, $var2, $collection);
}

sub value_var { shift->{value_var} }
sub key_var   { shift->{key_var}   }

sub hold_instr   { 1 }
sub body         { shift->{body}         }
sub param_exp    { shift->{param_exp}    }
sub in_param_exp { shift->{in_param_exp} }
sub is_closure   { 1 }

1
