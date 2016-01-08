# Copyright 2015, Mitchell Cooper
package F::Gather;

use warnings;
use strict;
use 5.010;

use parent qw(F::NodeExpression);
use Scalar::Util qw(weaken);

sub new {
    my ($class, %opts) = @_;
    my $gather = $class->SUPER::new(
        body => F::new('GatherBody'),
        %opts
    );
    $gather->adopt($gather->body);
    weaken($gather->{body});
    return $gather;
}

sub perl_fmt {
    return gather => {
        statements => shift->body->body_fmt_do
    };
}

sub is_closure { 1 }
sub body       { shift->{body} }

1
