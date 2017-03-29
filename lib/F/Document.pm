# Copyright (c) 2015, Mitchell Cooper
package F::Document;

use warnings;
use strict;
use 5.010;
use parent 'F::ScopeOwner';

use Ferret::Shared::Utils qw(dot_trim);

sub new {
    my ($class, %opts) = @_;
    return $class->SUPER::new(
        function_defs       => [],
        required_operations => {},
        %opts
    );
}

sub desc {
    my $doc = shift;
    my $desc = "package '$$doc{package}'";
    $desc   .= " version $$doc{version}" if defined $doc->{version};
    return $desc;
}

sub file_name     { shift->parent->{name}   }
sub provides_name { shift->{package}        }
sub hold_instr    { 1 }

sub perl_fmt {
    my $doc = shift;
    my ($before_c, $after_c) = ('') x 2;

    my @ordered_children = $doc->filter_children(
        order => 'Class Function Spaces rest'
    );

    # add everything.
    # this must come first so that function_defs etc. will be up-to-date.
    $after_c .= $_->perl_fmt_do."\n" foreach @ordered_children;

    # add each function definition.
    $before_c .= "$_\n" foreach map {
        my $info = $_;
        my $fmt  = $_->{event_cb}   ? 'function_def_event' :
                   $_->{need_topic} ? 'function_def_topic' : 'function_def';
        $fmt .= '_e' if !$_->{has_body};

        $info->{name} =
            length $info->{name} && $info->{name} ne '(undef)' ?
            "'$$info{name}'"                                   :
            'undef';

        F::get_perl_fmt($fmt => $_);
    } @{ $doc->{function_defs} };

    return document => {
        'package'      => $doc->{package},
        upper_content  => $before_c,    # function declarations
        lower_content  => $after_c,     # all other children
        all_content    => join("\n", $before_c, $after_c),
        pos            => $doc->{create_pos}
    };
}

sub markdown_fmt {
    my $doc = shift;

    # this must be called before calling ->markdown_fmt_do on children.
    my $head = $doc->get_markdown_heading($doc->{package});

    # first, classes.
    my $classes = '';
    my @classes = $doc->filter_children(type => 'Class');
    $classes .= $_->markdown_fmt_do."\n" for @classes;

    # separate into parts.
    my @functions    = grep $_->public, $doc->filter_children(type => 'Function');
    my @aliases      = grep $_->public, $doc->filter_children(type => 'Alias');
    my @types        = grep $_->public, $doc->filter_children(type => 'Type');
    my @vars         = map $_->first_child,
        $doc->filter_children(type => 'Instruction.SharedDeclaration');

    # type interfaces
    my $types = '';
    if (@types) {

        # add the heading. increase the class heading.
        $doc->{markdown_heading_level}++;
        $types .= $doc->get_markdown_heading('Type interfaces')."\n";

        foreach my $type (@types) {
            $types .= $type->markdown_fmt_do."\n";
        }

        $doc->{markdown_heading_level}--;
    }

    # functions
    my $functions = '';
    if (@functions) {

        # add the heading. increase the class heading to trick the methods.
        $doc->{markdown_heading_level}++;
        $functions .= $doc->get_markdown_heading('Functions')."\n";

        foreach my $function (@functions) {
            $functions .= $function->markdown_fmt_do."\n";
        }

        $doc->{markdown_heading_level}--;
    }

    # class variables.
    my $doc_variables = '';
    if (@vars) {

        # add the heading. increase the class heading.
        $doc->{markdown_heading_level}++;
        $doc_variables .= $doc->get_markdown_heading('Shared variables')."\n";

        foreach my $share (@vars) {
            $doc_variables .= $share->markdown_fmt_do."\n";
        }

        $doc->{markdown_heading_level}--;
    }

    return document => {
        name            => $doc->{package},
        description     => dot_trim($doc->doc_comment),
        version         => $doc->{version},
        version_str     => $doc->{version}    ?
            " version $$doc{version}"         :
            '',
        heading         => $head || '',
        classes         => $classes,
        types           => $types,
        doc_functions   => $functions,
        doc_variables   => $doc_variables
    };
}

1
