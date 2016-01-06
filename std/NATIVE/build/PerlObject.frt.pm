# Copyright (c) 2015, Mitchell Cooper
package Ferret::Native::PerlObject;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Scalar::Util qw(reftype refaddr weaken blessed);
use Ferret::Core::Conversion qw(perlize ffunction ferretize);

my @functions = (
    require => {
        need => '$file:Str',
        want => '$args...',
        code => \&_require
    }
);

Ferret::bind_class(
    package   => 'NATIVE',
    name      => 'PerlObject',
    functions => \@functions,
    #methods   => \@methods,
    init      => \&init,
    init_want => '$CLASS:Str $args...'
);

*new = *Ferret::bind_constructor;

my %objects;

sub init {
    my ($pobj, $args) = @_;

    # creating a new object.
    if ($args->{CLASS}) {

        # $CLASS is the name of the Perl class.
        my $class = $args->pstring('CLASS');
        $pobj->{class_name} = $class;
        delete $args->{CLASS};

        # if there is a $INIT, it's the constructor name.
        my $cnstr = $args->pstring('INIT') || 'new';
        delete $args->{INIT};

        # create the object.
        my $real_obj = $pobj->{real_obj} =
            eval { $class->$cnstr(_handle_args($args)) };

        # an error occurred, or the constructor returned false.
        if (!$real_obj || !blessed $real_obj) {
            $pobj->{override_init_obj} = Ferret::undefined;
            return;
            # TODO: return error -> some error object if $@ is set.
        }

        weaken($objects{ refaddr($real_obj) } = $pobj);
    }

    # otherwise, hope that we are wrapping an existing object.
    # TODO: somehow handle this if not.

}

# wrap an existing object.
sub _wrap {
    my ($f, $real_obj) = @_;

    # a PerlObject already exists.
    my $pobj = $objects{ refaddr($real_obj) || 0 };
    return $pobj if $pobj;

    # if it isn't blessed, we can't create a PerlObject.
    if (!blessed $real_obj) {
        return Ferret::undefined;
    }

    # create one.
    $pobj = __PACKAGE__->new;
    $pobj->{real_obj}   = $real_obj;
    $pobj->{class_name} = blessed $real_obj;

    return $pobj;
}

sub _require {
    my (undef, $args) = @_;
    my $file = $args->pstring('file');
    my @args = $args->plist('args');

    # convert package name to filename.
    if (index($file, '::') != -1) {
        $file =~ s/::/\//g;
        $file .= '.pm';
    }

    # if this eval returns false, there was an error.
    if (!eval { require $file; 1 }) {
        return Ferret::false;
        # TODO: return error -> some error object wrapping $@.
    }

    return Ferret::true;
}

sub _property {
    my ($pobj, $prop_name, $borrow_obj, $simple_only, $no_compute) = (shift, @_);
    my $real_obj = $pobj->{real_obj};
    my $f = $pobj->f;

    # use the Perl method.
    my $code = $real_obj->can($prop_name);
    return _create_function($f, $code, $prop_name, $real_obj) if $code;

    # use the Perl hash value.
    if (reftype $real_obj eq 'HASH' && exists $real_obj->{$prop_name}) {
        return _ferretize($f, $real_obj->{$prop_name});
    }

    return $pobj->SUPER::_property(@_);
}

# handles argument as a list, key:value pairs, or a mixture.
# returns a single list for passing to a Perl function.
sub _handle_args {
    my $args = shift;

    # if there is $args, the arguments were passed as a list.
    my @args = map perlize($_, 1), $args->plist('args');
    delete $args->{args};

    # all other arguments are key => value.
    my %args = map { perlize($args->{$_}, 1) } keys %$args;

    return (@args, %args);
}

# creates a Ferret function from a Perl code.
# if $real_obj is provided, it's assumed to be a method.
sub _create_function {
    my ($f, $code, $name, $real_obj) = @_;
    my $needs_obj = defined $real_obj;
    weaken(my $weak_obj = $real_obj) if $real_obj;

    return ffunction(sub {
        my (undef, $args) = @_;

        # if it's supposed to be a method and $weak_obj is gone,
        # it has been disposed of.
        return if $needs_obj && !$weak_obj;

        # handle the other args. add the object if it's a method.
        my @args = _handle_args($args);
        unshift @args, $weak_obj if $needs_obj;

        # ferretize the return value.
        my $ret = $code->(@args);
        return _ferretize($f, $ret);

    }, $name, undef, '$args...');
}

# wrapper for ferretize() which creates a PerlObject if necessary.
sub _ferretize {
    my ($f, $val) = @_;
    my $recursive = 1;

    # if it's a code reference, use _create_function().
    return _create_function($f, $val) if ref $val eq 'CODE';

    # blessed. could be a Ferret object or another Perl object.
    if (blessed $val) {

        # normal object. pass it on.
        if ($val->isa('Ferret::Object')) {
            return ferretize($val, $recursive);
        }

        # non-ferret object.
        return _wrap($f, $val);

    }

    # not blessed. pass it on.
    return ferretize($val, $recursive);

}

sub description {
    my $pobj = shift;
    return 'PerlObject("'.$pobj->{class_name}.'")';
}

1
