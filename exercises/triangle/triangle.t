#!/usr/bin/env perl
use strict;
use warnings;

use Test::More;
use JSON::PP qw(decode_json);
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'Triangle';

my $cases;
{
    local $/ = undef;
    $cases = decode_json scalar <DATA>;
}


#diag explain $cases;
plan tests => 3 + @$cases;

ok -e "$Bin/$module.pm", "missing $module.pm"
    or BAIL_OUT("You need to create a class called $module.pm with an function called kind() that gets 3 numbers - the length of the sides. It should return a single word like equilateral, isosceles, or scalene. Or, it should throw and exception.");

eval "use $module";
ok !$@, "Cannot load $module.pm"
    or BAIL_OUT("Does $module.pm compile?  Does it end with 1; ?");

can_ok($module, 'kind') or BAIL_OUT("Missing package $module; or missing sub kind()");

my $sub = $module . '::kind';

foreach my $c (@$cases) {
    my $kind;
    eval {
    	no strict 'refs';
        $kind = $sub->(@{ $c->{input} });
    };
    if ($c->{exception}) {
		like $@, qr/^$c->{exception}/, "Exception $c->{name}";
	} else {
        is $kind, $c->{expected}, $c->{name};
    }
}

__DATA__
[
  {
    "input"    : [2, 2, 2],
    "expected" : "equilateral",
    "name"     : "equilateral_triangles_have_equal_sides"
  },
  {
    "input"    : [10, 10, 10],
    "expected" : "equilateral",
    "name"     : "larger_equilateral_triangles_also_have_equal_sides"
  },
  {
    "input"    : [3, 4, 4],
    "expected" : "isosceles",
    "name"     : "isosceles_triangles_have_last_two_sides_equal"
  },
  {
    "input"    : [4, 3, 4],
    "expected" : "isosceles",
    "name"     : "isosceles_triangles_have_first_and_last_sides_equal"
  },
  {
    "input"    : [4, 4, 3],
    "expected" : "isosceles",
    "name"     : "isosceles_triangles_have_two_first_sides_equal"
  },
  {
    "input"    : [10, 10, 2],
    "expected" : "isosceles",
    "name"     : "isosceles_triangles_have_in_fact_exactly_two_sides_equal"
  },
  {
    "input"    : [3, 4, 5],
    "expected" : "scalene",
    "name"     : "scalene_triangles_have_no_equal_sides"
  },
  {
    "input"    : [10, 11, 12],
    "expected" : "scalene",
    "name"     : "scalene_triangles_have_no_equal_sides_at_a_larger_scale_too"
  },
  {
    "input"    : [5, 4, 2],
    "expected" : "scalene",
    "name"     : "scalene_triangles_have_no_equal_sides_at_a_larger_scale_too"
  },
  {
    "input"    : [0.4, 0.6, 0.3],
    "expected" : "scalene",
    "name"     : "very_small_triangles_are_legal"
  },
  {
    "input"    : [0, 0, 0],
    "expected" : "",
    "exception" : "TriangleError",
    "name"     : "triangles_with_no_size_are_illegal"
  },
  {
    "input"    : [3, 4, -5],
    "expected" : "",
    "exception" : "TriangleError",
    "name"     : "triangles_with_negative_sides_are_illegal"
  },
  {
    "input"    : [1, 1, 3],
    "expected" : "",
    "exception" : "TriangleError",
    "name"     : "triangles_violating_triangle_inequality_are_illegal"
  },
  {
    "input"    : [2, 4, 2],
    "expected" : "",
    "exception" : "TriangleError",
    "name"     : "triangles_violating_triangle_inequality_are_illegal_2"
  },
  {
    "input"    : [7, 3, 2],
    "expected" : "",
    "exception" : "TriangleError",
    "name"     : "triangles_violating_triangle_inequality_are_illegal_3"
  }
]
