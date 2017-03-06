# Copyright (c) 2015, Mitchell Cooper
package Ferret::Function;

use warnings;
use strict;
use utf8;
use 5.010;

use parent 'Ferret::Object';
use Scalar::Util qw(blessed weaken);
use Ferret::Core::Conversion qw(plist pstring flist ferror FUNC_RET);
use Ferret::Shared::Utils qw(signature_to_string detailed_signature_to_string);
use Ferret::Arguments;
use Ferret::Return;

Ferret::bind_class(
    name => 'Function',
    init => sub {
        my $ret = $_[FUNC_RET];
        my $err = ferror(
            'Functions cannot be created with the Function class constructor; '.
            'use the func keyword instead',
            'InvalidInitialization'
        );
        return $ret->fail($err);
    },
    alias => 'Func',
    # this relates to the class called Function.
    # it emulates a real class, but it's not truly such.
    #
    # explicitly setting the proto and proto class allows
    # functions such as say.*isa(Function) to behave as expected.
    #
    on_bind => sub {
        my $class = shift;
        my $proto = _global_function_prototype($class->f);
        $class->set_property_weak(proto => $proto);
        weaken($proto->{proto_class} = $class);
    }
);

# creates a new function.
sub new {
    my ($class, $f, %opts) = @_;

    # create a new object.
    my $func = $class->SUPER::new($f,
        priority   => 0,
        signatures => [],
        returns    => [],
        %opts
    );

    $func->{code} ||= state $dummy_code = sub { return $_[FUNC_RET] };
    $func->{id} = 'F'.($func + 0);

    # make the function inherit from the global function prototype.
    $func->add_parent(_global_function_prototype($f));

    # mimic = copy the signature.
    if (my $mimic = delete $func->{mimic}) {
        ref $mimic or return $func;
        $mimic = $mimic->default_func if $mimic->isa('Ferret::Event');
        @$func  {'signature', 'signatures'} =
        @$mimic {'signature', 'signatures'}
            if ref $mimic && $mimic->isa('Ferret::Function');
    }

    # all_opt = if true, convert the signature to all optional
    if (delete $func->{all_opt}) {
        $_->{optional} = 1 for @{ $func->{signatures} };
    }

    # add needs from string.
    if (my $need = delete $func->{need}) {
        $func->add_argument(
            %$_
        ) foreach _parse_method_args($need);
    }

    # add wants from string.
    if (my $want = delete $func->{want}) {
        $func->add_argument(
            %$_,
            optional => 1
        ) foreach _parse_method_args($want);
    }

    # add returns from string.
    if (my $rtrn = delete $func->{rtrn}) {
        $func->add_argument(
            %$_
        ) foreach _parse_method_args($rtrn);
    }

    $func->set_property(name => [ sub {
        my $func = $_[1];
        Ferret::String->new($f, str_value => $func->{name})
    } ]);

    $func->set_property(id => [ sub {
        my $func = $_[1];
        Ferret::String->new($f, str_value => $func->{id})
    } ]);

    return $func;
}

############################
### CALLING THE FUNCTION ###
############################

sub call_with_self {
    my ($func, $self) = (shift, shift);
    $func->{force_self} = $self;
    return $func->call(@_);
}

