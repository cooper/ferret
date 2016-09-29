# Copyright (c) 2015, Mitchell Cooper
package Ferret::Core::Conversion;

use warnings;
use strict;
use utf8;
use 5.010;

use Ferret::Core::Errors qw(throw);
use Types::Serialiser;
use Scalar::Util qw(blessed weaken looks_like_number);
use List::Util qw(any);

our $po;

# special import to handle underscore prefix
sub import {
    my $this_package = shift;
    my $package = caller;
    foreach (@_) {
        my ($left, $right) = ($_) x 2;
        my $f = \substr($right, 0, 1);
        $$f = '' if $$f eq '_';
        no strict 'refs';
        *{ "${package}::$left" } = *{ "${this_package}::$right" }
    }
}

###############
### STRINGS ###
###############

# return a ferret string object.
sub fstring {
    my $val = shift;
    my $f = $Ferret::ferret;

    # not blessed.
    if (!blessed $val) {
        return Ferret::String->new($f, str_value => "$val");
    }

    # already a blessed string.
    if ($val->isa('Ferret::String')) {
        return $val;
    }

    if ($val->isa('Ferret::Object')) {

        # it's an object with a string converter.
        if (my $to_str = $val->property('toString')) {
            return $to_str->call;
        }

        # maybe an unblessed string object.
        if (defined $val->{str_value}) {
            return $val;
        }

        # it's an object with a description converter.
        if ($val->can('description')) {
            return fstring($val->description);
        }
        if (my $to_desc = $val->property('description')) {
            return $to_desc->call;
        }

    }

    return "$val";
}

# return a perl string value.
sub pstring {
    my $val = shift;
    return ''   if !defined $val;
    return $val if !blessed $val;
    return fstring($val)->{str_value} // '';
}

# return a perl object description.
sub pdescription {
    my ($val, $own_only, $compute) = @_;
    return $val->description($own_only, $compute) if $val->can('description');
}

###############
### NUMBERS ###
###############

# return a ferret number object.
sub fnumber {
    my $val = shift;
    my $f = $Ferret::ferret;

    # not blessed.
    if (!blessed $val) {
        $val = 0 if !looks_like_number($val);
        return Ferret::Number->new($f, num_value => $val);
    }

    # already a blessed number.
    if ($val->isa('Ferret::Number')) {
        return $val;
    }

    if ($val->isa('Ferret::Object')) {

        # maybe an unblessed number object.
        if (defined $val->{num_value}) {
            return $val;
        }

        # it's an object with a number converter.
        if (my $to_num = $val->property('toNumber')) {
            return $to_num->call;
        }

        # it's an object with no number value.
        return Ferret::Number->new($f, num_value => 'nan');

    }

    # it's another Perl object. maybe it's overloaded?
    return Ferret::Number->new($f, num_value => $val)
        if looks_like_number("$val");

    return Ferret::Number->new($f, num_value => 'nan');
}

# return a perl string value.
sub pnumber {
    my $val = shift;

    # it's either a non-blessed number or an overloaded blessed number.
    return $val if looks_like_number("$val");

    # it's probably some Ferret object.
    return fnumber($val)->{num_value} // 0;

}

#############
### REGEX ###
#############

sub fregex {

}

sub pregex {
    my $rgx = shift;
    return $rgx if !blessed $rgx;
    return $rgx->{rgx_value}; # FIXME: fregex($rgx)->{rgx_value}
}

################
### BOOLEANS ###
################

sub fbool {
    my $val = shift;
    return $val if blessed $val && defined $val->{bool_value};
    return Ferret::false if blessed $val && Ferret::undefined($val);
    my $truth = !!$val;
    return $truth ? Ferret::true : Ferret::false;
}

sub pbool {
    return Ferret::truth(@_);
}

###############
### SYMBOLS ###
###############

sub fsym {
    my $name = shift;
    return FF::get_symbol($Ferret::ferret, $name);
}

sub psym {
    my $val = shift;
    return $val->{sym_value} if blessed $val && defined $val->{sym_value};
    return pstring(fstring($val));
}

##############
### ARRAYS ###
##############

sub flist         { _flist(undef, @_) }
sub flist_fromref { _flist(1,     @_) }

