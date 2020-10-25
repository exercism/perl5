# Exercism Perl 5 Track

Exercism exercises in Perl 5

## Getting started

- Clone this repository
- `git submodule update --init --recursive`.  This will pull in the [Exercism problem specification] repository.

## Dependencies

Each exercise has its own cpanfile (if necessary) for any dependencies it might have.
Other dependencies can be found in and installed with the top level cpanfile.

It is recommended to use [Carton].
Install the Carton module, run `carton install` to install the dependencies from the cpanfile, then prepend `carton exec` to your commands to include the locally installed dependencies.

## Adding/Updating an Exercise

Each exercise should have an `exercise-data.yaml` file inside a directory named `.meta` (please add one if the exercise does not have one yet).
This is used by the `exercise-gen.pl` script in the `bin` directory to generate the module and test for an exercise.
Documentation for the generator can be found in the `bin` directory.

If the [Exercism problem specification] for the exercise has been updated, run

    git submodule update --recursive --remote --checkout --force
    git add problem-specifications

to update the submodule to the latest.

## Testing the Tests

The Exercism system allows us to have example implementations in the directory of each exercise.

If they are in the `.meta` directory they won't be copied to the users. (which is a good thing).

### Testing All the Exercises

Run the full tests with

    prove -r exercises/*/.meta/solutions

### Testing a Single Exercise

If a test is run as

    prove exercises/example-exercise/.meta/solutions/example-exercise.t

the test will run using the example in the `.meta/solutions` directory.

## Contributing Guide

Please see the [contributing guide] for information from Exercism.
When editing Markdown files in this repository, please use one line &harr; one sentence.

### Perl 5 icon

The onion is the logo of the [Perl Foundation].
It is trademarked, and we have adapted it--changing the color--with their permission.
The Perl Foundation does not support or endorse Exercism.

[Carton]: https://metacpan.org/pod/Carton
[contributing guide]: https://github.com/exercism/docs/blob/master/contributing-to-language-tracks/README.md
[Exercism problem specification]: https://github.com/exercism/problem-specifications
[Perl Foundation]: https://www.perlfoundation.org/
