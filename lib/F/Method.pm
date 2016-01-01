# Copyright 2015, Mitchell Cooper
package F::Method;

use warnings;
use strict;
use 5.010;
use parent 'F::Node';


sub is_closure { 1 }
sub hold_instr { 1 }
sub body { shift->{body} }

sub desc {
    my $method = shift;
    my $main = $method->{main}    ? 'class '            : '';
    my $type = $method->{is_prop} ? 'computed property' : 'method';
    my $lazy = $method->{p_set}   ? ' (lazy)'           : '';
    return "$main$type '$$method{name}'$lazy";
}

sub new {
    my ($class, %opts) = @_;
    my $method = $class->SUPER::new(
        body => F::Body->new,
        %opts
    );
    $method->adopt($method->body);
    return $method;
}

sub perl_fmt {
    my $method = shift;
    my ($content, @arguments) = $method->body->body_fmt_do;

    # determine owner
    my $owner;
    if ($method->{main}) {
        my $public = $method->{name} && substr($method->{name}, 0, 1) ne '_';
        $owner = $public ? '$class' : '$scope';
    }
    else {
        $owner = '$proto';
    }

    my $class = $method->class;
    my $info = {
        event_cb   => $method->{event_cb},
        id         => $class->{method_cid}++,
        name       => $method->{name},
        statements => $content,
        arguments  => join(', ', @arguments),
        is_prop    => $method->{is_prop} ? '1' : 'undef',
        p_set      => $method->{p_set}   ? '1' : 'undef',
        owner      => $owner
    };

    # add the method definition.
    push @{ $class->{method_defs} }, $info;

    return method => $info;
}

1
