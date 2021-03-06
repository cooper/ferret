# Copyright 2015, Mitchell Cooper
package F::Class;

use warnings;
use strict;
use parent 'F::ScopeOwner';

use Ferret::Shared::Utils qw(dot_trim);

sub hold_instr { 1 }

sub desc {
    my $class = shift;
    my $desc  = "class '$$class{name}'";
    $desc    .= " version $$class{version}" if defined $class->{version};
    $desc    .= ' <'.join(', ', @{ $class->{generics} }).'>'
                if $class->{generics};
    return $desc;
}

sub provides_name {
    my $class = shift;
    my @provides = $class->{name};
    push @provides, @{ $class->{generics} } if $class->{generics};
    return @provides;
}

sub add_generic {
    my ($class, $tc) = @_;

    # find the optionals.
    foreach my $maybe_bw (map $_->first_child,
      grep $_->type eq 'Maybe', $tc->children) {
        die 'idk what to do bc this isnt a bareword'
            if $maybe_bw->type ne 'Bareword';
        $class->{generic_maybes}{ $maybe_bw->{bareword_value} }++;
    }

    # add the barewords.
    my @barewords = map $_->{bareword_value},
        grep $_->type eq 'Bareword', $tc->descendants;
    push @{ $class->{generics} ||= [] }, @barewords;

}

sub public {
    my $name = shift->{name};
    return substr($name, 0, 1) ne '_';
}

sub perl_fmt {
    my $class = shift;
    my ($before_c, $after_c) = ('') x 2;

    # add everything else.
    # this must come before the definitions below because
    # they are added to method_defs in perl_fmt.
    $after_c .= $_->perl_fmt_do."\n" foreach $class->ordered_children;

    # add each method definition.
    foreach my $def (@{ $class->{method_defs} || [] }) {
        my $fmt = 'method_def_event';
        $fmt .= '_e' if !$def->{has_body};
        $fmt = F::get_perl_fmt($fmt => $def);
        $before_c .= "$fmt\n";
    }

    # add generics.
    my ($generics, @generics) = ('undef', @{ $class->{generics} || [] });
    if (@generics) {
        @generics = map {
            my $is_maybe = $class->{generic_maybes}{$_};
            $is_maybe ? "\\'$_'" : "'$_'"
        } @generics;
        $generics = '[ '.join(', ', @generics).' ]';
    }

    return class => {
        name           => $class->{name},
        version        => $class->{version} // 'undef',
        context         => $class->public ? '$context' : 'undef',
        upper_content  => $before_c,    # function declarations
        lower_content  => $after_c,     # all other children
        generics       => $generics
    };
}

sub markdown_fmt {
    my $class = shift;
    my $content = '';

    # this must be called before calling ->markdown_fmt_do on children.
    my $pkg = $class->document->{package};
    my $class_full_name = $pkg ne 'main' ? $pkg.'::'.$class->{name} : $class->{name};
    my $head = $class->get_markdown_heading($class_full_name);

    # separate into parts.
    my @all_methods  = $class->filter_children(public => 1, type => 'Function');
    my @aliases      = $class->filter_children(public => 1, type => 'Alias');
    my @types        = $class->filter_children(public => 1, type => 'Type');
    my @class_vars   = $class->filter_children(type => 'Instruction.SharedDeclaration');

    # separate methods into initializer, class functions, and normal.
    my (@methods, @class_funcs, @init);
    foreach my $method (@all_methods) {
        next unless $method->public;
        next if $method->{name} eq 'description';
        
        # this is an initializer.
        if ($method->{main} && $method->{name} eq 'initializer__') {
            push @init, $method;
            next;
        }

        # this is a class function. ignore private ones.
        if ($method->{main}) {
            push @class_funcs, $method;
            next;
        }

        # it's a true method.
        push @methods, $method;

    }

    # type interfaces.
    my $types = '';
    if (@types) {

        # add the heading. increase the class heading.
        $class->{markdown_heading_level}++;
        $types .= $class->get_markdown_heading('Type interfaces')."\n";

        foreach my $type (@types) {
            $types .= $type->markdown_fmt_do."\n";
        }

        $class->{markdown_heading_level}--;
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

    # class variables.
    my $class_variables = '';
    if (@class_vars) {

        # add the heading. increase the class heading.
        $class->{markdown_heading_level}++;
        $class_functions .= $class->get_markdown_heading('Class properties')."\n";

        foreach my $share (@class_vars) {
            $class_variables .= $share->markdown_fmt_do."\n";
        }

        $class->{markdown_heading_level}--;
    }

    # initializers
    my $init = '';
    $init .= $_->markdown_fmt_do."\n" for @init;

    return class => {
        name            => $class_full_name,
        description     => dot_trim($class->doc_comment),
        version         => $class->{version},
        version_str     => $class->{version}    ?
            " version $$class{version}"         :
            '',
        heading         => $head || '',
        initializer     => $init,
        methods         => $methods,
        types           => $types,
        class_functions => $class_functions,
        class_variables => $class_variables
    };
}

1
