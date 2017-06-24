The `exercise-gen.pl` file can be used in the following ways:
* From within the directory of the exercise you wish to generate a test for.
* With arguments specifying which exercises you want to generate tests for.  
  e.g. `./exercise-gen.pl hello-world leap`.
* With the argument `--all` to run the generator for all exercises.  
  i.e `./exercise-gen.pl --all`

You will either need to create a symlink to or clone the
[x-common](https://github.com/exercism/x-common) repository
into the root directory of this repository.
The generator will retrieve data from an `example.yaml` file within
each exercise directory, and use the contained information to generate
test files using `templates/test.mustache`, and Example.pm files using
`templates/module.mustache`. If it finds a `canonical-data.json` file in
`x-common` for the exercise in question it will be included.

Example of a yaml file:
```yaml
exercise: MyExercise
version: 1
plan: 2
modules:
  - use: Data::Dump
  - use: Foo::Bar
subs: 'my_subroutine'
tests: |-
  ok my_subroutine, 'Perl 5 code here';
  pass;

example: |-
  sub my_subroutine {
    1;
  }
```
Run `cpanm --installdeps .` to install the required modules in `cpanfile`.
