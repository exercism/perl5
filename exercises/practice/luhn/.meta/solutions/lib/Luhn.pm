package Luhn;

use strict;
use warnings;
use experimental qw<signatures postderef postderef_qq>;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_luhn_valid>;

sub is_luhn_valid ($number) {
    $number =~ s/\s+//g;
    if ( length $number < 2 || $number =~ /\D+/ ) { return 0 }

    my @num = split( //, $number );
    unshift @num, 0 if scalar @num % 2;

    my $count = 1;
    my $sum   = 0;

    for (@num) {
        if ( $count % 2 ) {
            $sum += $_ * 2;
            $sum -= 9 if $_ * 2 > 9;
        }
        else {
            $sum += $_;
        }
        $count += 1;
    }

    if ( $sum % 10 ) { return 0 }
    return 1;
}

1;
