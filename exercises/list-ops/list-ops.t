#!/usr/bin/env perl
use strict;
use warnings;

use Test2::Bundle::More;
use FindBin qw($Bin);
use lib $Bin, "$Bin/local/lib/perl5";

my $module = 'ListOps';

my %test_cases = (
  map => {
    tests => [
      { name     => 'square',
        input    => [qw(-1 2 -3 4 -5 6 -7 8 -9 10)],
        function => sub { $_[0] * $_[0] },
        expected => [qw(1 4 9 16 25 36 49 64 81 100)],
      },
      { name     => 'cube',
        function => sub { $_[0] * $_[0] * $_[0] },
        input    => [qw(-1 2 -3 4 -5 6 -7 8 -9 10)],
        expected => [qw(-1 8 -27 64 -125 216 -343 512 -729 1000)],
      },
      { name     => 'abs',
        function => sub { $_[0] > 0 ? $_[0] : -$_[0] },
        input    => [qw(-1 2 -3 4 -5 6 -7 8 -9 10)],
        expected => [qw(1 2 3 4 5 6 7 8 9 10)],
      },
      { name     => 'inc',
        function => sub { $_[0] + 1 },
        input    => [qw(-1 2 -3 4 -5 6 -7 8 -9 10)],
        expected => [qw(0 3 -2 5 -4 7 -6 9 -8 11)],
      },
      { name     => 'dec',
        function => sub { $_[0] - 1 },
        input    => [qw(-1 2 -3 4 -5 6 -7 8 -9 10)],
        expected => [qw(-2 1 -4 3 -6 5 -8 7 -10 9)],
      },
    ],
  },
  reduce => {
    tests => [
      { name     => 'summation',
        function => sub { $_[0] + $_[1] },
        input    => [qw(1 2 3 4 5 6)],
        expected => 21,
      },
      { name     => 'product',
        function => sub { $_[0] * $_[1] },
        input    => [qw(1 2 3 4 5 6)],
        expected => 720,
      },
      { name     => 'concatenation',
        function => sub { $_[0] . $_[1] },
        input    => [qw(1 2 3 4 5 6)],
        expected => '123456',
      },
    ],
  },
  length => {
    tests => [
      { name     => 'postive length',
        input    => [qw(-1 2 -3 4 -5 6 -7 8 -9 10)],
        expected => 10,
      },
      { name     => 'empty length',
        input    => [],
        expected => 0,
      },
    ],
  },
);

my $num_test_cases;
foreach my $test_type ( keys %test_cases ) {
  $num_test_cases += @{ $test_cases{$test_type}->{tests} };
}

plan 5 + $num_test_cases;

ok -e "$Bin/$module.pm", "missing $module.pm"
  or BAIL_OUT(
  "You need to create a class called $module.pm with 3 functions: map, reduce, and length."
  );

eval "use $module";
ok !$@, "Cannot load $module.pm"
  or BAIL_OUT("Does $module.pm compile? Does it end with 1; ? ($@)");

can_ok( $module, 'map' )
  or BAIL_OUT("Missing package $module; or missing sub map()");

can_ok( $module, 'reduce' )
  or BAIL_OUT("Missing package $module; or missing sub reduce()");

can_ok( $module, 'length' )
  or BAIL_OUT("Missing package $module; or missing sub length()");

foreach my $test_type ( keys %test_cases ) {
  no strict 'refs';
  my $f = "${module}::$test_type";
  foreach my $test ( @{ $test_cases{$test_type}->{tests} } ) {
    if ( exists $test->{function} ) {
      is_deeply( $f->( $test->{function}, $test->{input} ),
        $test->{expected}, $test->{name}, );
    }
    else {    # length tests
      is_deeply( $f->( $test->{input} ),
        $test->{expected}, $test->{name}, );
    }

  }
}
