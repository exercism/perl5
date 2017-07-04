#!/usr/bin/env perl
use feature qw(lexical_subs say);
use YAML 'LoadFile';
use Path::Tiny qw(:DEFAULT cwd);
use Template::Mustache 'render';

my $base_dir = path($0)->realpath->parent->parent;
my @exercises;

if (@ARGV) {
  if ($ARGV[0] eq '--all') {
    push @exercises, $_->basename foreach $base_dir->child('exercises')->children;
  } else {
    @exercises = @ARGV;
  }
} else {
  say 'No args given; working in current directory.';
  if ( path('example.yaml')->is_file ) {
    push @exercises, cwd->basename;
  } else {
    say 'example.yaml not found in current directory; exiting.';
    exit;
  }
}

my @dir_not_found;
my @yaml_not_found;
for my $exercise (@exercises) {
  my $exercise_dir = $base_dir->child("exercises/$exercise");
  my $yaml = $exercise_dir->child('example.yaml');

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

  my $cdata = $base_dir->child("problem-specifications/exercises/$exercise/canonical-data.json");
  if ($cdata->is_file) {$data->{cdata}{json} = $cdata->slurp}

  my sub create_file {
    my ($filename, $template) = @_;
    my $file = $exercise_dir->child($filename);
    $file->spew(Template::Mustache->render(
      $base_dir->child("templates/$template.mustache")->slurp, $data
    ));
    $file->chmod(0755) if $template eq 'test';
  }

  create_file("$exercise.t", 'test');

  $data->{module_file} = $data->{example};
  create_file(qw{Example.pm module});

  $data->{module_file} = $data->{stub};
  create_file($data->{exercise}.'.pm', 'module');

  say 'Generated.';
}

if (@dir_not_found)  {warn 'exercise directory does not exist for: ' . join ' ', @dir_not_found}
if (@yaml_not_found) {warn 'example.yaml not found for: ' . join ' ', @yaml_not_found}
