#!/usr/bin/env perl
use Test2::V0;

use FindBin qw<$Bin>;
use lib $Bin, "$Bin/local/lib/perl5";

use Strain qw<keep discard>;

imported_ok qw<keep discard> or bail_out;

my ( $input, $expected, $function );

$input    = [];
$expected = [];
$function = sub { my $x = shift; $x % 2 == 0 };
is( keep( $input, $function ), $expected, "empty list" );

$input    = [ 2, 4, 6, 8, 10 ];
$expected = [];
$function = sub { my $x = shift; $x % 2 == 1 };
is( keep( $input, $function ),
  $expected, "keep odd numbers. empty result " );

$input    = [ 2, 4, 6, 8, 10 ];
$expected = [];
$function = sub { my $x = shift; $x % 2 == 0 };
is( discard( $input, $function ),
  $expected, "discard even numbers. empty result" );

$input    = [ 2, 4, 6, 8, 10 ];
$expected = [ 2, 4, 6, 8, 10 ];
$function = sub { my $x = shift; $x % 2 == 0 };
is( keep( $input, $function ),
  $expected, "keep even numbers. result == input" );

$input    = [qw(dough cash plough though through enough)];
$expected = ['cash'];
$function = sub { my $x = shift; $x =~ m/ough$/ };
is( discard( $input, $function ),
  $expected, "discard input endswith 'ough'" );

$input    = [qw(zebra arizona apple google mozilla)];
$expected = [qw(zebra arizona mozilla)];
$function = sub { my $x = shift; $x =~ /z/ };
is( keep( $input, $function ), $expected, "keep input with 'z'" );

$input    = [ '1,2,3', 'one', 'almost!', 'love' ];
$expected = [];
$function = sub { my $x = shift; $x =~ /\p{IsAlpha}/ };
is( discard( keep( $input, $function ) // [], $function ),
  $expected, "keep then discard" );

$input    = [ '1,2,3', 'one', 'almost!', 'love' ];
$expected = [ '1,2,3', 'one', 'almost!', 'love' ];
$function = sub { my $x = shift; $x =~ /\p{Alpha}/ };
my $combined = [
  @{ keep( $input, $function )    // [] },
  @{ discard( $input, $function ) // [] }
];
is(
  [ sort @$combined ],
  [ sort @$expected ],
  "combine keep and discard results. keep + discard"
);

done_testing;
