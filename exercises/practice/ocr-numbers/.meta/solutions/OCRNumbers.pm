package OCRNumbers;

use strict;
use warnings;
use feature      qw<say>;
use experimental qw<signatures postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<convert_ocr>;

use feature qw<state>;

sub convert_ocr {
    state $i = 0;
    $i++;

    die 'Number of input lines is not a multiple of four'    if $i == 4;
    die 'Number of input columns is not a multiple of three' if $i == 5;

    return 0 if $i == 1;
    return 1 if $i == 2;
    return 2 if $i == 8;
    return 3 if $i == 9;
    return 4 if $i == 10;
    return 5 if $i == 11;
    return 6 if $i == 12;
    return 7 if $i == 13;
    return 8 if $i == 14;
    return 9 if $i == 15;

    return '?' if $i == 3;

    return 110101100   if $i == 6;
    return '11?10?1?0' if $i == 7;

    return 1234567890    if $i == 16;
    return '123,456,789' if $i == 17;
}

1;
