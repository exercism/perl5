# Exercism Perl Track

Exercism exercises in Perl

## Dependencies

Each exercise has its own cpanfile (if necessary) for any dependencies it might have.
Other dependencies can be found in and installed with the top level cpanfile.

It is recommended to use [Carton].
Install the Carton module, run `carton install` to install the dependencies from the cpanfile, then prepend `carton exec` to your commands to include the locally installed dependencies.

## Adding/Updating an Exercise

Each exercise should have a `template-data.yaml` file inside a directory named `.meta` (please add one if the exercise does not have one yet).
This is used by the `exercise-gen.pl` script in the `bin` directory to generate the module and test for an exercise.
Documentation for the generator can be found in the `bin` directory.

## Testing the Tests

The Exercism system allows us to have example implementations in the directory of each exercise.

If they are in the `.meta` directory they won't be copied to the users. (which is a good thing).

### Testing All the Exercises

Run the full tests with

    prove -r exercises/practice/*/.meta/solutions

### Testing a Single Exercise

If a test is run as

    prove exercises/example-exercise/.meta/solutions/example-exercise.t

the test will run using the example in the `.meta/solutions` directory.

## Contributing Guide

Please see the [contributing guide] for information from Exercism.
When editing Markdown files in this repository, please use one line &harr; one sentence.

### Perl icon

Perl 5 camel from [perl-assets](https://github.com/metacpan/perl-assets/), 
license [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/)

[Carton]: https://metacpan.org/pod/Carton
[contributing guide]: https://exercism.org/docs/building
[Exercism problem specification]: https://github.com/exercism/problem-specifications
[Perl Foundation]: https://www.perlfoundation.org/