sub call {
    my ($func, $arguments, $call_scope, $return, $pos, $detail) = @_;
    my $is_event = delete $func->{force_is_event};

    # a list of arguments was provided. must use signature to convert.
    $arguments ||= {};
    if (ref $arguments eq 'ARRAY') {
        $arguments = $func->_handle_arguments($arguments);
    }

    # find self.
    my $class = $func->{class};
    my $self  =
        ( delete $func->{force_self}                          ) ||
        ( $arguments->{_self}                                 ) ||
        ( $func->is_method     ? $func->{last_parent} : undef ) ||
        ( $func->is_class_func ? $class               : undef ) ;
    my $this = $arguments->{_this} || delete $func->{this};
    my $ins  = $arguments->{_}     || delete $func->{ins};

    # handle the generics.
    # we have to do this before dynamic type checking.
    my $generics = $class && $class->{force_generics} ?
        delete $class->{force_generics}               :
        $class ? $self->{generics}{$class} : undef;

    # create the return object.
    if ($return && blessed $return && !$return->isa('Ferret::Return')) {
        undef $return;
        warn '$return is not a return object';
    }
    $return ||= Ferret::Return->new($func->f);

    # hash ref of arguments. check if matches signature.
    $arguments = { %$arguments }; # copy since this is shared with all callbacks
    if (!$func->_arguments_satisfy_signature($arguments, $generics)) {
        my $error = ferror(
            "Unsatisfied argument '$$func{last_unsatisfied}'",
            'UnsatisfiedArguments'
        );

        # call ->error_continue. in events, the propagation continues.
        # however, if ALL functions are unsuccessful, it will ->fail later.
        if ($is_event) {
            $return->error_continue($error, $pos);
            return $return->return;
        }

        # for non-events, just ->fail now.
        return $return->fail($error, $pos);
    }

    bless $arguments, 'Ferret::Arguments';

    # at this point, invalid wants have been deleted.
    # if this function has an ellipsis variable, that deleted
    # argument's value must be replaced with an empty list.
    if (my $elp = $func->{hungry}) {
        $arguments->{$elp} ||= Ferret::List->new($func->f);
    }

    # create a scope which inherits from the outer scope.
    #
    # $call_scope   = the scope where the function was called
    # $scope        = the scope within the function
    # outer_scope   = the scope outside of the function definition
    #
    my $scope = Ferret::Scope->new($func->f,
        parent => $func->{outer_scope}
    );

    # increment the number of callbacks actually called.
    $return->inc if $return->isa('Ferret::Return');

    # class/instance argument.
    $scope->{special}->set_property(self   => $self)                if $self;
    $scope->{special}->set_property(class  => $class)               if $class;
    $scope->{special}->set_property(this   => $this)                if $this;
    $scope->{special}->set_property(return => $return);

    # add any possible generics.
    if ($generics) {
        $scope->set_property($_ => $generics->{$_})
            foreach keys %$generics;
    }

    # call the function.
    # if the order of the arguments is changed, update FUNC_V* in Conversion.pm
    # and maybe also args_v* in FF.pm.
    my $ret = $func->{code}(
        $self,                  # FUNC_SELF
        $arguments,             # FUNC_ARGS
        $call_scope,            # FUNC_CSCOPE
        $scope,                 # FUNC_SCOPE
        $return,                # FUNC_RET
        $func,                  # FUNC_FUNC
        $this,                  # FUNC_THIS
        $ins                    # FUNC_INS
    );

    $return->detail if $detail;
    return $return->return($ret);
}

#########################
### ARGUMENT HANDLING ###
#########################

# add an argument to the signature.
sub add_argument {
    my ($func, %opts) = @_;

    # possible options:
    #
    #   name        the name of the argument (required)
    #   type        the type, which should be a Perl string
    #   optional    true if it's a want, not a need
    #   more        true if the argument consumes multiple values; i.e. ellipsis
    #
    foreach (qw(name type more)) {
        delete $opts{$_} if !length $opts{$_};
    }

    # for optimization, remember if the function has an ellipsis.
    $func->{hungry} ||= $opts{name} if $opts{more};

    $func->{signature}{ $opts{name} } = \%opts;
    push @{ $func->{signatures} }, \%opts;
}

# add an argument to the return signature.
sub add_return {
    my ($func, %opts) = @_;

    # possible options:
    #
    #   name        the name of the argument (required)
    #   type        the type, which should be a Perl string
    #
    foreach (qw(name type)) {
        delete $opts{$_} if !length $opts{$_};
    }

    $func->{return}{ $opts{name} } = \%opts;
    push @{ $func->{returns} }, \%opts;
}

