# Declare package 'Leap'
package Leap;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_leap_year>;

sub is_leap_year ($year) {
    return $year % 4 == 0 && $year % 100 != 0 || $year % 400 == 0;
}

1;
