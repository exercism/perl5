use strict;
use warnings;

use Test::More;

my $module = $ENV{EXERCISM} ? 'Example' : 'Accumulate';

my @cases = (
    {
        name      => "test empty",
        function  =>  sub { $_[0] / 2 },
        input     => [],
        expected  => [],
    },
    {
        name      => "raise to 2",
        function  => sub { $_[0] * $_[0] },
        input     => [1, 2, 3, 4, 5],
        expected  => [1, 4, 9, 16, 25],
    },
    {
        name      => "divmod",
        function  => sub { [int($_[0] / 7), int($_[0] % 7)] },
        input     => [10, 17, 23],
        expected  => [[1, 3], [2, 3], [3, 2]],
    },
    {
        name      => "composition",
        function  => [sub { my $n  = shift; [int($n / 7), int($n % 7)] }, 
                      sub { my $ar = shift;  7 * $ar->[0] + $ar->[1]   } ],
        input     => [10, 17, 23],
        expected  => [10, 17, 23],
    },
    {
        name      => "capitalize",
        function  => sub { uc $_[0] },
        input     => ['hello', 'exercism'],
        expected  => ['HELLO', 'EXERCISM'],
    },
    {
        name      => "recursive",
        function  => sub { 
                           my $inp = shift; 
                           {
                               no strict 'refs';
                               my $accumulate = "${module}::accumulate"; 
                               $accumulate->( [1, 2, 3], sub { $inp . $_[0] } )
                           }
                         },
        input     => ['a', 'b', 'c'],
        expected  => [['a1', 'a2', 'a3'], ['b1', 'b2', 'b3'], ['c1', 'c2', 'c3']],
    }    
);

plan tests => 3 + @cases;

ok -e "$module.pm", "missing $module.pm"
    or BAIL_OUT("You need to create a class called $module.pm with a constructor called new.");

eval "use $module";
ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ? ($@)");

can_ok($module, 'accumulate') 
    or BAIL_OUT("Missing package $module; or missing sub accumulate()");

foreach my $c (@cases) {
    my $accumulate = "${module}::accumulate"; 

    no strict 'refs';

    if ( ref $c->{function} eq 'CODE' ) {
        is_deeply $accumulate->($c->{input}, $c->{function}), $c->{expected}, $c->{name};
    }
    # test case: composition
    if ( ref $c->{function} eq 'ARRAY' ) {
        my ($fn1, $fn2) = @{$c->{function}};
        is_deeply $accumulate->( $accumulate->($c->{input}, $fn1), $fn2 ),
                  $c->{expected}, $c->{name};
    }
}
