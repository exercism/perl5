#!/usr/bin/env perl
use strict;
use warnings;
use Test2::Bundle::More;
plan 2;    # This is how many tests we expect to run.

use FindBin qw($Bin);
use lib $Bin,
  "$Bin/local/lib/perl5"; # Find modules in the same dir as this file.
use HelloWorld qw(hello);

can_ok 'HelloWorld', 'import'
  or BAIL_OUT 'Cannot import subroutines from module';

# Run the 'is' sub from 'Test2::Bundle::More' with three arguments.
is(
  hello,              # Run the 'hello' sub imported from the module.
  'Hello, World!',    # The expected result to compare with 'hello'.
  'Say Hi!'           # The test description.
);
