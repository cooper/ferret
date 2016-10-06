# Copyright (c) 2015, Mitchell Cooper
package Ferret::Native::Signal;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Object';

use Scalar::Util qw(blessed);

@SIG{ qw(INT HUP TERM) } = (\&_handle_signal) x 3;

sub _handle_signal {
    my $f = $Ferret::ferret;
    my $type = FF::get_symbol($f, shift);
    my $signal_class = Ferret::space($f->main_context, [caller], 'Signal');
    $signal_class->call_prop(fireSignal => { type => $type });
}

# TODO: make it possible to handle these

our $last_err;
$SIG{__DIE__} = sub {
    my $e = shift;
    $last_err = blessed $e ? $e : undef;
    $e = $e->description        if
        !$Ferret::in_catch      &&
        blessed $e              &&
        $e->can('description');
    if (!blessed $e) {
        $e =~ s/\n$//g;
        die $e."\n";
    }
    die $e;
};

$SIG{__WARN__} = sub {
    print "@_";
};

1
