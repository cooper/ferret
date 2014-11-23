# Copyright 2014 Mitchell Cooper
package Ferret::Lexer::Statement::Class;

use warnings;
use strict;
use parent 'Ferret::Lexer::Statement';

sub type { 'Class' }
sub desc {
    my $class = shift;
    my $desc  = "Class '$$class{name}'";
    $desc    .= " version $$class{version}" if defined $class->{version};
    return $desc;
}
1
