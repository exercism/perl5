#!/usr/bin/perl

use strict; 
use warnings;

use Example;
use Test::More tests => 9;  

{ # map tests 
   my @L = qw(-1 2 -3 4 -5 6 -7 8 -9 10);
   my %funcs = (
      square => sub { $_[0] * $_[0] },
      cube   => sub { $_[0] * $_[0] },
      abs    => sub { $_[0] > 0 ? $_[0] : -$_[0] },
      inc    => sub { $_[0] + 1 },
      dec    => sub { $_[0] - 1 },
   ); 

   is_deeply(
      [Example::map($funcs{square}, @L)],
      [map { $funcs{square}->($_) } @L],
      'map([..], square) produced correct squares'
   );

   is_deeply(
      [Example::map($funcs{cube}, @L)],
      [map { $funcs{cube}->($_)  } @L],
      'map([..], cube) produced correct cubes'
   );

   is_deeply(
      [Example::map($funcs{abs}, @L)],
      [map { $funcs{abs}->($_)  } @L],
      'map([..], abs) produced correct natural numbers'
   );

   is_deeply(
      [Example::map($funcs{inc}, @L)],
      [map { $funcs{inc}->($_)  } @L],
      'map([..], inc) produced correctly incremented numbers'
   );  
   
   is_deeply(
      [Example::map($funcs{dec}, @L)],
      [map { $funcs{dec}->($_)  } @L],
      'map([..], dec) produced correctly decrement numbers'
   );  
}

{ # reduce tests
   my @L = qw(1 2 3 4 5 6);
   my %func = (
      '+' => sub { $_[0] + $_[1] },
      '*' => sub { $_[0] * $_[1] },
      '.' => sub { $_[0] . $_[1] },
   );

   is(
      Example::reduce($func{'+'}, @L),
      @L * (@L + 1) / 2,
      'reducing 1 - 6 with + results in 6(7)/2 = 21'
   ); 

   is(
      Example::reduce($func{'*'}, @L),
      1*2*3*4*5*6,
      'reducing 1 - 6 with * results in 6! = 720'
   );
}

{ # length tests
   my @L = qw(-1 2 -3 4 -5 6 -7 8 -9 10);

   is(
      Example::length(@L),
      10,
      'Length of L is 10'
   );

   is(
      Example::length(()),
      0,
      'Empty arrayref has length 0'
   );
}
