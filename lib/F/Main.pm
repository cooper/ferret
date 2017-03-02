# Copyright 2017, Mitchell Cooper
package F::Main;

use warnings;
use strict;
use parent 'F::Node';

use Ferret::Shared::Utils qw(trim);
use File::Basename qw(basename);

sub file_name { shift->{name} }
sub desc {
    my $file_name = shift->file_name;
    return "file '$file_name'";
}

sub perl_fmt_do {
    my ($main, $mini) = @_;
    my $perl = join "\n", map { $_->perl_fmt_do } $main->children;
    return $perl if $mini;
    return F::get_format('Perl', main => {
        operations  => join(' ', sort keys %{ $main->{required_operations} }),
        content     => $perl,
        file_name   => $main->{name},
        base_name   => basename($main->{name})
    });
}

sub markdown_fmt_do {
    my ($main, $mini) = @_;
    my $markdown = join "\n", map { $_->markdown_fmt_do } $main->children;
    return $markdown if $mini;
    return trim(F::get_format('Markdown', main => {
        content   => $markdown,
        file_name => $main->{name},
        base_name => basename($main->{name})
    }));
}

1
