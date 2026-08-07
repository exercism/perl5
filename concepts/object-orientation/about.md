# About

## Classes

Class-based object orientation is a paradigm often used in Perl.
Traditionally, classes in Perl are created by using `bless` to associate a reference with a package.

```perl
package Foo;

sub new ($class, %args) {
    return bless {%args{bar}}, $class;
}

sub bar ($self) {
    return $self->{bar};
}
```

Perl `v5.38` introduced the `class` keyword which brings additional OOP features to core Perl.

```perl
use feature qw<class>;

class Foo;

field $bar :param;

method bar () {
    return $bar;
}
```

Additionally, Perl has numerous modules available on CPAN implementing OOP features.
Among the most well known are `Moo` and `Moose`.

```perl
package Foo;

use Moo;

has bar => (is => 'ro');
```

The arrow operator (`->`) is used to call methods on class names and objects.
All of the above can be used as follows:

```perl
# Object creation
my $object = Foo->new(bar => 1);

# Method call
say $object->bar;
```
