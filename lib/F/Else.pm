# Copyright 2015, Mitchell Cooper
package F::Else;

use warnings;
use strict;
use parent 'F::Closure';

use Scalar::Util 'weaken';

sub new {
    my ($class, %opts) = @_;
    my $else = $class->SUPER::new(%opts);

    # body.
    my $body = F::Body->new;
    weaken($else->{body} = $body);
    $else->adopt($body);

    return $else;
}

sub perl_fmt {
    my $else = shift;
    return else => {
        content => $else->body->body_fmt_do
    };
}

sub body       { shift->{body}      }
sub is_closure { 1 }
sub hold_instr { 1 }
sub type       { 'Else' }

1
