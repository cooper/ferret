# Copyright 2015, Mitchell Cooper
package F::Function;

use warnings;
use strict;
use 5.010;
use parent qw(F::NodeExpression);



sub anonymous  { shift->{anonymous} }
sub body       { shift->{body}      }

sub desc {
    my $func = shift;
    return 'anonymous function' if $func->anonymous;
    return "function '$$func{name}'";
}

sub new {
    my ($class, %opts) = @_;
    my $func = $class->SUPER::new(
        body => F::Body->new,
        %opts
    );
    $func->adopt($func->body);
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

sub perl_fmt {
    my $func = shift;
    my ($content, @arguments) = $func->body->body_fmt_do;

    my $info = {
        anonymous  => $func->{anonymous},
        event_cb   => $func->{event_cb},
        id         => $func->document->{function_cid}++,
        name       => length $func->{name} ? $func->{name} : '(undef)',
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
