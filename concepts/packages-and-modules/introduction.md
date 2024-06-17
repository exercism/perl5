## Importing

A module is usually loaded with the `use` keyword.
This will both load and call the `import` method on it, importing any exported symbols.

Symbols in the package's `@EXPORT` array will be imported by default.
Symbols in the package's `@EXPORT_OK` array must be imported explicitly.

Before Perl `v5.37`, a module would have to end in a true value (usually `1`) to indicate the module had loaded successfully.
This is not necessary when using the [`module_true`][module_true] feature.

## Exporting

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

## Pragma

A pragma is a module which influences some aspect of the behavior of Perl.

The pragmas [`strict`][strict] and [`warnings`][warnings] are commonly recommended, to restrict unsafe constructs and flag potential problems respectively.
The `strict` pragma is enabled along with `use v5.12` or higher.
The `warnings` pragma is enabled along with `use v5.35` or higher.

The [`feature`][feature] pragma allows you to enable newer and experimental Perl features.
When the `use` keyword is given a specific version of Perl, it will enable the feature bundle for that version.

## Core Modules

Along with [Exporter][Exporter], Perl has a large variety of [core modules][perl-core-modules] available to use.
Some examples useful for exercises you may encounter here include [List::Util][List::Util], [Time::Piece][Time::Piece], and [Math::BigRat][Math::BigRat].

## CPAN

In additon to core modules, [CPAN][metacpan] has thousands of additional modules created by the Perl community available for installation.
The Perl track uses a [cpanfile][test-runner-cpanfile] to install a selection of modules which can be used with Exercism's Perl test runner.

[perl-core-modules]: https://perldoc.pl/modules
[metacpan]: https://metacpan.org/
[test-runner-cpanfile]: https://github.com/exercism/perl5-test-runner/blob/main/cpanfile
[Exporter]: https://perldoc.pl/Exporter
[List::Util]: https://perldoc.pl/List::Util
[Time::Piece]: https://perldoc.pl/Time::Piece
[Math::BigRat]: https://perldoc.pl/Math::BigRat
[module_true]: https://perldoc.pl/feature#The-'module_true'-feature
[strict]: https://perldoc.pl/strict
[warnings]: https://perldoc.pl/warnings
[feature]: https://perldoc.pl/feature
