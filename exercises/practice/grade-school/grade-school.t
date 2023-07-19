#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use GradeSchool ();

my $grade_school;

$grade_school = GradeSchool->new;
is(
    $grade_school->roster,
    [],
    "Roster is empty when no student is added",
);

$grade_school = GradeSchool->new;
is(
    $grade_school->add( "Aimee", 2 ),
    T,
    "Add a student",
);

$grade_school = GradeSchool->new;
$grade_school->add( "Aimee", 2 );
is(
    $grade_school->roster,
    ["Aimee"],
    "Student is added to the roster",
);

$grade_school = GradeSchool->new;
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
);

$grade_school = GradeSchool->new;
$grade_school->add( "Blair", 2 );
$grade_school->add( "James", 2 );
$grade_school->add( "Paul",  2 );
is(
    $grade_school->roster,
    [ "Blair", "James", "Paul" ],
    "Multiple students in the same grade are added to the roster",
);

$grade_school = GradeSchool->new;
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
);

$grade_school = GradeSchool->new;
$grade_school->add( "Blair", 2 );
$grade_school->add( "James", 2 );
$grade_school->add( "James", 2 );
$grade_school->add( "Paul",  2 );
is(
    $grade_school->roster,
    [ "Blair", "James", "Paul" ],
    "Student not added to same grade in the roster more than once",
);

$grade_school = GradeSchool->new;
is(
    $grade_school->add( "Chelsea", 3 ),
    T,
    "Adding students in multiple grades",
);
is(
    $grade_school->add( "Logan", 7 ),
    T,
    "Adding students in multiple grades",
);

$grade_school = GradeSchool->new;
$grade_school->add( "Chelsea", 3 );
$grade_school->add( "Logan",   7 );
is(
    $grade_school->roster,
    [ "Chelsea", "Logan" ],
    "Students in multiple grades are added to the roster",
);

$grade_school = GradeSchool->new;
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
);

$grade_school = GradeSchool->new;
$grade_school->add( "Blair", 2 );
$grade_school->add( "James", 2 );
$grade_school->add( "James", 3 );
$grade_school->add( "Paul",  3 );
is(
    $grade_school->roster,
    [ "Blair", "James", "Paul" ],
    "Student not added to multiple grades in the roster",
);

$grade_school = GradeSchool->new;
$grade_school->add( "Jim",   3 );
$grade_school->add( "Peter", 2 );
$grade_school->add( "Anna",  1 );
is(
    $grade_school->roster,
    [ "Anna", "Peter", "Jim" ],
    "Students are sorted by grades in the roster",
);

$grade_school = GradeSchool->new;
$grade_school->add( "Peter", 2 );
$grade_school->add( "Zoe",   2 );
$grade_school->add( "Alex",  2 );
is(
    $grade_school->roster,
    [ "Alex", "Peter", "Zoe" ],
    "Students are sorted by name in the roster",
);

$grade_school = GradeSchool->new;
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
);

$grade_school = GradeSchool->new;
is(
    $grade_school->roster(1),
    [],
    "Grade is empty if no students in the roster",
);

$grade_school = GradeSchool->new;
$grade_school->add( "Peter", 2 );
$grade_school->add( "Zoe",   2 );
$grade_school->add( "Alex",  2 );
$grade_school->add( "Jim",   3 );
is(
    $grade_school->roster(1),
    [],
    "Grade is empty if no students in that grade",
);

$grade_school = GradeSchool->new;
$grade_school->add( "Blair", 2 );
$grade_school->add( "James", 2 );
$grade_school->add( "James", 2 );
$grade_school->add( "Paul",  2 );
is(
    $grade_school->roster(2),
    [ "Blair", "James", "Paul" ],
    "Student not added to same grade more than once",
);

$grade_school = GradeSchool->new;
$grade_school->add( "Blair", 2 );
$grade_school->add( "James", 2 );
$grade_school->add( "James", 3 );
$grade_school->add( "Paul",  3 );
is(
    $grade_school->roster(2),
    [ "Blair", "James" ],
    "Student not added to multiple grades",
);

$grade_school = GradeSchool->new;
$grade_school->add( "Blair", 2 );
$grade_school->add( "James", 2 );
$grade_school->add( "James", 3 );
$grade_school->add( "Paul",  3 );
is(
    $grade_school->roster(3),
    ["Paul"],
    "Student not added to other grade for multiple grades",
);

$grade_school = GradeSchool->new;
$grade_school->add( "Franklin", 5 );
$grade_school->add( "Bradley",  5 );
$grade_school->add( "Jeff",     1 );
is(
    $grade_school->roster(5),
    [ "Bradley", "Franklin" ],
    "Students are sorted by name in a grade",
);

done_testing;
