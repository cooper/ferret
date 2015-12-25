# Copyright (c) 2015, Mitchell Cooper
package Ferret::Native::Signal;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

@SIG{ qw(INT HUP TERM) } = (\&_handle_signal) x 3;

sub _handle_signal {
    my $f = $Ferret::ferret;
    my $type = FF::get_symbol($f, shift);
    my $signal_class = Ferret::space($f->main_context, [caller], 'Signal');
    $signal_class->property('fireSignal')->call({ type => $type });
}

1
