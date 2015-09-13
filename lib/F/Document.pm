# Copyright (c) 2014 Mitchell Cooper
package F::Document;

use warnings;
use strict;
use 5.010;
use parent 'F::Node';

sub new {
    my ($class, %opts) = @_;
    return $class->SUPER::new(
        function_defs       => [],
        required_spaces     => {},
        required_operations => {},
        %opts
    );
}

sub type { 'Document' }
sub desc {
    my $doc = shift;
    my $str = "document '$$doc{name}'";
    return $str;
}

sub perl_fmt {
    my $doc = shift;
    my ($before_c, $after_c, $includes) = ('') x 3;

    my @ordered_children = $doc->filter_children(
        order => 'Class Function Spaces rest'
    );

    # add everything.
    # this must come first so that function_defs etc. will be up-to-date.
    $after_c .= $_->perl_fmt_do."\n" foreach @ordered_children;

    # add each function definition.
    $before_c .= "$_\n" foreach map {
        my $fmt   = $_->{event_cb} ? 'function_def_event' : 'function_def';
        $doc->get_format($fmt => $_);
    } @{ $doc->{function_defs} };

    return document => {
        'package'      => $doc->{package} // 'main',
        includes       => $includes,
        operations     => join(' ', sort keys %{ $doc->{required_operations} }),
        upper_content  => $before_c,    # function declarations
        lower_content  => $after_c,     # all other children
    };
}

1
