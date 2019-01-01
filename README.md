# Exercism Perl 5 Track

[![Gitter](https://badges.gitter.im/exercism/xperl.svg)](https://gitter.im/exercism/perl?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

Exercism exercises in Perl 5

## Dependencies

The tests depend on the following modules:

    DateTime
    List::MoreUtils
    Test2::Tools::Exception
    Path::Tiny (for generator tests)
    Template::Mustache (for generator tests)
    YAML (for generator tests)

## Testing the Tests

The Exercism system allows us to have example implementations in the directory
of each exercise.

If they are in the `.meta` directory they won't be copied to the users. (which is a good thing).

### Testing All the Exercises

Run the full tests with

    prove -r exercises/*/.meta/solutions

### Testing a Single Exercise

If a test is run as

    prove exercises/example-exercise/.meta/solutions/example-exercise.t

the test will run using the example in the `.meta/solutions` directory.

## Contributing Guide

Please see the [contributing guide](https://github.com/exercism/docs/blob/master/contributing-to-language-tracks/README.md)

### Perl 5 icon

The onion is the logo of the Perl Foundation.
It is trademarked, and we have adapted it--changing the color--with their permission.
The Perl Foundation does not support or endorse Exercism.
