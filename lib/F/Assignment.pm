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

    my $private = substr($fmt_args->{name}, 0, 1) eq '_' if $fmt_args->{name};

    # find the instruction. Only useful if the assignment isn't in an If.
    # also find the Class we're in. Only useful if it's instruction's parent.
    # finally, find the document. Only useful if it's instruction's parent.
    my $instr = $a->first_self_or_parent('Instruction');
    my $class = $a->first_self_or_parent('Class');
    my $doc   = $a->first_self_or_parent('Document');
    undef $instr if $a->parent->type eq 'IfParameter';
    undef $class if !$class || !$instr || $instr->parent != $class;
    undef $doc   if !$doc   || !$instr || $instr->parent != $doc;

    # if our instruction belongs to a class, use special formats.
    $fmt_name .= '_c' if
        $class && !$private;

    # if our instruction belongs to a document, use special formats.
    $fmt_name .= '_d' if
        $doc && !$private;

    return $a->get_format("assign_$fmt_name" => $fmt_args);
}

sub assign_to    { shift->first_child   }
sub assign_value { (shift->children)[1] }

1
