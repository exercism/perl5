# Introduction

## Packages and Modules

### Importing

A module is usually loaded with the `use` keyword.
This will both load and call the `import` method on it, importing any exported symbols.

Symbols in the package's `@EXPORT` array will be imported by default.
Symbols in the package's `@EXPORT_OK` array must be imported explicitly.

### Exporting

For a symbol to be imported, it must first be exported.
The [Exporter][Exporter] module is included with Perl and is one of the most convenient options for exporting.

Defining the module:
```perl
package Foo;

use Exporter ('import');
our @EXPORT_OK = ('bar');

sub bar { ... }
```

Using the module:
```perl
use Foo ('bar');

bar();
```

### Core Modules

Along with [Exporter][Exporter], Perl has a large variety of [core modules][perl-core-modules] available to use.
Some examples useful for exercises you may encounter here include [List::Util][List::Util], [Time::Piece][Time::Piece], and [Math::BigRat][Math::BigRat].

### CPAN

In additon to core modules, [CPAN][metacpan] has thousands of additional modules created by the Perl community available for installation.
The Perl track uses a [cpanfile][test-runner-cpanfile] to install a selection of modules which can be used with Exercism's Perl test runner.

[perl-core-modules]: https://perldoc.pl/modules
[metacpan]: https://metacpan.org/
[test-runner-cpanfile]: https://github.com/exercism/perl5-test-runner/blob/main/cpanfile
[Exporter]: https://perldoc.pl/Exporter
[List::Util]: https://perldoc.pl/List::Util
[Time::Piece]: https://perldoc.pl/Time::Piece
[Math::BigRat]: https://perldoc.pl/Math::BigRat
