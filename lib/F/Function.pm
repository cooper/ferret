# Copyright 2015, Mitchell Cooper
package F::Function;

use warnings;
use strict;
use 5.010;

use parent qw(F::NodeExpression);
use Scalar::Util qw(weaken);
use Ferret::Shared::Utils qw(dot_trim);

sub anonymous  { shift->{anonymous} }
sub body       { shift->{body}      }
sub is_method  { shift->{is_method} }

sub public {
    my $f = shift;
    return if $f->anonymous;
    $f->owner;
    return $f->{public};
}

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

sub desc {
    my $func = shift;
    if ($func->is_method) {
        my $method = $func;
        my $main = $method->{main}    ? 'class '            : '';
        my $type = $method->{is_prop} ? 'computed property' : 'method';
        my $lazy = $method->{p_set}   ? ' (lazy)'           : '';
        return "$main$type '$$method{name}'$lazy";
    }
    return 'anonymous function' if $func->anonymous;
    return "function '$$func{name}'";
}

sub new {
    my ($class, %opts) = @_;
    my $func = $class->SUPER::new(
        body => F::new('FunctionMethodBody'),
        %opts
    );
    $func->adopt($func->body);
    weaken($func->{body});
    return $func;
}

sub close : method {
    my $func = shift;

    # this may be a fake function inside an On block
    if ($func->{parent}->type eq 'On') {
        return $func->SUPER::close->close;
    }

    return $func->SUPER::close(@_);
}

sub owner {
    my $func = shift;

    if ($func->is_method) {
        my ($method, $owner_str, $owner) = $func;
        my $class = $method->class;
        $method->{public} =
        my $public = $method->{name} && substr($method->{name}, 0, 1) ne '_';
        if ($method->{main}) {
            $owner_str = $public ? '$class' : '$scope';
            $owner     = $class;
        }
        else {
            $owner_str = '$proto';
            $owner     = "$class._PROTO_"; # no element
        }
        return ($owner, $owner_str);
    }

    # anonymous functions are owned by no one.
    return (undef, 'undef') if $func->anonymous;

    # document-level function.
    my $public_ctx = $func->parent->type eq 'Document';
    undef $public_ctx if $func->{name} && substr($func->{name}, 0, 1) eq '_';
    $func->{public} = $public_ctx;

    if ($public_ctx) {
        return ($func->parent, '$context');
    }
    return ($func->first_upper_scope, '$scope');
}

sub is_init {
    my $method = shift;
    return if !$method->is_method;
    return $method->{main} && $method->{name} eq 'initializer__';
}

sub perl_fmt {
    my $func = shift;
    my ($content, @arguments) = $func->body->body_fmt_do;

    # find a class maybe. this will always be set for methods.
    # for functions, this is for private class-level functions.
    my $class = $func->class;

    # we might need to set $ins within the function.
    my $vp = scalar $func->body->filter_descendants(type => 'PropertyVariable');
    my $need_topic = $vp && $func->anonymous && !$func->arguments;

    # return types.
    my @returns = map "{ name => '$_', type => '$$func{returns}{$_}{type}' }",
        grep $func->{returns}{$_}{type} ne '(none)',
        keys %{ $func->{returns} || {} };

    my $info = {
        need_topic => $need_topic,
        anonymous  => $func->{anonymous},
        event_cb   => $func->{event_cb},
        owner      => $func->owner_str,
        id         => $func->document->{function_cid}++,
        name       => length $func->{name} ? $func->{name} : '(undef)',
        cb_name    => length $func->{cb_name} ? "'$$func{cb_name}'" : 'undef',
        class      => $class ? '$class' : 'undef',
        semi       => $func->{anonymous} ? ''        : ';', # probably temporary hack
        is_prop    => $func->{is_prop}   ? '1'       : 'undef',
        p_set      => $func->{p_set}     ? '1'       : 'undef',
        statements => $content,
        arguments  => join(', ', @arguments),
        returns    => join(', ', @returns)
    };

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
    return if !$method->is_method; # TODO
    my $no_body = !defined $method->body->{open_pos};

    # create heading.
    my $head = $method->get_markdown_heading(
        $method->is_init    ?
        'Initializer'       :
        $method->{name}
    );

    # arguments string (signature).
    my $signature = $method->signature;
    $signature = Ferret::Shared::Utils::signature_need_only($signature);
    $signature = Ferret::Shared::Utils::signature_to_string($signature, 1);

    # show class name or instance variable?
    my $class_name = $method->class->{name};
    my $instn_name = '$'.lc($class_name);
    my $owner_name = $method->{main} ? $class_name : $instn_name;
    my $example =
        $method->{is_prop}                              ?
        $owner_name.'.'.$method->{name}                 :
        $method->is_init                                ?
        $instn_name.' = '.$class_name."($signature)"    :
        $owner_name.'.'.$method->{name}."($signature)"  ;

    # handle arguments.
    my $arguments = '';
    my @args = $method->arguments;
    if (@args) {
        $method->{markdown_heading_level}++;
        $arguments .= $method->get_markdown_heading('Arguments')."\n";
        foreach my $arg (@args) {
            $arguments .= $arg->markdown_fmt_do."\n";
        }
        $method->{markdown_heading_level}--;
    }

    # handle comments.
    my $comment = $method->{doc_comment};
    if (!length $comment && $method->is_init) {
        $comment = "Creates a new $class_name class instance.";
    }


    my $fmt = $method->{is_prop} ? 'computed' : 'method';
    return $fmt => {
        name        => $method->{name},
        hook        => $no_body || $method->{hook} ? 'Hook. ' : '',
        description => dot_trim($comment),
        heading     => $head,
        example     => $example,
        arguments   => $arguments,
        computed    => $method->{p_set} ? 'Once-computed' : 'Computed'
    };
}

1
