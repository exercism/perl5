use strict;
use warnings;

use Test::More;

my @cases = (
    {
        old      => { 1 => ['A'] },
        expected => { a => 1 },
        name     => "transform one value"
    },
    {
        old      => { 1 => [qw(A E I O U)] },
        expected => { a => 1, e => 1, i => 1, o => 1, u => 1 },
        name     => "transform five values"
    },
    {
        old      => { 1 => ['A', 'E'], 2 => ['D', 'G'] },
        expected => { a => 1, e => 1, d => 2, g => 2 },
        name     => "transform a pair of values"
    },
    {
        old      => { 1  => [qw(A E I O U L N R S T)],
                      2  => [qw(D G)],
                      3  => [qw(B C M P)],
                      4  => [qw(F H V W Y)],
                      5  => ['K'],
                      8  => [qw(J X)],
                      10 => [qw(Q Z)]
                    },
        expected => { a => 1, b =>  3, c => 3, d => 2, e => 1,
                      f => 4, g =>  2, h => 4, i => 1, j => 8,
                      k => 5, l =>  1, m => 3, n => 1, o => 1,
                      p => 3, q => 10, r => 1, s => 1, t => 1,
                      u => 1, v =>  4, w => 4, x => 8, y => 4, z => 10
                    },
        name     => "transform all values"
    }
);

plan tests => 3 + @cases;

my $module = $ENV{EXERCISM} ? 'Example' : 'ETL';

ok -e "$module.pm", "Missing $module.pm",
    or BAIL_OUT "You need to create a class called $module.pm";

eval "use $module";

ok !$@, "Cannot load $module.pm"
    or BAIL_OUT "Does $module.pm compile? Does it end with 1;?";

can_ok $module, "transform" or BAIL_OUT "Missing package module $module; or missing sub transform()";

foreach my $c (@cases) {
    if ($ENV{EXERCISM}) {
        is_deeply Example::transform($c->{old}), $c->{expected}, $c->{name};
    } else {
        is_deeply ETL::transform($c->{old}), $c->{expected}, $c->{name};
    }
}
