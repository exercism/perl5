use strict;
use warnings;

use Test::More tests => 13;
use Test::Exception;

my $module = $ENV{EXERCISM} ? 'Example' : 'Minesweeper';
my $name = 'count_adjacent_bombs';
my $sub = join('::', $module, $name);

use_ok($module) or BAIL_OUT("You need to create a module called $module.pm.");
can_ok($module, $name) or BAIL_OUT("You need to implement the $name()-function");

my $function = \&{"${module}::$name"};

is( $function->( <<'INPUT' ), <<'EXPECTED', "Large 6x6 board with 8 bombs" );
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

is( $function->( <<'INPUT' ), <<'EXPECTED', "Large 5x5 board with 7 bombs" );
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

is( $function->( <<'INPUT' ), <<'EXPECTED', "Small 5x1 board with 2 bombs" );
+-----+
| * * |
+-----+
INPUT
+-----+
|1*2*1|
+-----+
EXPECTED

is( $function->( <<'INPUT' ), <<'EXPECTED', "Small 1x5 board with 2 bombs" );
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

is( $function->( <<'INPUT' ), <<'EXPECTED', "1x1 sqaure with 1 bomb" );
+-+
|*|
+-+
INPUT
+-+
|*|
+-+
EXPECTED

is( $function->( <<'INPUT' ), <<'EXPECTED', "2x2 square with 4 bombs" );
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

is( $function->( <<'INPUT' ), <<'EXPECTED', "3x3 square with 8 bombs" );
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

is( $function->( <<'INPUT' ), <<'EXPECTED', "5x5 square with 2 bombs" );
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

throws_ok { $function->( <<'INPUT' ) } qr/ArgumentError/, 'Unaligned board';
+-+
| |
|*  |
|  |
+-+
INPUT

throws_ok { $function->( <<'INPUT' ) } qr/ArgumentError/, 'boarderless board';
+-----+
*   * |
+-- --+
INPUT

throws_ok { $function->( <<'INPUT' ) } qr/ArgumentError/, 'Unknwon characters';
+-----+
|X  * |
+-----+
INPUT
