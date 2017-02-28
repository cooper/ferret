# Copyright (c) 2015, Mitchell Cooper
package F::Assignment;

use warnings;
use strict;
use 5.010;
use parent qw(F::Node);

sub desc {
    my $a = shift;
    return 'lazy assignment'            if $a->{lazy};
    return 'assignment'                 if !$a->{operation};
    return 'addition assignment'        if $a->{operation} eq 'add';
    return 'subtraction assignment'     if $a->{operation} eq '_sub';
    return 'multiplication assignment'  if $a->{operation} eq 'mul';
    return 'division assignment'        if $a->{operation} eq 'div';
    return 'altering assignment';
}

# assignments can only act as expressions when they will return Ferret objects.
# lazy assignments return code or array references.
sub is_Expression { !shift->{lazy} }

sub owner {
    my ($a, $owner_str, $owner, $owrite) = shift;

    # if we find a share or alias, it's public.
    # this $public is only respected if we're at document or class level.
    my $public =
        $a->parent->type eq 'SharedDeclaration' ||
        ($a->parent->type eq 'Alias' &&
         substr($a->assign_to->{bareword_value}, 0, 1) ne '_');
    $a->{public} = $public;

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

    # the assignment value should be wrapped in an operation if it's an
    # altering assignment operator.
    if (my $op = $a->{operation}) {
        my $old = $a->assign_to->perl_fmt_do;
        $val = F::get_perl_fmt(operation => {
            operation => $op,
            items     => "$old, $val",
            pos       => $a->{create_pos}
        });
        $a->document->{required_operations}{$op}++;
    }

    $fmt_args->{assign_value} = $val;


    # fix *special properties
    # consider: will it ever even be allowed to assign to special property?
    $fmt_args->{name} = "'$$fmt_args{name}'"
        if ($fmt_args->{name} // '') =~ m/^\*/;

    my (undef, $owner_str, $owrite) = $a->owner;
    $fmt_args->{owner}  = $owner_str;
    $fmt_args->{owrite} = $owrite  ? '$file_scope' : 'undef';
    $fmt_args->{my}     = $a->{var1_declaration} ? 'my ' : '';

    return "assign_$fmt_name" => $fmt_args;
}

sub is_PropertyOwner    { shift->assign_to->is_type('PropertyOwner')    }
sub property_name       { shift->assign_to->property_name               }
sub property_name_code  { shift->assign_to->property_name_code          }
sub property_owner_code { shift->assign_to->property_owner_code         }

sub public       { shift->public        }
sub assign_to    { shift->first_child   }
sub assign_value { (shift->children)[1] }

1
