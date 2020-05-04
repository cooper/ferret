# Copyright 2015, Mitchell Cooper
package F::Function;

use warnings;
use strict;
use 5.010;

use parent qw(F::Node);
use Scalar::Util qw(weaken);
use Ferret::Shared::Utils qw(
    dot_trim signature_to_string detailed_signature_to_string
);

sub anonymous       { shift->{anonymous}    }
sub body            { shift->first_child    }
sub is_method       { shift->{is_method}    }
sub is_Expression   { shift->anonymous      }

sub new {
    my ($class, %opts) = @_;
    my $func = $class->SUPER::new(%opts);
    $func->adopt(F::new('FunctionBody')) unless $opts{no_body};
    return $func;
}

sub desc {
    my $func = shift;
    my $sig  = $func->detailed_signature_string;
    my $desc = $func->desc_type;
    $desc .= " { $sig }" if length $sig;
    return $desc;
}

sub desc_type {
    my $func = shift;
    if ($func->is_method) {
        my $method = $func;
        return "operator ($$method{operator})" if $method->{operator};
        my $main = $method->{main}    ? 'class ' : '';
        my $type = $method->{is_prop} ? ($method->body ? 'computed ' : '').'property' : 'method';
        my $lazy = $method->{p_set}   ? ' (lazy)' : '';
        return "$main$type '$$method{name}'$lazy";
    }
    return 'anonymous function' if $func->anonymous;
    return "function '$$func{name}'";
}

# all WantNeeds which belong to this function
sub arguments {
    my $func = shift;

    # find all the WantNeed descendants.
    my @wn = $func->filter_descendants(type => 'WantNeed');

    # filter out the ones which belong to me.
    @wn = grep {
        my $f = $_->first_self_or_parent('Function');
        $func == $f;
    } @wn;

    return @wn;
}

# all Returns and ReturnPairs which belong to this function
sub returns {
    my $func = shift;

    # find all the Return descendants.
    my @r = $func->filter_descendants(type => 'Return ReturnPair');

    # filter out the ones which belong to me.
    @r = grep {
        my $f = $_->first_self_or_parent('Function');
        $func == $f;
    } @r;

    return @r;
}

sub signature {
    my @args = map {
        my $a = {
            name => $_->variable->{var_name},
            type => join('|', $_->var_types),
            more => $_->{ellipsis},
            optional => $_->{arg_type} eq 'want'
        };
        $a
    } shift->arguments;
    return \@args;
}

sub return_signature {
    my @args = map {
        my $a = {
            name => $_->key,
            type => $_->type_string
        };
        $a
    } shift->returns;
    return \@args;
}

sub signature_string { signature_to_string(shift->signature) }
sub detailed_signature_string {
    my $func = shift;
    detailed_signature_to_string($func->signature, $func->return_signature);
}

# find the owner of the function or method.
sub owner {
    my $func = shift;
    if ($func->is_method) {
        my ($method, $owner_str, $owner) = $func;
        my $class = $method->class;

        # the method is public if its name does not start with _
        $method->{public} =
        my $public = $method->{name} && substr($method->{name}, 0, 1) ne '_';

        # if this is a main method, the owner is the usually the class.
        # if it's private though, the owner is the private class scope.
        if ($method->{main}) {
            $owner_str = $public ? '$class' : '$scope';
            $owner     = $class;
        }

        # if it's a normal method, the owner is the prototype.
        else {
            $owner_str = '$proto';
            $owner     = "$class._PROTO_"; # no element
        }

        return ($owner, $owner_str);
    }

    # anonymous functions are owned by no one.
    return (undef, 'undef') if $func->anonymous;

    # document-level functions are public unless they start with _.
    my $public_ctx = $func->parent->type eq 'Document';
    undef $public_ctx if $func->{name} && substr($func->{name}, 0, 1) eq '_';
    $func->{public} = $public_ctx;

    # the owner is the context if it's public.
    return ($func->parent, '$context') if $public_ctx;

    # otherwise it's the private file scope.
    return ($func->first_upper_scope, '$scope');
}

# ->owner determines whether the function is public.
sub public {
    my $f = shift;
    return if $f->anonymous;
    $f->owner;
    return $f->{public};
}

# true if the method is the class initializer.
sub is_init {
    my $method = shift;
    return if !$method->is_method;
    return $method->{main} && $method->{name} eq 'initializer__';
}

# on close, we might also terminate an On.
sub close : method {
    my $func = shift;

    # this may be a fake function inside an On block
    if ($func->{parent}->type eq 'On') {
        return $func->SUPER::close->close;
    }

    # computed properties can't have wants or needs
    delete $func->{is_prop}
        if $func->arguments;

    return $func->SUPER::close(@_);
}

