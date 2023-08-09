# Introduction

Arrays and lists contain an ordered collection of scalars.
Elements of an array or list can be accessed by specifying indexes via a subscript e.g. `('Alice', 'Bob', 'Charlie')[1] # 'Bob'`.

Indexes in Perl start at `0`.
Negative indexes will count from the end of the array or list e.g. `('Alice', 'Bob', 'Charlie')[-1] # 'Charlie'`.

## Functions

There are many functions implemented for operating on arrays and lists, some of the most useful being [grep][grep] for a new list of filtered elements which match a condition, [map][map] for translating elements to a new list of values, and [sort][sort] for a new list of reordered elements.

Functions for manipulating arrays include [push][push] to add elements to the end, [pop][pop] to remove the last element, [shift][shift] to remove the first element, [unshift][unshift] to add elements to the start, and [splice][splice] for more complex modifications.

## Sigil Variance

When accessing the elements of an array, the given sigil determines the result.
The subscript `[]` at the end of the variable name is what tells Perl that you are accessing an array with that name.

```perl
my @names = ('Alice', 'Bob', 'Charlie');

$names[0]; # 'Alice'      <- A scalar
@names[0]; # ('Alice')    <- A slice (with only one index, this probably isn't what you want. There will be a warning.)
%names[0]; # (0, 'Alice') <- A key/index + value slice

$names[1, 2]; # 'Charlie'                <- A scalar (via unsupported syntax for an ancient feature. Probably not what you want. There will be a warning.)
@names[1, 2]; # ('Bob', 'Charlie')       <- A slice
%names[1, 2]; # (1, 'Bob', 2, 'Charlie') <- A key/index + value slice
```

While it is allowed, it is recommended to not have different variable types share the same name for the sake of readability.

## Arrays vs Lists

Arrays and lists share many similarities, and in a lot of places can be used interchangably, but they are not the same thing.
A list is a fixed and immutable collection of scalars.
An array is a variable collection of scalars where the contents and the size of the array itself can be changed.

They have different behaviors in some contexts, for example, an array used in scalar context will give you the size of the array, while a list used in scalar context will give you the last element in the list, and potentially some warnings about the rest of its contents being used in void context.

```perl
my @names = ('Alice', 'Bob', 'Charlie');

scalar @names; # 3
scalar ('Alice', 'Bob', 'Charlie'); # 'Charlie' (and some warnings).
```

Read more in the folowing FAQ: [What is the difference between a list and an array?](perlfaq4listarray)

[perlfaq4listarray]: https://perldoc.pl/perlfaq4#What-is-the-difference-between-a-list-and-an-array?
[grep]: https://perldoc.pl/functions/grep
[map]: https://perldoc.pl/functions/map
[sort]: https://perldoc.pl/functions/sort
[push]: https://perldoc.pl/functions/push
[pop]: https://perldoc.pl/functions/pop
[shift]: https://perldoc.pl/functions/shift
[unshift]: https://perldoc.pl/functions/unshift
[splice]: https://perldoc.pl/functions/splice
