#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Minesweeper qw<annotate>;

is( # begin: 0c5ec4bd-dea7-4138-8651-1203e1cb9f44
    annotate( <<'INPUT' =~ s/\n$//r ),

INPUT
    <<'EXPECTED' =~ s/\n$//r,

EXPECTED
    "no rows",
); # end: 0c5ec4bd-dea7-4138-8651-1203e1cb9f44

is( # begin: 650ac4c0-ad6b-4b41-acde-e4ea5852c3b8
    annotate( <<'INPUT' =~ s/\n$//r ),

INPUT
    <<'EXPECTED' =~ s/\n$//r,

EXPECTED
    "no columns",
); # end: 650ac4c0-ad6b-4b41-acde-e4ea5852c3b8

is( # begin: 6fbf8f6d-a03b-42c9-9a58-b489e9235478
    annotate( <<'INPUT' =~ s/\n$//r ),
   
   
   
INPUT
    <<'EXPECTED' =~ s/\n$//r,
   
   
   
EXPECTED
    "no mines",
); # end: 6fbf8f6d-a03b-42c9-9a58-b489e9235478

is( # begin: 61aff1c4-fb31-4078-acad-cd5f1e635655
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
); # end: 61aff1c4-fb31-4078-acad-cd5f1e635655

is( # begin: 84167147-c504-4896-85d7-246b01dea7c5
    annotate( <<'INPUT' =~ s/\n$//r ),
   
 * 
   
INPUT
    <<'EXPECTED' =~ s/\n$//r,
111
1*1
111
EXPECTED
    "mine surrounded by spaces",
); # end: 84167147-c504-4896-85d7-246b01dea7c5

is( # begin: cb878f35-43e3-4c9d-93d9-139012cccc4a
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
); # end: cb878f35-43e3-4c9d-93d9-139012cccc4a

is( # begin: 7037f483-ddb4-4b35-b005-0d0f4ef4606f
    annotate( <<'INPUT' =~ s/\n$//r ),
 * * 
INPUT
    <<'EXPECTED' =~ s/\n$//r,
1*2*1
EXPECTED
    "horizontal line",
); # end: 7037f483-ddb4-4b35-b005-0d0f4ef4606f

is( # begin: e359820f-bb8b-4eda-8762-47b64dba30a6
    annotate( <<'INPUT' =~ s/\n$//r ),
*   *
INPUT
    <<'EXPECTED' =~ s/\n$//r,
*1 1*
EXPECTED
    "horizontal line, mines at edges",
); # end: e359820f-bb8b-4eda-8762-47b64dba30a6

is( # begin: c5198b50-804f-47e9-ae02-c3b42f7ce3ab
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
); # end: c5198b50-804f-47e9-ae02-c3b42f7ce3ab

is( # begin: 0c79a64d-703d-4660-9e90-5adfa5408939
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
); # end: 0c79a64d-703d-4660-9e90-5adfa5408939

is( # begin: 4b098563-b7f3-401c-97c6-79dd1b708f34
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
); # end: 4b098563-b7f3-401c-97c6-79dd1b708f34

is( # begin: 04a260f1-b40a-4e89-839e-8dd8525abe0e
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
); # end: 04a260f1-b40a-4e89-839e-8dd8525abe0e

done_testing;
