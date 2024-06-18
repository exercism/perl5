# Introduction

## Booleans

Boolean values exist in Perl, however they are seldom used explicitly.
They typically come as the result of a comparison operation, e.g, `2 > 1` or `'foo' eq 'bar'`, or negation, e.g., `!0`.

`1` and `0` are commonly used to represent true and false in boolean contexts.
With `use v5.40` or newer, the functions `true` and `false` are included to provide explicit boolean values.

The following are considered false in Perl:

```perl
0;   # The number 0.
'0'; # A single 0 in a string.
'';  # An empty string.
();  # An empty list.
undef;
```