# return a ferret list object.
# if @vals are not ferret objects, they will be ferretized.
sub _flist {
    my $allow_ref = shift; # convert single array ref to list
    my @vals = @_;

    # already an object, probably a list.
    if ($allow_ref && @vals == 1 && blessed $vals[0] && $vals[0]{list_items}) {
        return $vals[0];
    }

    # array ref.
    if ($allow_ref && @vals == 1 && ref $vals[0] eq 'ARRAY') {
        @vals = @{ $vals[0] };
    }

    @vals = map ferretize($_, $po), @vals;
    return Ferret::List->new($Ferret::ferret, values => \@vals);
}

# returns a Ferret list which updates a Perl array reference.
sub flist_wrap {
    my $ref = shift;
    return if ref $ref ne 'ARRAY';
    return Ferret::List->new($Ferret::ferret, ref_values => $ref);
}

sub plist {
    return @{ &plistref };
}

sub plistref {
    my ($list, $recursive) = @_;
    my $r = sub {
        my @items = @_;
        return $recursive                   ?
            [ map perlize($_, 1), @items ]  :
            \@items;
    };
    return $r->(@{ $list->{all_objs} })
        if blessed $list && $list->isa('Ferret::Set');
    return [ ]
        if !blessed $list || !$list->isa('Ferret::List');
    return $r->(@{ $list->{list_items} || [] }); # make a copy
}

##############
### HASHES ###
##############

sub fhash {
    my @keys_vals = @_;
    my %input;

    if (@keys_vals % 2) {
        my $hashref = shift @keys_vals;
        return unless ref $hashref eq 'HASH';
        %input = %$hashref;
    }
    else {
         %input = @keys_vals;
    }

    my %output = map { $_ => ferretize($input{$_}, $po) } keys %input;
    return Ferret::Hash->new($Ferret::ferret, pairs => \%output);
}

# $recursive indicates whether to perlize values.
sub phashref {
    my ($hash, $recursive) = @_;

    # can't do anything with this.
    return { } if !blessed $hash || !$hash->{hash_values};

    my %hash;
    foreach my $key (keys %{ $hash->{hash_values} }) {
        my $value = $hash->{hash_values}{$key};
        $hash{$key} = $recursive ? perlize($value) : $value;
    }

    return \%hash;
}

############
### SETS ###
############

sub fset {
    my (@objs) = @_;

    # find global set class.
    my $f = $Ferret::ferret;
    my $set_class = $f->get_class($f->main_context, 'Set');

    # create set.
    my $class = shift @objs if $objs[0]->isa('Ferret::Class');
    my $set = $set_class->call([ @objs ]);
    $set->{set_class} = $class if $class;

    return $set;
}

##############
### ERRORS ###
##############

sub ferror {
    my ($err, $type, @hints) = @_;
    my $f = $Ferret::ferret;

    # already an error object.
    if (blessed $err && $err->isa('Ferret::Error')) {
        $type = 'NativeCodeError' if !$type && !$err->has_property('type');
        $err->set_property(type => fsym($type)) if $type;
        return $err;
    }

    # FIXME: this is temporary until we have a decent way to show hints
    require Data::Dumper;
    $Data::Dumper::Maxdepth = 1;

    # create a new error.
    my $error_class = $f->get_class($f->main_context, 'Error');
    return $error_class->call({
        type  => fsym($type || 'NativeCodeError'),
        msg   => fstring($err.' '.Data::Dumper::Dumper(\@hints)),
        hints => ferretize(\@hints)
    });

}

###########################
### FUNCTIONS & METHODS ###
###########################

# returns a Ferret function with the provided wants and needs, if any.
sub ffunction {
    my ($code, $name, $need, $want) = @_;
    return unless ref $code eq 'CODE';
    return Ferret::Function->new($Ferret::ferret,
        code => $code,
        name => $name,
        need => $need,
        want => $want
    );
}

