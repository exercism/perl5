#!/usr/bin/env perl
use Test2::V0;
plan 2;    # This is how many tests we expect to run.

use FindBin qw($Bin);
use lib $Bin,
  "$Bin/local/lib/perl5"; # Find modules in the same dir as this file.
use HelloWorld qw(hello);

imported_ok qw(hello) or bail_out;

# Run the 'is' sub from 'Test2::V0' with three arguments.
is(
  hello(),            # Run the 'hello' sub imported from the module.
  'Hello, World!',    # The expected result to compare with 'hello'.
  'Say Hi!'           # The test description.
);
