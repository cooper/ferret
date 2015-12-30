# Copyright 2015, Mitchell Cooper
package F::Type;

use warnings;
use strict;
use parent 'F::Closure';

use Scalar::Util qw(weaken);

sub new {
    my ($class, %opts) = @_;
    my $type = $class->SUPER::new(%opts);

    # create the body.
    my $body = F::TypeBody->new;
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

   # if the direct parent is a Class, use a special format
   # UNLESS it starts with '_', in which case it is a "private" class type.
   my $fmt_name = 'type';
   $fmt_name .= '_c' if
       $type->parent->type eq 'Class' &&
       substr($type->type_name, 0, 1) ne '_';

    return $fmt_name => {
        name       => $type->type_name,
        conditions => $conditions,
        equal_to   => $equal_to
    };
}

sub type_name  { shift->{type_name} }
sub body       { shift->{body}      }
sub is_closure { 1 }
sub hold_instr { 1 }
sub type       { 'Type' }
sub desc       {
    my $type = shift;
    my $name = $type->type_name;
    return 'type definition'.($name ? " ('$name')" : '');
}

package F::TypeBody;

use warnings;
use strict;
use 5.010;
use parent 'F::Body';

sub type { 'TypeBody' }

1