sub perl_fmt {
    my $func = shift;
    my $body = $func->body;
    my ($content, @arguments) = $body->body_fmt_do if $body;

    # find a class maybe. this will always be set for methods.
    # for functions, this is for private class-level functions.
    my $class = $func->class;

    # we might need to set $ins within the function.
    my $need_topic;
    if ($body) {
        my $vp = scalar $body->filter_descendants(type => 'PropertyVariable');
        $need_topic = $vp && $func->anonymous && !$func->arguments;
    }

    # return types.
    my @returns = map "{ name => '$_', type => '$$func{returns}{$_}{type}' }",
        grep $func->{returns}{$_}{type} ne '(none)',
        keys %{ $func->{returns} || {} };

    my $arg_str = join(', ', @arguments);
    my $ret_str = join(', ', @returns);

    my ($func_name, $quoted_name);
    if (length $func->{name}) {
        $func_name   = $func->{name};
        $quoted_name = "'$func_name'";
        $func_name   = $quoted_name if $func_name =~ m/\W/;
    }
    else {
        $func_name = $quoted_name = '(undef)';
    }

    my $info = {
        has_body    => !!$body,
        need_topic  => $need_topic,
        anonymous   => $func->{anonymous},
        event_cb    => $func->{event_cb},
        owner       => $func->owner_str,
        id          => $func->document->{function_cid}++,
        name        => $func_name,
        quoted_name => $quoted_name,
        cb_name     => length $func->{cb_name} ? "'$$func{cb_name}'" : 'undef',
        class       => $class ? '$class' : 'undef',
        semi        => $func->{anonymous} ? ''        : ';', # probably temporary hack
        is_prop     => $func->{is_prop}   ? '1'       : 'undef',
        p_set       => $func->{p_set}     ? '1'       : 'undef',
        statements  => $content,
        arguments   => length $arg_str ? "[ $arg_str ]" : 'undef',
        returns     => length $ret_str ? "[ $ret_str ]" : 'undef'
    };

    # these things depend on whether it's a function or method.
    my ($def, $fmt, $con);
    if ($func->is_method) {
        $con = $class;
        $def = 'method_defs';
        $fmt = 'method';
    }
    else {
        $con = $func->document;
        $def = 'function_defs';
        $fmt = 'function';
    }

    # add the function or method definition.
    push @{ $con->{$def} }, $info;

    return $fmt => {
        %$info,
        name => $info->{anonymous} ? '(undef)' : $info->{name}
    };
}

sub markdown_fmt {
    my $method = shift;
    my $doc = $method->document;
    
    # create heading.
    my $head = $method->get_markdown_heading(
        $method->is_init                ?
        'Initializer'                   :
        $method->{operator_p}           ?
        ucfirst $method->{operator_p}   :
        $method->{name}
    );

    # arguments string (signature).
    my $signature = $method->signature;
    $signature = Ferret::Shared::Utils::signature_need_only($signature);
    $signature = Ferret::Shared::Utils::signature_to_string($signature, 1);

    # show class name or instance variable?
    my ($class_name, $instn_name, $owner_name);
    if ($method->class) {
        $class_name = $method->class->{name};
        $instn_name = '$'.($doc->{doc_opts}{instanceName} // lc($class_name));
        $owner_name = $method->{main} ? $class_name : $instn_name;
    }
    else {
        $owner_name = $method->document->{package};
    }
    
    my $example =

        # operator
        $method->{operator}                             ?
        "$instn_name $$method{operator} ($signature)"   :

        # property
        $method->{is_prop}                              ?
        $owner_name.'.'.$method->{name}                 :

        # initializer
        $method->is_init                                ?
        "$instn_name = $class_name($signature)"         :

        # normal method
        "$owner_name.$$method{name}($signature)"        ;

    # handle arguments.
    my $arguments = '';
    my @args = $method->arguments;
    if (@args && !$method->{operator}) {
        foreach my $arg (@args) {
            $arguments .= $arg->markdown_fmt_do."\n";
        }
    }

    # handle comments.
    my $comment = $method->doc_comment;
    if (!length $comment) {
        $comment = "Creates a new $class_name class instance."
            if $method->is_init;
        my $last = ($method->filter_descendants(type => 'Return'))[0];
        $comment = $last->find_doc_comment if $last;
    }

    my $fmt = $method->{is_prop} ? 'computed' : 'method';
    return $fmt => {
        name        => $method->{name},
        hook        => $method->{hook} ? 'Hook. ' : '',
        description => dot_trim($comment),
        heading     => $head,
        example     => $example,
        arguments   => $arguments,
        type        => !$method->body ?
                       "Property" : $method->{p_set} ?
                       'Once-computed property' : 'Computed property'
    };
}

1
