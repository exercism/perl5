# Readme

The `exercise-gen.pl` file can be used in the following ways:
* From within the directory of the exercise you wish to generate a test for.
* With arguments specifying which exercises you want to generate tests for.
  e.g. `./exercise-gen.pl hello-world leap`.
* With the argument `--all` to run the generator for all exercises.
  i.e `./exercise-gen.pl --all`

You will need to sync the exercise data using Exercism's configlet script.
The generator will retrieve data from `.meta/template-data.yaml` within each exercise directory, and use the contained information to generate test files using `templates/test.mustache`, and `.pm` files using `templates/module.mustache`.
If it finds a `canonical-data.json` file for the exercise in question (via `bin/configlet sync`), the data can be used to generate tests for each `property` found in this data.

Example of a yaml file:
```yaml
modules:
  - use: Data::Dump
  - use: Foo::Bar

# For exports
subs: 'foo bar'

# This is a string containing Perl code, to be inserted before any properties
tests: |-
  my $baz;

# Each JSON test case is decoded and stored in variable `$case`.
# The goal is to create a string of Perl code inserted into a template.
properties:
  foo:
    test: |-
      sprintf(<<'END', $case->{input}{data}, $case->{expected}, $case->{description});
      is(
          foo( %s ),
          %s,
          '%s',
      );
      END

  bar:
    test: |-
      sprintf(<<'END', $case->{input}{data}, $case->{expected}, $case->{description});
      is(
          bar( %s ),
          %s,
          '%s',
      );
      END

# The module we use to check the tests work.
example: |-
  sub foo {
      return 1;
  }

  sub bar {
      return 2;
  }

# The module the student receives to work on
stub: |-
  sub foo {
      return undef;
  }

  sub bar {
      return undef;
  }
```
