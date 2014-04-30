use strict;
use warnings;

use Test::More;

my @cases = (
    {
        input    => 0,
        expected => 'zero',
    },
    {
        input    => 1,
        expected => 'one',
    },
    {
        input    => 14,
        expected => 'fourteen',
    },
    {
        input    => 20,
        expected => 'twenty',
    },
    {
        input    => 22,
        expected => 'twenty-two',
    },
    {
        input    => 120,
        expected => 'one hundred twenty',
    },
    {
        input    => 123,
        expected => 'one hundred twenty-three',
    },
    {
        input    => 1000,
        expected => 'one thousand',
    },
    {
        input    => 1234,
        expected => 'one thousand two hundred thirty-four',
    },
    {
        input    => 1_000_000,
        expected => 'one million',
    },
    {
        input    => 1_000_002,
        expected => 'one million two',
    },
    {
        input    => 1_002_345,
        expected => 'one million two thousand three hundred forty-five',
    },
    {
        input    => 1_000_000_000,
        expected => 'one billion',
    },
    {
        input    => 987_654_321_123,
        expected => 'nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three',
    },
    {
        input     => -1,
        exception => "ArgumentError",
        name      => "Number too small",
    },
    {
        input     => 1_000_000_000_000,
        exception => "ArgumentError",
        name      => "Number too big"
    }
);

my $module = $ENV{EXERCISM} ? 'Example' : 'Say';

plan tests => 3 + @cases;

ok -e "$module.pm", "Missing $module.pm" or BAIL_OUT "You need to create file $module.pm";

eval "use $module";
ok !$@, "Cannot load $module" or BAIL_OUT "Does $module.pm compile? Does it end with 1;?";

can_ok $module, "in_english" or BAIL_OUT "Missing package $module; or missing sub in_english()";

foreach my $c (@cases) {
    my $say;
    eval {
        $say = $module->new($c->{input});
    };

    if ($@) {
        no warnings 'uninitialized';
        like $@, qr/$c->{exception}/, $c->{name};
    } else {
        is $say->in_english(), $c->{expected}, "test " . $c->{expected};
    }
}
