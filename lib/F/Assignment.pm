# Copyright (c) 2015, Mitchell Cooper
package F::Assignment;

use warnings;
use strict;
use 5.010;
use parent 'F::Node';


sub desc {
    my $a = shift;
    my $lazy = $a->{lazy} ? 'lazy ' : '';
    return "${lazy}assignment";
}

sub perl_fmt_do {
    my $a = shift;
    my ($fmt_name, $fmt_args) = $a->assign_to->perl_fmt;
    $fmt_args->{pos} = $a->{create_pos};

    # the assignment value should be wrapped in sub{} if it's a lazy property.
    my $val = $a->assign_value->perl_fmt_do;
    $val = "[ sub { $val } ]" if $a->{lazy};
    $fmt_args->{assign_value} = $val;

    # fix *special properties
    # consider: will it ever even be allowed to assign to special property?
    $fmt_args->{name} = "'$$fmt_args{name}'"
        if ($fmt_args->{name} // '') =~ m/^\*/;

    # if the direct parent of instruction is a Class, use a special format
    # UNLESS it starts with '_', in which case it is a "private" class var.
    $fmt_name .= '_c' if
        $a->parent->parent->type eq 'Class' &&
        substr($fmt_args->{name}, 0, 1) ne '_';

    return $a->get_format("assign_$fmt_name" => $fmt_args);
}

sub assign_to    { shift->first_child   }
sub assign_value { (shift->children)[1] }

1
