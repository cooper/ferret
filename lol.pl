#! /usr/bin/perl

print "hi\n";

use warnings;
use strict;
use Term::StatusBar;

system('clear'); # too lazy to do this right.

use constant MAX => 100_000;
use Time::HiRes qw(usleep);

my $run_progress = Term::StatusBar->new(label => 'Run',
                                        totalItems => 10,
                                        scale => 1000,
                                       );

for (0..10) # the outer run
{
    $run_progress->update();

    my $powers_progress = Term::StatusBar->new(label => "Powers$_",
                                               startRow => 3,
                                               scale => 1000,
                                               totalItems => MAX,
                                              );
    
    for (0..MAX)
    {
        $powers_progress->update();
        usleep(100);
    }
}
