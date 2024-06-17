# About

Perl is a programming language created by Larry Wall, first released in 1987.

## Packages and Modules

A package is a collection of code, often contained within a module file of the same name with the `.pm` extension.
The module can then be imported into another file, typically with the `use` keyword.

```perl
# Foo.pm
package Foo;

# Accessible with `Foo::bar` when module is used
# or just `bar` if the subroutine is exported.
sub bar () {
    return 1;
}
```

## Variables

There are scalar (`$foo`), array (`@bar`), and hash (`%baz`) variables.
To keep things simple, only scalar variables will be used here.
A scalar value can be the following: a string, a number, a boolean, or a [reference][perlreftut] to something.
The absence of a value is `undef`.


The keywords `my` and `our` will declare a variable in the lexical scope e.g. `my $foo;`.
With `our`, the variable will also be aliased to a package variable of the same name.
There are other ways of declaring variables which won't be covered here.

You can assign a variable with the `=` operator e.g `$foo = 1;`, which can be done at the same time as declaring the variable e.g. `my $foo = 1;`.

```perl
package Foo;

sub baz () {
    our $bar = 1; # Sets both $bar and $Foo::bar as 1.
    return $bar;
}

$Foo::bar = 2; # $bar is not accessible here, but $Foo::bar is.

# Both of these will print 1.
say baz;
say $Foo::bar;
```

## Subroutines

The `sub` keyword declares a [subroutine][perlsub].
The `return` keyword exits the subroutine, giving the specified values, or an empty list if nothing is given.
Without a specified `return`, the returned value will be determined by the context (scalar, list, or void) of the used subroutine and its final statement.

```perl
sub hello () {
    return 'Hello, World!';
}
```

Recent versions of Perl allow you to specify formal parameters in a [signature][perlsubsig].
The parameter list can contain scalar, array, or hash variables.
An empty parameter list means the subroutine accepts zero arguments.
Older versions of Perl would require retrieving the arguments from the special variable `@_`, which won't be covered here.

## Comments

Comments in Perl start with a `#` that is not part of a string, and finish at the end of the line.

[perldata]: https://perldoc.pl/perldata
[perlreftut]: https://perldoc.pl/perlreftut
[perlsub]: https://perldoc.pl/perlsub
[perlsubsig]: https://perldoc.pl/perlsub#Signatures
