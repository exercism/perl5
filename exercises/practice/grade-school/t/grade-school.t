#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib "$Bin/../lib", "$Bin/../local/lib/perl5";

use GradeSchool ();

my $grade_school;

$grade_school = GradeSchool->new; # begin: a3f0fb58-f240-4723-8ddc-e644666b85cc
is(
    $grade_school->roster,
    [],
    "Roster is empty when no student is added",
); # end: a3f0fb58-f240-4723-8ddc-e644666b85cc

$grade_school = GradeSchool->new; # begin: 9337267f-7793-4b90-9b4a-8e3978408824
is(
    $grade_school->add( "Aimee", 2 ),
    T,
    "Add a student",
); # end: 9337267f-7793-4b90-9b4a-8e3978408824

$grade_school = GradeSchool->new; # begin: 6d0a30e4-1b4e-472e-8e20-c41702125667
$grade_school->add( "Aimee", 2 );
is(
    $grade_school->roster,
    ["Aimee"],
    "Student is added to the roster",
); # end: 6d0a30e4-1b4e-472e-8e20-c41702125667

$grade_school = GradeSchool->new; # begin: 73c3ca75-0c16-40d7-82f5-ed8fe17a8e4a
is(
    $grade_school->add( "Blair", 2 ),
    T,
    "Adding multiple students in the same grade in the roster",
);
is(
    $grade_school->add( "James", 2 ),
    T,
    "Adding multiple students in the same grade in the roster",
);
is(
    $grade_school->add( "Paul", 2 ),
    T,
    "Adding multiple students in the same grade in the roster",
); # end: 73c3ca75-0c16-40d7-82f5-ed8fe17a8e4a

$grade_school = GradeSchool->new; # begin: 233be705-dd58-4968-889d-fb3c7954c9cc
$grade_school->add( "Blair", 2 );
$grade_school->add( "James", 2 );
$grade_school->add( "Paul",  2 );
is(
    $grade_school->roster,
    [ "Blair", "James", "Paul" ],
    "Multiple students in the same grade are added to the roster",
); # end: 233be705-dd58-4968-889d-fb3c7954c9cc

$grade_school = GradeSchool->new; # begin: 87c871c1-6bde-4413-9c44-73d59a259d83
is(
    $grade_school->add( "Blair", 2 ),
    T,
    "Cannot add student to same grade in the roster more than once",
);
is(
    $grade_school->add( "James", 2 ),
    T,
    "Cannot add student to same grade in the roster more than once",
);
is(
    $grade_school->add( "James", 2 ),
    DF,
    "Cannot add student to same grade in the roster more than once",
);
is(
    $grade_school->add( "Paul", 2 ),
    T,
    "Cannot add student to same grade in the roster more than once",
); # end: 87c871c1-6bde-4413-9c44-73d59a259d83

$grade_school = GradeSchool->new; # begin: d7982c4f-1602-49f6-a651-620f2614243a
$grade_school->add( "Blair", 2 );
$grade_school->add( "James", 2 );
$grade_school->add( "James", 2 );
$grade_school->add( "Paul",  2 );
is(
    $grade_school->roster,
    [ "Blair", "James", "Paul" ],
    "Student not added to same grade in the roster more than once",
); # end: d7982c4f-1602-49f6-a651-620f2614243a

$grade_school = GradeSchool->new; # begin: e70d5d8f-43a9-41fd-94a4-1ea0fa338056
is(
    $grade_school->add( "Chelsea", 3 ),
    T,
    "Adding students in multiple grades",
);
is(
    $grade_school->add( "Logan", 7 ),
    T,
    "Adding students in multiple grades",
); # end: e70d5d8f-43a9-41fd-94a4-1ea0fa338056

$grade_school = GradeSchool->new; # begin: 75a51579-d1d7-407c-a2f8-2166e984e8ab
$grade_school->add( "Chelsea", 3 );
$grade_school->add( "Logan",   7 );
is(
    $grade_school->roster,
    [ "Chelsea", "Logan" ],
    "Students in multiple grades are added to the roster",
); # end: 75a51579-d1d7-407c-a2f8-2166e984e8ab

$grade_school = GradeSchool->new; # begin: 7df542f1-57ce-433c-b249-ff77028ec479
is(
    $grade_school->add( "Blair", 2 ),
    T,
    "Cannot add same student to multiple grades in the roster",
);
is(
    $grade_school->add( "James", 2 ),
    T,
    "Cannot add same student to multiple grades in the roster",
);
is(
    $grade_school->add( "James", 3 ),
    DF,
    "Cannot add same student to multiple grades in the roster",
);
is(
    $grade_school->add( "Paul", 3 ),
    T,
    "Cannot add same student to multiple grades in the roster",
); # end: 7df542f1-57ce-433c-b249-ff77028ec479

