# Copyright 2015, Mitchell Cooper
package F::Type;

use warnings;
use strict;
use parent 'F::Closure';

use Scalar::Util 'weaken';

sub new {
    my ($class, %opts) = @_;
    my $type = $class->SUPER::new(%opts);

    # create the body.
    my $body = F::TypeBody->new;
    weaken($type->{body} = $body);
    $type->adopt($body);

    return $type;
}

sub perl_fmt {
    my $type = shift;

    my @possibilities;
    foreach my $item (map $_->first_child, $type->body->children) {
        next if $item->type eq 'Call'; # TODO
        push @possibilities, $item->perl_fmt_do;
    }

    return type => {
        name     => $type->type_name,
        equal_to => join(', ', @possibilities)
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
