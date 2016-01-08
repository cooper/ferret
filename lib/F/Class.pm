# Copyright 2015, Mitchell Cooper
package F::Class;

use warnings;
use strict;
use parent 'F::ScopeOwner';


sub hold_instr { 1 }

sub desc {
    my $class = shift;
    my $desc  = "class '$$class{name}'";
    $desc    .= " version $$class{version}" if defined $class->{version};
    return $desc;
}

sub perl_fmt {
    my $class = shift;
    my ($before_c, $after_c) = ('') x 2;

    # separate.
    # my @wants_needs = $class->filter_children(type => 'Instruction.WantNeed');
    # my @other = $class->filter_children(
    #     ignore => 'Instruction.WantNeed',
    #     order  => 'Function Method rest'
    # );

    # # add wants and needs.
    # foreach my $instr (@wants_needs) {
    #     my $wn = $instr->first_child;
    #     foreach my $var ($wn->variables) {
    #         my $type  = $var->type eq 'InstanceVariable' ? 'ivar' : 'var';
    #         my $fmt   = sprintf 'class_%s_%s', $type, $wn->{arg_type};
    #         $after_c .= F::get_perl_fmt($fmt => {
    #             name => $var->{var_name}
    #         }).";\n"
    #     }
    # }

    # add everything else.
    # this must come before the definitions below because
    # they are added to method_defs in perl_fmt.
    $after_c .= $_->perl_fmt_do."\n" foreach $class->ordered_children;

    # add each method definition.
    foreach my $def (@{ $class->{method_defs} }) {
        my $fmt = F::get_perl_fmt(method_def_event => $def);
        $before_c .= "$fmt\n";
    }

    return class => {
        name           => $class->{name},
        version        => $class->{version} // 'undef',
        upper_content  => $before_c,    # function declarations
        lower_content  => $after_c,     # all other children
    };
}


1
