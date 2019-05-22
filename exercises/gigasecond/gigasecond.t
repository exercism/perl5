#!/usr/bin/env perl
use warnings;
use strict;

use Test2::Bundle::More;
plan 3;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";
use Gigasecond;
use DateTime;

sub gs_new {
  no strict 'refs';
  Gigasecond->new(@_);
}

is gs_new( 2011, 4, 25 )->date,
  DateTime->new( year => 2043, month => 1, day => 1 ), 'test 1';
is gs_new( 1977, 6, 13 )->date,
  DateTime->new( year => 2009, month => 2, day => 19 ), 'test 2';
is gs_new( 1959, 7, 19 )->date,
  DateTime->new( year => 1991, month => 3, day => 27 ), 'test 3';
