# Tests

## Run All Tests

There is a Perl script with the extension `.t` contained in the `t/` directory, which will be used to testyour solution.
You can run through the tests by using the command:

`prove`

Before you start the exercise, the output will likely look something like:

```
./t/hello-world.t .. 1/2
# Failed test 'Say Hi!'
# at exercises/hello-world/t/hello-world.t line 15.
# +---------+---------------+
# | GOT     | CHECK         |
# +---------+---------------+
# | <UNDEF> | Hello, World! |
# +---------+---------------+
exercises/hello-world/t/hello-world.t .. Dubious, test returned 1 (wstat 256, 0x100)
Failed 1/2 subtests

Test Summary Report
-------------------
./t/hello-world.t (Wstat: 256 Tests: 2 Failed: 1)
  Failed test:  2
  Non-zero exit status: 1
Files=1, Tests=2,  0 wallclock secs ( 0.03 usr  0.00 sys +  0.18 cusr  0.02 csys =  0.23 CPU)
Result: FAIL
```

You will need to modify the module with the extension `.pm`, contained in the `lib/` directory, and write a solution to pass the tests.
Once the tests are passing, the output from the command above will likely look something like:

```
./t/hello-world.t .. ok
All tests successful.
Files=1, Tests=2,  0 wallclock secs ( 0.02 usr  0.00 sys +  0.07 cusr  0.01 csys =  0.10 CPU)
Result: PASS
```

Documentation about the assertions used in the test files can be found in [Test2::Manual::Testing::Introduction][test2-manual].
You can find a more in-depth explanation of `Test2` on [perldoc][test2].

[test2-manual]: https://metacpan.org/pod/Test2::Manual::Testing::Introduction
[test2]: https://perldoc.pl/Test2
