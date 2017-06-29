## Run All Tests

There is a Perl 5 script with the extension `.t`, which will be used to test
your solution. You can run through the tests by using the command:

`prove .`

Before you start the exercise, the output will likely look something like:

```
./hello-world.t .. 1/4
#   Failed test 'Say Hi!'
#   at ./hello-world.t line 33.
#          got: undef
#     expected: 'Hello, World!'
# Looks like you failed 1 test of 4.
./hello-world.t .. Dubious, test returned 1 (wstat 256, 0x100)
Failed 1/4 subtests
	(less 1 skipped subtest: 2 okay)

Test Summary Report
-------------------
./hello-world.t (Wstat: 256 Tests: 4 Failed: 1)
  Failed test:  3
  Non-zero exit status: 1
Files=1, Tests=4,  0 wallclock secs ( 0.03 usr  0.00 sys +  0.08 cusr  0.01 csys =  0.12 CPU)
Result: FAIL
```
You will either need to modify or create a module with the extension `.pm`, and
write a solution to pass the tests. Once the tests are passing, the output from
the command above will likely look something like:

```
./hello-world.t .. ok
All tests successful.
Files=1, Tests=4,  1 wallclock secs ( 0.01 usr  0.00 sys +  0.49 cusr  0.06 csys =  0.56 CPU)
Result: PASS
```

Some exercises may have optional tests. You can test for these by adding the
flag `-v` (for 'verbose') to the above command, like so:

`prove . -v`

As well as showing optional tests, it will include all of the tests that your solution currently passes.

You can find a more in-depth explanation of the `Test::More` module on
[perldoc](http://perldoc.perl.org/Test/More.html#I%27m-ok%2c-you%27re-not-ok.).
