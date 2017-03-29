package Ferret::Config;
use strict;

our ($ferret_root, @user_lib);

# required
die '$ferret_root is not configured'
    if !length $ferret_root;

# core libs
my @core_lib = (
    "$ferret_root/lib",
    "$ferret_root/lib/evented-object/lib"
);

# core standard library
my @core_std = (
    "$ferret_root/std"
);

# set ferret global vars, add to @INC
my @libs = ('.', @user_lib, @core_std, @core_lib);
unless (length $Ferret::ferret_root) {
	$Ferret::ferret_root = $ferret_root;
	$Ferret::ferret_libs = \@libs;
	unshift @INC, @libs;
}

1;
