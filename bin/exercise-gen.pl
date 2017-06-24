#!/usr/bin/env perl
use feature qw(lexical_subs say);
use YAML 'LoadFile';
use JSON::PP 'decode_json';
use Data::Dump 'pp';
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
    say 'example.yaml not found; exiting.';
    exit;
  }
}

for my $exercise (@exercises) {
  my $exercise_dir = $base_dir->child("exercises/$exercise");
  my $yaml = $exercise_dir->child('example.yaml');
  unless ($yaml->is_file) {
    say "No example.yaml found for $exercise.";
    next;
  }
  print "Generating $exercise... ";

  my $data = LoadFile $yaml;

  my $cdata = $base_dir->child("x-common/exercises/$exercise/canonical-data.json");
  if ($cdata->is_file) {
    $data->{cdata}{json} = $cdata->slurp;
    $data->{cdata}{perl} = pp decode_json($data->{cdata}{json});
  }

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
