package LargestSeriesProduct;

use strict;
use warnings;
use feature      qw<say>;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<largest_product>;

use List::Util qw<product>;

sub largest_product {
    my ( $digits, $span ) = @_;

    die 'span must be smaller than string length' if length($digits) < $span;
    die 'digits input must only contain digits'   if $digits =~ /\D/;
    die 'span must not be negative'               if $span < 0;

    return 1 if $span == 0;

    my $i    = 0;
    my $prod = 0;
    while (1) {
        my $str = substr $digits, $i, $span;
        last if length($str) < $span;
        my $new_prod = product split //, $str;
        $prod = $new_prod if $new_prod > $prod;
        $i++;
    }

    return $prod;
}

1;
