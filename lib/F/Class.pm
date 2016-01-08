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

sub markdown_fmt {
    my $class = shift;
    my $content = '';

    # this must be called before calling ->markdown_fmt_do on children.
    my $head = $class->get_markdown_heading($class->{name});

    # separate into parts.
    my @all_methods  = $class->filter_children(type => 'Method');
    my @aliases      = grep $_->public, $class->filter_children(type => 'Alias');

    # separate methods into initializer, class functions, and normal.
    my (@methods, @class_funcs, $init);
    foreach my $method (@all_methods) {

        # this is the initializer.
        if ($method->{main} && $method->{name} eq 'initializer__') {
            $init = $method;
            next;
        }

        # this is a class function. ignore private ones.
        if ($method->{main}) {
            push @class_funcs, $method if $method->public;
            next;
        }

        # it's a true method.
        push @methods, $method;

    }

    # methods.
    my $methods = '';
    if (@methods) {

        # add the heading. increase the class heading to trick the methods.
        $class->{markdown_heading_level}++;
        $methods .= $class->get_markdown_heading('Methods')."\n";

        foreach my $method (@methods) {
            $methods .= $method->markdown_fmt_do."\n";
        }

        $class->{markdown_heading_level}--;
    }

    # class functions.
    my $class_functions = '';
    if (@class_funcs) {

        # add the heading. increase the class heading to trick the functions.
        $class->{markdown_heading_level}++;
        $class_functions .= $class->get_markdown_heading('Class functions')."\n";

        foreach my $method (@class_funcs) {
            $class_functions .= $method->markdown_fmt_do."\n";
        }

        $class->{markdown_heading_level}--;
    }

    return class => {
        name            => $class->{name},
        version         => $class->{version},
        version_str     => $class->{version}    ?
            " version $$class{version}"         :
            '; it is not versioned',
        heading         => $head || '',
        initializer     => $init ? $init->markdown_fmt_do : '',
        methods         => $methods,
        class_functions => $class_functions
    };
}

1
