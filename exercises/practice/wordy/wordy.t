#!/usr/bin/env perl
use strict;
use warnings;

use Test2::Bundle::More;
use JSON::PP qw(decode_json);
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'Wordy';

my $cases;
{
  local $/ = undef;
  $cases = decode_json scalar <DATA>;
}

plan 3 + @$cases;

#diag explain $cases;

ok -e "$Bin/$module.pm", "missing $module.pm"
  or BAIL_OUT(
  "You need to create a class called $module.pm with an function called answer() that gets the original word as the first parameter and a reference to a list of word to check. It should return a referene to a list of words."
  );

eval "use $module";
ok !$@, "Cannot load $module.pm"
  or BAIL_OUT('Does $module.pm compile?  Does it end with 1; ?');

can_ok( $module, 'answer' )
  or BAIL_OUT("Missing package $module; or missing sub answer()");

my $sub = $module . '::answer';

foreach my $c (@$cases) {
  my $answer;
  eval {
    no strict 'refs';
    $answer = $sub->( $c->{input} );
  };
  if ( $c->{exception} ) {
    like $@, qr/^$c->{exception}/, "Exception $c->{name}";
  }
  else {
    is $answer, $c->{expected}, $c->{name};
  }
}

__DATA__
[
  {
    "input"    : "What is 1 plus 1?",
    "expected" : 2,
    "name"     : "add_1"
  },
  {
    "input"    : "What is 53 plus 2?",
    "expected" : 55,
    "name"     : "add_2"
  },
  {
    "input"    : "What is -1 plus -10?",
    "expected" : -11,
    "name"     : "add_negative_numbers"
  },
  {
    "input"    : "What is 123 plus 45678?",
    "expected" : 45801,
    "name"     : "add_more_digits"
  },
  {
    "input"    : "What is 4 minus -12?",
    "expected" : 16,
    "name"     : "subtract"
  },
  {
    "input"    : "What is -3 multiplied by 25?",
    "expected" : -75,
    "name"     : "multiply"
  },
  {
    "input"    : "What is 33 divided by -3?",
    "expected" : -11,
    "name"     : "divide"
  },
  {
    "input"    : "What is 1 plus 1 plus 1?",
    "expected" : 3,
    "name"     : "add_twice"
  },
  {
    "input"    : "What is 1 plus 5 minus -2?",
    "expected" : 8,
    "name"     : "add_then_subtract"
  },
  {
    "input"    : "What is 20 minus 4 minus 13?",
    "expected" : 3,
    "name"     : "subtract_twice"
  },
  {
    "input"    : "What is 17 minus 6 plus 3?",
    "expected" : 14,
    "name"     : "subtract_then_add"
  },
  {
    "input"    : "What is 2 multiplied by -2 multiplied by 3?",
    "expected" : -12,
    "name"     : "multiply_twice"
  },
  {
    "input"    : "What is -3 plus 7 multiplied by -2?",
    "expected" : -8,
    "name"     : "add_then_multiply"
  },
  {
    "input"    : "What is -12 divided by 2 divided by -3?",
    "expected" : 2,
    "name"     : "divide_twice"
  },
  {
    "input"     : "What is 53 cubed?",
    "exception" : "ArgumentError",
    "name"      : "too_advanced"
  },
  {
    "input"    : "Who is the president of the United States?",
    "exception" : "ArgumentError",
    "name"     : "irrelevant"
  }
]
