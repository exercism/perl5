#!/usr/bin/env perl
use strict;
use warnings;
use Test::More tests => 2; # This is how many tests we expect to run.
use JSON::PP;
use FindBin;
use lib $FindBin::Bin; # Look for the module inside the same directory as this test file.
use HelloWorld qw(hello);

my $exercise = 'HelloWorld'; # The name of this exercise.
can_ok $exercise, 'import' or BAIL_OUT 'Cannot import subroutines from module';

my $C_DATA = do { local $/; decode_json(<DATA>); };
is hello($_->{input}), $_->{expected}, $_->{description} foreach @{$C_DATA->{cases}};

__DATA__
{
  "exercise": "hello-world",
  "version": "1.1.0",
  "cases": [
    {
      "description": "Say Hi!",
      "property": "hello",
      "input": {},
      "expected": "Hello, World!"
    }
  ]
}
