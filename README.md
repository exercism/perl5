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
## License
The MIT License (MIT)

Copyright (c) 2014 Katrina Owen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
