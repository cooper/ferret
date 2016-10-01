# Copyright 2015, Mitchell Cooper
package F::Function;

use warnings;
use strict;
use 5.010;

use parent qw(F::NodeExpression);
use Scalar::Util qw(weaken);

sub anonymous  { shift->{anonymous} }
sub body       { shift->{body}      }

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
        my $f = $_->first_self_or_parent('Function', 'Method');
        $func == $f;
    } @wn;

    return @wn;
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

sub perl_fmt {
    my $func = shift;
    my ($content, @arguments) = $func->body->body_fmt_do;

    # find a class maybe.
    # this is for private class-level functions.
    my $class = $func->first_self_or_parent('Class');

    # we might need to set $ins within the function.
    my $vp = scalar $func->body->filter_descendants(type => 'PropertyVariable');
    my $need_topic = $vp && $func->anonymous && !$func->arguments;

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
        arguments  => join(', ', @arguments)
    };

    # add the function definition.
    push @{ $func->document->{function_defs} }, $info;

    return function => {
        %$info,
        name => $info->{anonymous} ? '(undef)' : $info->{name}
    };
}

1
