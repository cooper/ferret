# Copyright (c) 2015, Mitchell Cooper
package Ferret::Core::Context;

use warnings;
use strict;
use utf8;
use 5.010;
use parent 'Ferret::Context';

use Ferret::Core::Conversion qw(flist);

# creates a new context.
sub new {
    my ($class, $f, %opts) = @_;
    my $context = $class->SUPER::new($f, %opts, is_core => 1);

    # global special variables.
    $context->{special}->set_property(argv => [ sub { flist(\@ARGV) }]);

    return $context;
}

sub add_global_functions {
    my $context = shift;
    my $f = $context->f;

    # add global functions.
    my %funcs = %Ferret::Core::Functions::functions;
    foreach my $name (keys %funcs) {
        my %opts = %{ $funcs{$name} };

        # create function with proper requirements.
        my $func = Ferret::Function->new($f,
            name => $opts{cb_name} // 'default',
            code => $opts{code},
            need => $opts{need},
            want => $opts{want},
            pending_add => 1
        );

        $func->inside_scope($name, $context, $context, undef);
    }
}

1
