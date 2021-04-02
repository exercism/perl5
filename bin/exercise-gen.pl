#!/usr/bin/env perl
use strict;
use warnings;
use feature qw<say>;

use YAML qw<LoadFile>;
use Path::Tiny qw<:DEFAULT cwd>;

use lib::gitroot qw<:lib :once>;
use Exercism::Generator;

use constant BASE_DIR => path(GIT_ROOT);

if ( !BASE_DIR->child('.problem-specifications')->is_dir ) {
  warn
    "`.problem-specifications` directory not found; exercise(s) may generate incorrectly.\n";
}

my @exercises;

if (@ARGV) {
  my %arg_set = map { $_ => 1 } @ARGV;
  if ( $arg_set{'--all'} ) {
    push @exercises, $_->basename
      for BASE_DIR->child( 'exercises', 'practice' )->children;
  }
  else {
    @exercises = keys %arg_set;
  }
}
else {
  say 'No args given; working in current directory.';
  if ( path( '.meta', 'exercise-data.yaml' )->is_file ) {
    push @exercises, cwd->basename;
  }
  else {
    say
      '.meta/exercise-data.yaml not found in current directory; exiting.';
    exit 1;
  }
}

my ( @dir_not_found, @data_not_found );
for my $exercise (@exercises) {
  my $exercise_dir
    = BASE_DIR->child( 'exercises', 'practice', $exercise );
  my $yaml = $exercise_dir->child( '.meta', 'exercise-data.yaml' );

  unless ( $exercise_dir->is_dir ) {
    push @dir_not_found, $exercise;
    next;
  }
  unless ( $yaml->is_file ) {
    push @data_not_found, $exercise;
    next;
  }
  print "Generating $exercise... ";

  Exercism::Generator->new( exercise => $exercise )->create_files;

  say 'Generated.';
}

if (@dir_not_found) {
  warn 'exercise directory does not exist for: '
    . join( q| |, @dir_not_found ) . "\n";
}
if (@data_not_found) {
  warn '.meta/exercise-data.yaml not found for: '
    . join( q| |, @data_not_found ) . "\n";
}
