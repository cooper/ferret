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

    # mimic = copy the signature.
    if (my $mimic = delete $opts{mimic}) {
        ref $mimic or return $func;
        $mimic = $mimic->{function}{default} if $mimic->isa('Ferret::Event');
        ref $mimic && $mimic->isa('Ferret::Function') or return $func;
        @$func  {'signature', 'signatures'} =
        @$mimic {'signature', 'signatures'};
    }

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

sub call_with_self {
    my ($func, $self) = (shift, shift);
    $func->{force_self} = $self;
    my $ret = $func->call(@_);
    delete $func->{force_self};
    return $ret;
}

sub call {
    my ($func, $arguments, $from_scope, $return) = @_;

    # list of arguments. must use signature.
    if (ref $arguments eq 'ARRAY') {
        $arguments = $func->handle_arguments($arguments);
    }

    # hash ref of arguments.
    if (ref $arguments eq 'HASH') {
        return unless $func->arguments_satisfy_signature($arguments);

        # create a scope which inherits from the outer scope.
        #
        # $from_scope   = the scope where the function was called
        # $scope        = the scope within the function
        # outer_scope   = the scope outside of the function definition
        #
        my $scope = Ferret::Scope->new($func->ferret,
            parent => $func->{outer_scope}
        );

        $return ||= Ferret::Object->new($func->ferret);

        my $self =
            delete $func->{force_self} ||
            ($func->is_method ? $func->{last_parent} : $func->{class});

        # class/instance argument.
        $scope->{special}->set_property(self   => $self) if $self;
        $scope->{special}->set_property(class  => $func->{class}) if $func->{class};
        $scope->{special}->set_property(return => $return);

        # call the function.
        return $func->{code}($self, $arguments, $from_scope, $scope, $return);

    }

    # otherwise, not sure what to do...
    return;

}

sub inside_scope {
    # $name     =   the name of the function within the containing scope, or undef if anonymous
    # $scope    =   the containing scope of the function definition
    # $owner    =   the owner of the function: a scope, class, or prototype
    # $class    =   the containing class of the function (if any)
    my ($func, $name, $scope, $owner, $class) = @_;
    $func->{class} = $class;
    $func->{outer_scope} = $scope;
    $owner->set_property($name => $func) if defined $name;
    return $func;
}

sub has_name  { length shift->{name} }
sub is_method { shift->{is_method}   }

1
