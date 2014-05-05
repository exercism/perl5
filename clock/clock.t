use strict;
use warnings;

use Test::More;

my @cases = (
    {
        clock    => [8],
        expected => "08:00"
    },
    {
        clock    => [9],
        expected => "09:00"
    },
    {
        clock    => [11, 9],
        expected => "11:09"
    },
    {
        clock    => [10],
        add      => 3,
        expected => "10:03"
    },
    {
        clock    => [10],
        add      => 61,
        expected => "11:01"
    },
    {
        clock    => [23, 30],
        add      => 60,
        expected => "00:30"
    },
    {
        clock    => [10],
        subtract => 90,
        expected => "08:30"
    },
    {
        clock    => [0, 30],
        subtract => 60,
        expected => "23:30"
    },
    {
        clock    => [15, 37],
        equal    => [15, 36],
        expected => 0
    },
    {
        clock    => [15, 37],
        equal    => [15, 37],
        expected => 1
    },
    {
        clock    => [15, 37],
        equal    => [14, 37],
        expected => 0
    }
);

my $module = $ENV{EXERCISM} ? 'Example' : 'Clock';

plan tests => 6 + @cases;

ok -e "$module.pm", "Missing $module.pm"
            or BAIL_OUT "You need to create file: $module.pm";

eval "use $module";

ok !$@, "Cannot load $module"
            or BAIL_OUT "Cannot load $module. Does it compile? Does it end with 1;?";

ok exists $INC{'overload.pm'}, "$module loads overload module; use overload"
            or BAIL_OUT "You need to overload these operators + - eq";

use overload;

is ref overload::Method($module, '+'), 'CODE', "$module overloads '+' operator"
            or BAIL_OUT "Missing package $module; or missing 'use overload '+' => sub { ... }";
is ref overload::Method($module, '-'), 'CODE', "$module overloads '-' operator"
            or BAIL_OUT "Missing package $module; or missing 'use overload '-' => sub { ... }";
is ref overload::Method($module, 'eq'), 'CODE', "$module overloads 'eq' operator"
            or BAIL_OUT "Missing package $module; or missing 'use overload 'eq' => sub { ... }";


foreach my $c (@cases) {
    my $clock = $module->new($c->{clock});

    unless ($c->{add} or $c->{subtract} or $c->{equal}) {
        is $clock, $c->{expected}, "clock(@{$c->{clock}}) is $c->{expected}";
    }
    if ($c->{add}) {
        is $clock + $c->{add}, $c->{expected}, "add $c->{add} minutes to clock(@{$c->{clock}})";
    }
    if ($c->{subtract}) {
        is $clock - $c->{subtract}, $c->{expected}, "subtract $c->{subtract} minutes to clock(@{$c->{clock}})";
    }
    if ($c->{equal}) {
        is int($clock eq $module->new($c->{equal})), $c->{expected},
                "clock(@{$c->{clock}}) eq clock(@{$c->{equal}}) ($c->{expected})";
    }
}
