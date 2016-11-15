# Copyright 2015, Mitchell Cooper
package F::Method;

use warnings;
use strict;
use 5.010;

use parent qw(F::Node);
use Scalar::Util qw(weaken);
use Ferret::Shared::Utils qw(dot_trim);

sub is_closure { 1 }
sub hold_instr { 1 }
sub body { shift->{body} }

sub public {
    my $m = shift;
    #return unless $m->{main};
    $m->owner;
    return $m->{public};
}

sub arguments {
    my $method = shift;

    # find all the WantNeed descendants.
    my @wn = $method->filter_descendants(type => 'WantNeed');

    # filter out the ones which belong to me.
    @wn = grep {
        my $m = $_->first_self_or_parent('Function', 'Method');
        $method == $m;
    } @wn;

    return @wn;
}

sub returns {
    my $func = shift;

    # find all the Return descendants.
    my @r = $func->filter_descendants(type => 'Return ReturnPair');

    # filter out the ones which belong to me.
    @r = grep {
        my $f = $_->first_self_or_parent('Function', 'Method');
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
    my $method = shift;
    my $main = $method->{main}    ? 'class '            : '';
    my $type = $method->{is_prop} ? 'computed property' : 'method';
    my $lazy = $method->{p_set}   ? ' (lazy)'           : '';
    return "$main$type '$$method{name}'$lazy";
}

sub new {
    my ($class, %opts) = @_;
    my $method = $class->SUPER::new(
        body => F::new('FunctionMethodBody'),
        %opts
    );
    $method->adopt($method->body);
    weaken($method->{body});
    return $method;
}

sub owner {
    my ($method, $owner_str, $owner) = shift;
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

sub perl_fmt {
    my $method = shift;
    my ($content, @arguments) = $method->body->body_fmt_do;

    my $class = $method->class;
    my $info = {
        event_cb   => $method->{event_cb},
        id         => $class->{method_cid}++,
        name       => $method->{name},
        statements => $content,
        arguments  => join(', ', @arguments),
        is_prop    => $method->{is_prop} ? '1' : 'undef',
        p_set      => $method->{p_set}   ? '1' : 'undef',
        owner      => $method->owner_str
    };

    # add the method definition.
    push @{ $class->{method_defs} }, $info;

    return method => $info;
}

sub is_init {
    my $method = shift;
    return $method->{main} && $method->{name} eq 'initializer__';
}

sub markdown_fmt {
    my $method  = shift;
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
