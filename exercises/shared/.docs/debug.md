# Debug

When a test fails, a message is displayed describing what went wrong.
If you would like additional output, you can use the subroutine `::YYY()` around the code you would like to inspect.
(`::` is a shortcut for `main::`).
This subroutine is part of the [XXX][XXX] module.

You may also simply print a message using the `say` function, e.g., `say 'Hello, World!';`.

The online test runner uses the [Test Anything Protocol][TAP].
Due to the nature of TAP, the use of `print` in the online test runner is strongly discouraged.

[XXX]: https://metacpan.org/dist/XXX/view/lib/XXX.pod
[TAP]: https://testanything.org/
