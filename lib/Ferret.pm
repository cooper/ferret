# Copyright (c) 2013 Mitchell Cooper
package Ferret;

use warnings;
use strict;
use utf8;
use 5.010;

use Scalar::Util 'blessed';

use Ferret::Object;
use Ferret::String;
use Ferret::Number;
use Ferret::Context;
use Ferret::Function;
use Ferret::Event;
use Ferret::Class;
use Ferret::List;
use Ferret::Hash;
use Ferret::Core::Functions;
use Ferret::Core::Context;

# object constants.
our ($ferret, $core_context, %tried_files);
my $undefined = \'undefined';
sub true      () { state $true  = \'true'  } # TODO
sub false     () { state $false = \'false' } # TODO

# fetch undefined value or test if a value is undefined.
sub undefined(;$) {
    my $test = shift;
    return $undefined if not defined $test;
    return $test == $undefined;
}

# create a new ferret.
sub new {
    my ($class, %opts) = @_;
    my $f = bless {}, $class;

    # create the core and main context objects.
    $f->{context}{core} ||=
        $core_context   ||= Ferret::Core::Context->new($f, %opts);
    $f->{context}{main} ||= Ferret::Context->new($f,
        %opts,
        parent => $f->{context}{core}
    );

    return $f;
}

sub main_context { shift->{context}{main}   }
sub core_context { shift->{context}{core}   }

# fetch a context or create it.
sub get_context  {
    my ($f, $name) = @_;
    return $f->{context}{$name} if $f->{context}{$name};
    # TODO: if the context is like A::B, B should inheit from A.
    my $context = Ferret::Context->new($f, parent => $f->main_context);
    return $f->{context}{$name} = $context;
}

# returns Perl boolean of whether or not a value is a valid Ferret value.
sub valid_value {
    defined(my $value = shift) or return;

    # if it's one of these non-object values, it's good.
    if ($value == undefined || $value == true || $value == false) {
        return 1;
    }

    # if it's an object, it's good.
    if (blessed($value) && $value->isa('Ferret::Object')) {
        return 1;
    }

    # it is none of these; not good.
    return;

}

# fetch a class or namespace.
# if necessary, load it.
sub space {
    my ($scope, $space) = @_;
    my $file = c2s("$space.frt.pm");

    # already tried this file, or the namespace/class exists.
    return $scope->property($space)
        if $scope->has_property($space) || $tried_files{$file};

    # load it.
    require $file;
    $tried_files{$file} = 1;
    return $scope->property($space);

}

sub c2s { my $c = shift; $c =~ s/::/\//g; $c }
sub s2c { my $s = shift; $s =~ s/\//::/g; $s }

1
