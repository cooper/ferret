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

sub owner {
    my ($a, $owner_str, $owner, $owrite) = shift;

    # if we find a share or alias, it's public.
    # this $public is only respected if we're at document or class level.
    my $public =
        $a->parent->type eq 'SharedDeclaration' ||
        $a->parent->type eq 'Alias';

    # find instruction. assignment will always be below an instruction
    # unless it is within an if parameter.
    my $instr = $a->first_self_or_parent('Instruction');
    undef $instr if $a->parent->type eq 'IfParameter';

    # find the owner.
    if ($instr && $instr->parent->type eq 'Document') {
        $owner_str  = $public ? '$context' : '$scope';
        $owner      = $instr->parent;
        $owrite     = 0;
    }
    elsif ($instr && $instr->parent->type eq 'Class') {
        $owner_str  = $public ? '$class' : '$scope';
        $owner      = $instr->parent;
        $owrite     = 0;
    }
    else {
        $owner_str = '$scope';
        $owner     = $a->first_upper_scope;
        $owrite    = 1;
    }

    return ($owner, $owner_str, $owrite);
}

sub perl_fmt {
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

    my (undef, $owner, $owrite) = $a->owner;

    $fmt_args->{owner}  = $owner;
    $fmt_args->{owrite} = $owrite ? '_ow($context, ' : '(';
    return "assign_$fmt_name" => $fmt_args;
}

sub assign_to    { shift->first_child   }
sub assign_value { (shift->children)[1] }

1
