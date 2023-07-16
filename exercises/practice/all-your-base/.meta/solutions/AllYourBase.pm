package AllYourBase;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<rebase>;

my @errors = (
    'input base must be >= 2',
    'output base must be >= 2',
    'all digits must satisfy 0 <= d < input base',
);

sub rebase ( $digits, $input_base, $output_base ) {

    if ( $input_base < 2 ) {
        die $errors[0];
    }
    if ( $output_base < 2 ) {
        die $errors[1];
    }
    for my $digit ( @{$digits} ) {
        if ( $digit < 0 || $digit >= $input_base ) {
            die $errors[2];
        }
    }

    return from_decimal( $output_base,
        to_decimal( $input_base, $digits ) );
}

sub to_decimal ( $base, $digits ) {
    my $elems = @{$digits};
    for ( @{$digits} ) {
        if ( $_ == 0 ) {
            $elems--;
        }
        else {
            last;
        }
    }

    my $sum = 0;
    for ( my $i = 0; $i < $elems; $i++ ) {
        $sum += $digits->[ -$i - 1 ] * $base**$i;
    }

    return $sum;
}

sub from_decimal ( $base, $number ) {
    my @digits;
    while ( $number >= $base ) {
        unshift @digits, $number % $base;
        $number = int( $number / $base );
    }
    unshift @digits, $number;
    return [@digits];
}

1;
