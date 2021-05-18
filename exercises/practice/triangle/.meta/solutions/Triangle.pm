package Triangle;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<is_equilateral is_isosceles is_scalene>;

use experimental qw<signatures>;
use lib 'lib';
use Exercism::QuickSolve;

sub is_equilateral ($triangle) {
  !!quicksolve(
    input     => $triangle,
    input_key => 'sides',
    property  => 'equilateral',
  );
}

sub is_isosceles ($triangle) {
  !!quicksolve(
    input     => $triangle,
    input_key => 'sides',
    property  => 'isosceles',
  );
}

sub is_scalene ($triangle) {
  !!quicksolve(
    input     => $triangle,
    input_key => 'sides',
    property  => 'scalene',
  );
}

1;
