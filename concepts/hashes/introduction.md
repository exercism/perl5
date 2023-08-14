# Introduction

Hashes are a data type in Perl which contain an unordered collection of string keys paired with scalar values.

A hash variable is usually populated by assigning a list to it, e.g., `my %scores = (Alice => 10, Bob => 15, Charlie => 20);`.

Lists are usually separated with commas, but you will commonly see what is known as the "fat comma" `=>` to separate keys and values in a list.
Its behavior is almost identical to a comma, but it has the added benefit of interpreting the element on the left hand side as a string.

Hashes can be populated by assigning to individual keys, e.g., `$scores{Alice} = 10;`.

Values of a hash can be accessed by specifying keys via a subscript, e.g., `$scores{Bob} # 15`.

Keys in a hash are unique.
If a key is given multiple times, only the last value given will be kept.

## Functions

Functions for working with hashes include [keys][keys] and [values][values], for retrieving those respective parts of a hash as a list.
Lists returned by the [keys][keys] and [values][values] functions can be useful for list functions such as [grep][grep], [map][map], and [sort][sort], as well as [for][for] loops.

Other hash functions include [exists][exists], for checking if a key exists in a hash (even if its value is `undef`), and [delete][delete], for removing a key from a hash.

## Sigil Variance

When obtaining values of a hash, the given sigil determines the result.
The subscript `{}` at the end of the variable name is what tells Perl that you are accessing a hash with that name.

```perl
my %names = (Alice => 10, Bob => 15, Charlie => 20);

$names{Alice}; # 10            <- A scalar
@names{Alice}; # (10)          <- A slice (with only one key, this probably isn't what you want. There will be a warning.)
%names{Alice}; # ('Alice', 10) <- A key/index + value slice

$names{'Bob', 'Charlie'}; #                            <- An error (disabled syntax for an ancient feature.)
@names{'Bob', 'Charlie'}; # (15, 20)                   <- A slice
%names{'Bob', 'Charlie'}; # ('Bob', 15, 'Charlie', 20) <- A key/index + value slice
```

While it is allowed, it is recommended to not have different variable types share the same name for the sake of readability.

[grep]: https://perldoc.pl/functions/grep
[map]: https://perldoc.pl/functions/map
[sort]: https://perldoc.pl/functions/sort
[keys]: https://perldoc.pl/functions/keys
[values]: https://perldoc.pl/functions/values
[exists]: https://perldoc.pl/functions/exists
[delete]: https://perldoc.pl/functions/delete
[for]: https://perldoc.pl/perlsyn#Foreach-Loops
