#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Minesweeper qw<annotate>;

is(
    annotate( <<'INPUT' =~ s/\n$//r ),

INPUT
    <<'EXPECTED' =~ s/\n$//r,

EXPECTED
    "no rows",
);

is(
    annotate( <<'INPUT' =~ s/\n$//r ),

INPUT
    <<'EXPECTED' =~ s/\n$//r,

EXPECTED
    "no columns",
);

is(
    annotate( <<'INPUT' =~ s/\n$//r ),
   
   
   
INPUT
    <<'EXPECTED' =~ s/\n$//r,
   
   
   
EXPECTED
    "no mines",
);

is(
    annotate( <<'INPUT' =~ s/\n$//r ),
***
***
***
INPUT
    <<'EXPECTED' =~ s/\n$//r,
***
***
***
EXPECTED
    "minefield with only mines",
);

is(
    annotate( <<'INPUT' =~ s/\n$//r ),
   
 * 
   
INPUT
    <<'EXPECTED' =~ s/\n$//r,
111
1*1
111
EXPECTED
    "mine surrounded by spaces",
);

is(
    annotate( <<'INPUT' =~ s/\n$//r ),
***
* *
***
INPUT
    <<'EXPECTED' =~ s/\n$//r,
***
*8*
***
EXPECTED
    "space surrounded by mines",
);

is(
    annotate( <<'INPUT' =~ s/\n$//r ),
 * * 
INPUT
    <<'EXPECTED' =~ s/\n$//r,
1*2*1
EXPECTED
    "horizontal line",
);

is(
    annotate( <<'INPUT' =~ s/\n$//r ),
*   *
INPUT
    <<'EXPECTED' =~ s/\n$//r,
*1 1*
EXPECTED
    "horizontal line, mines at edges",
);

is(
    annotate( <<'INPUT' =~ s/\n$//r ),
 
*
 
*
 
INPUT
    <<'EXPECTED' =~ s/\n$//r,
1
*
2
*
1
EXPECTED
    "vertical line",
);

is(
    annotate( <<'INPUT' =~ s/\n$//r ),
*
 
 
 
*
INPUT
    <<'EXPECTED' =~ s/\n$//r,
*
1
 
1
*
EXPECTED
    "vertical line, mines at edges",
);

is(
    annotate( <<'INPUT' =~ s/\n$//r ),
  *  
  *  
*****
  *  
  *  
INPUT
    <<'EXPECTED' =~ s/\n$//r,
 2*2 
25*52
*****
25*52
 2*2 
EXPECTED
    "cross",
);

is(
    annotate( <<'INPUT' =~ s/\n$//r ),
 *  * 
  *   
    * 
   * *
 *  * 
      
INPUT
    <<'EXPECTED' =~ s/\n$//r,
1*22*1
12*322
 123*2
112*4*
1*22*2
111111
EXPECTED
    "large minefield",
);

done_testing;
