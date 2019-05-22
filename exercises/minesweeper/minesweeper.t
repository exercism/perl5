#!/usr/bin/env perl
use strict;
use warnings;

use Test2::Bundle::More;
plan 12;

use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";
use Minesweeper;
use Test2::Tools::Exception qw(dies);

my $module = 'Minesweeper';
my $name   = 'count_adjacent_bombs';
my $sub    = join( '::', $module, $name );

can_ok( $module, $name )
  or BAIL_OUT("You need to implement the $name()-function");

my $function = \&{"${module}::$name"};

is(
  $function->(
    <<'INPUT' ), <<'EXPECTED', "Large 6x6 board with 8 bombs" );
+------+
| *  * |
|  *   |
|    * |
|   * *|
| *  * |
|      |
+------+
INPUT
+------+
|1*22*1|
|12*322|
| 123*2|
|112*4*|
|1*22*2|
|111111|
+------+
EXPECTED

is(
  $function->(
    <<'INPUT' ), <<'EXPECTED', "Large 5x5 board with 7 bombs" );
+-----+
| * * |
|     |
|   * |
|  * *|
| * * |
+-----+
INPUT
+-----+
|1*2*1|
|11322|
| 12*2|
|12*4*|
|1*3*2|
+-----+
EXPECTED

is(
  $function->(
    <<'INPUT' ), <<'EXPECTED', "Small 5x1 board with 2 bombs" );
+-----+
| * * |
+-----+
INPUT
+-----+
|1*2*1|
+-----+
EXPECTED

is(
  $function->(
    <<'INPUT' ), <<'EXPECTED', "Small 1x5 board with 2 bombs" );
+-+
|*|
| |
|*|
| |
| |
+-+
INPUT
+-+
|*|
|2|
|*|
|1|
| |
+-+
EXPECTED

is(
  $function->( <<'INPUT' ), <<'EXPECTED', "1x1 sqaure with 1 bomb" );
+-+
|*|
+-+
INPUT
+-+
|*|
+-+
EXPECTED

is(
  $function->( <<'INPUT' ), <<'EXPECTED', "2x2 square with 4 bombs" );
+--+
|**|
|**|
+--+
INPUT
+--+
|**|
|**|
+--+
EXPECTED

is(
  $function->( <<'INPUT' ), <<'EXPECTED', "3x3 square with 8 bombs" );
+---+
|***|
|* *|
|***|
+---+
INPUT
+---+
|***|
|*8*|
|***|
+---+
EXPECTED

is(
  $function->( <<'INPUT' ), <<'EXPECTED', "5x5 square with 2 bombs" );
+-----+
|     |
|   * |
|     |
|     |
| *   |
+-----+
INPUT
+-----+
|  111|
|  1*1|
|  111|
|111  |
|1*1  |
+-----+
EXPECTED

like dies {
  $function->( <<'INPUT' ) }, qr/ArgumentError/, 'Unaligned board';
+-+
| |
|*  |
|  |
+-+
INPUT

like dies {
  $function->( <<'INPUT' ) }, qr/ArgumentError/, 'boarderless board';
+-----+
*   * |
+-- --+
INPUT

like dies {
  $function->( <<'INPUT' ) }, qr/ArgumentError/, 'Unknwon characters';
+-----+
|X  * |
+-----+
INPUT
