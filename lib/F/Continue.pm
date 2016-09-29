# Copyright (c) 2016, Mitchell Cooper
package F::Continue;

use warnings;
use strict;
use parent qw(F::Closure);

use Scalar::Util 'weaken';

sub new {
    my ($class, %opts) = @_;
    my $cont = $class->SUPER::new(%opts);

    # body.
    my $body = F::new('ContinueBody');
    weaken($cont->{body} = $body);
    $cont->adopt($body);

    return $cont;
}


sub perl_fmt { }

sub param_exp  { shift->{param_exp} }
sub body       { shift->{body}      }
sub is_closure { 1 }
sub hold_instr { 1 }

1
