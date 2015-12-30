# Copyright (c) 2015, Mitchell Cooper
package Ferret::Function;

use warnings;
use strict;
use utf8;
use 5.010;

use parent 'Ferret::Object';
use Scalar::Util 'blessed';

use Ferret::Arguments;
use Ferret::Return;

# creates a new function.
sub new {
    my ($class, $f, %opts) = @_;

    # create a new object.
    my $func = $class->SUPER::new($f,
        priority   => 0,
        signatures => [],
        %opts
    );
    $func->{id} = 'F'.($func + 0);

    # mimic = copy the signature.
    if (my $mimic = delete $func->{mimic}) {
        ref $mimic or return $func;
        $mimic = $mimic->default_func if $mimic->isa('Ferret::Event');
        @$func  {'signature', 'signatures'} =
        @$mimic {'signature', 'signatures'}
            if ref $mimic && $mimic->isa('Ferret::Function');
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

    $func->set_property(signature => sub {
        my $func = $_[1];
        Ferret::String->new($f, str_value => $func->signature_string)
    });

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

# convert a list of arguments into a hash using the signature.
# this does NOT check if the requirements were satisfied.
sub handle_arguments {
    my ($func, @args, %args) = (shift, @{ +shift });
    my @sigs = @{ $func->{signatures} };

    # the last argument may be a hash ref with named arguments.
    my %named_args;
    if (ref $args[$#args] eq 'HASH') {
        %named_args = %{ pop @args };
    }

    while (@sigs) {
        my $sig = shift @sigs;

        # ellipsis
        if ($sig->{more}) {
            $args{ $sig->{name} } = Ferret::List->new($func->f, values => \@args);
            last;
        }

        my $val = shift @args;
        $args{ $sig->{name} } = $val if $val;
    }

    @args{ keys %named_args } = values %named_args;
    return \%args;
}

# check that the requirements are present and of correct types.
sub arguments_satisfy_signature {
    my ($func, $arguments) = @_;
    foreach my $sig (@{ $func->{signatures} }) {

        # if it's an ellipsis, the actual type of the arg must be List.
        my $type = $sig->{more} ? 'List' : $sig->{type};
        next if $sig->{optional} && !length $type;

        # check things.
        my $arg = $arguments->{ $sig->{name} };
        return if !$arg && !$sig->{optional};   # need must be present
        next   if !$arg;                        # want with no value
        next   if !length $type;                # want/need with no type check

        # check that it works.
        next if $arguments->{ $sig->{name} } =
            $func->obj_type_works($arg, $type);

        # TODO: check if ellipsis satisfies type
        #       if not, want will make it an empty list,
        #       and need will unsatisfy the function.

        # bad news.
        return if !$sig->{optional};            # bad type for need
        delete $arguments->{ $sig->{name} };    # bad type for want

    }
    return 1;
}

sub obj_type_works {
    my ($func, $obj, $type) = @_;

    # not blessed - find SOI and type obj.
    if (!blessed $type) {

        # find scope of interest.
        my $soi = $func->{outer_scope} || $func->f->main_context;
        $soi = $soi->closest_context;

        # get object.
        $type = $soi->property($type) or return;

    }

    # if this is a function, use its return value.
    if ($type->isa('Ferret::Function') || $type->isa('Ferret::Event')) {
        return $type->call_u([ $obj ]);
    }

    return $obj if $obj->instance_of($type);
    return;
}

sub signature_string {
    my $func = shift;
    return Ferret::Shared::Utils::signature_to_string($func->{signatures});
}

sub call_with_self {
    my ($func, $self) = (shift, shift);
    $func->{force_self} = $self;
    return $func->call(@_);
}

sub description {
    my $func = shift;
    return "Function" if !length $func->{name};
    return "Function '$$func{name}'";
}

sub call {
    my ($func, $arguments, $call_scope, $return) = @_;

    # list of arguments. must use signature.
    $arguments ||= {};
    if (ref $arguments eq 'ARRAY') {
        $arguments = $func->handle_arguments($arguments);
    }

    # hash ref of arguments.
    return unless $func->arguments_satisfy_signature($arguments);
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

    $return ||= Ferret::Return->new($func->f);

    # find self.
    my $self =
        ( delete $func->{force_self}                          ) ||
        ( $arguments->{_self}                                 ) ||
        ( $func->is_method     ? $func->{last_parent} : undef ) ||
        ( $func->is_class_func ? $func->{class}       : undef ) ;

    # class/instance argument.
    $scope->{special}->set_property(self   => $self) if $self;
    $scope->{special}->set_property(class  => $func->{class})       if $func->{class};
    $scope->{special}->set_property(this   => delete $func->{this}) if $func->{this};
    $scope->{special}->set_property(return => $return);

    # call the function.
    my $ret = $func->{code}(
        $self,
        $arguments,
        $call_scope,
        $scope,
        $return,
        $func
    );

    return $ret // Ferret::undefined;
}

sub inside_scope {
    #
    # $name     =   the name of the function within the containing scope, or undef if anonymous
    # $scope    =   the containing scope of the function definition
    # $owner    =   the owner of the function: a scope, class, or prototype
    # $class    =   the containing class of the function (if any)
    # $is_prop  =   the function is a computed property
    # $p_set    =   the computed property should be set after evaluating
    #
    my ($func, $name, $scope, $owner, $class, $is_prop, $p_set) = @_;
    $func->{class} = $class;
    $func->{outer_scope} = $scope;
    $func->{is_class_func} = 1 if $owner && $owner->isa('Ferret::Class');
    $func->{is_method}     = 1 if $owner && $owner->{is_proto};

    $owner->set_property($name => $is_prop ? sub {
        _handle_property($func, $p_set ? $name : undef, @_);
    } : $func) if defined $name;

    return $func;
}

sub name          { shift->{name}          }
sub has_name      { length shift->{name}   }
sub is_method     { shift->{is_method}     }
sub is_class_func { shift->{is_class_func} }

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
        my ($name, $type) = split /:/, $arg, 2;
        $name =~ s/^\$//;

        push @args, {
            name => $name,
            type => $type,
            more => $more
        };
    }
    return @args;
}

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

1
