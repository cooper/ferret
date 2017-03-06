# Copyright (c) 2015, Mitchell Cooper
package Ferret::NATIVE::PerlObject;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Evented::Object::Hax;
use Scalar::Util qw(reftype refaddr weaken blessed);
use Ferret::Core::Conversion qw(perlize pargs ferretize ffunction_smart ferror);

my @functions = (
    require => {
        need => '$file:Str',
        want => '$args...',
        code => \&_require
    },
    wrapPackageVariable => {
        need => '$pkg:Str $var:Str',
        code => \&_wrap_package_variable
    }
);

my @methods = (
    perlCall => {
        need => '$FUNC:Str',
        want => '$args...',
        code => \&_perlCall
    }
);

Ferret::bind_class(
    package   => 'NATIVE',
    name      => 'PerlObject',
    functions => \@functions,
    methods   => \@methods,
    init      => \&init,
    init_need => '$CLASS:Str',
    init_want => '$args...'
);

*new = *Ferret::bind_constructor;

my %objects;

sub init {
    my ($pobj, $args, undef, undef, $ret) = @_;

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
            eval { $class->$cnstr(pargs($args)) };

        # an error occurred, or the constructor returned false.
        if (!$real_obj || !blessed $real_obj) {
            my $err = ferror($@, 'PerlConstructorFailed');
            return $ret->throw($err);
        }

        weaken($objects{ refaddr($real_obj) } = $pobj);
    }

    # otherwise, hope that we are wrapping an existing object.
    # TODO: somehow handle this if not.

}

# wrap an existing object.
sub _wrap {
    my ($f, $real_obj) = @_;

    # if it isn't blessed, we can't create a PerlObject.
    return Ferret::undefined if !$real_obj || !blessed $real_obj;

    # a PerlObject already exists.
    my $pobj = $objects{ refaddr($real_obj) || 0 };
    return $pobj if $pobj;

    # create one.
    $pobj = __PACKAGE__->new;
    $pobj->{real_obj}   = $real_obj;
    $pobj->{class_name} = blessed $real_obj;

    return $pobj;
}

sub _require {
    my (undef, $args, undef, undef, $ret) = @_;
    my $file = $args->pstring('file');
    my @args = $args->plist('args');

    # convert package name to filename.
    $file =~ s/::/\//g;
    $file .= '.pm';

    # if this eval returns false, there was an error.
    if (!eval { require $file; 1 }) {
        my $err = ferror($@, 'PerlRequireFailed');
        return $ret->throw($err);
    }

    return Ferret::true;
}

sub _wrap_package_variable {
    my ($class, $args) = @_;
    my $pkg_name = $args->pstring('pkg');
    my $var_name = $args->pstring('var');
    my $value = Evented::Object::Hax::get_symbol($pkg_name, $var_name);
    return _wrap($class->f, $value);
}

sub _perlCall {
    my ($pobj, $args, undef, undef, $ret) = @_;
    my $real_obj = $pobj->{real_obj};

    # method name.
    my $func_name = $args->pstring('FUNC');
    delete $args->{FUNC};

    # call context.
    my $ctx = $args->pstring('CONTEXT');
    delete $args->{CONTEXT};

    # find the method.
    my $code = $real_obj->can($func_name);
    return $ret->throw(
        ferror("No such Perl method '$func_name'", 'NativeCodeError')
    ) if !$code;

    # create a function.
    my $func = ffunction_smart($code, $func_name, $real_obj, $ctx);

    # call it.
    return $func->call([ pargs($args) ]);

}

sub _property {
    my ($pobj, $prop_name, $borrow_obj, $simple_only, $no_compute) = (shift, @_);
    my $real_obj = $pobj->{real_obj};
    my $f = $pobj->f;

    # use the Perl method.
    my $code = $real_obj->can($prop_name);
    return ffunction_smart($code, $prop_name, $real_obj) if $code;

    # use the Perl hash value.
    if ($pobj->_has_hash_key($prop_name)) {
        return ferretize($pobj->_get_hash_value($prop_name), 1, 1);
    }

    return $pobj->SUPER::_property(@_);
}

sub set_property {
    my ($pobj, $prop_name, $value) = (shift, @_);
    my $real_obj = $pobj->{real_obj};
    $value = perlize(my $ferret_value = $value);

    # if we have a method set_$prop_name, use that.
    # also try set$prop_name. If it's camel case, it would be like setSomething.
    my $code = $real_obj->can("set_$prop_name") ||
        $real_obj->can("set$prop_name");
    if ($code) {
        $code->($real_obj, $value);
        return $ferret_value;
    }

    # if we have a method $prop_name, it might be a Moose-style setter.
    $code = $real_obj->can($prop_name);
    if ($code) {
        $code->($real_obj, $value);
        return $ferret_value;
    }

    # otherwise, just assign to a hash value.
    if (reftype $real_obj eq 'HASH') {
        $pobj->_get_hash_value($prop_name) = $value;
        return $ferret_value;
    }

    # at this point, the object isn't a hash ref.
    # we can't store anything in it, so store it in the PerlObject.
    return $pobj->SUPER::set_property(@_);

}

sub _has_hash_key {
    my $real_obj = shift->{real_obj};
    return reftype $real_obj eq 'HASH' && exists $real_obj->{ +shift };
}

sub _get_hash_value : lvalue {
    my $real_obj = shift->{real_obj};
    return $real_obj->{ +shift };
}

sub description {
    my $pobj = shift;
    return 'PerlObject("'.$pobj->{class_name}.'")';
}

1