# creates a Ferret function from a Perl code.
# it is smarter than ffunction() in that it attempts to automatically convert
# Ferret named arguments into Perl list/pair arguments.
#
# additionally, the call is wrapped with eval{}, and failure will not die
# but rather raise a runtime exception.
#
# if $real_obj is provided, it must be a NATIVE::PerlObject, and the code is
# assumed to be a method on that object.
#
# $ret_ctx indicates in what context the function should be called. Perl
# functions often yield different results from void, scalar, and list context.
# valid values: 'void', 'scalar', 'list' with 'scalar' the default.
#
sub ffunction_smart {
    my ($code, $name, $real_obj, $ret_ctx) = @_;
    my $needs_obj = defined $real_obj;
    my $f = $Ferret::ferret;

    # to prevent a cylical reference, use a weak var within the CODE.
    weaken(my $weak_obj = $real_obj) if $real_obj;

    # if we have a real obj, use fmethod().
    my $creator = $needs_obj            ?
        __PACKAGE__->can("fmethod")     :
        __PACKAGE__->can("ffunction");

    return $creator->(sub {
        my (undef, $args) = @_;

        # if it's supposed to be a method and $weak_obj is gone,
        # it has been disposed of.
        return if $needs_obj && !$weak_obj;

        # handle the other args. add the object if it's a method.
        my @args = pargs($args);
        unshift @args, $weak_obj if $needs_obj;

        my $ret;
        $ret_ctx ||= 'scalar';

        # call the Perl function in list context.
        if ($ret_ctx eq 'list') {
            my @ret = eval { $code->(@args) };
            $ret = \@ret if @ret;
        }

        # call the Perl function in void context.
        elsif ($ret_ctx eq 'void') {
            eval { $code->(@args) };
            $ret = Ferret::undefined if !$@;
        }

        # call the Perl function in scalar context.
        else {
            $ret = eval { $code->(@args) };
        }

        # an error occurred.
        if (!defined $ret && $@) {
            throw(NativeCodeError => [caller], [
                Name     => $name || 'unknown function'
            ], $@);
            return;
        }

        # ferretize the return value.
        return ferretize($ret, 1);

    }, $name, undef, '$args...');
}

# handles argument object as a list, key:value pairs, or a mixture.
# returns a single list for passing to a Perl function.
sub pargs {
    my $args = shift;

    # if there is $args, the arguments were passed as a list.
    my @args = map perlize($_, 1), $args->plist('args');
    delete $args->{args};

    # all other arguments are key => value.
    my %args = map { $_ => perlize($args->{$_}, 1) } keys %$args;

    return (@args, %args);
}

# same as ffunction(), except it marks it as a method.
sub fmethod {
    my $func = &ffunction;
    $func->{is_method} = 1;
    return $func;
}

# converts a Ferret function to a Perl CODE.
sub pfunction {
    my $func_or_event = shift;
    return sub { $func_or_event->call_u([ @_ ]) };
}

# smarter than pfunction() in that it converts the return value to a Perl one.
sub pfunction_smart {
    my $func_or_event = shift;
    return sub {
        my $ret = $func_or_event->call_u([ @_ ]);
        return perlize($ret);
    };
}

#############################
### BEST-GUESS CONVERSION ###
#############################

sub ferretize {
    my $ret = &_ferretize;
    undef $po;
    return $ret;
}

sub _ferretize {
    my ($val, $create_perlobject) = @_;
    $po = $create_perlobject;

    # undefined value.
    return Ferret::undefined if !defined $val;

    # it's already a Ferret object.
    return $val if blessed $val && $val->isa('Ferret::Object');

    # it's a boolean.
    if (Types::Serialiser::is_bool($val)) {
        return Ferret::true if $val;
        return Ferret::false;
    }

    # if it's blessed and we're allowing PerlObjects, use that.
    if (blessed $val && $create_perlobject) {
        return Ferret::Native::PerlObject::_wrap($Ferret::ferret, $val);
    }

    # it's an array. convert to a list.
    return flist_fromref($val) if ref $val eq 'ARRAY';

    # it's a hash.
    return fhash(%$val) if ref $val eq 'HASH';

    # it's a CODE. convert to a function which handles Perl arguments.
    return ffunction_smart($val) if ref $val eq 'CODE';

    # it appears to be a number.
    return fnumber($val) if looks_like_number($val);

    # fall back to string.
    return fstring($val);

}

# for lists and hashes, references are returned.
sub perlize {
    my ($val, $r) = @_;

    # not a Ferret object, so leave it as-is.
    return $val if !blessed $val || !$val->isa('Ferret::Object');

    # it's the constant true. return something like 1.
    return Types::Serialiser::true if $val == Ferret::true;

    # it's the constant false. return something like 0.
    return Types::Serialiser::false if $val == Ferret::false;

    # it's a list. return an arrayref.
    return plistref($val, $r) if $val->{list_items};

    # it's a hash. return a hashref.
    return phashref($val, $r) if $val->{hash_values};

    # it's a symbol. return its string value, without the prefix.
    return psym($val) if defined $val->{sym_value};

    # it has a numeric value. return that.
    return pnumber($val) if defined $val->{num_value};

    # it is a function. return a CODE reference which perlizes its return.
    return pfunction_smart($val)
        if $val->isa('Ferret::Function') || $val->isa('Ferret::Event');

    # fall back to string.
    return pstring($val);

}

1