# convert a list of arguments into a hash using the signature.
# this does NOT check if the requirements were satisfied.
sub _handle_arguments {
    my ($func, @args, %args) = (shift, @{ +shift });
    my @sigs = @{ $func->{signatures} };

    # the last argument may be a array ref with named arguments.
    my %named_args;
    if (ref $args[$#args] eq 'ARRAY') {

        # pop the named arg list of the back.
        # shift a potential undef (signifying no unnamed arguments).
        my @named_args_list = @{ pop @args };
        shift @args if !defined $args[$#args];

        # stringify all the keys
        while (my ($key, $value) = splice @named_args_list, 0, 2) {
            $named_args{ pstring($key) } = $value;
        }
    }

    # for each element in the signature, map unnamed arguments to their names
    while (my $sig = shift @sigs) {

        # ellipsis
        if ($sig->{more}) {
            $args{ $sig->{name} } = flist(@args);
            last;
        }

        my $val = shift @args;
        $args{ $sig->{name} } = $val if $val;
    }

    @args{ keys %named_args } = values %named_args;
    return \%args;
}

# check that the requirements are present and of correct types.
sub _arguments_satisfy_signature {
    my ($func, $arguments, $generics_maybe) = @_;
    foreach my $sig (@{ $func->{signatures} }) {
        my ($name, $types) = @$sig{ qw(name type) };

        next if $sig->{optional} && !length $types;
        $func->{last_unsatisfied} = $sig->{name};

        # check things.
        my $arg = $arguments->{ $name };
        return if !$arg && !$sig->{optional};   # need must be present
        next   if !$arg;                        # want with no value
        next   if !length $types;               # want/need with no type check

        # if this is an ellipsis, check all of the items.
        if ($sig->{more}) {
            my @plist = plist($arguments->{$name});

            # weed out things of improper type.
            # use map such that transformations will apply to every arg.
            @plist = grep $_,
                map $func->_obj_type_works($_, $types, $generics_maybe), @plist;

            # if there is at least one thing left, we're good.
            # otherwise, we might have to fail below if it wasn't optional.
            $arguments->{$name} = flist(@plist);
            next if @plist;

        }

        # check that it works.
        else {
            next if $arguments->{$name} =
                $func->_obj_type_works($arg, $types, $generics_maybe);
        }

        # bad news.
        return if !$sig->{optional};   # bad type for need
        delete $arguments->{$name};    # bad type for want

    }
    return 1;
}

sub _types_satisfy_requirements {
    my ($func, $arguments, $key) = @_;
    $arguments = { @$arguments } if ref $arguments eq 'ARRAY';

    # check each item in the signature.
    foreach my $sig (@{ $func->{$key} }) {
        my ($name, $types) = @$sig{ qw(name type) };

        # remove the type from the provided list from the interface.
        my $type_name = delete $arguments->{$name};

        # find the type object associated with the type in the interface.
        my ($type_obj) = $func->_get_types($type_name);
        return if !$type_obj;

        # no type requirement in the function.
        next if !length $types;

        # check if the types are compatible.
        next if $func->_type_type_works($type_obj, $types);

        return;
    }

    # there can't be anything left. that means the signature does not
    # include one of the arguments in the interface.
    return if keys %$arguments;

    return 1;
}

sub _get_types {
    my ($func, $t, $generics_maybe) = @_;

    # already an object type.
    return $t if blessed $t;

    my %generics = $generics_maybe ? %$generics_maybe : ();
    my @final;

    # find scope of interest.
    my $soi = $func->{outer_scope} || $func->f->main_context;

    # FIXME: we used to use the nearest context to the outer scope of the
    # function, but now we use the outer scope itself. this is because
    # class-level declarations are associated with the class, not the context.
    # since you can store contexts in classes now, maybe classes themselves
    # should inherit from Context...

    # $soi = $soi->closest_context_or_class;

    # either a single type or a list of types.
    foreach my $type (ref $t eq 'ARRAY' ? @$t : ($t)) {

        # undefined.
        if ($type eq 'undefined') {
            push @final, Ferret::undefined;
            next;
        }

        # already an object.
        if (blessed $type) {
            push @final, $type;
            next;
        }

        # get object.
        my $found = $generics{$type} || $soi->property($type);
        push @final, $found if $found;
    }

    return @final;
}

sub _obj_type_works {
    my ($func, $obj, $types, $generics_maybe) = @_;
    foreach my $type ($func->_get_types($types, $generics_maybe)) {
        my $worked = $obj->fits_type($type);
        return $worked if $worked;
    }
    return;
}

sub _type_type_works {
    my ($func, $type_obj, $types, $generics_maybe) = @_;
    return 1 if $type_obj->{name} eq 'Any'; # HACK
    foreach my $type ($func->_get_types($types, $generics_maybe)) {
        return 1 if $type_obj == $type;
    }
    return;
}

sub _parse_method_args {
    my ($str, @args) = shift;
    return if not defined $str;
    foreach my $arg (split /\s+/, $str) {
        my $more;

        # ellipsis
        my $last_three = \substr($arg, -3);
        if ($$last_three eq '...') {
            $$last_three = '';
            $more = 1;
        }

        # split $name:type
        my ($name, $types) = split /:/, $arg, 2;
        $name =~ s/^\$//;

        # split types.
        my @types = split m/\|/, $types if length $types;

        push @args, {
            name => $name,
            type => @types > 1 ? \@types : $types[0],
            more => $more
        };
    }
    return @args;
}

###################################
### LEXICAL ENVIRONMENT (SCOPE) ###
###################################

sub inside_scope {
    #
    # $name     =   the name of the function within the containing scope.
    #               it can be undef for a nameless anonymous function.
    #
    # $scope    =   the containing scope of the function definition.
    #               always available.
    #
    # $owner    =   the owner of the function: a scope, class, or prototype.
    #               for anonymous functions, this is undef.
    #
    # $class    =   the containing class of the function (if any)
    #               it is available for all functions and methods within a class
    #               construct, even if they are private, etc.
    #
    # $ins      =   the $ins in the scope where the function is defined
    #
    # $is_prop  =   the function is a computed property.
    #               only makes sense if this is a method.
    #
    # $p_set    =   the computed property should be set after evaluating
    #               only makes sense with $is_prop.
    #
    my ($func, $name, $scope, $owner, $class, $ins, $is_prop, $p_set) =
        (shift, @_);

    $func->{class}         = $class;
    $func->{outer_scope}   = $scope;
    $func->{is_class_func} = 1 if $owner && $owner->isa('Ferret::Class');
    $func->{is_method}     = 1 if $owner && $owner->isa('Ferret::Prototype');
    $func->{ins}           = $ins;

    weaken($func->{class}) if $func->{class};
    weaken($func->{ins})   if $func->{ins};

    my $event;

    # FIXME: haven't considered what to do if $owner->own_property($name)
    # is something other than an Event

    # we've already added to an event.
    if ($func->{added_to}) {
        $event = $func->{added_to};
    }

    # add it to the event. create the event if needed.
    elsif ($func->{pending_add}) {
        $event = $owner->own_property($name) || do {
            Ferret::Event->new($func->f, name => $name);
        };
        $event->add_function(undef, $func);
        weaken($func->{added_to} = $event);
        delete $func->{pending_add};
    }

    return $event->inside_scope(@_) if $event;

    # set the property on the func or event.
    $owner->set_property($name => $is_prop ? sub {
        _handle_property($func, $p_set ? $name : undef, @_);
    } : $func) if defined $name;
    $owner->set_underlying_property_code($name => $func)
        if defined $name && $is_prop;

    return $func;
}

# helper function for computed properties.
# also called directly from Event.pm with $_[0] an event.
sub _handle_property {
    my ($func_or_event, $p_set, $borrow_obj) = @_;

    # if the object is not an instance of the class,
    # simply return the getter itself.
    my $class = $func_or_event->{class};
    if (!$class || !$borrow_obj->instance_of($class)) {
        return $func_or_event;
    }

    # otherwise, set the last_parent (self) to the borrow object and call.
    $func_or_event->{last_parent} = $borrow_obj;
    my $res = $func_or_event->call;

    # if setting the property, do so.
    $borrow_obj->set_property($p_set => $res) if $p_set;

    # return both the call result and the function itself.
    return [ $res, $func_or_event ];
}

#####################
### MISCELLANEOUS ###
#####################

sub signature_string {
    my $func = shift;
    return $func->{sig_str} //= signature_to_string($func->{signatures});
}

sub detailed_signature_string {
    my $func = shift;
    return $func->{detailed_sig_str} //= detailed_signature_to_string(
        $func->{signatures},
        $func->{returns}
    );
}

# fetch the global ferret prototype from which all functions inherit.
sub _global_function_prototype {
    my $f = shift;
    return $f->{function_proto} ||= do {
        my $proto = Ferret::Prototype->new($f, proto_name => 'Function');
        $proto->set_property(signature => sub {
            my ($func) = @_;
            Ferret::String->new($f, str_value => $func->signature_string)
        });
        $proto->set_property(detailedSignature => sub {
            my ($func) = @_;
            Ferret::String->new($f, str_value =>
                $func->detailed_signature_string
            )
        });
        $proto;
    };
}

sub description {
    my $func = shift;
    my $sig  = $func->detailed_signature_string;
    my $type = $func->{is_typedef} ? 'Interface' : 'Function';
    $type   .= " '$$func{name}'" if length $func->{name};
    $type   .= " { $sig }"       if length $sig;
    return $type;
}

sub name          { shift->{name}          }
sub has_name      { length shift->{name}   }
sub is_method     { shift->{is_method}     }
sub is_class_func { shift->{is_class_func} }

1
