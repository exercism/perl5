#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(lexical_subs say);
use YAML 'LoadFile';
use Path::Tiny qw(:DEFAULT cwd);
use FindBin;
use lib "$FindBin::Bin/../lib";
use Exercism::Generator 'BASE_DIR';

my @exercises;

if (@ARGV) {
  my %arg_set = map {$_ => 1} @ARGV;
  if ($arg_set{'--all'}) {
    push @exercises, $_->basename foreach BASE_DIR->child('exercises')->children;
  } else {
    @exercises = keys %arg_set;
  }
} else {
  say 'No args given; working in current directory.';
  if ( path('.meta/exercise-data.yaml')->is_file ) {
    push @exercises, cwd->basename;
  } else {
    say '.meta/exercise-data.yaml not found in current directory; exiting.';
    exit;
  }
}

my @dir_not_found;
my @yaml_not_found;
for my $exercise (@exercises) {
  my $exercise_dir = BASE_DIR->child("exercises/$exercise");
  my $yaml = $exercise_dir->child('.meta/exercise-data.yaml');

  unless ($exercise_dir->is_dir) {
    push @dir_not_found, $exercise;
    next;
  }
  unless ($yaml->is_file) {
    push @yaml_not_found, $exercise;
    next;
  }
  print "Generating $exercise... ";

  my $data = LoadFile $yaml;
  my $generator = Exercism::Generator->new({exercise => $exercise, data => $data});
  $exercise_dir->child("$exercise.t")->spew($generator->test);
  $exercise_dir->child("$exercise.t")->chmod(0755);
  $exercise_dir->child('.meta/solutions/'.$data->{exercise}.'.pm')->spew($generator->example);
  $exercise_dir->child($data->{exercise}.'.pm')->spew($generator->stub);

  say 'Generated.';
}

if (@dir_not_found)  {warn 'exercise directory does not exist for: '  . join(q| |, @dir_not_found)  . "\n"}
if (@yaml_not_found) {warn '.meta/exercise-data.yaml not found for: ' . join(q| |, @yaml_not_found) . "\n"}
