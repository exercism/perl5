# Introduction

Perl is a programming language created by Larry Wall, first released in 1987.

## Variables

There are scalar (`$foo`), array (`@bar`), and hash (`%baz`) variables.
They can be in the lexical scope (`my $foo`) or package scope (`our $foo`).
There are other ways of declaring variables which won't be covered here.

To keep things simple, only scalar variables will be used here.
A scalar is either a string, a number, or a [reference][perlreftut] to something.

## Subroutines

The `sub` keyword declares a [subroutine][perlsub].
Recent versions of Perl allow you to specify formal parameters in a [signature][perlsubsig].
Older versions of Perl would require retrieving the arguments from the special variable `@_`.

[perldata]: https://perldoc.pl/perldata
[perlreftut]: https://perldoc.pl/perlreftut
[perlsub]: https://perldoc.pl/perlsub
[perlsubsig]: https://perldoc.pl/perlsub#Signatures
