# Copyright 2015, Mitchell Cooper
package F::Defer;

use warnings;
use strict;
use parent 'F::Closure';

use Scalar::Util 'weaken';

sub new {
    my ($class, %opts) = @_;
    my $defer = $class->SUPER::new(%opts);

    # body.
    my $body = F::Body->new;
    weaken($defer->{body} = $body);
    $defer->adopt($body);

    return $defer;
}

sub perl_fmt {
    my $defer = shift;
    return defer => {
        content => $defer->body->body_fmt_do
    };
}

sub body       { shift->{body}      }
sub is_closure { 1 }
sub hold_instr { 1 }
sub type       { 'Defer' }

1
