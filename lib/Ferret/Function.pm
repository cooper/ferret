# Copyright (c) 2014, Mitchell Cooper
package Ferret::Function;

use warnings;
use strict;
use utf8;
use 5.010;

use parent 'Ferret::Object';

# creates a new function.
sub new {
    my ($class, $f, %opts) = @_;

    # create a new object.
    my $func = $class->SUPER::new($f,
        priority   => 0,
        signatures => [],
        %opts
    );

    return $func;
}

# add an argument to the signature.
sub add_argument {
    my ($func, %opts) = @_;
    #
    # possible options:
    #
    #   name        the name of the argument (required)
    #   type        the type, which should be a Perl string
    #   optional    true if it's a want, not a need
    #
    $func->{signature}{ $opts{name} } = \%opts;
    push @{ $func->{signatures} }, \%opts;
}

# convert a list of arguments into a hash using the signature.
# this does NOT check if the requirements were satisfied.
sub handle_arguments {
    my ($func, @args, %args) = (shift, @{ +shift });
    my @sigs = @{ $func->{signatures} };
    $args{ (shift @sigs)->{name} } = shift @args while @sigs && @args;
    return \%args;
}

# check that the requirements are present and of correct types.
sub arguments_satisfy_signature {
    my ($func, $arguments) = @_;
    foreach my $sig (@{ $func->{signatures} }) {
        next if $sig->{optional};
        return if not exists $arguments->{ $sig->{name} };
        # TODO: check types here.
    }
    return 1;
}

sub call {
    my ($func, $arguments, $from_scope) = @_;

    # hash ref of arguments.
    if (ref $arguments eq 'HASH') {
        return unless $func->arguments_satisfy_signature($arguments);
        return $func->{code}($arguments, $from_scope);
    }

    # list of arguments. must use signature.
    $arguments = $func->handle_arguments($arguments);
    return $func->call($arguments);

}

sub has_name { length shift->{name} }

1
