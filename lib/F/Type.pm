# Copyright 2015, Mitchell Cooper
package F::Type;

use warnings;
use strict;
use parent 'F::Closure';

use Ferret::Shared::Utils qw(dot_trim);
use Scalar::Util qw(weaken);

sub new {
    my ($class, %opts) = @_;
    my $type = $class->SUPER::new(%opts);

    # create the body.
    my $body = F::new('TypeBody');
    weaken($type->{body} = $body);
    $type->adopt($body);

    return $type;
}

sub close : method {
    my $type = shift;

    # check for errors.
    foreach my $item (map $_->first_child, $type->body->children) {
        next unless $item->type eq 'TypeRequirement';
        my $e = $item->req_error;
        return $e if $e;
    }

    return $type->SUPER::close(@_);
}

sub public {
    my $t = shift;
    $t->owner;
    return $t->{public};
}

sub owner {
    my ($type, $owner, $owner_str) = shift;

    # private if starts with _
    my $private = substr($type->type_name, 0, 1) eq '_';
    $type->{public} = !$private;

    if ($type->parent->type eq 'Class') {
        $owner_str = $private ? '$scope' : '$class';
        $owner     = $type->parent;
    }
    elsif ($type->parent->type eq 'Document') {
        $owner_str = $private ? '$scope' : '$context';
        $owner     = $type->parent;
    }
    else {
        $owner_str = '$scope';
        $owner     = $type->first_upper_scope;
    }

    return ($owner, $owner_str);
}

sub perl_fmt {
    my $type = shift;

    my (@equal_possibly, @conditions);
    foreach my $item (map $_->first_child, $type->body->children) {

        # it's some sort of requirement or transform.
        if (defined $item->{req_type}) {
            my $format = $item->perl_fmt_do;
            push @conditions, $format;
            next;
        }

        # it's just an expression.
        push @equal_possibly, $item->perl_fmt_do;

    }

    my $equal_to = join(', ', @equal_possibly);
       $equal_to = $equal_to ? "[ $equal_to ]" : 'undef';

    my $conditions = join(', ', @conditions);
       $conditions = $conditions ? "[ $conditions ]" : 'undef';

    return type => {
        owner      => $type->owner_str,
        name       => $type->type_name,
        conditions => $conditions,
        equal_to   => $equal_to,
        lazy       => $type->{lazy} ? 1 : 'undef'
    };
}

sub markdown_fmt {
    my $type = shift;
    my $head = $type->get_markdown_heading($type->type_name);

    my (@equal_possibly, @conditions);
    foreach my $item (map $_->first_child, $type->body->children) {

        # it's some sort of requirement or transform.
        if (defined $item->{req_type}) {
            my $format = $item->markdown_fmt_do;
            push @conditions, $format;
            next;
        }

        # it's just an expression.
        push @equal_possibly, $item->markdown_fmt_do;

    }

    # accepted expression values.
    my $equal_to = '';
    if (@equal_possibly) {
        $type->{markdown_heading_level}++;
        $equal_to .= $type->get_markdown_heading('Accepted values')."\n\n";
        $equal_to .= "In order to comply, the test object must be equal ".
                     "(according to the `==` ".
                     "[`OP_EQUAL`](/doc/Operators.md#equality-operator) ".
                     "operator) to any one of these values.\n";
        $equal_to .= (F::get_markdown_fmt(type_exp => { expression => $_ }))
            // '(a value evaluated at runtime)'
            foreach @equal_possibly;
        $type->{markdown_heading_level}--;
    }

    return type => {
        heading     => $head,
        description => dot_trim($type->{doc_comment}),
        name        => $type->type_name,
        equal_to    => $equal_to
    };
}

sub type_name  { shift->{type_name} }
sub body       { shift->{body}      }
sub is_closure { 1 }
sub hold_instr { 1 }

sub desc       {
    my $type = shift;
    my $name = $type->type_name;
    return 'type definition'.($name ? " ('$name')" : '');
}

1
