# Copyright 2014 Mitchell Cooper
package F::Class;

use warnings;
use strict;
use parent 'F::Statement';

sub type { 'Class' }

sub desc {
    my $class = shift;
    my $desc  = "Class '$$class{name}'";
    $desc    .= " version $$class{version}" if defined $class->{version};
    return $desc;
}

sub perl_fmt {
    my $class = shift;
    my ($before_c, $after_c) = ('') x 2;

    # separate.
    my @wants_needs = $class->filter_children(type => 'Instruction.WantNeed');
    my @other = $class->filter_children(
        ignore => 'Instruction.WantNeed',
        order  => 'Function Method rest'
    );

    # add wants and needs.
    foreach my $instr (@wants_needs) {
        my $wn  = $instr->first_child;
        my $fmt = 'class_'.$wn->{arg_type};
        $after_c .= $wn->get_format($fmt => {
            name => $_->{var_name}
        }).";\n" foreach $wn->variables;
    }

    # add everything else.
    # this must come before the definitions below because
    # they are added to method_defs in perl_fmt.
    $after_c .= $_->perl_fmt_do."\n" foreach @other;

    # add each method definition.
    foreach my $def (@{ $class->{method_defs} }) {
        my $fmt = $class->get_format(method_def => $def);
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