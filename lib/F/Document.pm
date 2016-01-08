# Copyright (c) 2015, Mitchell Cooper
package F::Document;

use warnings;
use strict;
use 5.010;
use parent 'F::ScopeOwner';

sub new {
    my ($class, %opts) = @_;
    return $class->SUPER::new(
        function_defs       => [],
        required_spaces     => {},
        required_operations => {},
        %opts
    );
}

sub hold_instr { 1 }

sub desc {
    my $doc = shift;
    my $str = "document '$$doc{name}'";
    return $str;
}

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
        my $fmt  = $_->{event_cb} ? 'function_def_event' : 'function_def';

        $info->{name} =
            length $info->{name} && $info->{name} ne '(undef)' ?
            "'$$info{name}'"                                   :
            'undef';

        F::get_perl_fmt($fmt => $_);
    } @{ $doc->{function_defs} };

    return document => {
        'package'      => $doc->{package} // 'main',
        operations     => join(' ', sort keys %{ $doc->{required_operations} }),
        upper_content  => $before_c,    # function declarations
        lower_content  => $after_c,     # all other children
        all_content    => join("\n", $before_c, $after_c)
    };
}

sub markdown_fmt {
    my $doc = shift;
    my $content = '';

    # this must be called before calling ->markdown_fmt_do on children.
    my $head = $doc->get_markdown_heading($doc->{package});

    # first, classes.
    my @classes = $doc->filter_children(type => 'Class');
    $content .= $_->markdown_fmt_do."\n" for @classes;

    return document => {
        heading => $head || '',
        content => $content
    };
}

1
