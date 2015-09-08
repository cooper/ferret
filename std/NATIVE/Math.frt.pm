# Copyright (c) 2015, Mitchell Cooper
package Ferret::Native::Math;

print "OK!\n";

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

my @functions = (
    sqrt => {
        code => \&_sqrt,
        need => '$num:Num'
    }
);

*new = *Ferret::bind_constructor;
Ferret::bind_class(
    package   => 'NATIVE',
    name      => 'Math',
    functions => \@functions
);

sub _sqrt {
    my ($class, $arguments) = @_;
    my $sqrt = sqrt $arguments->{num}{value};
    return Ferret::Number->new($class->ferret, value => $sqrt);    
}

1