$grade_school = GradeSchool->new; # begin: c7ec1c5e-9ab7-4d3b-be5c-29f2f7a237c5
$grade_school->add( "Blair", 2 );
$grade_school->add( "James", 2 );
$grade_school->add( "James", 3 );
$grade_school->add( "Paul",  3 );
is(
    $grade_school->roster,
    [ "Blair", "James", "Paul" ],
    "Student not added to multiple grades in the roster",
); # end: c7ec1c5e-9ab7-4d3b-be5c-29f2f7a237c5

$grade_school = GradeSchool->new; # begin: d9af4f19-1ba1-48e7-94d0-dabda4e5aba6
$grade_school->add( "Jim",   3 );
$grade_school->add( "Peter", 2 );
$grade_school->add( "Anna",  1 );
is(
    $grade_school->roster,
    [ "Anna", "Peter", "Jim" ],
    "Students are sorted by grades in the roster",
); # end: d9af4f19-1ba1-48e7-94d0-dabda4e5aba6

$grade_school = GradeSchool->new; # begin: d9fb5bea-f5aa-4524-9d61-c158d8906807
$grade_school->add( "Peter", 2 );
$grade_school->add( "Zoe",   2 );
$grade_school->add( "Alex",  2 );
is(
    $grade_school->roster,
    [ "Alex", "Peter", "Zoe" ],
    "Students are sorted by name in the roster",
); # end: d9fb5bea-f5aa-4524-9d61-c158d8906807

$grade_school = GradeSchool->new; # begin: 180a8ff9-5b94-43fc-9db1-d46b4a8c93b6
$grade_school->add( "Peter",   2 );
$grade_school->add( "Anna",    1 );
$grade_school->add( "Barb",    1 );
$grade_school->add( "Zoe",     2 );
$grade_school->add( "Alex",    2 );
$grade_school->add( "Jim",     3 );
$grade_school->add( "Charlie", 1 );
is(
    $grade_school->roster,
    [ "Anna", "Barb", "Charlie", "Alex", "Peter", "Zoe", "Jim" ],
    "Students are sorted by grades and then by name in the roster",
); # end: 180a8ff9-5b94-43fc-9db1-d46b4a8c93b6

$grade_school = GradeSchool->new; # begin: 5e67aa3c-a3c6-4407-a183-d8fe59cd1630
is(
    $grade_school->roster(1),
    [],
    "Grade is empty if no students in the roster",
); # end: 5e67aa3c-a3c6-4407-a183-d8fe59cd1630

$grade_school = GradeSchool->new; # begin: 1e0cf06b-26e0-4526-af2d-a2e2df6a51d6
$grade_school->add( "Peter", 2 );
$grade_school->add( "Zoe",   2 );
$grade_school->add( "Alex",  2 );
$grade_school->add( "Jim",   3 );
is(
    $grade_school->roster(1),
    [],
    "Grade is empty if no students in that grade",
); # end: 1e0cf06b-26e0-4526-af2d-a2e2df6a51d6

$grade_school = GradeSchool->new; # begin: 2bfc697c-adf2-4b65-8d0f-c46e085f796e
$grade_school->add( "Blair", 2 );
$grade_school->add( "James", 2 );
$grade_school->add( "James", 2 );
$grade_school->add( "Paul",  2 );
is(
    $grade_school->roster(2),
    [ "Blair", "James", "Paul" ],
    "Student not added to same grade more than once",
); # end: 2bfc697c-adf2-4b65-8d0f-c46e085f796e

$grade_school = GradeSchool->new; # begin: 66c8e141-68ab-4a04-a15a-c28bc07fe6b9
$grade_school->add( "Blair", 2 );
$grade_school->add( "James", 2 );
$grade_school->add( "James", 3 );
$grade_school->add( "Paul",  3 );
is(
    $grade_school->roster(2),
    [ "Blair", "James" ],
    "Student not added to multiple grades",
); # end: 66c8e141-68ab-4a04-a15a-c28bc07fe6b9

$grade_school = GradeSchool->new; # begin: c9c1fc2f-42e0-4d2c-b361-99271f03eda7
$grade_school->add( "Blair", 2 );
$grade_school->add( "James", 2 );
$grade_school->add( "James", 3 );
$grade_school->add( "Paul",  3 );
is(
    $grade_school->roster(3),
    ["Paul"],
    "Student not added to other grade for multiple grades",
); # end: c9c1fc2f-42e0-4d2c-b361-99271f03eda7

$grade_school = GradeSchool->new; # begin: 1bfbcef1-e4a3-49e8-8d22-f6f9f386187e
$grade_school->add( "Franklin", 5 );
$grade_school->add( "Bradley",  5 );
$grade_school->add( "Jeff",     1 );
is(
    $grade_school->roster(5),
    [ "Bradley", "Franklin" ],
    "Students are sorted by name in a grade",
); # end: 1bfbcef1-e4a3-49e8-8d22-f6f9f386187e

done_testing;
