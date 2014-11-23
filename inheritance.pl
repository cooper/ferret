#!/usr/bin/perl
use warnings;
use strict;
use 5.010;
use lib 'lib';
use Ferret;

my $f = Ferret->new;
my $context = $f->context;
my $obj1 = Ferret::Object->new;
my $obj2 = Ferret::Object->new;

$obj1->set_property(test_prop => Ferret::false);
$obj2->add_parent($obj1);

say "The original value: ", $obj1->property('test_prop');
say "The inherited value: ", $obj2->property('test_prop');

my $func = Ferret::Function->new($f,
    name     => 'default',
    priority => 100
);
$func->{code} = sub {
    my $arguments = shift;
    my $msg = $arguments->{message};
    say $msg;
};
$func->add_argument(name => 'message');

my $func2 = Ferret::Function->new($f,
    name     => 'secondary',
    priority => 101
);
$func2->{code} = sub {
    my $arguments = shift;
    my $msg = $arguments->{message};
    say 'this should be called first';
};
$func2->add_argument(name => 'message2', optional => 1);

my $event = Ferret::Event->new($f);
$event->add_function($func);
$event->add_function($func2);

$event->call(["Hello World!"]);
