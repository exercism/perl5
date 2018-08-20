#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 2; # This is how many tests we expect to run.
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5"; # Look for modules inside the same directory as this test file.
use HelloWorld qw(hello);

can_ok 'HelloWorld', 'import' or BAIL_OUT 'Cannot import subroutines from module';

# Run the 'is' subroutine from the 'Test::More' module, with three arguments.
is(
  hello,           # Run the 'hello' subroutine, which is imported from your module.
  'Hello, World!', # The expected result to compare with 'hello'.
  'Say Hi!'        # The test description.
);
