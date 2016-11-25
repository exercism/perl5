#!/usr/bin/env perl
use warnings;
use strict;

use Test::More tests => 9;
use FindBin;
my $dir;
BEGIN { $dir = $FindBin::Bin . '/' };
use lib $dir;

my $module = $ENV{EXERCISM} ? 'Example' : 'GradeSchool';

use_ok($module) or BAIL_OUT "You need to create a module called $module.pm";

sub new_school {
  no strict 'refs';
  $module->new();
};

is_deeply new_school, {}, 'empty school';

for (1) {
  my $school = new_school;
  $school->add('Aimee', 2);
  is_deeply $school, {2 => ['Aimee']}, 'add student';
}

for (1) {
  my $school = new_school;
  $school->add($_, 2) for qw(Blair James Paul);
  is_deeply $school, {2 => ['Blair', 'James', 'Paul']}, 'add more students';
}

for (1) {
  my $school = new_school;
  $school->add('Chelsea', 3);
  $school->add('Logan', 7);
  is_deeply $school, { 3 => ['Chelsea'], 7 => ['Logan'] }, 'add students to different grades';
}

for (1) {
  my $school = new_school;
  $school->add($_, 5) for 'Bradley', 'Franklin';
  $school->add('Jeff', 1);
  is_deeply $school->grade(5), ['Bradley', 'Franklin'], 'get students in a grade';
}

for (1) {
  my $school = new_school;
  $school->add($_, 5) for 'Franklin', 'Bradley';
  $school->add('Jeff', 1);
  is_deeply $school->grade(5), ['Bradley', 'Franklin'], 'get students sorted in a grade';
}

is_deeply new_school->grade(1), [], 'get students in a non-existant grade';

for (1) {
  my $school = new_school;
  $school->add('Jennifer', 4);
  $school->add('Kareem', 6);
  $school->add('Christopher', 4);
  $school->add('Kyle', 3);

  is_deeply $school, { 3 => ['Kyle'], 4 => ['Christopher', 'Jennifer'], 6 => ['Kareem'] }, 'sort school';
}
