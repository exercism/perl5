# xPerl5

Exercism exercises in Perl 5

## Testing the Tests

When the tests are run they expect a module with some real name (e.g. Anagram.pm)
but the Exercism system allows us to have example implementations in the directory
of each exercise.

If they are called /*example.*/i they won't be copied to the users. (which is a good thing).

So the sample solutions are all called Example.pm.

Each test file will look for the appropriate module name, but if the test are run as

   EXERCISM=1 perl file.t

then they will expect a file called Example.pm

## Contributing Guide

Please see the [contributing guide](https://github.com/exercism/x-api/blob/master/CONTRIBUTING.md#the-exercise-data)

## License

The MIT License (MIT)

Copyright (c) 2014 Katrina Owen, _@kytrinyx.com

### Perl 5 icon
The onion is the logo of the Perl Foundation.
It is trademarked, and we have adapted it--changing the color--with their permission.
The Perl Foundation does not support or endorse Exercism.
