#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use FlowerField qw<annotate>;

is( # begin: 237ff487-467a-47e1-9b01-8a891844f86c
    annotate( <<'INPUT' =~ s/\n$//r ),

INPUT
    <<'EXPECTED' =~ s/\n$//r,

EXPECTED
    "no rows",
); # end: 237ff487-467a-47e1-9b01-8a891844f86c

is( # begin: 4b4134ec-e20f-439c-a295-664c38950ba1
    annotate( <<'INPUT' =~ s/\n$//r ),

INPUT
    <<'EXPECTED' =~ s/\n$//r,

EXPECTED
    "no columns",
); # end: 4b4134ec-e20f-439c-a295-664c38950ba1

is( # begin: d774d054-bbad-4867-88ae-069cbd1c4f92
    annotate( <<'INPUT' =~ s/\n$//r ),
   
   
   
INPUT
    <<'EXPECTED' =~ s/\n$//r,
   
   
   
EXPECTED
    "no flowers",
); # end: d774d054-bbad-4867-88ae-069cbd1c4f92

is( # begin: 225176a0-725e-43cd-aa13-9dced501f16e
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
    "garden full of flowers",
); # end: 225176a0-725e-43cd-aa13-9dced501f16e

is( # begin: 3f345495-f1a5-4132-8411-74bd7ca08c49
    annotate( <<'INPUT' =~ s/\n$//r ),
   
 * 
   
INPUT
    <<'EXPECTED' =~ s/\n$//r,
111
1*1
111
EXPECTED
    "flower surrounded by spaces",
); # end: 3f345495-f1a5-4132-8411-74bd7ca08c49

is( # begin: 6cb04070-4199-4ef7-a6fa-92f68c660fca
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
    "space surrounded by flowers",
); # end: 6cb04070-4199-4ef7-a6fa-92f68c660fca

is( # begin: 272d2306-9f62-44fe-8ab5-6b0f43a26338
    annotate( <<'INPUT' =~ s/\n$//r ),
 * * 
INPUT
    <<'EXPECTED' =~ s/\n$//r,
1*2*1
EXPECTED
    "horizontal line",
); # end: 272d2306-9f62-44fe-8ab5-6b0f43a26338

is( # begin: c6f0a4b2-58d0-4bf6-ad8d-ccf4144f1f8e
    annotate( <<'INPUT' =~ s/\n$//r ),
*   *
INPUT
    <<'EXPECTED' =~ s/\n$//r,
*1 1*
EXPECTED
    "horizontal line, flowers at edges",
); # end: c6f0a4b2-58d0-4bf6-ad8d-ccf4144f1f8e

is( # begin: a54e84b7-3b25-44a8-b8cf-1753c8bb4cf5
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
); # end: a54e84b7-3b25-44a8-b8cf-1753c8bb4cf5

is( # begin: b40f42f5-dec5-4abc-b167-3f08195189c1
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
    "vertical line, flowers at edges",
); # end: b40f42f5-dec5-4abc-b167-3f08195189c1

is( # begin: 58674965-7b42-4818-b930-0215062d543c
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
); # end: 58674965-7b42-4818-b930-0215062d543c

is( # begin: dd9d4ca8-9e68-4f78-a677-a2a70fd7a7b8
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
    "large garden",
); # end: dd9d4ca8-9e68-4f78-a677-a2a70fd7a7b8

is( # begin: 6e4ac13a-3e43-4728-a2e3-3551d4b1a996
    annotate( <<'INPUT' =~ s/\n$//r ),
 ** 
INPUT
    <<'EXPECTED' =~ s/\n$//r,
1**1
EXPECTED
    "multiple adjacent flowers",
); # end: 6e4ac13a-3e43-4728-a2e3-3551d4b1a996

done_testing;
