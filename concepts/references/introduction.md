# Introduction

Understanding references is a fundamental element to using Perl effectively.
Since references are scalars, and arrays and hashes can only contain scalars, references are key to nesting these data structures.

References can be created for existing variables and subroutines by using the backslash operator `\`:

* `\$scalar` to create a scalar reference (this can be any scalar, e.g., `\1`, not just a variable).
* `\@array` to create an array reference.
* `\%hash` to create a hash reference.
* `\&sub` to create a code reference.

You can also create what is known as an anonymous reference for arrays, hashes, and subroutines:

* `['Alice', 'Bob', 'Charlie']` to create an anonymous array reference.
* `{foo => 'a', bar => 'b', baz => 'c'}` to create an anonymous hash reference.
* `sub { return 1 }` to create an anonymous code reference.

References can be accessed by using the arrow operator `->`:

* `$ref->[0]` to access an element inside an array reference.
* `$ref->{foo}` to access a value inside a hash reference.
* `$ref->($arg)` to call a subroutine via a code reference.

Data inside complicated data structures, such as multidimensional arrays and nested hashes, can be accessed by chaining subscripts, e.g., `$ref->{foo}[0]{bar}` (same as `$ref->{foo}->[0]->{bar}`).

If you want to dereference an entire array or hash, you can use the arrow operator followed by either `@*` or `%*` respectively, e.g., `$ref->@*` or `$ref->%*`.
You can also obtain slices of an array or hash reference by replacing the `*` with a subscript, e.g., `$ref->@[0..2]` or `$ref->@{'Foo', 'Bar'}`.
For slices, sigil variance applies here in the same way it does with array and hash variables.
